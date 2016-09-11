unit uUserInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, MyPub,System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,Data.DB, Data.Win.ADODB,
  Vcl.ComCtrls;

type
  TfrmUserInfo = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    edtCode: TEdit;
    lbl2: TLabel;
    edtName: TEdit;
    lbl3: TLabel;
    cbbType: TComboBox;
    edtMobile: TEdit;
    lbl4: TLabel;
    edtQQ: TEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    mmoRemark: TMemo;
    pnl4: TPanel;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    m_umState: char; //�����������־
    m_cdsOther :TAdoDataSet;
    m_qryOperate : TAdoQuery;//����У��
    m_cmd: TAdoCommand;  //���ڲ�����
    m_qryUser: TAdoQuery; //����һ��������Ϣ
    m_User : Integer;
  end;

var
  frmUserInfo: TfrmUserInfo;

implementation

{$R *.dfm}

procedure TfrmUserInfo.btnCloseClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmUserInfo.btnSaveClick(Sender: TObject);
var sLog: string;
begin
  if EditValid(edtCode,'�û����',Self) or EditValid(edtName,'�û�����',Self)
     or EditValid(edtMobile,'�ֻ�����',Self) then
  begin
    Exit;
  end;
  if Trim(cbbType.Text) = '' then
  begin
    ShowMsg('ϵͳ��ʾ', '�������������û����', self);
    cbbType.SetFocus;
    Exit;
  end;
  if IsExist(m_qryOperate,'FCode',edtCode.Text,'tUser') and (m_umState = 'A') then
  begin
    ShowMsg('����', '�û�����Ѵ���', self);
    edtCode.SetFocus;
    exit;
  end;

  if m_umState = 'A' then
  begin
    try
      with m_cmd do
      begin
        m_cmd.Connection.BeginTrans;
        CommandText := 'Insert into tUser(FCode, FName, FType, FPsw, FRegDate, FMobile, FQQ, Fremark) '
                     + 'values(:FCode, :FName, :FType, :FPsw, getdate(),:FMobile, :FQQ, :Fremark)';
        //Parameters.ParamByName('FID').Value :=  GetNextID(m_qryOperate,'tUser');
        Parameters.ParamByName('FCode').Value :=  trim(edtCode.Text);
        Parameters.ParamByName('FName').Value :=  Trim(edtName.Text);
        Parameters.ParamByName('FType').Value := Trim(cbbType.Text);
        Parameters.ParamByName('FPsw').Value :=  trim('123456');
        Parameters.ParamByName('FMobile').Value := Trim(edtMobile.Text);
        Parameters.ParamByName('FQQ').Value := Trim(edtQQ.Text);
        Parameters.ParamByName('Fremark').Value := mmoRemark.Text;
        Execute;
        m_cmd.Connection.CommitTrans;
      end;
      sLog := '��tUser�������ݣ�' + inttostr(GetNextID(m_qryOperate,'tUser') - 1) + ',' + edtCode.Text
            + ',' + edtName.Text + ',' + cbbType.Text + ',' + DateToStr(Now()) + ',' + edtMobile.Text
            + ',' + edtQQ.Text + ',' + mmoRemark.Text;
      MakeLog(m_qryOperate,m_User,'Ȩ�޹���','���',sLog);
      ModalResult := mrOk;
    except
      on E: Exception do
        ShowMsg('����','������' + E.ClassName + '!  ������Ϣ' + E.Message,self);
    end;

  end
  else if m_umState = 'M' then
  begin
    try
      with m_cmd do
      begin
        Connection.BeginTrans;
        CommandText := 'update tUser set FName = :FName, FType = :FType, '
                     + 'FMobile = :FMobile, FQQ = :FQQ, FRemark = :FRemark '
                     + 'where FCode = :FCode';
        Parameters.ParamByName('FCode').Value :=  trim(edtCode.Text);
        Parameters.ParamByName('FName').Value :=  Trim(edtName.Text);
        Parameters.ParamByName('FType').Value := Trim(cbbType.Text);
        Parameters.ParamByName('FMobile').Value := Trim(edtMobile.Text);
        Parameters.ParamByName('FQQ').Value := Trim(edtQQ.Text);
        Parameters.ParamByName('Fremark').Value := mmoRemark.Text;
        Execute;
        m_cmd.Connection.CommitTrans;
        sLog := '��tUser�޸����ݣ�' + edtCode.Text
              + ',' + edtName.Text + ',' + cbbType.Text + ',' + DateToStr(Now()) + ',' + edtMobile.Text
              + ',' + edtQQ.Text + ',' + mmoRemark.Text;
        MakeLog(m_qryOperate,m_User,'Ȩ�޹���','�޸�',sLog);
        ModalResult := mrOk;
      end;
    except
      on E: Exception do
        ShowMsg('����','������' + E.ClassName + '!  ������Ϣ' + E.Message,self);
    end;
  end;

end;

procedure TfrmUserInfo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ControlKey(key,Shift);
end;

procedure TfrmUserInfo.FormShow(Sender: TObject);
var sqltxt: string;
begin
  //�����û�����
  sqltxt := 'select FValue from tCodeList where FType = ''�û�����'' ';
  OpenAdoQuery(m_qryOperate,sqltxt);
  AddItemToCommbox(m_qryOperate,'FValue',cbbType);

  if m_umState = 'A' then
  begin
    edtCode.SetFocus;
    Exit;
  end
  else if m_umState = 'M' then
  begin
    edtCode.ReadOnly := True;
    edtName.SetFocus;
  end
  else if m_umState = 'V' then
  begin
    SetReadOnly(self);
    btnSave.Enabled := not btnSave.Enabled;
  end;
  with m_qryUser do
  begin
    edtCode.Text := trim(fieldbyname('FCode').AsString);
    edtName.Text := Trim(FieldByName('FName').AsString);
    cbbType.Text := Trim(FieldByName('FType').AsString);
    edtMobile.Text := trim(fieldbyname('FMobile').AsString);
    edtQQ.Text := trim(fieldbyname('FQQ').AsString);
    mmoRemark.Text := trim(fieldbyname('FRemark').AsString);
  end;
end;

end.
