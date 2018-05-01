/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  User
 * Created: 01.05.2018
 */
create sequence user_id_seq;

create table gender(id integer not null,
		    code character varying(10),
		    name character varying(50),
		    constraint gen_id_pk primary key(id))

WITH (
  OIDS=FALSE
);
ALTER TABLE gender
  OWNER TO postgres;

insert into gender(id, code, name)
values(1,'M','Мужской');

insert into gender(id, code, name)
values(2,'F','Женский');

create table user_roles(id integer not null,
		       code character varying(250),
		       name character varying(250),
		       descr character varying(1250),
		       constraint urole_pk primary key(id))
WITH (
  OIDS=FALSE
);
ALTER TABLE user_roles
  OWNER TO postgres;

insert into user_roles(id, code, name, descr)
values(1,'admin','Администратор','Администратор системы');

insert into user_roles(id, code, name, descr)
values(2,'moderator','Модератор','Имеет доступ к контенту пользователей в целях управления им');

insert into user_roles(id, code, name, descr)
values(3,'nutritionist','Диетолог','Диетолог может составлять план питания клиентам');

insert into user_roles(id, code, name, descr)
values(4,'manager','Контент менеджер','Контент менеджер занимается заполнением сайта контентом');

insert into user_roles(id, code, name, descr)
values(5,'client','Клиент','Пользователь системы');


create table users(id bigint NOT NULL DEFAULT nextval('user_id_seq'::regclass), 
		  urole_id integer,
                  gender_id integer,
		  email character varying(250), 
                  password character varying(250),
		  first_name character varying(250), 
		  last_name character varying(250), 
		  patr_name character varying(250), 
		  age integer, 
		  birth_date date,
                  create_time date,
                  update_time date,
		  active integer default 1,
		  constraint user_pk primary key(id),
		  constraint urole_user_fk foreign key(urole_id)
		  references user_roles(id) match simple
		  on update no action on delete no action)
WITH (
  OIDS=FALSE
);
ALTER TABLE users
  OWNER TO postgres;

