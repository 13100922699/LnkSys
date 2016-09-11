unit uPrj;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,Mypub,ShellAPI;

type
  TfrmPrj = class(TForm)
    lbl1: TLabel;
    edtName: TEdit;
    lbl2: TLabel;
    edtCode: TEdit;
    lbl3: TLabel;
    edtMan: TEdit;
    btnSure: TBitBtn;
    btnCancel: TBitBtn;
    lstMsg: TListBox;
    mmo1: TMemo;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSureClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function SetFirstUpper(sText: string):string;
  private
    { Private declarations }
  public
    { Public declarations }
    ErrNo: Integer;
    CrtNo: Integer;
  end;

var
  frmPrj: TfrmPrj;

implementation

{$R *.dfm}
function TfrmPrj.SetFirstUpper(sText: string):string;
var sFirst: string;
    sLast: string;
begin
  sFirst := Copy(sText,1,1);
  sLast := Copy(sText,2,length(sText));
  Result := UpperCase(sFirst) + sLast;
end;
procedure TfrmPrj.btnCancelClick(Sender: TObject);
begin
  Close;
end;



procedure TfrmPrj.btnSureClick(Sender: TObject);
var ModuleID : string;
    fSrcFile : TFileStream;
    fDstFile : TFileStream;
    sSrcPath : array[0..10] of string;
    sDstPath : array[0..10] of string;
    sFileTxt : WideString;
    tFile:TextFile;
    i,j,nFlag: Integer;
    bIsOK: Boolean;
    sSql: string;
begin
  nFlag := 0; //����Ƿ��ǹ����ļ��ĵ�һ��  ����������� 2014,08,20 by lnk
  //��Ч���ж�
  if trim(edtName.Text) = '' then
  begin
    ErrNo := ErrNo + 1;
    if ErrNo = 1 then
    begin
      lstMsg.Items.Add('������ʾ��');
      lstMsg.ItemIndex := lstMsg.Count - 1;
    end;
    lstMsg.Items.Add(IntToStr(ErrNo) + '�� �����빤�����ƣ�');
    lstMsg.ItemIndex := lstMsg.Count - 1;
    exit;
  end;
  if trim(edtCode.Text) = '' then
  begin
    ErrNo := ErrNo + 1;
    if ErrNo = 1 then
    begin
      lstMsg.Items.Add('������ʾ��');
      lstMsg.ItemIndex := lstMsg.Count - 1;
    end;
    lstMsg.Items.Add(IntToStr(ErrNo) + '�� �����빤�̴��룡');
    lstMsg.ItemIndex := lstMsg.Count - 1;
    exit;
  end;
  if trim(edtMan.Text) = '' then
  begin
    ErrNo := ErrNo + 1;
    if ErrNo = 1 then
    begin
      lstMsg.Items.Add('������ʾ��');
      lstMsg.ItemIndex := lstMsg.Count - 1;
    end;
    lstMsg.Items.Add(IntToStr(ErrNo) + '�� �����봴���ߣ�');
    lstMsg.ItemIndex := lstMsg.Count - 1;
    exit;
  end;
  //��ʼ����
  lstMsg.Items.Add('�������ȣ�');
  lstMsg.ItemIndex := lstMsg.Count - 1;
  CrtNo := CrtNo + 1;
  sSrcPath[0] := 'lnkDll.dpr';
  sSrcPath[8] := 'lnkDll.dproj';
  sSrcPath[2] := 'lnkDll.res';
  sSrcPath[3] := 'uDllDel.dfm';
  sSrcPath[4] := 'uDllDel.pas';
  sSrcPath[5] := 'uDllMain.dfm';
  sSrcPath[6] := 'uDllMain.pas';
  sSrcPath[7] := 'uDllSub.dfm';
  sSrcPath[1] := 'uDllSub.pas';
  sSrcPath[9] := 'lnkDll.dproj.local';
  sSrcPath[10] := 'lnkDll.identcache';

  sDstPath[0] := Trim(edtCode.Text) +'.dpr';
  sDstPath[8] := Trim(edtCode.Text) +'.dproj';
  sDstPath[2] := Trim(edtCode.Text) +'.res';
  sDstPath[3] := 'u' + SetFirstUpper(Trim(edtCode.Text)) +'Del.dfm';
  sDstPath[4] := 'u' + SetFirstUpper(Trim(edtCode.Text)) +'Del.pas';
  sDstPath[5] := 'u' + SetFirstUpper(Trim(edtCode.Text)) +'Main.dfm';
  sDstPath[6] := 'u' + SetFirstUpper(Trim(edtCode.Text)) +'Main.pas';
  sDstPath[7] := 'u' + SetFirstUpper(Trim(edtCode.Text)) +'Sub.dfm';
  sDstPath[1] := 'u' + SetFirstUpper(Trim(edtCode.Text)) +'Sub.pas';
  sDstPath[9] := Trim(edtCode.Text) +'.dproj.local';
  sDstPath[10] := Trim(edtCode.Text) +'.identcache';
  //1�����������ļ���
  lstMsg.Items.Add(IntToStr(CrtNo) + '�� ���������ļ���.....');
  lstMsg.ItemIndex := lstMsg.Count - 1;
  bIsOK := CreateDirectory(PWideChar('../../../src/'+trim(edtMan.Text) + '_' + Trim(edtCode.Text)),nil);
  if bIsOK then
  begin
    lstMsg.Items.Add('      �ɹ����������ļ��У�'+ trim(edtMan.Text) + '_' + Trim(edtCode.Text));
    lstMsg.ItemIndex := lstMsg.Count - 1;
  end
  else
  begin
    if ShowMsg('ѯ��','�ù����Ѵ��ڣ��Ƿ񸲸ǣ�',self,2) = mrCancel then
    begin
      Exit;
    end
    else
    begin
      lstMsg.Items.Add('      �ɹ����ǹ����ļ��У�'+ trim(edtMan.Text) + '_' + Trim(edtCode.Text));
      lstMsg.ItemIndex := lstMsg.Count - 1;
    end;
  end;

  //2������Demo���̵������ļ���
  CrtNo := CrtNo + 1;
  lstMsg.Items.Add(IntToStr(CrtNo) + '�� ����Demo����.....');
  lstMsg.ItemIndex := lstMsg.Count - 1;
  for I := 0 to 10 do
  begin
    fSrcFile := TFileStream.Create('../../../pub/lnkDll/' + sSrcPath[I],fmOpenRead);
    try
      fDstFile := TFileStream.Create('../../../src/'+trim(edtMan.Text) + '_' + Trim(edtCode.Text) +'/'+ sDstPath[i],fmOpenWrite or fmCreate);
      try
        fDstFile.CopyFrom(fSrcFile,fSrcFile.size);
      finally
        fDstFile.Free;
      end;
    finally
      fSrcFile.Free;
    end;
    lstMsg.Items.Add('      �ɹ�����['+sSrcPath[i] + ']��[' + sDstPath[i] +']��');
    lstMsg.ItemIndex := lstMsg.Count - 1;
  end;

  //3������ģ��ID
  CrtNo := CrtNo + 1;
  lstMsg.Items.Add(IntToStr(CrtNo) + '�� ����ģ��ID......');
  lstMsg.ItemIndex := lstMsg.Count - 1;
  ModuleID := Trim(edtCode.Text)+'by'+trim(edtMan.Text);
  if Length(ModuleID) < 20 then
  begin
    for I := 1 to 20 - Length(ModuleID) do
    begin
      ModuleID := ModuleID+'0';
    end;
  end;
  lstMsg.Items.Add('      ģ��ID:' + ModuleID);
  lstMsg.ItemIndex := lstMsg.Count - 1;

  //4����дģ����Ϣ
  CrtNo := CrtNo + 1;
  lstMsg.Items.Add(IntToStr(CrtNo) + '�� ��дģ����Ϣ......');
  lstMsg.ItemIndex := lstMsg.Count - 1;
  for I := 0 to 10 do
  begin
    if i = 2 then
    begin
      Continue;
    end;
    if i > 8 then
    begin
      Break;
    end;
    //��ȡ�ļ�
    sFileTxt := '../../../src/'+trim(edtMan.Text) + '_' + Trim(edtCode.Text)
                                    +'/'+ sDstPath[i];
    assignFile(tFile,sFileTxt);
    Reset(tFile);
    mmo1.Clear;
    sFileTxt := '';
    lstMsg.Items.Add('      �ɹ���ȡ�ļ�[' + sDstPath[i] +']��');
    lstMsg.ItemIndex := lstMsg.Count - 1;
    while not Eof(tFile) do
    begin
      Readln(tFile,sFileTxt);
      if (i = 8) and (nFlag = 0) then
      begin
        sFileTxt :='<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003">';
        nFlag := 1;
      end;
      mmo1.Lines.add(sFileTxt);
    end;
    CloseFile(tFile);

    mmo1.Text := StringReplace(mmo1.Text,PChar('lnkDll00000000000000'),PChar(ModuleID),[rfReplaceAll]);
    mmo1.Text := StringReplace(mmo1.Text,PChar('lnkDll'),PChar(Trim(edtCode.Text)),[rfReplaceAll]);
    mmo1.Text := StringReplace(mmo1.Text,PChar('Dll'),PChar(SetFirstUpper(Trim(edtCode.Text))),[rfReplaceAll]);
    mmo1.Text := StringReplace(mmo1.Text,PChar('Gen' + SetFirstUpper(Trim(edtCode.Text))),PChar('GenDll'),[rfReplaceAll]);

    //��д�ļ�
    sFileTxt := '../../../src/'+trim(edtMan.Text) + '_' + Trim(edtCode.Text)
                                    +'/'+ sDstPath[i];
    assignFile(tFile,sFileTxt);
    Rewrite(tFile);
    for j := 0 to mmo1.Lines.Count - 1 do
    begin
      Writeln(tFile,mmo1.Lines[j]);
    end;
    CloseFile(tFile);
    lstMsg.Items.Add('      �ɹ���д�ļ�[' + sDstPath[i] +']��');
    lstMsg.ItemIndex := lstMsg.Count - 1;
  end;
  //ģ��д�����ݿ�
  CrtNo := CrtNo + 1;
  lstMsg.Items.Add(IntToStr(CrtNo) + '�� �����������ݿ�ű�.....');
  lstMsg.ItemIndex := lstMsg.Count - 1;

  sFileTxt := 'InitNewModule.sql';
  assignFile(tFile,sFileTxt);
  Rewrite(tFile);

  sSql := 'delete from tModule where FID = '''+ ModuleID +''';';
  Writeln(tFile,sSql);
  sSql := 'go';
  Writeln(tFile,sSql);
  sSql := 'insert into tModule values(''' + ModuleID + ''','''
        + edtName.Text + ''',''' + edtCode.Text + ''',''False'');';
  Writeln(tFile,sSql);

  CloseFile(tFile);
  lstMsg.Items.Add('      �ɹ��������ݿ�ű���');
  lstMsg.ItemIndex := lstMsg.Count - 1;

  //ͨ��SQLCMDֱ���ύSQL�ļ�
  CrtNo := CrtNo + 1;
  lstMsg.Items.Add(IntToStr(CrtNo) + '�� ����ִ�����ݿ�ű�.....');
  lstMsg.ItemIndex := lstMsg.Count - 1;
  ShellExecute(Handle, 'open','SQLCMD.exe',PWideChar('-S 127.0.0.1 -E -d LnkSys -i "' +sFileTxt + '"'), nil, SW_HIDE);

  lstMsg.Items.Add('      �ɹ�ִ�����ݿ�ű���');
  lstMsg.ItemIndex := lstMsg.Count - 1;
  lstMsg.Items.Add('�������̳ɹ���');
  lstMsg.ItemIndex := lstMsg.Count - 1;


end;

procedure TfrmPrj.FormShow(Sender: TObject);
begin
  CrtNo := 0;
  ErrNo := 0;
  self.Left := (Screen.Width - Self.Width) div 2;
  Self.Top := (Screen.Height - Self.Height) div 2;
end;

end.
