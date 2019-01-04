-- Create table
create table USERS
(
  userid        VARCHAR2(32),
  nickname      VARCHAR2(128),
  password      VARCHAR2(128),
  fullname      VARCHAR2(255),
  email         VARCHAR2(255),
  mobile        VARCHAR2(18),
  fromcity      VARCHAR2(50),
  sign          VARCHAR2(255) default '暂时没有签名',
  gender        NUMBER(2) default 0,
  validateemail NUMBER(2) default 0,
  validateuser  NUMBER(2) default 0,
  starts        NUMBER(2) default 0,
  validateinfo  VARCHAR2(255),
  createdate    VARCHAR2(50),
  iseffective   NUMBER(2) default 0
);
-- Add comments to the columns 
comment on column USERS.nickname
  is '昵称';
comment on column USERS.password
  is '密码';
comment on column USERS.fullname
  is '全称';
comment on column USERS.email
  is '邮箱';
comment on column USERS.mobile
  is '手机';
comment on column USERS.fromcity
  is '城市';
comment on column USERS.sign
  is '签名';
comment on column USERS.gender
  is '性别 0-男，1-女';
comment on column USERS.validateemail
  is '邮箱是否认证 0-否 1-是';
comment on column USERS.validateuser
  is '用户是否认证 0-否 1-是';
comment on column USERS.starts
  is '可用积分';
comment on column USERS.validateinfo
  is '认证信息';
comment on column USERS.createdate
  is '创建时间';
comment on column USERS.iseffective
  is '是否有效用户0-有效，1-无效';
-- Create/Recreate indexes 
create index PK_USER on USERS (USERID);


-- Create table
create table ATTACHMENT
(
  id         VARCHAR2(32) not null,
  relationid VARCHAR2(32) not null,
  type       NUMBER not null,
  path       VARCHAR2(120),
  filetype   VARCHAR2(20),
  filename   VARCHAR2(100)
);
-- Add comments to the columns 
comment on column ATTACHMENT.id
  is 'id';
comment on column ATTACHMENT.relationid
  is '关联id';
comment on column ATTACHMENT.type
  is '0-用户头像';
comment on column ATTACHMENT.path
  is '路径';
comment on column ATTACHMENT.filetype
  is '文件类型';
comment on column ATTACHMENT.filename
  is '文件名称';
-- Create/Recreate primary, unique and foreign key constraints 
alter table ATTACHMENT
  add constraint PK_ATTACHMENT primary key (ID);
