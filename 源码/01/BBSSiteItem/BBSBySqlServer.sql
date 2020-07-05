create database BBSDB
go
use BBSDB
go
--��ͨ�û���
create table UsersByCustomer
(
  ID int identity(1,1) primary key,
  UserName varchar(60) Not NULL,
  UserPassword varbinary(1024) Not NULL,
  NickName varchar(10) Not NULL,
  Sex char(2) Not NULL,
  Age int Not NULL,
  PhotoUrl varchar(255) DEFAULT NULL,
  Shenfenzheng varchar(20) NULL DEFAULT 0,
  Fatieshu int NULL DEFAULT 0,
  Huitieshu int NULL DEFAULT 0  
)
--�����û���
create table UsersBySystem (
  ID int identity(1,1) primary key,
  RoleID int not null,
  NickName varchar(60) NOT NULL,
  UserPassword varbinary(1024) NOT NULL,
  Email varchar(45) DEFAULT NULL
) 
--��ɫ��
create table UserByRole (
  ID int identity(1,1) primary key Not NULL,
  RoleName varchar(60) Not NULL
)
--��ĿȨ�޶����
create table UserByPermission (
  ID int identity(1,1) Not NULL,
  PermissionName varchar(60) Not NULL
)
--��ɫ��Ȩ�޹�����
create table UserByRoleJoinPermission (
  RoleID int NOT NULL,
  PermissionID int NOT NULL
)
--�������
create table ForumArea
(
  ID int identity(1,1) primary key NOT NULL,
  AreaName varchar(64) Not NULL
) 
--������
create table ForumClassify
(
  ID int identity(1,1) primary key NOT NULL,
  ForumAreaID int Not NULL,
  ClassifyName varchar(45) DEFAULT NULL,
  ClassifyLogo varchar(526) Null,
  ClassifyOrder int Not NULL DEFAULT 0,
  ClassifyIsleaf bit DEFAULT 0
) 
--��������
CREATE TABLE ForumMain (
  ID int identity(1,1) primary key NOT NULL,
  Title varchar(128) NOT NULL,
  ForumAreaID int NOT NULL,
  ForumClassifyID int NOT NULL,
  CreateUserID int NOT NULL,
  CreateTime datetime NOT NULL,
  Content text NOT NULL,    
  IsRecommend bit NOT NULL,
  Isdelete bit NOT NULL,
  Zan int DEFAULT NULL
) 
--���ӳ���״̬
create table ForumInfoStatus (
  ID int identity NOT NULL,
  ForumMainID int NOT NULL,
  ReplyNumber int NOT NULL default 0,
  SeeNumber int NOT NULL default 0,
  LastReplyUserID int NULL default 0,
  LastReplytime datetime NULL
)
--���ӻظ���
create table ForumSecond (
  ID int identity(1,1) primary key Not NULL,
  ForumMainID int NOT NULL,--����ID
  CurSequence int Not Null,--��ǰ¥��
  Content text NOT NULL,
  CreateUserID varchar(20) NOT NULL,
  CreateTime datetime NOT NULL,
  ReplySequence int NOT NULL,--�ظ�¥��,Ĭ��0 �ظ�����
  IsDelete char(1) NOT NULL,
  ReplyID varchar(64) NOT NULL--���ظ�������ID,��ظ���������ForumMainID��ͬ
)  