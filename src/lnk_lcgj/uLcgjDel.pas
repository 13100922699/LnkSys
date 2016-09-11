unit uLcgjDel;

interface

uses
  Winapi.Windows, Winapi.Messages, MyPub,System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,Data.DB, Data.Win.ADODB,
  Vcl.ComCtrls;

type
  TfrmLcgjDel = class(TForm)
    btnSure: TBitBtn;
    btnCancle: TBitBtn;
    chkDel: TCheckBox;
    chkExpired: TCheckBox;
    procedure btnCancleClick(Sender: TObject);
    procedure chkDelClick(Sender: TObject);
    procedure chkExpiredClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSureClick(Sender: TObject);
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
  frmLcgjDel: TfrmLcgjDel;

implementation

{$R *.dfm}

procedure TfrmLcgjDel.btnCancleClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmLcgjDel.btnSureClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmLcgjDel.chkDelClick(Sender: TObject);
begin
  if chkDel.Checked then
  begin
    chkExpired.Checked := False;
  end;
end;

procedure TfrmLcgjDel.chkExpiredClick(Sender: TObject);
begin
  if chkExpired.Checked then
  begin
    chkDel.Checked := False;
  end;
end;

procedure TfrmLcgjDel.FormCreate(Sender: TObject);
begin
  Font.Charset := GB2312_CHARSET;
  Font.Size := 9;
end;

end.
