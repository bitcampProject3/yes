-- create DATABASE mydb;
-- USE mydb;


/*����� �ѹ� �߰�*/

create table user_info(
	id varchar(30) primary key,
	password varchar(30) not null,
	nickname varchar(30) not null,
	email varchar(30) not null,
	phoneNum varchar(30) not null,
	pwQuestion varchar(100) not null,
	birthDate date not null,
	registNum varchar(30)/*����� ��Ϲ�ȣ*/

);

select * from user_info;


create table branch_info(
	id varchar(20) primary key,
	opTime varchar(20) not null,
	breakTime varchar(20) not null,
	opDate varchar(20) not null,
	menu varchar(20) not null,
	address varchar(20) not null,
	phoneNum varchar(20) not null,
	image varchar(20) not null,
	score decimal(2,1) not null,
	maxTable int not null,
	tableState int not null,
	acceptState varchar(10) not null,
	waitingNum int not null
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

-- 0709 16:35 ������ �÷� �߰� -------------------------------------------------------
alter table branch_info add menu2 varchar(20) NOT NULL;
alter table branch_info add menu3 varchar(20) NOT NULL;
alter table branch_info add state varchar(20) NOT NULL;
alter table branch_info add branchname varchar(20) NOT NULL;
alter table branch_info add zonecode varchar(20) NOT NULL;
alter table branch_info add jibunaddress varchar(20) NOT NULL;
alter table branch_info add addressdetail varchar(40) NOT NULL;
alter table branch_info add image2 varchar(20) NOT NULL;
alter table branch_info add image3 varchar(20) NOT NULL;
alter table branch_info add maxTable int NOT NULL;
alter table branch_info add tableState int NOT NULL;
alter table branch_info add acceptState varchar(10) NOT NULL;
alter table branch_info add waitingNum int NOT NULL;








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


-- # ���� ���̺� ���� �� ����
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

insert into branch_info values('branch01','매장8','09:00~23:05','14:00~15:05','매주 금요일 휴무','010-2131-4136','1.6','적당','8','0','false','0');
insert into branch_info values('branch02','����9','09:00~23:06','14:00~15:06','���� ����� �޹�','010-2131-4137','1.7','ȥ��');
insert into branch_info values('branch03','����3','09:00~23:00','14:00~15:00','���� �Ͽ��� �޹�','010-2131-4131','1.1','ȥ��');
insert into branch_info values('branch04','����4','09:00~23:01','14:00~15:01','���� ������ �޹�','010-2131-4132','1.2','�ѻ�');
insert into branch_info values('branch05','����5','09:00~23:02','14:00~15:02','���� ȭ���� �޹�','010-2131-4133','1.3','����');
insert into branch_info values('branch06','����6','09:00~23:03','14:00~15:03','���� ������ �޹�','010-2131-4134','1.4','ȥ��');
insert into branch_info values('branch07','����7','09:00~23:04','14:00~15:04','���� ����� �޹�','010-2131-4135','1.5','�ѻ�');
insert into branch_info values('branch08','����8','09:00~23:05','14:00~15:05','���� �ݿ��� �޹�','010-2131-4136','1.6','����');
insert into branch_info values('branch09','����9','09:00~23:06','14:00~15:06','���� ����� �޹�','010-2131-4137','1.7','ȥ��');
insert into branch_info values('branch10','����10','06:00~21:00','15:00~16:00','���� �Ͽ��� �޹�','010-2131-4138','1.8','�ѻ�');
insert into branch_info values('branch11','����11','06:00~21:01','15:00~16:01','���� ������ �޹�','010-2131-4139','1.9','����');
insert into branch_info values('branch12','����12','06:00~21:02','15:00~16:02','���� ȭ���� �޹�','010-2131-4140','2.0','ȥ��');
insert into branch_info values('branch13','����13','06:00~21:03','15:00~16:03','���� ������ �޹�','010-2131-4141','2.1','�ѻ�');
insert into branch_info values('branch14','����14','06:00~21:04','15:00~16:04','���� ����� �޹�','010-2131-4142','2.2','����');
insert into branch_info values('branch15','����15','06:00~21:05','15:00~16:05','���� �ݿ��� �޹�','010-2131-4143','2.3','ȥ��');
insert into branch_info values('branch16','����16','06:00~21:06','15:00~16:06','���� ����� �޹�','010-2131-4144','2.4','�ѻ�');
insert into branch_info values('branch17','����17','06:00~21:07','15:00~16:07','���� �Ͽ��� �޹�','010-2131-4145','2.5','����');
insert into branch_info values('branch18','����18','06:00~21:08','15:00~16:08','���� ������ �޹�','010-2131-4146','2.6','ȥ��');
insert into branch_info values('branch19','����19','06:00~21:09','15:00~16:09','���� ȭ���� �޹�','010-2131-4147','2.7','�ѻ�');
insert into branch_info values('branch20','����20','06:00~21:10','15:00~16:10','���� ������ �޹�','010-2131-4148','2.8','����');
insert into branch_info values('branch21','����21','06:00~21:11','15:00~16:11','���� ����� �޹�','010-2131-4149','2.9','ȥ��');
insert into branch_info values('branch22','����22','06:00~21:12','15:00~16:12','���� �ݿ��� �޹�','010-2131-4150','3.0','�ѻ�');
insert into branch_info values('branch23','����23','06:00~21:13','15:00~16:13','���� ����� �޹�','010-2131-4151','3.1','����');
insert into branch_info values('branch24','����24','06:00~21:14','15:00~16:14','���� �Ͽ��� �޹�','010-2131-4152','3.2','ȥ��');
insert into branch_info values('branch25','����25','06:00~21:15','15:00~16:15','���� ������ �޹�','010-2131-4153','3.3','�ѻ�');
insert into branch_info values('branch26','����26','06:00~21:16','15:00~16:16','���� ȭ���� �޹�','010-2131-4154','3.4','����');
insert into branch_info values('branch27','����27','06:00~21:17','15:00~16:17','���� ������ �޹�','010-2131-4155','3.5','ȥ��');
insert into branch_info values('branch28','����28','06:00~21:18','15:00~16:18','���� ����� �޹�','010-2131-4156','3.6','�ѻ�');
insert into branch_info values('branch29','����29','06:00~21:19','15:00~16:19','���� �ݿ��� �޹�','010-2131-4157','3.7','����');
insert into branch_info values('branch30','����30','06:00~21:20','15:00~16:20','���� ����� �޹�','010-2131-4158','3.8','ȥ��');
insert into branch_info values('branch31','����31','06:00~21:21','15:00~16:21','���� �Ͽ��� �޹�','010-2131-4159','3.9','�ѻ�');
insert into branch_info values('branch32','����32','06:00~21:22','15:00~16:22','���� ������ �޹�','010-2131-4160','4.0','����');
insert into branch_info values('branch33','����33','06:00~21:23','15:00~16:23','���� ȭ���� �޹�','010-2131-4161','4.1','ȥ��');
insert into branch_info values('branch34','����34','06:00~21:24','15:00~16:24','���� ������ �޹�','010-2131-4162','4.2','�ѻ�');
insert into branch_info values('branch35','����35','06:00~21:25','15:00~16:25','���� ����� �޹�','010-2131-4163','4.3','����');
insert into branch_info values('branch36','����36','06:00~21:26','15:00~16:26','���� �ݿ��� �޹�','010-2131-4164','4.4','ȥ��');
insert into branch_info values('branch37','����37','06:00~21:27','15:00~16:27','���� ����� �޹�','010-2131-4165','4.5','�ѻ�');
insert into branch_info values('branch38','����38','06:00~21:28','15:00~16:28','���� �Ͽ��� �޹�','010-2131-4166','4.6','����');
insert into branch_info values('branch39','����39','06:00~21:29','15:00~16:29','���� ������ �޹�','010-2131-4167','4.7','ȥ��');
insert into branch_info values('branch40','����40','06:00~21:30','15:00~16:30','���� ȭ���� �޹�','010-2131-4168','4.7','�ѻ�');
insert into branch_info values('branch41','����41','06:00~21:31','15:00~16:31','���� ������ �޹�','010-2131-4169','4.8','����');
insert into branch_info values('branch42','����42','06:00~21:32','15:00~16:32','���� ����� �޹�','010-2131-4170','1.0','ȥ��');
insert into branch_info values('branch43','����43','06:00~21:33','15:00~16:33','���� �ݿ��� �޹�','010-2131-4171','1.1','�ѻ�');
insert into branch_info values('branch44','����44','06:00~21:34','15:00~16:34','���� ����� �޹�','010-2131-4172','1.2','����');
insert into branch_info values('branch45','����45','06:00~21:35','15:00~16:35','���� �Ͽ��� �޹�','010-2131-4173','1.3','ȥ��');
insert into branch_info values('branch46','����46','06:00~21:36','15:00~16:36','���� ������ �޹�','010-2131-4174','1.4','�ѻ�');
insert into branch_info values('branch47','����47','06:00~21:37','15:00~16:37','���� ȭ���� �޹�','010-2131-4175','1.5','����');
insert into branch_info values('branch48','����48','06:00~21:38','15:00~16:38','���� ������ �޹�','010-2131-4176','1.6','ȥ��');
insert into branch_info values('branch49','����49','06:00~21:39','15:00~16:39','���� ����� �޹�','010-2131-4177','1.7','�ѻ�');
insert into branch_info values('branch50','����50','06:00~21:40','15:00~16:40','���� �ݿ��� �޹�','010-2131-4178','1.7','����');
insert into branch_info values('branch51','����51','06:00~21:41','15:00~16:41','���� ����� �޹�','010-2131-4179','1.8','ȥ��');
insert into branch_info values('branch52','����52','06:00~21:42','15:00~16:42','���� �Ͽ��� �޹�','010-2131-4180','1.9','�ѻ�');
insert into branch_info values('branch53','����53','06:00~21:43','15:00~16:43','���� ������ �޹�','010-2131-4181','2.0','����');
insert into branch_info values('branch54','����54','06:00~21:44','15:00~16:44','���� ȭ���� �޹�','010-2131-4182','2.1','ȥ��');
insert into branch_info values('branch55','����55','06:00~21:45','15:00~16:45','���� ������ �޹�','010-2131-4183','2.2','�ѻ�');
insert into branch_info values('branch56','����56','06:00~21:46','15:00~16:46','���� ����� �޹�','010-2131-4184','2.3','����');
insert into branch_info values('branch57','����57','06:00~21:47','15:00~16:47','���� �ݿ��� �޹�','010-2131-4185','2.4','ȥ��');
insert into branch_info values('branch58','����58','06:00~21:48','15:00~16:48','���� ����� �޹�','010-2131-4186','2.5','�ѻ�');
insert into branch_info values('branch59','����59','06:00~21:49','15:00~16:49','���� �Ͽ��� �޹�','010-2131-4187','2.6','����');
insert into branch_info values('branch60','����60','06:00~21:50','15:00~16:50','���� ������ �޹�','010-2131-4188','2.7','ȥ��');
insert into branch_info values('branch61','����61','06:00~21:51','15:00~16:51','���� ȭ���� �޹�','010-2131-4189','2.8','�ѻ�');
insert into branch_info values('branch62','����62','06:00~21:52','15:00~16:52','���� ������ �޹�','010-2131-4190','2.9','����');
insert into branch_info values('branch63','����63','06:00~21:53','15:00~16:53','���� ����� �޹�','010-2131-4191','3.0','ȥ��');
insert into branch_info values('branch64','����64','06:00~21:54','15:00~16:54','���� �ݿ��� �޹�','010-2131-4192','3.1','�ѻ�');
insert into branch_info values('branch65','����65','06:00~21:55','15:00~16:55','���� ����� �޹�','010-2131-4193','3.2','����');
insert into branch_info values('branch66','����66','06:00~21:56','15:00~16:56','���� �Ͽ��� �޹�','010-2131-4194','3.3','ȥ��');
insert into branch_info values('branch67','����67','06:00~21:57','15:00~16:57','���� ������ �޹�','010-2131-4195','3.4','�ѻ�');
insert into branch_info values('branch68','����68','06:00~21:58','15:00~16:58','���� ȭ���� �޹�','010-2131-4196','3.5','����');
insert into branch_info values('branch69','����69','06:00~21:59','15:00~16:59','���� ������ �޹�','010-2131-4197','3.6','ȥ��');
insert into branch_info values('branch70','����70','06:00~21:60','15:00~16:60','���� ����� �޹�','010-2131-4198','3.7','�ѻ�');
insert into branch_info values('branch71','����71','06:00~21:61','15:00~16:61','���� �ݿ��� �޹�','010-2131-4199','3.8','����');
insert into branch_info values('branch72','����72','06:00~21:62','15:00~16:62','���� ����� �޹�','010-2131-4200','3.9','ȥ��');
insert into branch_info values('branch73','����73','06:00~21:63','15:00~16:63','���� �Ͽ��� �޹�','010-2131-4201','4.0','�ѻ�');
insert into branch_info values('branch74','����74','06:00~21:64','15:00~16:64','���� ������ �޹�','010-2131-4202','4.1','����');
insert into branch_info values('branch75','����75','06:00~21:65','15:00~16:65','���� ȭ���� �޹�','010-2131-4203','4.2','ȥ��');
insert into branch_info values('branch76','����76','06:00~21:66','15:00~16:66','���� ������ �޹�','010-2131-4204','4.3','�ѻ�');
insert into branch_info values('branch77','����77','06:00~21:67','15:00~16:67','���� ����� �޹�','010-2131-4205','4.4','����');
insert into branch_info values('branch78','����78','06:00~21:68','15:00~16:68','���� �ݿ��� �޹�','010-2131-4206','4.5','ȥ��');
insert into branch_info values('branch79','����79','06:00~21:69','15:00~16:69','���� ����� �޹�','010-2131-4207','4.6','�ѻ�');
insert into branch_info values('branch80','����80','06:00~21:70','15:00~16:70','���� �Ͽ��� �޹�','010-2131-4208','4.7','����');
insert into branch_info values('branch81','����81','06:00~21:71','15:00~16:71','���� ������ �޹�','010-2131-4209','4.7','ȥ��');
insert into branch_info values('branch82','����82','06:00~21:72','15:00~16:72','���� ȭ���� �޹�','010-2131-4210','4.8','�ѻ�');
insert into branch_info values('branch83','����83','06:00~21:73','15:00~16:73','���� ������ �޹�','010-2131-4211','1.0','����');
insert into branch_info values('branch84','����84','06:00~21:74','15:00~16:74','���� ����� �޹�','010-2131-4212','1.1','ȥ��');
insert into branch_info values('branch85','����85','06:00~21:75','15:00~16:75','���� �ݿ��� �޹�','010-2131-4213','1.2','�ѻ�');
insert into branch_info values('branch86','����86','06:00~21:76','15:00~16:76','���� ����� �޹�','010-2131-4214','1.3','����');
insert into branch_info values('branch87','����87','06:00~21:77','15:00~16:77','���� �Ͽ��� �޹�','010-2131-4215','1.4','ȥ��');
insert into branch_info values('branch88','����88','06:00~21:78','15:00~16:78','���� ������ �޹�','010-2131-4216','1.5','�ѻ�');
insert into branch_info values('branch89','����89','06:00~21:79','15:00~16:79','���� ȭ���� �޹�','010-2131-4217','1.6','����');
insert into branch_info values('branch90','����90','06:00~21:80','15:00~16:80','���� ������ �޹�','010-2131-4218','1.7','ȥ��');
insert into branch_info values('branch91','����91','06:00~21:81','15:00~16:81','���� ����� �޹�','010-2131-4219','1.2','�ѻ�');
insert into branch_info values('branch92','����92','06:00~21:82','15:00~16:82','���� �ݿ��� �޹�','010-2131-4220','1.3','����');
insert into branch_info values('branch93','����93','06:00~21:83','15:00~16:83','���� ����� �޹�','010-2131-4221','1.4','ȥ��');
insert into branch_info values('branch94','����94','06:00~21:84','15:00~16:84','���� �Ͽ��� �޹�','010-2131-4222','1.5','�ѻ�');

insert into branch_address values('branch01','07741','서울 송파구 도곡로 434','잠실동 305-15','지하2층','서울','송파구','','잠실동');
insert into branch_address values('branch01','06621','서울 강동구 강동대로 143-52','성내동 452','지하1층','서울','강동구','','성내동');
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

insert into branch_menu values('branch01','���','4000��','');
insert into branch_menu values('branch02','���','4001��','');
insert into branch_menu values('branch03','���','4002��','');
insert into branch_menu values('branch04','���','4003��','');
insert into branch_menu values('branch05','«��','4004��','');
insert into branch_menu values('branch06','������','4005��','');
insert into branch_menu values('branch07','�쵿','4006��','');
insert into branch_menu values('branch08','���뱹','4007��','');
insert into branch_menu values('branch09','�佺Ʈ','4008��','');
insert into branch_menu values('branch10','���','4009��','');
insert into branch_menu values('branch11','���','4010��','');
insert into branch_menu values('branch12','«��','4011��','');
insert into branch_menu values('branch13','������','4012��','');
insert into branch_menu values('branch14','�쵿','4013��','');
insert into branch_menu values('branch15','���뱹','4014��','');
insert into branch_menu values('branch16','�佺Ʈ','4015��','');
insert into branch_menu values('branch17','���','4016��','');
insert into branch_menu values('branch18','���','4017��','');
insert into branch_menu values('branch19','«��','4018��','');
insert into branch_menu values('branch20','������','4019��','');
insert into branch_menu values('branch21','�쵿','4020��','');
insert into branch_menu values('branch22','���뱹','4021��','');
insert into branch_menu values('branch23','�佺Ʈ','4022��','');
insert into branch_menu values('branch24','���','4023��','');
insert into branch_menu values('branch25','���','4024��','');
insert into branch_menu values('branch26','«��','4025��','');
insert into branch_menu values('branch27','������','4026��','');
insert into branch_menu values('branch28','�쵿','4027��','');
insert into branch_menu values('branch29','���뱹','4028��','');
insert into branch_menu values('branch30','�佺Ʈ','4029��','');
insert into branch_menu values('branch31','���','4030��','');
insert into branch_menu values('branch32','���','4031��','');
insert into branch_menu values('branch33','«��','4032��','');
insert into branch_menu values('branch34','������','4033��','');
insert into branch_menu values('branch35','�쵿','4034��','');
insert into branch_menu values('branch36','���뱹','4035��','');
insert into branch_menu values('branch37','�佺Ʈ','4036��','');
insert into branch_menu values('branch38','���','4037��','');
insert into branch_menu values('branch39','���','4038��','');
insert into branch_menu values('branch40','«��','4039��','');
insert into branch_menu values('branch41','������','4040��','');
insert into branch_menu values('branch42','�쵿','4041��','');
insert into branch_menu values('branch43','���뱹','4042��','');
insert into branch_menu values('branch44','�佺Ʈ','4043��','');
insert into branch_menu values('branch45','���','4044��','');
insert into branch_menu values('branch46','���','4045��','');
insert into branch_menu values('branch47','«��','4046��','');
insert into branch_menu values('branch48','������','4047��','');
insert into branch_menu values('branch49','�쵿','4048��','');
insert into branch_menu values('branch50','���뱹','4049��','');
insert into branch_menu values('branch51','�佺Ʈ','4050��','');
insert into branch_menu values('branch52','���','4051��','');
insert into branch_menu values('branch53','���','4052��','');
insert into branch_menu values('branch54','«��','4053��','');
insert into branch_menu values('branch55','������','4054��','');
insert into branch_menu values('branch56','�쵿','4055��','');
insert into branch_menu values('branch57','���뱹','4056��','');
insert into branch_menu values('branch58','�佺Ʈ','4057��','');
insert into branch_menu values('branch59','���','4058��','');
insert into branch_menu values('branch60','���','4059��','');
insert into branch_menu values('branch61','«��','4060��','');
insert into branch_menu values('branch62','������','4061��','');
insert into branch_menu values('branch63','�쵿','4062��','');
insert into branch_menu values('branch64','���뱹','4063��','');
insert into branch_menu values('branch65','�佺Ʈ','4064��','');
insert into branch_menu values('branch66','���','4065��','');
insert into branch_menu values('branch67','���','4066��','');
insert into branch_menu values('branch68','«��','4067��','');
insert into branch_menu values('branch69','������','4068��','');
insert into branch_menu values('branch70','�쵿','4069��','');
insert into branch_menu values('branch71','���뱹','4070��','');
insert into branch_menu values('branch72','�佺Ʈ','4071��','');
insert into branch_menu values('branch73','���','4072��','');
insert into branch_menu values('branch74','���','4073��','');
insert into branch_menu values('branch75','«��','4074��','');
insert into branch_menu values('branch76','������','4075��','');
insert into branch_menu values('branch77','�쵿','4076��','');
insert into branch_menu values('branch78','���뱹','4077��','');
insert into branch_menu values('branch79','�佺Ʈ','4078��','');
insert into branch_menu values('branch80','���','4079��','');
insert into branch_menu values('branch81','���','4080��','');
insert into branch_menu values('branch82','«��','4081��','');
insert into branch_menu values('branch83','������','4082��','');
insert into branch_menu values('branch84','�쵿','4083��','');
insert into branch_menu values('branch85','���뱹','4084��','');
insert into branch_menu values('branch86','�佺Ʈ','4085��','');
insert into branch_menu values('branch87','���','4086��','');
insert into branch_menu values('branch88','���','4087��','');
insert into branch_menu values('branch89','«��','4088��','');
insert into branch_menu values('branch90','������','4089��','');
insert into branch_menu values('branch91','�쵿','4090��','');
insert into branch_menu values('branch92','���뱹','4091��','');
insert into branch_menu values('branch93','�佺Ʈ','4092��','');
insert into branch_menu values('branch94','���','4093��','');

insert into branch_menu values('branch01','��ġ������','20,000��','');
insert into branch_menu values('branch02','��ġ������','20,001��','');
insert into branch_menu values('branch03','��ġ������','20,002��','');
insert into branch_menu values('branch04','���캺����','20,003��','');
insert into branch_menu values('branch05','ī��','20,004��','');
insert into branch_menu values('branch06','���','20,005��','');
insert into branch_menu values('branch07','�յ��','20,006��','');
insert into branch_menu values('branch08','���','20,007��','');
insert into branch_menu values('branch09','Į����','20,008��','');
insert into branch_menu values('branch10','��ġ������','20,009��','');
insert into branch_menu values('branch11','���캺����','20,010��','');
insert into branch_menu values('branch12','ī��','20,011��','');
insert into branch_menu values('branch13','���','20,012��','');
insert into branch_menu values('branch14','�յ��','20,013��','');
insert into branch_menu values('branch15','���','20,014��','');
insert into branch_menu values('branch16','Į����','20,015��','');
insert into branch_menu values('branch17','��ġ������','20,016��','');
insert into branch_menu values('branch18','���캺����','20,017��','');
insert into branch_menu values('branch19','ī��','20,018��','');
insert into branch_menu values('branch20','���','20,019��','');
insert into branch_menu values('branch21','�յ��','20,020��','');
insert into branch_menu values('branch22','���','20,021��','');
insert into branch_menu values('branch23','Į����','20,022��','');
insert into branch_menu values('branch24','��ġ������','20,023��','');
insert into branch_menu values('branch25','���캺����','20,024��','');
insert into branch_menu values('branch26','ī��','20,025��','');
insert into branch_menu values('branch27','���','20,026��','');
insert into branch_menu values('branch28','�յ��','20,027��','');
insert into branch_menu values('branch29','���','20,028��','');
insert into branch_menu values('branch30','Į����','20,029��','');
insert into branch_menu values('branch31','��ġ������','20,030��','');
insert into branch_menu values('branch32','���캺����','20,031��','');
insert into branch_menu values('branch33','ī��','20,032��','');
insert into branch_menu values('branch34','���','20,033��','');
insert into branch_menu values('branch35','�յ��','20,034��','');
insert into branch_menu values('branch36','���','20,035��','');
insert into branch_menu values('branch37','Į����','20,036��','');
insert into branch_menu values('branch38','��ġ������','20,037��','');
insert into branch_menu values('branch39','���캺����','20,038��','');
insert into branch_menu values('branch40','ī��','20,039��','');
insert into branch_menu values('branch41','���','20,040��','');
insert into branch_menu values('branch42','�յ��','20,041��','');
insert into branch_menu values('branch43','���','20,042��','');
insert into branch_menu values('branch44','Į����','20,043��','');
insert into branch_menu values('branch45','��ġ������','20,044��','');
insert into branch_menu values('branch46','���캺����','20,045��','');
insert into branch_menu values('branch47','ī��','20,046��','');
insert into branch_menu values('branch48','���','20,047��','');
insert into branch_menu values('branch49','�յ��','20,048��','');
insert into branch_menu values('branch50','���','20,049��','');
insert into branch_menu values('branch51','Į����','20,050��','');
insert into branch_menu values('branch52','��ġ������','20,051��','');
insert into branch_menu values('branch53','���캺����','20,052��','');
insert into branch_menu values('branch54','ī��','20,053��','');
insert into branch_menu values('branch55','���','20,054��','');
insert into branch_menu values('branch56','�յ��','20,055��','');
insert into branch_menu values('branch57','���','20,056��','');
insert into branch_menu values('branch58','Į����','20,057��','');
insert into branch_menu values('branch59','��ġ������','20,058��','');
insert into branch_menu values('branch60','���캺����','20,059��','');
insert into branch_menu values('branch61','ī��','20,060��','');
insert into branch_menu values('branch62','���','20,061��','');
insert into branch_menu values('branch63','�յ��','20,062��','');
insert into branch_menu values('branch64','���','20,063��','');
insert into branch_menu values('branch65','Į����','20,064��','');
insert into branch_menu values('branch66','��ġ������','20,065��','');
insert into branch_menu values('branch67','���캺����','20,066��','');
insert into branch_menu values('branch68','ī��','20,067��','');
insert into branch_menu values('branch69','���','20,068��','');
insert into branch_menu values('branch70','�յ��','20,069��','');
insert into branch_menu values('branch71','���','20,070��','');
insert into branch_menu values('branch72','Į����','20,071��','');
insert into branch_menu values('branch73','��ġ������','20,072��','');
insert into branch_menu values('branch74','���캺����','20,073��','');
insert into branch_menu values('branch75','ī��','20,074��','');
insert into branch_menu values('branch76','���','20,075��','');
insert into branch_menu values('branch77','�յ��','20,076��','');
insert into branch_menu values('branch78','���','20,077��','');
insert into branch_menu values('branch79','Į����','20,078��','');
insert into branch_menu values('branch80','��ġ������','20,079��','');
insert into branch_menu values('branch81','���캺����','20,080��','');
insert into branch_menu values('branch82','ī��','20,081��','');
insert into branch_menu values('branch83','���','20,082��','');
insert into branch_menu values('branch84','�յ��','20,083��','');
insert into branch_menu values('branch85','���','20,084��','');
insert into branch_menu values('branch86','Į����','20,085��','');
insert into branch_menu values('branch87','��ġ������','20,086��','');
insert into branch_menu values('branch88','���캺����','20,087��','');
insert into branch_menu values('branch89','ī��','20,088��','');
insert into branch_menu values('branch90','���','20,089��','');
insert into branch_menu values('branch91','�յ��','20,090��','');
insert into branch_menu values('branch92','���','20,091��','');
insert into branch_menu values('branch93','Į����','20,092��','');
insert into branch_menu values('branch94','��ġ������','20,093��','');

insert into branch_menu values('branch01','�ʹ�','10,000��','true');
insert into branch_menu values('branch02','�ʹ�','10,001��','true');
insert into branch_menu values('branch03','�ʹ�','10,002��','true');
insert into branch_menu values('branch04','����','10,003��','true');
insert into branch_menu values('branch05','����','10,004��','true');
insert into branch_menu values('branch06','�߾���','10,005��','true');
insert into branch_menu values('branch07','������','10,006��','true');
insert into branch_menu values('branch08','�����屹','10,007��','true');
insert into branch_menu values('branch09','�����','10,008��','true');
insert into branch_menu values('branch10','�ʹ�','10,009��','true');
insert into branch_menu values('branch11','����','10,010��','true');
insert into branch_menu values('branch12','����','10,011��','true');
insert into branch_menu values('branch13','�߾���','10,012��','true');
insert into branch_menu values('branch14','������','10,013��','true');
insert into branch_menu values('branch15','�����屹','10,014��','true');
insert into branch_menu values('branch16','�����','10,015��','true');
insert into branch_menu values('branch17','�ʹ�','10,016��','true');
insert into branch_menu values('branch18','����','10,017��','true');
insert into branch_menu values('branch19','����','10,018��','true');
insert into branch_menu values('branch20','�߾���','10,019��','true');
insert into branch_menu values('branch21','������','10,020��','true');
insert into branch_menu values('branch22','�����屹','10,021��','true');
insert into branch_menu values('branch23','�����','10,022��','true');
insert into branch_menu values('branch24','�ʹ�','10,023��','true');
insert into branch_menu values('branch25','����','10,024��','true');
insert into branch_menu values('branch26','����','10,025��','true');
insert into branch_menu values('branch27','�߾���','10,026��','true');
insert into branch_menu values('branch28','������','10,027��','true');
insert into branch_menu values('branch29','�����屹','10,028��','true');
insert into branch_menu values('branch30','�����','10,029��','true');
insert into branch_menu values('branch31','�ʹ�','10,030��','true');
insert into branch_menu values('branch32','����','10,031��','true');
insert into branch_menu values('branch33','����','10,032��','true');
insert into branch_menu values('branch34','�߾���','10,033��','true');
insert into branch_menu values('branch35','������','10,034��','true');
insert into branch_menu values('branch36','�����屹','10,035��','true');
insert into branch_menu values('branch37','�����','10,036��','true');
insert into branch_menu values('branch38','�ʹ�','10,037��','true');
insert into branch_menu values('branch39','����','10,038��','true');
insert into branch_menu values('branch40','����','10,039��','true');
insert into branch_menu values('branch41','�߾���','10,040��','true');
insert into branch_menu values('branch42','������','10,041��','true');
insert into branch_menu values('branch43','�����屹','10,042��','true');
insert into branch_menu values('branch44','�����','10,043��','true');
insert into branch_menu values('branch45','�ʹ�','10,044��','true');
insert into branch_menu values('branch46','����','10,045��','true');
insert into branch_menu values('branch47','����','10,046��','true');
insert into branch_menu values('branch48','�߾���','10,047��','true');
insert into branch_menu values('branch49','������','10,048��','true');
insert into branch_menu values('branch50','�����屹','10,049��','true');
insert into branch_menu values('branch51','�����','10,050��','true');
insert into branch_menu values('branch52','�ʹ�','10,051��','true');
insert into branch_menu values('branch53','����','10,052��','true');
insert into branch_menu values('branch54','����','10,053��','true');
insert into branch_menu values('branch55','�߾���','10,054��','true');
insert into branch_menu values('branch56','������','10,055��','true');
insert into branch_menu values('branch57','�����屹','10,056��','true');
insert into branch_menu values('branch58','�����','10,057��','true');
insert into branch_menu values('branch59','�ʹ�','10,058��','true');
insert into branch_menu values('branch60','����','10,059��','true');
insert into branch_menu values('branch61','����','10,060��','true');
insert into branch_menu values('branch62','�߾���','10,061��','true');
insert into branch_menu values('branch63','������','10,062��','true');
insert into branch_menu values('branch64','�����屹','10,063��','true');
insert into branch_menu values('branch65','�����','10,064��','true');
insert into branch_menu values('branch66','�ʹ�','10,065��','true');
insert into branch_menu values('branch67','����','10,066��','true');
insert into branch_menu values('branch68','����','10,067��','true');
insert into branch_menu values('branch69','�߾���','10,068��','true');
insert into branch_menu values('branch70','������','10,069��','true');
insert into branch_menu values('branch71','�����屹','10,070��','true');
insert into branch_menu values('branch72','�����','10,071��','true');
insert into branch_menu values('branch73','�ʹ�','10,072��','true');
insert into branch_menu values('branch74','����','10,073��','true');
insert into branch_menu values('branch75','����','10,074��','true');
insert into branch_menu values('branch76','�߾���','10,075��','true');
insert into branch_menu values('branch77','������','10,076��','true');
insert into branch_menu values('branch78','�����屹','10,077��','true');
insert into branch_menu values('branch79','�����','10,078��','true');
insert into branch_menu values('branch80','�ʹ�','10,079��','true');
insert into branch_menu values('branch81','����','10,080��','true');
insert into branch_menu values('branch82','����','10,081��','true');
insert into branch_menu values('branch83','�߾���','10,082��','true');
insert into branch_menu values('branch84','������','10,083��','true');
insert into branch_menu values('branch85','�����屹','10,084��','true');
insert into branch_menu values('branch86','�����','10,085��','true');
insert into branch_menu values('branch87','�ʹ�','10,086��','true');
insert into branch_menu values('branch88','����','10,087��','true');
insert into branch_menu values('branch89','����','10,088��','true');
insert into branch_menu values('branch90','�߾���','10,089��','true');
insert into branch_menu values('branch91','������','10,090��','true');
insert into branch_menu values('branch92','�����屹','10,091��','true');
insert into branch_menu values('branch93','�����','10,092��','true');
insert into branch_menu values('branch94','�ʹ�','10,093��','true');

--select * from branch_menu where id like 'branch90' and mainMenu like 'true';

--select * from branch_info a inner join branch_address b on a.id = b.id inner join branch_image c on a.id = c.id where roadAddress like '%����%';

--# �õ� / �ñ��� / ���� / �� �÷� �߰�

alter table branch_address add sido varchar(20) NOT null;
alter table branch_address add sigungu varchar(20) NOT null;
alter table branch_address add bname1 varchar(20);
alter table branch_address add bname2 varchar(20) NOT null;
alter table branch_address add latlngx varchar(20) ;
alter table branch_address add latlngy varchar(20) ;

select * from branch_address;


--select * from branch_address where roadAddress like '%����%';

--# ----------------- selectLocation ���̵�����
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
--where menu like '%�쵿%';
---------------------------------------------------------------------------------






