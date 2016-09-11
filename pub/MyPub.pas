{**********************************************************************
* �ļ�����: MyPub.pas
* �汾��Ϣ��2014.07(lnk)
* �ļ�������
            �������ͨ�ú��������뺯���밴����˵���ú������ܡ�������
            ����ֵ����Ϣ����Ҫʱ��������ʵ��
* �� �� �ߣ�qianlnk
* ����ʱ�䣺2014.07.19
***********************************************************************}
unit MyPub;

interface

uses SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Variants,
  Controls, Forms, Dialogs, ExtCtrls, StdCtrls, DBClient, DB, Mask,
  DBCtrls, URLMON, AdoDB,Math,Vcl.ComCtrls,Vcl.Buttons
  ;

{**********************************************************************
���̹��ܣ�ͨ��ADO��ѯ,�����û�����SQL��������
����˵����adoqry��TADOQuery���,sqltxt-SQL���
��ʷ��Ϣ��2014.07.19 created by qianlnk
**********************************************************************}
procedure OpenAdoQuery(adoQry: TADOquery; sqltxt: widestring);

{**********************************************************************
���̹��ܣ�ͨ��ADOִ��,�����û�����SQL�ύ����
����˵����adoqry1��TADOQuery���,sqltxt-EXECSQL���
��ʷ��Ϣ��2014.07.19 created by qianlnk
**********************************************************************}
procedure ExecAdoQuery(adoQry: TADOquery; sqltxt: widestring);

//���̹��ܣ�ͨ��ADODataSetִ��,�����û�����SQLCOMMAND��������
procedure OpenAdoDataSet(adoDataSet: TADODataSet; commandStr: widestring);
{**********************************************************************
���̹��ܣ�������Ļ�������,֧�ֻس�������һ�ؼ�
����˵����������Ӧ���keyDown�����еĲ���
��ʷ��Ϣ��2014.07.19 created by qianlnk
**********************************************************************}
procedure ControlKey(var Key: Word; Shift: TShiftState);

{**********************************************************************
���̹��ܣ����ھ���
����˵������
��ʷ��Ϣ��2014.07.19 created by qianlnk
**********************************************************************}
procedure PutFormCenter(subForm: TForm; MainForm: TForm);
{**********************************************************************
���̹��ܣ�����λ������
����˵������
��ʷ��Ϣ��2014.08.05 created by qianlnk
**********************************************************************}
procedure SetSubFormPlace(subForm: TForm);
{**********************************************************************
���̹��ܣ��ж�Edit����Ϊ��
����˵����Edit1 �����
          MainForm ���øù��̵Ĵ���
��ʷ��Ϣ��2014.07.19 created by qianlnk
**********************************************************************}
function EditValid(Edit1: TEdit; strMsg: string; MainForm: TForm):boolean;

{**********************************************************************
�������ܣ���Ϣ��ʾ����
����˵����sTitle ��������
          sMsg ��Ϣ
          MainForm ���øõ����Ĵ��� ���ڵ�������
          btnCount ��ť����
��ʷ��Ϣ��2014.07.19 created by qianlnk
**********************************************************************}
function ShowMsg(sTitle: Widestring; sMsg: widestring; MainForm: TForm; btnCount:Integer = 1):Integer;
{**********************************************************************
���̹��ܣ���combobox��������ݿ�ѡ��
����˵����qry1��ѯ�����
          itemNameѡ�����
          IsDel�Ƿ����
��ʷ��Ϣ��2014.08.04 created by qianlnk
**********************************************************************}
procedure AddItemToCommbox(qry1: TADOQuery; itemName: string;
                           cbb1:TComboBox; IsDel:Boolean = True);
{**********************************************************************
���̹��ܣ���ȡtreeview�Ľ�㼰�ӽڵ��textֵ���ö��Ÿ���
����˵����strText
          node
��ʷ��Ϣ��2014.08.05 created by qianlnk
**********************************************************************}
procedure GetTvTextAndChild(var strText: string; node: TTreeNode);
{**********************************************************************
���̹��ܣ���ȡtreeview�Ľ��Nodeͬ����㼰�ӽڵ��textֵ���ö��Ÿ���
����˵����strText
          node
��ʷ��Ϣ��2014.08.05 created by qianlnk
**********************************************************************}
procedure GetAllTvTextAfterNode(var strText: string; node: TTreeNode);

{**********************************************************************
���̹��ܣ�����treeview�Ľ��Node��ͬ����㼰���ǵ��ӽڵ��״̬
����˵����node
          state
��ʷ��Ϣ��2014.08.05 created by qianlnk
**********************************************************************}
procedure SetTvNodeStateIndex(node: TTreeNode; nState: Integer);

{**********************************************************************
���̹��ܣ�չ��treeview�Ľ��
����˵����treeview
��ʷ��Ϣ��2014.08.05 created by qianlnk
**********************************************************************}
procedure ExpandTvItem(tv: TTreeView);

{**********************************************************************
���̹��ܣ���treeview�Ľ��ǰ��һ����ѡ��
����˵����treeview
��ʷ��Ϣ��2014.08.09 created by qianlnk
**********************************************************************}
procedure DrowChkBoxForTv(tv: TTreeView);

{**********************************************************************
���̹��ܣ���ָ�������µ����б༭�ؼ�����Ϊֻ��
����˵����AComponent: TComponent
��ʷ��Ϣ��2014.08.06 created by qianlnk
**********************************************************************}
procedure SetReadOnly(AComponent: TComponent);

{**********************************************************************
���̹��ܣ�����������־
����˵����adoQry  qry�ؼ� ���ڲ���
          UserId  �û�ID
          Module  ģ������
          type    ��������
          remark  ��������
��ʷ��Ϣ��2014.08.07 created by qianlnk
**********************************************************************}
procedure MakeLog(adoQry: TADOquery; UserId: Integer; sModule: string;
                  sType: string; sRemark: string);

{**********************************************************************
���̹��ܣ��жϲ����ָ���ֶ�ֵ�Ƿ��ظ�
����˵����sCloum --�ֶ�
          sValue --ֵ
          sTbale --��
��ʷ��Ϣ��2014.08.06 created by qianlnk
**********************************************************************}
function IsExist(adoQry: TADOquery; sCloum: string; sValue:string; sTable:string):Boolean;

{**********************************************************************
���̹��ܣ���ȡ��һ����¼��FID
����˵����adoQry: TADOquery
          sTbale
��ʷ��Ϣ��2014.08.06 created by qianlnk
**********************************************************************}
function GetNextID(adoQry: TADOquery; sTable:string):Integer;

{**********************************************************************
���̹��ܣ�ƴ�ӽ�����ļ�¼
����˵����adoQry: TADOquery --�����
          sColumn:          --Ҫƴ�ӵ�����
��ʷ��Ϣ��2014.08.06 created by qianlnk
**********************************************************************}
function wm_concat(adoQry: TADOquery; sColumn:string):string;

{**********************************************************************
���̹��ܣ���ʼ��ģ��Ȩ��
����˵����adoQry: TADOquery
          frm:          --ģ��������
          sModileId��   --ģ��汾��
          nUser��       --��ǰ��¼�û�
��ʷ��Ϣ��2014.08.06 created by qianlnk
**********************************************************************}
procedure InitModuleLimit(adoqry: TADOQuery; frm: TForm;
                          sModileId: string; nUser: integer);

{**********************************************************************
���̹��ܣ��������µ����б༭�ؼ���������ݽ��а�ȫ��� ��ֹ�ڿ͵�SQLע��
����˵����AComponent: TComponent
          frm: ���жϵ��������ڵĴ���   ������Ϣ��ʾ
��ʷ��Ϣ��2014.08.20 created by qianlnk
��    �������е�SQL��ѯ����ʱ������øù���
**********************************************************************}
function SafeCheck(AComponent: TComponent; frm:TForm):Boolean;
//�� SafeCheck�е���
function CheckString(sContent:string;frm:TForm):Boolean;
{---------------------------------------------------------------------}
{                                  ʵ��                               }
{---------------------------------------------------------------------}
implementation

uses uShowMsg;

//���̹��ܣ�ͨ��ADO��ѯ,�����û�����SQL��������
procedure OpenAdoQuery(adoQry: TADOquery; sqltxt: widestring);
begin
  with adoQry do
  begin
    if active then close;
    SQL.clear;
    SQL.add(sqltxt);
    open;
  end;
end;

//���̹��ܣ�ͨ��ADOִ��,�����û�����SQL�ύ����
procedure ExecAdoQuery(adoQry: TADOquery; sqltxt: widestring);
begin
  with adoQry do
  begin
    if active then close;
    SQL.clear;
    SQL.add(sqltxt);
    EXECSQL;
  end;
end;

//���̹��ܣ�ͨ��ADOִ��,�����û�����SQL�ύ����
procedure OpenAdoDataSet(adoDataSet: TADODataSet; commandStr: widestring);
begin
  with adoDataSet do
  begin
    if active then close;
    CommandText := commandStr;
    open;
  end;
end;
//������Ļ�������
procedure ControlKey(var Key: Word; Shift: TShiftState);
var
  CurForm: TForm;
  CurControl: TWinControl;
  bSelectNext: boolean;
begin
  CurForm := Screen.ActiveForm;
  CurControl := CurForm.ActiveControl;
  if Shift = [] then
  begin
    case Key of
      VK_RETURN:
        begin
          bSelectNext := FALSE;
          if (CurControl is TEdit) then bSelectNext := TRUE;
          if (CurControl is TCombobox) then bSelectNext := TRUE;
          if (CurControl is TMaskEdit) then bSelectNext := TRUE;
          if (CurControl is TDBEdit) then bSelectNext := TRUE;
          //if (CurControl is TDateTime) then bSelectNext := TRUE;
          if bSelectNext then CurForm.Perform(CM_DIALOGKEY, VK_TAB, 0);
        end;
    end;
  end;
end;

//���ھ���
procedure PutFormCenter(subForm: TForm; MainForm: TForm);
begin
  subForm.Left := (MainForm.Width - subForm.Width) div 2 + MainForm.Left;
  subForm.Top := (MainForm.Height - subForm.Height)div 2 + MainForm.Top;
end;
//����λ������
procedure SetSubFormPlace(subForm: TForm);
begin
  subForm.Top := 105;
  subForm.Left := (screen.Width - subForm.Width) div 2;
end;
//�������ܣ���Ϣ��ʾ����
function ShowMsg(sTitle: Widestring; sMsg: widestring; MainForm: TForm; btnCount:Integer = 1):Integer;
var msgLen : integer;
begin
  FrmShowMsg := TFrmShowMsg.Create(Application);
  msgLen := length(sMsg) * 10;
  with FrmShowMsg do
  begin
    if msgLen > 180 then
    begin
      width := msgLen + 130;
    end
    else
    begin
      width := 350;
    end;

    height := 150;
    Caption := sTitle;
    m_msg := sMsg;
    lbMsg.Left := 85;
    lbMsg.Top := 30;
    if btnCount = 1 then
    begin
      btnCancle.Visible := False;
      btnSure.Visible := True;
      btnSure.Left := FrmShowMsg.Width - btnSure.Width - 20;
    end
    else
    begin
      btnCancle.Visible := True;
      btnSure.Visible := True;
      btnSure.Left := FrmShowMsg.Width - btnSure.Width - btnSure.Width - 30;
      btnCancle.Left := FrmShowMsg.Width - btnCancle.Width - 20;
    end;
    PutFormCenter(FrmShowMsg,MainForm);
  end;
  //if FrmShowMsg.ShowModal = IDOK then
  begin
    Result := FrmShowMsg.ShowModal;
  end;
  FrmShowMsg.Release;
end;

//�ж�Edit����Ϊ��
function EditValid(Edit1: TEdit; strMsg:string ; MainForm: TForm):boolean;
begin
  if (trim(Edit1.Text)='') then
  begin
    ShowMsg('ϵͳ��ʾ', '������������' + strMsg, MainForm);
    if Edit1.Enabled then Edit1.SetFocus;
    result := TRUE;
  end
  else
    result := FALSE;
end;

//��������ѡ�ѡ���
procedure AddItemToCommbox(qry1: TADOQuery; itemName: string;
                           cbb1:TComboBox;IsDel:Boolean = True);
var i: Integer;
begin
  if IsDel then
  begin
    cbb1.Clear;
  end;
  if(qry1.RecordCount = 0) then
  begin
    Exit;
  end;
  for i := 0 to qry1.RecordCount - 1 do
  begin
    cbb1.Items.Add(trim(qry1.FieldValues[itemName]));
    qry1.Next;
  end;
   if cbb1.Items.count <>0 then
    cbb1.ItemIndex := 0;
end;

//��ȡtreeview�Ľ�㼰���ӽڵ��textֵ���ö��Ÿ���
procedure GetTvTextAndChild(var strText: string; node: TTreeNode);
var
    tmpNode: TTreeNode;
begin
  tmpNode := node;
  if tmpNode <> nil then
  begin
    if strText = '' then
    begin
      strText := '''' + tmpNode.Text + '''';
    end
    else
    begin
      strText := strText + ',' + '''' + tmpNode.Text + '''';
    end;
    if tmpNode.HasChildren then
    begin
      GetAllTvTextAfterNode(strText,tmpNode.getFirstChild);
    end;
  end;
end;
//��ȡtreeview�Ľ��Node��ͬ������Լ����ǵ��ӽڵ��textֵ���ö��Ÿ���
procedure GetAllTvTextAfterNode(var strText: string; node: TTreeNode);
var
    tmpNode: TTreeNode;
begin
  tmpNode := node;
  while tmpNode <> nil do
  begin
    if strText = '' then
    begin
      strText := '''' + tmpNode.Text + '''';
    end
    else
    begin
      strText := strText + ',' + '''' + tmpNode.Text + '''';
    end;
    if tmpNode.HasChildren then
    begin
      GetAllTvTextAfterNode(strText,tmpNode.getFirstChild);
    end;
    tmpNode := tmpNode.getNextSibling;
  end;
end;

//����treeview�Ľ��Node��ͬ����㼰���ǵ��ӽڵ��״̬
procedure SetTvNodeStateIndex(node: TTreeNode; nState: Integer);
var
    tmpNode: TTreeNode;
begin
  tmpNode := node;
  while tmpNode <> nil do
  begin
    tmpNode.StateIndex := nState;

    if tmpNode.HasChildren then
    begin
      SetTvNodeStateIndex(tmpNode.getFirstChild,nState);
    end;
    tmpNode := tmpNode.getNextSibling;
  end;
end;
//չ��treeview���н��
procedure ExpandTvItem(tv: TTreeView);
var i:Integer;
begin
  for i := 0 to tv.Items.Count - 1 do
    begin
      tv.Items[i].Expanded := True;
    end;
end;

//��ָ�������µ����б༭�ؼ�����Ϊֻ��
procedure SetReadOnly(AComponent: TComponent);
var i: Integer;
begin
  //˵����û�п��Ƶ��Ŀؼ������������
  if AComponent is TEdit then TEdit(AComponent).ReadOnly := True;
  if AComponent is TComboBox then TComboBox(AComponent).Enabled := False;
  if AComponent is TMemo then TMemo(AComponent).ReadOnly := True;
  if AComponent is TCheckBox then TCheckBox(AComponent).Enabled := False;
  if AComponent is TDateTimePicker then TDateTimePicker(AComponent).Enabled := False;


  if AComponent is TWinControl then //�ؼ�����������ݹ�
  begin
    for i := 0 to TWinControl(AComponent).ControlCount - 1 do
    begin
      SetReadOnly(TWinControl(AComponent).Controls[i]);
    end;

  end;
end;

//����������־
procedure MakeLog(adoQry: TADOquery; UserId: Integer; sModule: string; sType: string; sRemark: string);
var sqltxt: string;
    //FID: Integer;
begin
  //FID := GetNextID(adoQry,'tLog');

  sqltxt := 'Insert into tLog(FUserID, FDate, FModule, FType, FRemark) '
          + 'values(' + IntToStr(UserId) + ',getdate(),''' + sModule
          + ''',''' + sType + ''',''' + sRemark + ''')';
  ExecAdoQuery(adoQry,sqltxt);
end;

{**********************************************************************
���̹��ܣ��жϲ����ָ���ֶ�ֵ�Ƿ��ظ�
����˵����sCloum --�ֶ�
          sValue --ֵ
          sTbale --��
��ʷ��Ϣ��2014.08.06 created by qianlnk
**********************************************************************}
function IsExist(adoQry: TADOquery; sCloum: string; sValue:string; sTable:string):Boolean;
var sqltxt:string;
begin
  sqltxt := 'select * from ' + sTable + ' where ' + sCloum + ' = ''' + sValue + ''' ';
  OpenAdoQuery(adoQry,sqltxt);
  if adoQry.RecordCount > 0 then
  begin
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

//��ȡ��һ����¼��FID
function GetNextID(adoQry: TADOquery; sTable:string):Integer;
var sqltxt: string;
begin
  sqltxt := 'select isnull(max(FID),0) as FID from ' + sTable;
  OpenAdoQuery(adoQry,sqltxt);
  if adoQry.RecordCount = 0 then
  begin
    Result := 1;
  end
  else
  begin
    Result := StrToInt(trim((adoQry.FieldByName('FID').AsString))) + 1;
  end;
end;

//��treeview�Ľ��ǰ��һ����ѡ��
procedure DrowChkBoxForTv(tv: TTreeView);
var i:Integer;
begin
  for i := 0 to tv.Items.Count - 1 do
    begin
      tv.Items[i].StateIndex := 1;
    end;
end;

//ƴ�ӽ�����ļ�¼
function wm_concat(adoQry: TADOquery; sColumn:string):string;
var sRes: string;
    i: Integer;
begin
  if adoQry.RecordCount = 0 then
  begin
    Result := '';
    Exit;
  end;
  for i := 0 to adoQry.RecordCount - 1 do
  begin
    if sRes = '' then
    begin
      sRes := adoQry.FieldByName(sColumn).AsString;
    end
    else
    begin
      sRes := sRes + ',' + adoQry.FieldByName(sColumn).AsString;
    end;
    adoQry.Next;
  end;
  Result := sRes;
end;

//��ʼ��ģ��Ȩ��
procedure InitModuleLimit(adoqry: TADOQuery; frm: TForm; sModileId: string; nUser:integer);
var i: Integer;
    Compon : TComponent;
    OldLeft: Integer; //��һ�������leftֵ
    sqltxt: string;
    j: Integer;
    sFuncs: WideString;
begin
  OldLeft := 5;
  sqltxt := 'select FFuncCaption from tModuleFunc where FModuleID = (select FID from tModule where FCode = ''' + sModileId + ''')'
          + 'and FID in(select FModuleFuncID from tFuncLimit where FUserID = '+ IntToStr(nUser) +')';
  OpenAdoQuery(adoqry,sqltxt);
  sFuncs := wm_concat(adoqry,'FFuncCaption');
  for i := 0 to frm.ComponentCount - 1 do
  begin
    Compon := frm.Components[i];
    if Compon is TBitBtn then
    begin
      if (Compon As TBitBtn).Visible = False then
      begin //������ϵͳ���ʱ������
        Continue;
      end;

      if Pos((Compon As TBitBtn).Caption,sFuncs) > 0 then
      begin
        (Compon As TBitBtn).Visible := False;
      end
      else
      begin
        (Compon As TBitBtn).Visible := True;
      end;
      if (Compon As TBitBtn).Visible and ((Compon As TBitBtn).Caption <> '��ѯ') then
      begin
        (Compon As TBitBtn).Left := OldLeft;
        OldLeft := OldLeft + (Compon As TBitBtn).Width;
      end;
    end;
  end;
end;

//�������µ����б༭�ؼ���������ݽ��а�ȫ��� ��ֹ�ڿ͵�SQLע��
function SafeCheck(AComponent: TComponent; frm:TForm):Boolean;
var i: Integer;
    sContent: string;//�༭���е�����
    nFlag: Integer;
begin
  //˵����û�п��Ƶ��ı༭�ؼ������������
  if AComponent is TEdit then
  begin
    sContent := TEdit(AComponent).Text;
    if CheckString(sContent,frm) then
    begin
      TEdit(AComponent).SetFocus;
      Result := True;
      Exit;
    end;
  end;
  if AComponent is TComboBox then
  begin
    sContent := TComboBox(AComponent).Text;
    if CheckString(sContent,frm) then
    begin
      TComboBox(AComponent).SetFocus;
      Result := True;
      Exit;
    end;
  end;
  if AComponent is TMemo then
  begin
    sContent := TMemo(AComponent).Text;
    if CheckString(sContent,frm) then
    begin
      TMemo(AComponent).SetFocus;
      Result := True;
      Exit;
    end;
  end;

  // nFlag �������ͱ��Ŀǰ�Ȳ���


  if AComponent is TWinControl then //�ؼ�����������ݹ�
  begin
    for i := 0 to TWinControl(AComponent).ControlCount - 1 do
    begin
      if SafeCheck(TWinControl(AComponent).Controls[i],frm) then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;
  Result := False;
end;
const
CK_SQLInjection: array[0..13] of string=(
'''',';','--','/*','#','SELECT','DELETE','DROP','INSERT','UNION',
'UPDATE','ALTER','CREATE','EXEC'
);
function CheckString(sContent:string;frm:TForm):Boolean;
var i :Integer;
begin
  // ���˶�SQL������е��ַ���
  for I := 0 to 13 do
  begin
    if Pos(CK_SQLInjection[i],UpperCase(sContent))>0 then
    begin
      ShowMsg('����','�������Ϣ���������['+ CK_SQLInjection[i] +']��',frm);
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;
end.

