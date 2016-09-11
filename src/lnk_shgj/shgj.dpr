library shgj;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  System.SysUtils,
  System.Classes,
  Windows,
  dbtables,
  ADODB,
  forms,
  MyPub,
  uShgjMain in 'uShgjMain.pas' {frmShgjMain},
  uShgjSub in 'uShgjSub.pas' {frmShgjSub},
  uShgjDel in 'uShgjDel.pas' {frmShgjDel};

{$R *.res}
const
  MODUALEID = 'shgjbylnk00000000000';   //ģ��ţ��޸ĳ���Ӧ��ģ���
 var
  SaveDLLApp: TApplication;
{
  ���ܣ�����MDICHILDFORM
  ������APP�����Ӧ�ó�����
        CORBACONNECT��APP SERVER���ӵľ��
        FRM����ָ�루������
}

procedure CreateForm(App: TApplication; adoCon: TAdoConnection; nUser: Integer; var frm: TForm);stdcall;export;
var
  frmShgj: TfrmShgjMain;
begin
  if  not  Assigned(SaveDLLApp)  then
  begin
    SaveDLLApp:= Application;
    Application := App;
  end;



  //MODIFY ��������
  tmp_g_user := nUser;
  tmp_g_con := adoCon;
  tmp_g_moduleid := MODUALEID;
  frmShgj := TfrmShgjMain.Create(Application);
  with frmShgj do
  begin
    FormStyle := fsMDIChild;
    frm := frmShgj;
  end;
end;
procedure  MyLibraryProc(Reason:integer);
begin
  if  Reason=0 then
  begin
    Application := SaveDLLApp;

  end;
end;
exports
  CreateForm;

begin
  DLLProc:=@MyLibraryProc;
end.


