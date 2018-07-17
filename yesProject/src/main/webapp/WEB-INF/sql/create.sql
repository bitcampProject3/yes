-- create DATABASE mydb;
-- USE mydb;


create table user_info(
	id varchar(30) primary key,
	password varchar(30) not null,
	name varchar(30) not null,
	nickname varchar(30) not null,
	email varchar(30) not null,
	phoneNum varchar(30) not null,
	pwQuestion varchar(100) not null,
	birthDate date not null,
	registNum varchar(30)

);



create table branch_info(
	id varchar(20) primary key,
	opTime varchar(20) not null,
	breakTime varchar(20) not null,
	opDate varchar(20) not null,
	menu varchar(20) not null,
	address varchar(20) not null,
	phoneNum varchar(20) not null,
	image varchar(20) not null,
	score decimal(2,1) not null

);


create table ticketing(
	brnachID varchar(20) primary key,
	clientID varchar(20) ,
	ticketingTime datetime not null,
	waitingNum int not null

);


create table br_accept(
	licenceNum varchar(20) primary key,
	name varchar(20) not null,
	address varchar(20) not null,
	opTime varchar(20) not null,
	menu varchar(20) not null,
	image varchar(20) not null,
	phoneNum varchar(20) not null,
	cartegory varchar(20) not null


);


create table reserve_list(
	branchID varchar(20) primary key,
	clientID varchar(20) not null,
	reserveTime date not null,
	personel int not null,
	request varchar(100) not null

);


create table review(
	branchID varchar(20) primary key,
	clientID varchar(20) not null,
	idx int not null,
	title varchar(20) not null,
	content varchar(100) not null,
	writer varchar(20) not null,
	calendar date not null,
	image varchar(20) not null,
	comment varchar(20) not null


);

create table notice (
	idx int primary key,
	title varchar(20) not null,
	content varchar(100) not null,
	writer varchar(20) not null,
	calendar date not null,
	image varchar(20) not null


);



create table branch_Counsel(
	idx int primary key,
	title varchar(20) not null,
	content varchar(100) not null,
	writer varchar(20) not null,
	calendar date not null,
	image varchar(20) not null,
	comment varchar(20) not null


);

 
create table client_Counsel(
	branchID varchar(20) primary key,
	clientID varchar(20) not null,
	idx int not null,
	title varchar(20) not null,
	content varchar(100) not null,
	writer varchar(20) not null,
	calendar date not null,
	image varchar(20) not null,
	comment varchar(20) not null
);

drop table user_info;
select * from user_info where id='guddlsel1003' and password='1234';
select * from user_info;
