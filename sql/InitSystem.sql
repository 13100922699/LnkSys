--Init System data
--�û���ʼ��
insert into tUser
values( 'xiezj','л���',	'����Ա','123456',NULL,'2014-08-08 21:33:27.060',NULL,'18950498839','405790115',NULL,'False','True');
--�˵���ʼ��
insert into tMenu
values('��������',0,0,0,1,1,NULL,'False');
insert into tMenu
values('ϵͳ����',1,0,0,1,2,NULL,'False');
insert into tMenu
values('Ȩ�޹���',2,1,1,1,3,NULL,'False');
--Ȩ�޳�ʼ��
insert into tLimit
values(1,1);
insert into tLimit
values(1,2);
insert into tLimit
values(1,3);
--ģ���ʼ��  �����������ģ�� ֱ����sql�м���
insert into tModule
values('qxglbylnk00000000000','Ȩ�޹���','qxgl','False');
insert into tModule
values('xtdmbylnk00000000000','ϵͳ����','xtdm','False');
insert into tModule
values('xtrzbylnk00000000000','ϵͳ��־','xtrz','False');
insert into tModule
values('lnkDll0001','ģ��Demo','lnkDll','False');