drop table if exists lma_user;
create table lma_user (
	id					bigint unsigned not null auto_increment,
	username			varchar(128),
	email				varchar(128) not null,
	phone				varchar(15),
	password_hash		char(64) not null,
	activationkey	    varchar(128) not null,
	superuser			int(1) not null default '0',
	status				int(1) not null default '0',
	lastvisit			datetime,
	createdat			timestamp default current_timestamp ,
	updatedat			datetime,
	primary key (id),
	unique(email)
) 
engine = innodb
default character set = utf8;


drop table if exists lma_order;
create table lma_order (
	id                  bigint unsigned not null auto_increment,
    user_id             bigint unsigned not null,
    delivery_date       datetime,
    status              int(1) not null default 0,
	createdat			timestamp default current_timestamp ,
	updatedat			datetime,
    primary key(id),
    constraint lma_order_user foreign key (user_id) 
    references lma_user(id)
    on delete no action on update no action
) engine = innodb
default character set = utf8;


drop table if exists lma_item;
create table lma_item (
    id                  bigint unsigned not null auto_increment,
    name                varchar(250) not null,
    description         text,
	primary key (id),
    unique(name)
) 
engine = innodb
default character set = utf8;

drop table if exists lma_service;
create table lma_service (
    id                  bigint unsigned not null auto_increment,
    name                varchar(250) not null,
    description         text,
    charge              float not null default 0.0,
	primary key (id),
    unique(name)
) 
engine = innodb
default character set = utf8;


drop table if exists lma_orderItem;
create table lma_orderItem (
	id                  bigint unsigned not null auto_increment,
    order_id            bigint unsigned not null,
    item_id             bigint unsigned not null,
    service             varchar(25),
    status              int(1) not null default 0,
    token               int not null,
	createdat           timestamp default current_timestamp ,
	updatedat           datetime,
    primary key(id),
    constraint lma_orderitem_order foreign key (order_id) 
    references lma_order(id)
    on delete no action on update no action
) engine = innodb
default character set = utf8;
