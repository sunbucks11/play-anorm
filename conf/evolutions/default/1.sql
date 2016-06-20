# --- First database schema

# --- !Ups

# -- set ignorecase true;

use `play-anorm`;

DROP TABLE if exists company;
DROP TABLE if exists computer;


create table company (
  id                        bigint not null AUTO_INCREMENT,
  name                      varchar(255) not null,
  constraint pk_company primary key (id))
;

create table computer (
#-- id                        bigint not null UNIQUE,
  id                        MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  name                      varchar(255) not null,
  introduced                datetime,
  discontinued              datetime,
  company_id                bigint,
  constraint pk_computer primary key (id))
  ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
;

#--create sequence company_seq start with 1000;
#--create sequence computer_seq start with 1000;



create index ix_computer_company_1 on computer (company_id);


# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists company;

drop table if exists computer;

# -- SET REFERENTIAL_INTEGRITY TRUE;
SET FOREIGN_KEY_CHECKS TRUE;

drop sequence if exists company_seq;

drop sequence if exists computer_seq;

