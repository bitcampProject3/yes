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


--reserveTime >예약 시간 , checkTime 예약했을때시간--
create table reserve_list(
	branchID varchar(20) not null,
	clientID varchar(20) not null,
	reserveTime varchar(20) not null,
	checkTime datetime not null, 
	personel int not null,
	request varchar(100) not null,
	useState varchar(10) NOT NULL
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
select * from user_info;


----reserve_list > 이용 여부 컬럼 추가(혜원)// 2018-07-18----------
alter table reserve_list add useState varchar(10) NOT NULL;

drop table reserve_list;


select * from branch_info;
select * from reserve_list;
insert into reserve_list values ('branch01','hyewon','2018-12-25-18:00',CURRENT_TIMESTAMP,2,'아이가 먹을거예요','N');
insert into reserve_list values ('branch02','hyewon','2018-12-24-17:00',CURRENT_TIMESTAMP,2,'아이가 먹을거예요','N');
insert into reserve_list values ('branch01','wonywony93','2018-12-25-16:00',CURRENT_TIMESTAMP,3,'아이가 먹을거예요','N');

select branchID,branchName,clientID,reserveTime,personel,request,useState from reserve_list a inner join branch_info b on a.branchID=b.id where clientID='hyewon';
select * from branch_info;


select * from branch_info a inner join branch_address b on a.id=b.id where a.id='branch01';