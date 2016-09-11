unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TFrmLogin = class(TForm)
    Label1: TLabel;
    edtUser: TEdit;
    Label2: TLabel;
    edtPsw: TEdit;
    Image1: TImage;
    btnLogin: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure UserLogin(UserName, Password: string);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;
  loginCount: integer;

implementation

{$R *.dfm}

uses uMainForm, MyPub;

procedure TFrmLogin.btnCancelClick(Sender: TObject);
begin
  self.Close;
end;

procedure TFrmLogin.UserLogin(UserName, Password: string);
var
  retcode: integer;
  retmsg: string;
  sToday: string;
  sServerBBH: string;
  sMM: string;
  sNN: string;
  i: integer;
  strLM: String;
begin
  if(EditValid(edtUser,'�û���', self)) then exit;
  try
    Screen.Cursor := CrSQLWait;
    if FrmMain.adocon.Connected = false then
    begin
      FrmMain.adocon.ConnectionString := FrmMain.GetConnectString('sa','131313');
      retmsg := '������login�û�ֵ��';
      FrmMain.adocon.Connected := true;
    end;

    with FrmMain.cdsOther do
    begin
      Close;
      CommandText := 'select FPsw,FID,FCode,FName from tUser where FCode = ''' + UserName + ''' ';
      Open;
      sMM := FieldByName('FPsw').AsString;
      sNN := FieldByName('FCode').AsString;
    end;


    if (trim(sMM) = trim(edtPsw.Text)) and (trim(SNN) = trim(edtUser.Text)) then
    begin
    FrmMain.m_bLogin := TRUE;
    FrmMain.m_Operator := trim(FrmMain.cdsOther.FieldByName('FID').AsString);
    FrmMain.statusBar.Panels[0].Text := '��ǰ�û�:' + trim(FrmMain.cdsOther.FieldByName('FName').AsString);
    ModalResult := mrOK;
    logincount := 0;
    end
    else
    begin //��¼ʧ��
      edtUser.Text := '';
      edtPsw.Text := '';
      edtUser.SetFocus ;
      ShowMsg('ϵͳ��ʾ','��������ȷ���û���������!',self);
      Screen.Cursor := CrDefault;
      logincount := logincount + 1;
      if logincount > 2 then
      begin
        Application.Terminate;
        close;
      end;
      exit;
    end;
  except
    on E: Exception do
    begin
      Screen.Cursor := CrDefault;
      if (Pos('��¼ʧ��',e.Message)<>0) then
      begin

      end
      else begin
        Application.MessageBox(pchar('�޷����ӷ���������' + '������' + E.ClassName + '!  ������Ϣ' + E.Message), pchar('ϵͳ��ʾ'), mB_OK + MB_ICONINFORMATION);
      end;
    end;

  end;

end;
procedure TFrmLogin.btnLoginClick(Sender: TObject);
var username,password:string;
begin
  if SafeCheck(Self,Self) then
  begin
    Exit;
  end;
  username := trim(TRIM(edtUser.text)) ;
  password := TRIM(edtPsw.text);
  if (username <> '')and (logincount < 3) then
  begin
    UserLogin(UserName, PassWord);
  end
  else
    begin
      edtUser.Text := '';
      edtPsw.Text := '';
      edtUser.SetFocus ;
      ShowMsg('ϵͳ��ʾ','��������ȷ���û���������!',self);
      end;
end;

procedure TFrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ControlKey(Key,Shift);
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  PutFormCenter(self,frmMain);
  edtUser.SetFocus;
  FrmMain.adocon.Connected := false;
end;

end.
