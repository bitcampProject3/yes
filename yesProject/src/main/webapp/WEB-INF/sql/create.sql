-- create DATABASE mydb;
-- USE mydb;


create table user_info(
	id varchar(30) primary key,
	name varchar(30),
	password varchar(30) ,
	nickname varchar(30) ,
	email varchar(30) ,
	phoneNum varchar(30) ,
	pwQuestion varchar(100) ,
	birthDate date ,
	registNum varchar(30)/*사업자 등록번호*/

);




create table ticketing(
	branchID varchar(20) ,
	clientID varchar(20) ,
	ticketingTime datetime not null,
	waitingNum int not null

);



--reserveTime >���� �ð� , checkTime �����������ð�--
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

<<<<<<< HEAD
drop table user_info;
select * from user_info;


----reserve_list > �̿� ���� �÷� �߰�(����)// 2018-07-18----------
alter table reserve_list add useState varchar(10) NOT NULL;

drop table ticketing;


select * from branch_info;
select * from reserve_list;
insert into reserve_list values ('branch01','hyewon','2018-12-25-18:00',CURRENT_TIMESTAMP,2,'���̰� �����ſ���','N');
insert into reserve_list values ('branch02','hyewon','2018-12-24-17:00',CURRENT_TIMESTAMP,2,'���̰� �����ſ���','N');

insert into reserve_list values ('branch01','wonywony93','2018-12-25-16:00',CURRENT_TIMESTAMP,3,'맛있게 주세요','N');
insert into reserve_list values ('branch01','wonywony93','2018-07-19-16:00',CURRENT_TIMESTAMP,3,'빨리주세요','Y');
insert into reserve_list values ('branch01','wonywony93','2018-07-19-17:00',CURRENT_TIMESTAMP,4,'제발빨리주세요','Y');
insert into reserve_list values ('branch02','wonywony93','2018-07-19-18:00',CURRENT_TIMESTAMP,4,'빨리요','N');
insert into reserve_list values ('branch02','wonywony93','2018-07-19-19:00',CURRENT_TIMESTAMP,2,'4인분 같은 2인분!','N');
insert into reserve_list values ('branch02','wonywony93','2018-07-19-19:00',CURRENT_TIMESTAMP,2,'4�κ� ���� 2�κ� �ֽø� �����ϰڽ��ϴ�......^^ ��â�ϼ���........','N');



insert into ticketing values('branch01','wonywony93',now(),'1');
insert into ticketing values('branch01','wonywony83',now(),'2');


select branchID,branchName,clientID,reserveTime,personel,request,useState from reserve_list a inner join branch_info b on a.branchID=b.id where clientID='hyewon';
select * from branch_info where id='branch01';

delete from user_info where id='branch01';
select * from ticketing;
select * from ticketing where clientID='wonywony93';
select * from user_info;


select * from user_info;




update user_info set registNum='1002' where id='branch01';

select waitingNum from ticketing where clientID='wonywony93';

select a.waitingNum from branch_info a inner join ticketing b on a.id=b.branchID where b.clientID='wonywony93';
select maxTable,tableState,waitingNum from branch_info where id='branch01';
select * from user_info;
select * from reserve_list a inner join user_info b on a.clientID=b.id where branchID='branch01'; 
select * from branch_info a inner join branch_address b on a.id=b.id where a.id='branch02';

select * from branch_address;

alter table user_info change password password varchar(20);
alter table user_info change name name varchar(20);
alter table user_info change nickName nickName varchar(20);
alter table user_info change email email varchar(20);
alter table user_info change phoneNum phoneNum varchar(20);
alter table user_info change pwQuestion pwQuestion varchar(20);
alter table user_info change birthDate birthDate varchar(20);


delete from user_info where id='branch02';

select * from branch_info;
select * from mydb.user_info;
delete from user_info where id like 'kakao%';

insert into branch_info values('branch01','매장8','09:00~23:05','14:00~15:05','매주 금요일 휴무','010-2131-4136','1.6','적당','8','0','false','0');

select * from user_info;
insert into user_info values('admin','관리자','admin',null,null,null,null,null,null);


select * from reserve_list where branchID='branch02';
select * from reserve_list where clientID='wonywony93';

select * from review where branchID='branch01';