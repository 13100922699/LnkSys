::
:: xuxiaoxi by 20121024 v1.1
::
:: 20121027���޸�֧�ֺ��ո���ļ���
::
:: [isqlw][osql][isql] -U sa -P -S 127.0.0.1 -i inputfile -o outputfile
:: [isql]��֧��unicode�ļ�;[osql]֧��unicode�ļ�;[isqlw]�൱�ڲ�ѯ������
:: osql���osql -E -d DataBaseName -i InputFile >> outputfile
:: ���� >> �ض���׷�������

@echo OFF
::echo ���ύ��ǰĿ¼�Լ���Ŀ¼������*.sql�ļ���SQL��ѯ������ִ��
::set /p p=�Ƿ��ύ��(Y/N):
::if "%p%"=="y" (
  :: ��ȡ��ǰʱ��
:begin
  echo %Date:~0,10% %time:~0,5% >> %CD%\Log_ExecSql.txt 
  echo. >> %CD%\Log_ExecSql.txt
  :: ��ʼ�ύsql�ű�
  for /r .\ %%i in (*.sql) do (
    echo �ύ %%i
    echo.�ύ %%i ��SQL��ѯ������ִ�� >> %CD%\Log_ExecSql.txt 
    SQLCMD -S 127.0.0.1 -E -d LnkSys -i "%%i" -o %CD%\Log.txt
    type %CD%\Log.txt & echo. 
    type %CD%\Log.txt >> %CD%\Log_ExecSql.txt    
    echo. >> %CD%\Log_ExecSql.txt  
  )
  if exist %CD%\Log.txt del %CD%\Log.txt
::pause
::) else if "%p%"=="Y" goto begin

