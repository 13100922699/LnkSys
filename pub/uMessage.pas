{**********************************************************************
* �ļ�����: uMessage.pas
* �汾��Ϣ��2014.07(lnk)
* �ļ�������
            �Զ�����Ϣ��Ԫ
* �� �� �ߣ�qianlnk
* ����ʱ�䣺2014.07.28
***********************************************************************}

unit uMessage;

interface
uses Messages;
const
  WM_USER_UNDOCK = WM_USER + 100; //ͣ�����岻ͣ���¼�
  WM_User_CALLDLL = WM_USER + 101; //����һ��DLL�еĴ�����Ϣ
  WM_USER_DLLFORMEXIT = WM_USER + 102; //DLL�еĴ���ر��������巢����Ϣ
  WM_USER_SHOWFORM = WM_USER + 103;
  MSG_OK = 0;
  MSG_CANCLE = 1;

implementation

end.

