-- Create table
create table TB_ATTACHMENT
(
  id         VARCHAR2(32) not null,
  relationid VARCHAR2(32) not null,
  type       NUMBER not null,
  path       VARCHAR2(120),
  filetype   VARCHAR2(20),
  filename   VARCHAR2(100)
);
-- Add comments to the table 
comment on table TB_ATTACHMENT is '附件信息表';
-- Add comments to the columns 
comment on column TB_ATTACHMENT.id is 'id';
comment on column TB_ATTACHMENT.relationid is '关联id';
comment on column TB_ATTACHMENT.type is '0-用户头像';
comment on column TB_ATTACHMENT.path is '路径';
comment on column TB_ATTACHMENT.filetype is '文件类型';
comment on column TB_ATTACHMENT.filename is '文件名称';
--  Create/Recreate primary, unique and foreign key constraints 
alter table TB_ATTACHMENT add constraint PK_ATTACHMENT primary key (ID);

  
 -- Create table
create table TB_USERS
(
  userid        VARCHAR2(32) not null,
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
-- Add comments to the table 
comment on table TB_USERS is '注册会员用户表';
-- Add comments to the columns 
comment on column TB_USERS.nickname is '昵称';
comment on column TB_USERS.password is '密码';
comment on column TB_USERS.fullname is '全称';
comment on column TB_USERS.email is '邮箱';
comment on column TB_USERS.mobile is '手机';
comment on column TB_USERS.fromcity is '城市';
comment on column TB_USERS.sign is '签名';
comment on column TB_USERS.gender is '性别 0-男，1-女';
comment on column TB_USERS.validateemail is '邮箱是否认证 0-否 1-是';
comment on column TB_USERS.validateuser is '用户是否认证 0-否 1-是';
comment on column TB_USERS.starts is '可用积分';
comment on column TB_USERS.validateinfo is '认证信息';
comment on column TB_USERS.createdate is '创建时间';
comment on column TB_USERS.iseffective is '是否有效用户0-有效，1-无效';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_USERS
  add constraint PK_USER primary key (USERID);

  
  
  -- Create table
create table TB_SUBJECT
(
  id         VARCHAR2(32) not null,
  title      VARCHAR2(250),
  module     VARCHAR2(2),
  status     VARCHAR2(50),
  browse     NUMBER,
  reply      NUMBER,
  integral   NUMBER,
  createdate VARCHAR2(32),
  userid     VARCHAR2(32)
);
-- Add comments to the table 
comment on table TB_SUBJECT is '帖子主题表';
-- Add comments to the columns 
comment on column TB_SUBJECT.title is '标题';
comment on column TB_SUBJECT.module is '模块  0-分享，1-讨论，2-提问，3-公告，4-动态，5-建议';
comment on column TB_SUBJECT.status is '帖子状态0-默认模块，1-未结，2-已结，3-审核中，4-顶置，5-精贴';
comment on column TB_SUBJECT.browse is '浏览数';
comment on column TB_SUBJECT.reply is '回帖数';
comment on column TB_SUBJECT.integral is '帖子积分';
comment on column TB_SUBJECT.createdate is '创建时间';
comment on column TB_SUBJECT.userid is '发帖人';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_SUBJECT 
  add constraint PK_SUBJECT primary key (ID);
  
 -- Create table
create table TB_CONTENT
(
  id      VARCHAR2(32) not null,
  sub_id  VARCHAR2(32) not null,
  content CLOB
);
-- Add comments to the table 
comment on table TB_CONTENT is '主题内容表';
-- Add comments to the columns 
comment on column TB_CONTENT.sub_id is '主题id';
comment on column TB_CONTENT.content is '内容';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_CONTENT
  add constraint PK_CONTENT primary key (ID, SUB_ID);
  
  
  -- Create table
create table TB_REPLY
(
  id         VARCHAR2(32) not null,
  sub_id     VARCHAR2(32),
  content    CLOB,
  userid     VARCHAR2(32),
  ip         VARCHAR2(32),
  createdate VARCHAR2(32)
);
-- Add comments to the table 
comment on table TB_REPLY is '主题回复表';
-- Add comments to the columns 
comment on column TB_REPLY.sub_id is '主题id';
comment on column TB_REPLY.content is '回帖内容'; 
comment on column TB_REPLY.userid is '回帖人';
comment on column TB_REPLY.ip is 'ip地址';
comment on column TB_REPLY.createdate is '回复时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_REPLY
  add constraint PK_REPLY primary key (ID);
  