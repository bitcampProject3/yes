-- create DATABASE mydb;
-- USE mydb;


/*사업자 넘버 추가*/

create table user_info(
	id varchar(30) primary key,
	password varchar(30) not null,
	nickname varchar(30) not null,
	email varchar(30) not null,
	phoneNum varchar(30) not null,
	pwQuestion varchar(100) not null,
	birthDate date not null,
	registNum varchar(30)/*사업자 등록번호*/

);

select * from branch_image;


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

-- 0709 16:35 부족한 컬럼 추가 -------------------------------------------------------
alter table branch_info add menu2 varchar(20) NOT NULL;
alter table branch_info add menu3 varchar(20) NOT NULL;
alter table branch_info add state varchar(20) NOT NULL;
alter table branch_info add branchname varchar(20) NOT NULL;
alter table branch_info add zonecode varchar(20) NOT NULL;
alter table branch_info add jibunaddress varchar(20) NOT NULL;
alter table branch_info add addressdetail varchar(40) NOT NULL;
alter table branch_info add image2 varchar(20) NOT NULL;
alter table branch_info add image3 varchar(20) NOT NULL;


alter table branch_info change menu menu1 varchar(20) not null;
alter table branch_info change menu1 menu1 varchar(30) NOT NULL;
alter table branch_info change menu2 menu2 varchar(30) NOT NULL;
alter table branch_info change menu3 menu3 varchar(30) NOT NULL;
alter table branch_info change image3 image3 varchar(20);
alter table branch_info change image2 image2 varchar(20);
alter table branch_info change image image1 varchar(20);
alter table branch_info change address address varchar(60) not null;
alter table branch_info change image1 image varchar(40) ;

alter table branch_info change score score decimal(2,1);

alter table branch_info modify column menu2 varchar(30) not null after menu1;
alter table branch_info modify column menu3 varchar(30) not null after menu2;
alter table branch_info modify column branchname varchar(20) not null after id;
alter table branch_info modify column zonecode varchar(20) not null after menu3;
alter table branch_info modify column jibunaddress varchar(20) not null after address;
alter table branch_info modify column addressdetail varchar(40) not null after jibunaddress;
alter table branch_info modify column image2 varchar(20) not null after image;
alter table branch_info modify column image3 varchar(20) not null after image2;


-- # 이하 테이블 수정 및 분할
alter table branch_info drop menu1;
alter table branch_info drop menu2;
alter table branch_info drop menu3;

alter table branch_info drop image;
alter table branch_info drop image2;
alter table branch_info drop image3;

alter table branch_info drop zonecode;
alter table branch_info drop address;
alter table branch_info drop jibunaddress;
alter table branch_info drop addressdetail;

create table branch_address(
  id varchar(20) primary key NOT NULL,
  zoneCode varchar(10) NOT NULL ,
  roadAddress varchar(50) NOT NULL,
  jibunAddress varchar(30) NOT NULL,
  detailAddress varchar(30) NOT null,
  constraint fk_id foreign key (id) references branch_info (id) on delete cascade
);
select * from branch_address;
alter table branch_menu drop primary key;
drop table branch_menu;
create table branch_menu(
  id varchar(20) not null ,
  menu varchar(20) NOT NULL,
  price varchar(20) NOT NULL,
  mainMenu varchar(20) NOT NULL,
  constraint fk_me_id foreign key (id) references branch_info (id) on delete cascade
);

create table branch_image(
  id varchar(20) primary key not null ,
  markerImage varchar(40) not null ,
  mainImage varchar(40) NOT NULL,
  image1 varchar(40) NOT NULL,
  image2 varchar(40),
  image3 varchar(40),
  image4 varchar(40),
  image5 varchar(40),
  constraint fk_img_id foreign key (id) references branch_info (id) on delete cascade
);

insert into branch_info values('branch01','매장8','09:00~23:05','14:00~15:05','매주 금요일 휴무','010-2131-4136','1.6','적당');
insert into branch_info values('branch02','매장9','09:00~23:06','14:00~15:06','매주 토요일 휴무','010-2131-4137','1.7','혼잡');
insert into branch_info values('branch03','매장3','09:00~23:00','14:00~15:00','매주 일요일 휴무','010-2131-4131','1.1','혼잡');
insert into branch_info values('branch04','매장4','09:00~23:01','14:00~15:01','매주 월요일 휴무','010-2131-4132','1.2','한산');
insert into branch_info values('branch05','매장5','09:00~23:02','14:00~15:02','매주 화요일 휴무','010-2131-4133','1.3','적당');
insert into branch_info values('branch06','매장6','09:00~23:03','14:00~15:03','매주 수요일 휴무','010-2131-4134','1.4','혼잡');
insert into branch_info values('branch07','매장7','09:00~23:04','14:00~15:04','매주 목요일 휴무','010-2131-4135','1.5','한산');
insert into branch_info values('branch08','매장8','09:00~23:05','14:00~15:05','매주 금요일 휴무','010-2131-4136','1.6','적당');
insert into branch_info values('branch09','매장9','09:00~23:06','14:00~15:06','매주 토요일 휴무','010-2131-4137','1.7','혼잡');
insert into branch_info values('branch10','매장10','06:00~21:00','15:00~16:00','매주 일요일 휴무','010-2131-4138','1.8','한산');
insert into branch_info values('branch11','매장11','06:00~21:01','15:00~16:01','매주 월요일 휴무','010-2131-4139','1.9','적당');
insert into branch_info values('branch12','매장12','06:00~21:02','15:00~16:02','매주 화요일 휴무','010-2131-4140','2.0','혼잡');
insert into branch_info values('branch13','매장13','06:00~21:03','15:00~16:03','매주 수요일 휴무','010-2131-4141','2.1','한산');
insert into branch_info values('branch14','매장14','06:00~21:04','15:00~16:04','매주 목요일 휴무','010-2131-4142','2.2','적당');
insert into branch_info values('branch15','매장15','06:00~21:05','15:00~16:05','매주 금요일 휴무','010-2131-4143','2.3','혼잡');
insert into branch_info values('branch16','매장16','06:00~21:06','15:00~16:06','매주 토요일 휴무','010-2131-4144','2.4','한산');
insert into branch_info values('branch17','매장17','06:00~21:07','15:00~16:07','매주 일요일 휴무','010-2131-4145','2.5','적당');
insert into branch_info values('branch18','매장18','06:00~21:08','15:00~16:08','매주 월요일 휴무','010-2131-4146','2.6','혼잡');
insert into branch_info values('branch19','매장19','06:00~21:09','15:00~16:09','매주 화요일 휴무','010-2131-4147','2.7','한산');
insert into branch_info values('branch20','매장20','06:00~21:10','15:00~16:10','매주 수요일 휴무','010-2131-4148','2.8','적당');
insert into branch_info values('branch21','매장21','06:00~21:11','15:00~16:11','매주 목요일 휴무','010-2131-4149','2.9','혼잡');
insert into branch_info values('branch22','매장22','06:00~21:12','15:00~16:12','매주 금요일 휴무','010-2131-4150','3.0','한산');
insert into branch_info values('branch23','매장23','06:00~21:13','15:00~16:13','매주 토요일 휴무','010-2131-4151','3.1','적당');
insert into branch_info values('branch24','매장24','06:00~21:14','15:00~16:14','매주 일요일 휴무','010-2131-4152','3.2','혼잡');
insert into branch_info values('branch25','매장25','06:00~21:15','15:00~16:15','매주 월요일 휴무','010-2131-4153','3.3','한산');
insert into branch_info values('branch26','매장26','06:00~21:16','15:00~16:16','매주 화요일 휴무','010-2131-4154','3.4','적당');
insert into branch_info values('branch27','매장27','06:00~21:17','15:00~16:17','매주 수요일 휴무','010-2131-4155','3.5','혼잡');
insert into branch_info values('branch28','매장28','06:00~21:18','15:00~16:18','매주 목요일 휴무','010-2131-4156','3.6','한산');
insert into branch_info values('branch29','매장29','06:00~21:19','15:00~16:19','매주 금요일 휴무','010-2131-4157','3.7','적당');
insert into branch_info values('branch30','매장30','06:00~21:20','15:00~16:20','매주 토요일 휴무','010-2131-4158','3.8','혼잡');
insert into branch_info values('branch31','매장31','06:00~21:21','15:00~16:21','매주 일요일 휴무','010-2131-4159','3.9','한산');
insert into branch_info values('branch32','매장32','06:00~21:22','15:00~16:22','매주 월요일 휴무','010-2131-4160','4.0','적당');
insert into branch_info values('branch33','매장33','06:00~21:23','15:00~16:23','매주 화요일 휴무','010-2131-4161','4.1','혼잡');
insert into branch_info values('branch34','매장34','06:00~21:24','15:00~16:24','매주 수요일 휴무','010-2131-4162','4.2','한산');
insert into branch_info values('branch35','매장35','06:00~21:25','15:00~16:25','매주 목요일 휴무','010-2131-4163','4.3','적당');
insert into branch_info values('branch36','매장36','06:00~21:26','15:00~16:26','매주 금요일 휴무','010-2131-4164','4.4','혼잡');
insert into branch_info values('branch37','매장37','06:00~21:27','15:00~16:27','매주 토요일 휴무','010-2131-4165','4.5','한산');
insert into branch_info values('branch38','매장38','06:00~21:28','15:00~16:28','매주 일요일 휴무','010-2131-4166','4.6','적당');
insert into branch_info values('branch39','매장39','06:00~21:29','15:00~16:29','매주 월요일 휴무','010-2131-4167','4.7','혼잡');
insert into branch_info values('branch40','매장40','06:00~21:30','15:00~16:30','매주 화요일 휴무','010-2131-4168','4.7','한산');
insert into branch_info values('branch41','매장41','06:00~21:31','15:00~16:31','매주 수요일 휴무','010-2131-4169','4.8','적당');
insert into branch_info values('branch42','매장42','06:00~21:32','15:00~16:32','매주 목요일 휴무','010-2131-4170','1.0','혼잡');
insert into branch_info values('branch43','매장43','06:00~21:33','15:00~16:33','매주 금요일 휴무','010-2131-4171','1.1','한산');
insert into branch_info values('branch44','매장44','06:00~21:34','15:00~16:34','매주 토요일 휴무','010-2131-4172','1.2','적당');
insert into branch_info values('branch45','매장45','06:00~21:35','15:00~16:35','매주 일요일 휴무','010-2131-4173','1.3','혼잡');
insert into branch_info values('branch46','매장46','06:00~21:36','15:00~16:36','매주 월요일 휴무','010-2131-4174','1.4','한산');
insert into branch_info values('branch47','매장47','06:00~21:37','15:00~16:37','매주 화요일 휴무','010-2131-4175','1.5','적당');
insert into branch_info values('branch48','매장48','06:00~21:38','15:00~16:38','매주 수요일 휴무','010-2131-4176','1.6','혼잡');
insert into branch_info values('branch49','매장49','06:00~21:39','15:00~16:39','매주 목요일 휴무','010-2131-4177','1.7','한산');
insert into branch_info values('branch50','매장50','06:00~21:40','15:00~16:40','매주 금요일 휴무','010-2131-4178','1.7','적당');
insert into branch_info values('branch51','매장51','06:00~21:41','15:00~16:41','매주 토요일 휴무','010-2131-4179','1.8','혼잡');
insert into branch_info values('branch52','매장52','06:00~21:42','15:00~16:42','매주 일요일 휴무','010-2131-4180','1.9','한산');
insert into branch_info values('branch53','매장53','06:00~21:43','15:00~16:43','매주 월요일 휴무','010-2131-4181','2.0','적당');
insert into branch_info values('branch54','매장54','06:00~21:44','15:00~16:44','매주 화요일 휴무','010-2131-4182','2.1','혼잡');
insert into branch_info values('branch55','매장55','06:00~21:45','15:00~16:45','매주 수요일 휴무','010-2131-4183','2.2','한산');
insert into branch_info values('branch56','매장56','06:00~21:46','15:00~16:46','매주 목요일 휴무','010-2131-4184','2.3','적당');
insert into branch_info values('branch57','매장57','06:00~21:47','15:00~16:47','매주 금요일 휴무','010-2131-4185','2.4','혼잡');
insert into branch_info values('branch58','매장58','06:00~21:48','15:00~16:48','매주 토요일 휴무','010-2131-4186','2.5','한산');
insert into branch_info values('branch59','매장59','06:00~21:49','15:00~16:49','매주 일요일 휴무','010-2131-4187','2.6','적당');
insert into branch_info values('branch60','매장60','06:00~21:50','15:00~16:50','매주 월요일 휴무','010-2131-4188','2.7','혼잡');
insert into branch_info values('branch61','매장61','06:00~21:51','15:00~16:51','매주 화요일 휴무','010-2131-4189','2.8','한산');
insert into branch_info values('branch62','매장62','06:00~21:52','15:00~16:52','매주 수요일 휴무','010-2131-4190','2.9','적당');
insert into branch_info values('branch63','매장63','06:00~21:53','15:00~16:53','매주 목요일 휴무','010-2131-4191','3.0','혼잡');
insert into branch_info values('branch64','매장64','06:00~21:54','15:00~16:54','매주 금요일 휴무','010-2131-4192','3.1','한산');
insert into branch_info values('branch65','매장65','06:00~21:55','15:00~16:55','매주 토요일 휴무','010-2131-4193','3.2','적당');
insert into branch_info values('branch66','매장66','06:00~21:56','15:00~16:56','매주 일요일 휴무','010-2131-4194','3.3','혼잡');
insert into branch_info values('branch67','매장67','06:00~21:57','15:00~16:57','매주 월요일 휴무','010-2131-4195','3.4','한산');
insert into branch_info values('branch68','매장68','06:00~21:58','15:00~16:58','매주 화요일 휴무','010-2131-4196','3.5','적당');
insert into branch_info values('branch69','매장69','06:00~21:59','15:00~16:59','매주 수요일 휴무','010-2131-4197','3.6','혼잡');
insert into branch_info values('branch70','매장70','06:00~21:60','15:00~16:60','매주 목요일 휴무','010-2131-4198','3.7','한산');
insert into branch_info values('branch71','매장71','06:00~21:61','15:00~16:61','매주 금요일 휴무','010-2131-4199','3.8','적당');
insert into branch_info values('branch72','매장72','06:00~21:62','15:00~16:62','매주 토요일 휴무','010-2131-4200','3.9','혼잡');
insert into branch_info values('branch73','매장73','06:00~21:63','15:00~16:63','매주 일요일 휴무','010-2131-4201','4.0','한산');
insert into branch_info values('branch74','매장74','06:00~21:64','15:00~16:64','매주 월요일 휴무','010-2131-4202','4.1','적당');
insert into branch_info values('branch75','매장75','06:00~21:65','15:00~16:65','매주 화요일 휴무','010-2131-4203','4.2','혼잡');
insert into branch_info values('branch76','매장76','06:00~21:66','15:00~16:66','매주 수요일 휴무','010-2131-4204','4.3','한산');
insert into branch_info values('branch77','매장77','06:00~21:67','15:00~16:67','매주 목요일 휴무','010-2131-4205','4.4','적당');
insert into branch_info values('branch78','매장78','06:00~21:68','15:00~16:68','매주 금요일 휴무','010-2131-4206','4.5','혼잡');
insert into branch_info values('branch79','매장79','06:00~21:69','15:00~16:69','매주 토요일 휴무','010-2131-4207','4.6','한산');
insert into branch_info values('branch80','매장80','06:00~21:70','15:00~16:70','매주 일요일 휴무','010-2131-4208','4.7','적당');
insert into branch_info values('branch81','매장81','06:00~21:71','15:00~16:71','매주 월요일 휴무','010-2131-4209','4.7','혼잡');
insert into branch_info values('branch82','매장82','06:00~21:72','15:00~16:72','매주 화요일 휴무','010-2131-4210','4.8','한산');
insert into branch_info values('branch83','매장83','06:00~21:73','15:00~16:73','매주 수요일 휴무','010-2131-4211','1.0','적당');
insert into branch_info values('branch84','매장84','06:00~21:74','15:00~16:74','매주 목요일 휴무','010-2131-4212','1.1','혼잡');
insert into branch_info values('branch85','매장85','06:00~21:75','15:00~16:75','매주 금요일 휴무','010-2131-4213','1.2','한산');
insert into branch_info values('branch86','매장86','06:00~21:76','15:00~16:76','매주 토요일 휴무','010-2131-4214','1.3','적당');
insert into branch_info values('branch87','매장87','06:00~21:77','15:00~16:77','매주 일요일 휴무','010-2131-4215','1.4','혼잡');
insert into branch_info values('branch88','매장88','06:00~21:78','15:00~16:78','매주 월요일 휴무','010-2131-4216','1.5','한산');
insert into branch_info values('branch89','매장89','06:00~21:79','15:00~16:79','매주 화요일 휴무','010-2131-4217','1.6','적당');
insert into branch_info values('branch90','매장90','06:00~21:80','15:00~16:80','매주 수요일 휴무','010-2131-4218','1.7','혼잡');
insert into branch_info values('branch91','매장91','06:00~21:81','15:00~16:81','매주 목요일 휴무','010-2131-4219','1.2','한산');
insert into branch_info values('branch92','매장92','06:00~21:82','15:00~16:82','매주 금요일 휴무','010-2131-4220','1.3','적당');
insert into branch_info values('branch93','매장93','06:00~21:83','15:00~16:83','매주 토요일 휴무','010-2131-4221','1.4','혼잡');
insert into branch_info values('branch94','매장94','06:00~21:84','15:00~16:84','매주 일요일 휴무','010-2131-4222','1.5','한산');


insert into branch_address values('branch01','07741','서울 송파구 도곡로 434','잠실동 305-15','지하2층','서울','송파구','','잠실동');
insert into branch_address values('branch02','06621','서울 강동구 강동대로 143-52','성내동 452','지하1층','서울','강동구','','성내동');
insert into branch_address values('branch03','05239','서울 강동구 고덕로 31','암사동 506-6','1층','서울','강동구','','암사동');
insert into branch_address values('branch04','13480','경기 성남시 분당구 대왕판교로 477','판교동 649','2층','경기','성남시','','판교동');
insert into branch_address values('branch05','06040','서울 강남구 도산대로 154','논현동 6-4','3층','서울','강남구','','논현동');
insert into branch_address values('branch06','06309','서울 강남구 개포로32길 15','개포동 1209-20','4층','서울','강남구','','개포동');
insert into branch_address values('branch07','07741','서울 강서구 등촌로 57','화곡동 772-67','5층','서울','강서구','','화곡동');
insert into branch_address values('branch08','06621','서울 서초구 서초대로78길 24','서초동 1327-5','6층','서울','서초구','','서초동');
insert into branch_address values('branch09','13481','서울 용산구 남산공원길 3','후암동 30-66','7층','서울','용산구','','후암동');
insert into branch_address values('branch10','06040','인천 서구 고산로 35','원당동 851-2','8층','인천','서구 ','','원당동');
insert into branch_address values('branch11','06309','서울 종로구 율곡로 6','중학동 14','9층','서울','종로구','','중학동');
insert into branch_address values('branch12','07741','서울 중구 통일로 30','봉래동1가 126-2','10층','서울','중구 ','','봉래동1가');
insert into branch_address values('branch13','06621','서울 중구 마른내로 31','초동 107-12','11층','서울','중구 ','','초동');
insert into branch_address values('branch14','13482','서울 중구 퇴계로 15','남대문로5가 84-17','12층','서울','중구 ','','남대문로5가');
insert into branch_address values('branch15','06040','서울 종로구 율곡로 58','경운동 96-18','13층','서울','종로구','','경운동');
insert into branch_address values('branch16','06309','서울 종로구 사직로 65','사직동 262-85','14층','서울','종로구','','사직동');
insert into branch_address values('branch17','07741','서울 용산구 소월로 66','후암동 448-103','15층','서울','용산구','','후암동');
insert into branch_address values('branch18','06621','서울 중구 동호로 296','장충동2가 186-69','16층','서울','중구 ','','장충동2가');
insert into branch_address values('branch19','13483','서울 서초구 서초대로74길 45 2층','서초동 1330-3','17층','서울','서초구','','서초동');
insert into branch_address values('branch20','06040','서울 강남구 논현로111길 16','논현동 193-38','18층','서울','강남구','','논현동');
insert into branch_address values('branch21','06309','서울 중구 퇴계로36길 10','필동2가 80-2','19층','서울','중구 ','','필동2가');
insert into branch_address values('branch22','07741','서울 종로구 북촌로5길 62','소격동 122-3','20층','서울','종로구','','소격동');
insert into branch_address values('branch23','06621','서울 종로구 삼일대로32길 55-4','운니동 51','21층','서울','종로구','','운니동');
insert into branch_address values('branch24','13484','서울 중구 남대문시장4길 39-1','남창동 48-12','22층','서울','중구 ','','남창동');
insert into branch_address values('branch25','06040','서울 종로구 인사동12길 3','관훈동 68','23층','서울','종로구','','관훈동');
insert into branch_address values('branch26','06309','서울 서초구 신반포로 329','잠원동 40-9','24층','서울','서초구','','잠원동');
insert into branch_address values('branch27','07741','서울 광진구 자양로18길 95','구의동 221-28','25층','서울','광진구','','구의동');
insert into branch_address values('branch28','06621','서울 성북구 안암로 81','안암동5가 104-35','26층','서울','성북구','','안암동5가');
insert into branch_address values('branch29','13485','서울 종로구 종로32길 23-5','종로5가 395-10','27층','서울','종로구','','종로5가');
insert into branch_address values('branch30','06040','서울 중구 창경궁로 62-29','주교동 118-1','28층','서울','중구 ','','주교동');
insert into branch_address values('branch31','06309','서울 강남구 강남대로 452','역삼동 809-13','29층','서울','강남구','','역삼동');
insert into branch_address values('branch32','07741','서울 강남구 도산대로 327','신사동 652-16','30층','서울','강남구','','신사동');
insert into branch_address values('branch33','06621','서울 중구 명동10길 29','명동2가 25-2','31층','서울','중구 ','','명동2가');
insert into branch_address values('branch34','13486','서울 성동구 아차산로9길 8','성수동2가 277-135','32층','서울','성동구','','성수동2가');
insert into branch_address values('branch35','06040','서울 용산구 이태원로42길 28-4','한남동 683-63','33층','서울','용산구','','한남동');
insert into branch_address values('branch36','06309','서울 성동구 연무장3길 9','성수동2가 301-16','34층','서울','성동구','','성수동2가');
insert into branch_address values('branch37','07741','서울 종로구 수표로28길 23','익선동 174','35층','서울','종로구','','익선동');
insert into branch_address values('branch38','06621','서울 강남구 학동로 305-3','논현동 115-14','36층','서울','강남구','','논현동');
insert into branch_address values('branch39','13487','서울 영등포구 국회대로76길 10','여의도동 13-1','37층','서울','영등포','','여의도동');
insert into branch_address values('branch40','06040','서울 종로구 대학로9길 12','명륜4가 107','38층','서울','종로구','','명륜4가');
insert into branch_address values('branch41','06309','서울 마포구 동교로 267','연남동 229-67','39층','서울','마포구','','연남동');
insert into branch_address values('branch42','07741','서울 중구 정동길 12-15','정동 28-2','40층','서울','중구 ','','정동');
insert into branch_address values('branch43','06621','서울 중구 남산공원길 627','예장동 산5-6','41층','서울','중구 ','','예장동');
insert into branch_address values('branch44','13488','서울 중구 장충단로 275','을지로6가 18-12','42층','서울','중구 ','','을지로6가');
insert into branch_address values('branch45','06040','서울 강남구 봉은사로 418','삼성동 113','43층','서울','강남구','','삼성동');
insert into branch_address values('branch46','06309','서울 마포구 숭문길 24','염리동 147-6','44층','서울','마포구','','염리동');
insert into branch_address values('branch47','07741','서울 강남구 강남대로94길 9','역삼동 818-14','45층','서울','강남구','','역삼동');
insert into branch_address values('branch48','06621','서울 용산구 이태원로15길 1','이태원동 181-8','46층','서울','용산구','','이태원동');
insert into branch_address values('branch49','13489','서울 중구 서애로 26','필동3가 1-5','47층','서울','중구 ','','필동3가');
insert into branch_address values('branch50','06040','서울 중구 을지로3길 24','다동 121-4','48층','서울','중구 ','','다동');
insert into branch_address values('branch51','06309','서울 강남구 언주로107길 7','역삼동 655-12','49층','서울','강남구','','역삼동');
insert into branch_address values('branch52','07741','서울 성동구 성수이로 78','성수동2가 322-32','50층','서울','성동구','','성수동2가');
insert into branch_address values('branch53','06621','서울 종로구 종로 19','청진동 146','51층','서울','종로구','','청진동');
insert into branch_address values('branch54','13490','서울 강남구 역삼로 118','역삼동 833','52층','서울','강남구','','역삼동');
insert into branch_address values('branch55','06040','서울 용산구 두텁바위로 10','남영동 8-1','53층','서울','용산구','','남영동');
insert into branch_address values('branch56','06309','서울 서초구 서초대로50길 24 청화빌딩 2층','서초동 1571-18','54층','서울','서초구','','서초동');
insert into branch_address values('branch57','07741','서울 중구 충무로14길 2-1','입정동 161','55층','서울','중구 ','','입정동');
insert into branch_address values('branch58','06621','서울 영등포구 여의대로 24','여의도동 28-1','56층','서울','영등포','','여의도동');
insert into branch_address values('branch59','13491','서울 송파구 백제고분로45길 38','송파동 57','57층','서울','송파구','','송파동');
insert into branch_address values('branch60','06040','서울 마포구 와우산로 101','서교동 343-10','58층','서울','마포구','','서교동');
insert into branch_address values('branch61','06309','서울 강남구 학동로2길 56?','논현동 164-14','59층','서울','강남구','','논현동');
insert into branch_address values('branch62','07741','서울 마포구 잔다리로 123','서교동 469-67','60층','서울','마포구','','서교동');
insert into branch_address values('branch63','06621','서울 마포구 양화진길 10','합정동 381-64','61층','서울','마포구','','합정동');
insert into branch_address values('branch64','13492','서울 강남구 압구정로38길 14','신사동 619-4','62층','서울','강남구','','신사동');
insert into branch_address values('branch65','06040','서울 마포구 독막로 67-9','상수동 317-3','63층','서울','마포구','','상수동');
insert into branch_address values('branch66','06309','서울 송파구 양재대로71길 1-4','방이동 205-8','64층','서울','송파구','','방이동');
insert into branch_address values('branch67','07741','서울 강남구 언주로 835','신사동 623-5','65층','서울','강남구','','신사동');
insert into branch_address values('branch68','06621','서울 종로구 종로40가길 18','종로5가 265-22','66층','서울','종로구','','종로5가');
insert into branch_address values('branch69','13493','서울 강남구 학동로2길 45','논현동 163-3','67층','서울','강남구','','논현동');
insert into branch_address values('branch70','06040','서울 송파구 위례성대로 10','방이동 44-5','68층','서울','송파구','','방이동');
insert into branch_address values('branch71','06309','서울 마포구 와우산로21길 36-6?','서교동 358-49','69층','서울','마포구','','서교동');
insert into branch_address values('branch72','07741','서울 서대문구 연희로11가길 23','연희동 190-4','70층','서울','서대문','','연희동');
insert into branch_address values('branch73','06621','서울 관악구 조원로 60','신림동 546-1','71층','서울','관악구','','신림동');
insert into branch_address values('branch74','13494','서울 마포구 와우산로21길 20-11','서교동 358-121','72층','서울','마포구','','서교동');
insert into branch_address values('branch75','06040','서울 강남구 논현로94길 25-3','역삼동 670-20','73층','서울','강남구','','역삼동');
insert into branch_address values('branch76','06309','서울 성북구 성북로 7','성북동1가 35-5','74층','서울','성북구','','성북동1가');
insert into branch_address values('branch77','07741','서울 동작구 동작대로7길 19','사당동 1032-1','75층','서울','동작구','','사당동');
insert into branch_address values('branch78','06621','서울 영등포구 영등포로 159 1층','당산동1가 79-5','76층','서울','영등포','','당산동1가');
insert into branch_address values('branch79','13495','서울 관악구 낙성대역길 8','봉천동 1660-7','77층','서울','관악구','','봉천동');
insert into branch_address values('branch80','06040','서울 서초구 서초대로78길 22','서초동 1327-2','78층','서울','서초구','','서초동');
insert into branch_address values('branch81','06309','서울 성동구 왕십리로 96','성수동1가 656-442','79층','서울','성동구','','성수동1가');
insert into branch_address values('branch82','07741','서울 서초구 방배천로2길 25','방배동 449-5','80층','서울','서초구','','방배동');
insert into branch_address values('branch83','06621','서울 강북구 4.19로 69','수유동 563-14','81층','서울','강북구','','수유동');
insert into branch_address values('branch84','13496','서울 종로구 율곡로1길 74-9','소격동 158-1','82층','서울','종로구','','소격동');
insert into branch_address values('branch85','06040','서울 관악구 남부순환로234길 19','봉천동 1620-3','83층','서울','관악구','','봉천동');
insert into branch_address values('branch86','06309','서울 성북구 성북로23길 4','성북동 109-2','84층','서울','성북구','','성북동');
insert into branch_address values('branch87','07741','서울 성북구 정릉로 395','하월곡동 221','85층','서울','성북구','','하월곡동');
insert into branch_address values('branch88','06621','서울 성동구 왕십리로 331','하왕십리동 966-12','86층','서울','성동구','','하왕십리동');
insert into branch_address values('branch89','13497','서울 강동구 강동대로 217','성내동 448-24','87층','서울','강동구','','성내동');
insert into branch_address values('branch90','06040','서울 양천구 중앙로32길 61','신정동 1021-9','88층','서울','양천구','','신정동');
insert into branch_address values('branch91','06309','서울 중구 소파로 107','예장동 8-53','89층','서울','중구 ','','예장동');
insert into branch_address values('branch92','07741','서울 강남구 강남대로162길 31','신사동 523-16','90층','서울','강남구','','신사동');
insert into branch_address values('branch93','06621','서울 용산구 서빙고로 69?','용산동5가 24-1','91층','서울','용산구','','용산동5가');
insert into branch_address values('branch94','13498','서울 성동구 마장로35길 68','마장동 439-1','92층','서울','성동구','','마장동');

insert into branch_image values('branch01','foodIcon2.png','mainimage1.png','image3.png','image4.png','image3.png','image3.png','image3.png');
insert into branch_image values('branch02','foodIcon3.png','mainimage2.png','image4.png','image5.png','image4.png','image4.png','image4.png');
insert into branch_image values('branch03','foodIcon1.png','mainimage3.png','image2.png','image3.png','image2.png','image2.png','image2.png');
insert into branch_image values('branch04','foodIcon2.png','mainimage4.png','image3.png','image4.png','image3.png','image3.png','image3.png');
insert into branch_image values('branch05','foodIcon3.png','mainimage5.png','image4.png','image5.png','image4.png','image4.png','image4.png');
insert into branch_image values('branch06','foodIcon4.png','mainimage6.png','image5.png','image6.png','image5.png','image5.png','image5.png');
insert into branch_image values('branch07','foodIcon5.png','mainimage7.png','image6.png','image7.png','image6.png','image6.png','image6.png');
insert into branch_image values('branch08','foodIcon6.png','mainimage8.png','image7.png','image8.png','image7.png','image7.png','image7.png');
insert into branch_image values('branch09','foodIcon7.png','mainimage9.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch10','foodIcon8.png','mainimage10.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch11','foodIcon9.png','mainimage11.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch12','foodIcon10.png','mainimage12.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch13','foodIcon11.png','mainimage13.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch14','foodIcon12.png','mainimage14.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch15','foodIcon13.png','mainimage15.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch16','foodIcon14.png','mainimage16.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch17','foodIcon15.png','mainimage17.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch18','foodIcon16.png','mainimage18.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch19','foodIcon17.png','mainimage19.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch20','foodIcon18.png','mainimage20.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch21','foodIcon19.png','mainimage21.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch22','foodIcon20.png','mainimage22.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch23','foodIcon21.png','mainimage23.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch24','foodIcon22.png','mainimage24.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch25','foodIcon23.png','mainimage25.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch26','foodIcon24.png','mainimage26.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch27','foodIcon25.png','mainimage27.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch28','foodIcon26.png','mainimage28.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch29','foodIcon27.png','mainimage29.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch30','foodIcon28.png','mainimage30.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch31','foodIcon29.png','mainimage31.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch32','foodIcon30.png','mainimage32.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch33','foodIcon31.png','mainimage33.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch34','foodIcon32.png','mainimage34.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch35','foodIcon33.png','mainimage35.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch36','foodIcon34.png','mainimage36.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch37','foodIcon35.png','mainimage37.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch38','foodIcon36.png','mainimage38.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch39','foodIcon37.png','mainimage39.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch40','foodIcon38.png','mainimage40.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch41','foodIcon39.png','mainimage41.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch42','foodIcon40.png','mainimage42.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch43','foodIcon41.png','mainimage43.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch44','foodIcon42.png','mainimage44.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch45','foodIcon43.png','mainimage45.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch46','foodIcon44.png','mainimage46.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch47','foodIcon45.png','mainimage47.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch48','foodIcon46.png','mainimage48.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch49','foodIcon47.png','mainimage49.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch50','foodIcon48.png','mainimage50.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch51','foodIcon49.png','mainimage51.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch52','foodIcon50.png','mainimage52.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch53','foodIcon1.png','mainimage53.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch54','foodIcon2.png','mainimage54.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch55','foodIcon3.png','mainimage55.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch56','foodIcon4.png','mainimage56.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch57','foodIcon5.png','mainimage57.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch58','foodIcon6.png','mainimage58.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch59','foodIcon7.png','mainimage59.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch60','foodIcon8.png','mainimage60.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch61','foodIcon9.png','mainimage61.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch62','foodIcon10.png','mainimage62.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch63','foodIcon11.png','mainimage63.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch64','foodIcon12.png','mainimage64.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch65','foodIcon13.png','mainimage65.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch66','foodIcon14.png','mainimage66.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch67','foodIcon15.png','mainimage67.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch68','foodIcon16.png','mainimage68.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch69','foodIcon17.png','mainimage69.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch70','foodIcon18.png','mainimage70.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch71','foodIcon19.png','mainimage71.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch72','foodIcon20.png','mainimage72.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch73','foodIcon21.png','mainimage73.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch74','foodIcon22.png','mainimage74.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch75','foodIcon23.png','mainimage75.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch76','foodIcon24.png','mainimage76.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch77','foodIcon25.png','mainimage77.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch78','foodIcon26.png','mainimage78.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch79','foodIcon27.png','mainimage79.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch80','foodIcon28.png','mainimage80.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch81','foodIcon29.png','mainimage81.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch82','foodIcon30.png','mainimage82.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch83','foodIcon31.png','mainimage83.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch84','foodIcon32.png','mainimage84.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch85','foodIcon33.png','mainimage85.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch86','foodIcon34.png','mainimage86.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch87','foodIcon35.png','mainimage87.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch88','foodIcon36.png','mainimage88.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch89','foodIcon37.png','mainimage89.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch90','foodIcon38.png','mainimage90.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch91','foodIcon39.png','mainimage91.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch92','foodIcon40.png','mainimage92.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch93','foodIcon41.png','mainimage93.png','image8.png','image9.png','image8.png','image8.png','image8.png');
insert into branch_image values('branch94','foodIcon42.png','mainimage94.png','image8.png','image9.png','image8.png','image8.png','image8.png')

insert into branch_menu values('branch01','김밥','4000원','');
insert into branch_menu values('branch02','김밥','4001원','');
insert into branch_menu values('branch03','김밥','4002원','');
insert into branch_menu values('branch04','라면','4003원','');
insert into branch_menu values('branch05','짬뽕','4004원','');
insert into branch_menu values('branch06','볶음밥','4005원','');
insert into branch_menu values('branch07','우동','4006원','');
insert into branch_menu values('branch08','순대국','4007원','');
insert into branch_menu values('branch09','토스트','4008원','');
insert into branch_menu values('branch10','김밥','4009원','');
insert into branch_menu values('branch11','라면','4010원','');
insert into branch_menu values('branch12','짬뽕','4011원','');
insert into branch_menu values('branch13','볶음밥','4012원','');
insert into branch_menu values('branch14','우동','4013원','');
insert into branch_menu values('branch15','순대국','4014원','');
insert into branch_menu values('branch16','토스트','4015원','');
insert into branch_menu values('branch17','김밥','4016원','');
insert into branch_menu values('branch18','라면','4017원','');
insert into branch_menu values('branch19','짬뽕','4018원','');
insert into branch_menu values('branch20','볶음밥','4019원','');
insert into branch_menu values('branch21','우동','4020원','');
insert into branch_menu values('branch22','순대국','4021원','');
insert into branch_menu values('branch23','토스트','4022원','');
insert into branch_menu values('branch24','김밥','4023원','');
insert into branch_menu values('branch25','라면','4024원','');
insert into branch_menu values('branch26','짬뽕','4025원','');
insert into branch_menu values('branch27','볶음밥','4026원','');
insert into branch_menu values('branch28','우동','4027원','');
insert into branch_menu values('branch29','순대국','4028원','');
insert into branch_menu values('branch30','토스트','4029원','');
insert into branch_menu values('branch31','김밥','4030원','');
insert into branch_menu values('branch32','라면','4031원','');
insert into branch_menu values('branch33','짬뽕','4032원','');
insert into branch_menu values('branch34','볶음밥','4033원','');
insert into branch_menu values('branch35','우동','4034원','');
insert into branch_menu values('branch36','순대국','4035원','');
insert into branch_menu values('branch37','토스트','4036원','');
insert into branch_menu values('branch38','김밥','4037원','');
insert into branch_menu values('branch39','라면','4038원','');
insert into branch_menu values('branch40','짬뽕','4039원','');
insert into branch_menu values('branch41','볶음밥','4040원','');
insert into branch_menu values('branch42','우동','4041원','');
insert into branch_menu values('branch43','순대국','4042원','');
insert into branch_menu values('branch44','토스트','4043원','');
insert into branch_menu values('branch45','김밥','4044원','');
insert into branch_menu values('branch46','라면','4045원','');
insert into branch_menu values('branch47','짬뽕','4046원','');
insert into branch_menu values('branch48','볶음밥','4047원','');
insert into branch_menu values('branch49','우동','4048원','');
insert into branch_menu values('branch50','순대국','4049원','');
insert into branch_menu values('branch51','토스트','4050원','');
insert into branch_menu values('branch52','김밥','4051원','');
insert into branch_menu values('branch53','라면','4052원','');
insert into branch_menu values('branch54','짬뽕','4053원','');
insert into branch_menu values('branch55','볶음밥','4054원','');
insert into branch_menu values('branch56','우동','4055원','');
insert into branch_menu values('branch57','순대국','4056원','');
insert into branch_menu values('branch58','토스트','4057원','');
insert into branch_menu values('branch59','김밥','4058원','');
insert into branch_menu values('branch60','라면','4059원','');
insert into branch_menu values('branch61','짬뽕','4060원','');
insert into branch_menu values('branch62','볶음밥','4061원','');
insert into branch_menu values('branch63','우동','4062원','');
insert into branch_menu values('branch64','순대국','4063원','');
insert into branch_menu values('branch65','토스트','4064원','');
insert into branch_menu values('branch66','김밥','4065원','');
insert into branch_menu values('branch67','라면','4066원','');
insert into branch_menu values('branch68','짬뽕','4067원','');
insert into branch_menu values('branch69','볶음밥','4068원','');
insert into branch_menu values('branch70','우동','4069원','');
insert into branch_menu values('branch71','순대국','4070원','');
insert into branch_menu values('branch72','토스트','4071원','');
insert into branch_menu values('branch73','김밥','4072원','');
insert into branch_menu values('branch74','라면','4073원','');
insert into branch_menu values('branch75','짬뽕','4074원','');
insert into branch_menu values('branch76','볶음밥','4075원','');
insert into branch_menu values('branch77','우동','4076원','');
insert into branch_menu values('branch78','순대국','4077원','');
insert into branch_menu values('branch79','토스트','4078원','');
insert into branch_menu values('branch80','김밥','4079원','');
insert into branch_menu values('branch81','라면','4080원','');
insert into branch_menu values('branch82','짬뽕','4081원','');
insert into branch_menu values('branch83','볶음밥','4082원','');
insert into branch_menu values('branch84','우동','4083원','');
insert into branch_menu values('branch85','순대국','4084원','');
insert into branch_menu values('branch86','토스트','4085원','');
insert into branch_menu values('branch87','김밥','4086원','');
insert into branch_menu values('branch88','라면','4087원','');
insert into branch_menu values('branch89','짬뽕','4088원','');
insert into branch_menu values('branch90','볶음밥','4089원','');
insert into branch_menu values('branch91','우동','4090원','');
insert into branch_menu values('branch92','순대국','4091원','');
insert into branch_menu values('branch93','토스트','4092원','');
insert into branch_menu values('branch94','김밥','4093원','');

insert into branch_menu values('branch01','김치볶음밥','20,000원','');
insert into branch_menu values('branch02','김치볶음밥','20,001원','');
insert into branch_menu values('branch03','김치볶음밥','20,002원','');
insert into branch_menu values('branch04','새우볶음밥','20,003원','');
insert into branch_menu values('branch05','카레','20,004원','');
insert into branch_menu values('branch06','돈까스','20,005원','');
insert into branch_menu values('branch07','왕돈까스','20,006원','');
insert into branch_menu values('branch08','백반','20,007원','');
insert into branch_menu values('branch09','칼국수','20,008원','');
insert into branch_menu values('branch10','김치볶음밥','20,009원','');
insert into branch_menu values('branch11','새우볶음밥','20,010원','');
insert into branch_menu values('branch12','카레','20,011원','');
insert into branch_menu values('branch13','돈까스','20,012원','');
insert into branch_menu values('branch14','왕돈까스','20,013원','');
insert into branch_menu values('branch15','백반','20,014원','');
insert into branch_menu values('branch16','칼국수','20,015원','');
insert into branch_menu values('branch17','김치볶음밥','20,016원','');
insert into branch_menu values('branch18','새우볶음밥','20,017원','');
insert into branch_menu values('branch19','카레','20,018원','');
insert into branch_menu values('branch20','돈까스','20,019원','');
insert into branch_menu values('branch21','왕돈까스','20,020원','');
insert into branch_menu values('branch22','백반','20,021원','');
insert into branch_menu values('branch23','칼국수','20,022원','');
insert into branch_menu values('branch24','김치볶음밥','20,023원','');
insert into branch_menu values('branch25','새우볶음밥','20,024원','');
insert into branch_menu values('branch26','카레','20,025원','');
insert into branch_menu values('branch27','돈까스','20,026원','');
insert into branch_menu values('branch28','왕돈까스','20,027원','');
insert into branch_menu values('branch29','백반','20,028원','');
insert into branch_menu values('branch30','칼국수','20,029원','');
insert into branch_menu values('branch31','김치볶음밥','20,030원','');
insert into branch_menu values('branch32','새우볶음밥','20,031원','');
insert into branch_menu values('branch33','카레','20,032원','');
insert into branch_menu values('branch34','돈까스','20,033원','');
insert into branch_menu values('branch35','왕돈까스','20,034원','');
insert into branch_menu values('branch36','백반','20,035원','');
insert into branch_menu values('branch37','칼국수','20,036원','');
insert into branch_menu values('branch38','김치볶음밥','20,037원','');
insert into branch_menu values('branch39','새우볶음밥','20,038원','');
insert into branch_menu values('branch40','카레','20,039원','');
insert into branch_menu values('branch41','돈까스','20,040원','');
insert into branch_menu values('branch42','왕돈까스','20,041원','');
insert into branch_menu values('branch43','백반','20,042원','');
insert into branch_menu values('branch44','칼국수','20,043원','');
insert into branch_menu values('branch45','김치볶음밥','20,044원','');
insert into branch_menu values('branch46','새우볶음밥','20,045원','');
insert into branch_menu values('branch47','카레','20,046원','');
insert into branch_menu values('branch48','돈까스','20,047원','');
insert into branch_menu values('branch49','왕돈까스','20,048원','');
insert into branch_menu values('branch50','백반','20,049원','');
insert into branch_menu values('branch51','칼국수','20,050원','');
insert into branch_menu values('branch52','김치볶음밥','20,051원','');
insert into branch_menu values('branch53','새우볶음밥','20,052원','');
insert into branch_menu values('branch54','카레','20,053원','');
insert into branch_menu values('branch55','돈까스','20,054원','');
insert into branch_menu values('branch56','왕돈까스','20,055원','');
insert into branch_menu values('branch57','백반','20,056원','');
insert into branch_menu values('branch58','칼국수','20,057원','');
insert into branch_menu values('branch59','김치볶음밥','20,058원','');
insert into branch_menu values('branch60','새우볶음밥','20,059원','');
insert into branch_menu values('branch61','카레','20,060원','');
insert into branch_menu values('branch62','돈까스','20,061원','');
insert into branch_menu values('branch63','왕돈까스','20,062원','');
insert into branch_menu values('branch64','백반','20,063원','');
insert into branch_menu values('branch65','칼국수','20,064원','');
insert into branch_menu values('branch66','김치볶음밥','20,065원','');
insert into branch_menu values('branch67','새우볶음밥','20,066원','');
insert into branch_menu values('branch68','카레','20,067원','');
insert into branch_menu values('branch69','돈까스','20,068원','');
insert into branch_menu values('branch70','왕돈까스','20,069원','');
insert into branch_menu values('branch71','백반','20,070원','');
insert into branch_menu values('branch72','칼국수','20,071원','');
insert into branch_menu values('branch73','김치볶음밥','20,072원','');
insert into branch_menu values('branch74','새우볶음밥','20,073원','');
insert into branch_menu values('branch75','카레','20,074원','');
insert into branch_menu values('branch76','돈까스','20,075원','');
insert into branch_menu values('branch77','왕돈까스','20,076원','');
insert into branch_menu values('branch78','백반','20,077원','');
insert into branch_menu values('branch79','칼국수','20,078원','');
insert into branch_menu values('branch80','김치볶음밥','20,079원','');
insert into branch_menu values('branch81','새우볶음밥','20,080원','');
insert into branch_menu values('branch82','카레','20,081원','');
insert into branch_menu values('branch83','돈까스','20,082원','');
insert into branch_menu values('branch84','왕돈까스','20,083원','');
insert into branch_menu values('branch85','백반','20,084원','');
insert into branch_menu values('branch86','칼국수','20,085원','');
insert into branch_menu values('branch87','김치볶음밥','20,086원','');
insert into branch_menu values('branch88','새우볶음밥','20,087원','');
insert into branch_menu values('branch89','카레','20,088원','');
insert into branch_menu values('branch90','돈까스','20,089원','');
insert into branch_menu values('branch91','왕돈까스','20,090원','');
insert into branch_menu values('branch92','백반','20,091원','');
insert into branch_menu values('branch93','칼국수','20,092원','');
insert into branch_menu values('branch94','김치볶음밥','20,093원','');

insert into branch_menu values('branch01','초밥','10,000원','true');
insert into branch_menu values('branch02','초밥','10,001원','true');
insert into branch_menu values('branch03','초밥','10,002원','true');
insert into branch_menu values('branch04','맥주','10,003원','true');
insert into branch_menu values('branch05','소주','10,004원','true');
insert into branch_menu values('branch06','추어탕','10,005원','true');
insert into branch_menu values('branch07','설렁탕','10,006원','true');
insert into branch_menu values('branch08','뼈해장국','10,007원','true');
insert into branch_menu values('branch09','밥버거','10,008원','true');
insert into branch_menu values('branch10','초밥','10,009원','true');
insert into branch_menu values('branch11','맥주','10,010원','true');
insert into branch_menu values('branch12','소주','10,011원','true');
insert into branch_menu values('branch13','추어탕','10,012원','true');
insert into branch_menu values('branch14','설렁탕','10,013원','true');
insert into branch_menu values('branch15','뼈해장국','10,014원','true');
insert into branch_menu values('branch16','밥버거','10,015원','true');
insert into branch_menu values('branch17','초밥','10,016원','true');
insert into branch_menu values('branch18','맥주','10,017원','true');
insert into branch_menu values('branch19','소주','10,018원','true');
insert into branch_menu values('branch20','추어탕','10,019원','true');
insert into branch_menu values('branch21','설렁탕','10,020원','true');
insert into branch_menu values('branch22','뼈해장국','10,021원','true');
insert into branch_menu values('branch23','밥버거','10,022원','true');
insert into branch_menu values('branch24','초밥','10,023원','true');
insert into branch_menu values('branch25','맥주','10,024원','true');
insert into branch_menu values('branch26','소주','10,025원','true');
insert into branch_menu values('branch27','추어탕','10,026원','true');
insert into branch_menu values('branch28','설렁탕','10,027원','true');
insert into branch_menu values('branch29','뼈해장국','10,028원','true');
insert into branch_menu values('branch30','밥버거','10,029원','true');
insert into branch_menu values('branch31','초밥','10,030원','true');
insert into branch_menu values('branch32','맥주','10,031원','true');
insert into branch_menu values('branch33','소주','10,032원','true');
insert into branch_menu values('branch34','추어탕','10,033원','true');
insert into branch_menu values('branch35','설렁탕','10,034원','true');
insert into branch_menu values('branch36','뼈해장국','10,035원','true');
insert into branch_menu values('branch37','밥버거','10,036원','true');
insert into branch_menu values('branch38','초밥','10,037원','true');
insert into branch_menu values('branch39','맥주','10,038원','true');
insert into branch_menu values('branch40','소주','10,039원','true');
insert into branch_menu values('branch41','추어탕','10,040원','true');
insert into branch_menu values('branch42','설렁탕','10,041원','true');
insert into branch_menu values('branch43','뼈해장국','10,042원','true');
insert into branch_menu values('branch44','밥버거','10,043원','true');
insert into branch_menu values('branch45','초밥','10,044원','true');
insert into branch_menu values('branch46','맥주','10,045원','true');
insert into branch_menu values('branch47','소주','10,046원','true');
insert into branch_menu values('branch48','추어탕','10,047원','true');
insert into branch_menu values('branch49','설렁탕','10,048원','true');
insert into branch_menu values('branch50','뼈해장국','10,049원','true');
insert into branch_menu values('branch51','밥버거','10,050원','true');
insert into branch_menu values('branch52','초밥','10,051원','true');
insert into branch_menu values('branch53','맥주','10,052원','true');
insert into branch_menu values('branch54','소주','10,053원','true');
insert into branch_menu values('branch55','추어탕','10,054원','true');
insert into branch_menu values('branch56','설렁탕','10,055원','true');
insert into branch_menu values('branch57','뼈해장국','10,056원','true');
insert into branch_menu values('branch58','밥버거','10,057원','true');
insert into branch_menu values('branch59','초밥','10,058원','true');
insert into branch_menu values('branch60','맥주','10,059원','true');
insert into branch_menu values('branch61','소주','10,060원','true');
insert into branch_menu values('branch62','추어탕','10,061원','true');
insert into branch_menu values('branch63','설렁탕','10,062원','true');
insert into branch_menu values('branch64','뼈해장국','10,063원','true');
insert into branch_menu values('branch65','밥버거','10,064원','true');
insert into branch_menu values('branch66','초밥','10,065원','true');
insert into branch_menu values('branch67','맥주','10,066원','true');
insert into branch_menu values('branch68','소주','10,067원','true');
insert into branch_menu values('branch69','추어탕','10,068원','true');
insert into branch_menu values('branch70','설렁탕','10,069원','true');
insert into branch_menu values('branch71','뼈해장국','10,070원','true');
insert into branch_menu values('branch72','밥버거','10,071원','true');
insert into branch_menu values('branch73','초밥','10,072원','true');
insert into branch_menu values('branch74','맥주','10,073원','true');
insert into branch_menu values('branch75','소주','10,074원','true');
insert into branch_menu values('branch76','추어탕','10,075원','true');
insert into branch_menu values('branch77','설렁탕','10,076원','true');
insert into branch_menu values('branch78','뼈해장국','10,077원','true');
insert into branch_menu values('branch79','밥버거','10,078원','true');
insert into branch_menu values('branch80','초밥','10,079원','true');
insert into branch_menu values('branch81','맥주','10,080원','true');
insert into branch_menu values('branch82','소주','10,081원','true');
insert into branch_menu values('branch83','추어탕','10,082원','true');
insert into branch_menu values('branch84','설렁탕','10,083원','true');
insert into branch_menu values('branch85','뼈해장국','10,084원','true');
insert into branch_menu values('branch86','밥버거','10,085원','true');
insert into branch_menu values('branch87','초밥','10,086원','true');
insert into branch_menu values('branch88','맥주','10,087원','true');
insert into branch_menu values('branch89','소주','10,088원','true');
insert into branch_menu values('branch90','추어탕','10,089원','true');
insert into branch_menu values('branch91','설렁탕','10,090원','true');
insert into branch_menu values('branch92','뼈해장국','10,091원','true');
insert into branch_menu values('branch93','밥버거','10,092원','true');
insert into branch_menu values('branch94','초밥','10,093원','true');

--select * from branch_menu where id like 'branch90' and mainMenu like 'true';

--select * from branch_info a inner join branch_address b on a.id = b.id inner join branch_image c on a.id = c.id where roadAddress like '%마포%';

--# 시도 / 시군구 / 읍면 / 동 컬럼 추가

alter table branch_address add sido varchar(20) NOT null;
alter table branch_address add sigungu varchar(20) NOT null;
alter table branch_address add bname1 varchar(20);
alter table branch_address add bname2 varchar(20) NOT null;
alter table branch_address add latlngx varchar(20) ;
alter table branch_address add latlngy varchar(20) ;

select * from branch_address;


--select * from branch_address where roadAddress like '%마포%';

--# ----------------- selectLocation 더미데이터
--create table selectLocation(
--sido varchar(20) not null,
--sigungu varchar(20),
--bname1 varchar(20),
--bname2 varchar(20)
--
--);


--update branch_address set latlngx = '', latlngy = '' where id = '';



--select * from branch_info a
--  inner join branch_address b on a.id = b.id
--    inner join branch_image c on a.id = c.id
--      inner join branch_menu d on a.id = d.id
--where menu like '%우동%';
---------------------------------------------------------------------------------






