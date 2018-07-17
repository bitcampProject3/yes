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

create table branch_menu(
  id varchar(20) primary key not null ,
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

insert into branch_info values('branch01','����8','09:00~23:05','14:00~15:05','���� �ݿ��� �޹�','010-2131-4136','1.6','����');
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

insert into branch_address values('branch01','07741','���� ���ı� ����� 434','��ǵ� 305-15','����2��');
insert into branch_address values('branch02','06621','���� ������ ������� 143-52','������ 452','����1��');
insert into branch_address values('branch03','05239','���� ������ ����� 31','�ϻ絿 506-6','1��');
insert into branch_address values('branch04','13480','��� ������ �д籸 ����Ǳ��� 477','�Ǳ��� 649','2��');
insert into branch_address values('branch05','06040','���� ������ ������ 154','������ 6-4','3��');
insert into branch_address values('branch06','06309','���� ������ ������32�� 15','������ 1209-20','4��');
insert into branch_address values('branch07','07741','���� ������ ���̷� 57','ȭ� 772-67','5��');
insert into branch_address values('branch08','06621','���� ���ʱ� ���ʴ��78�� 24','���ʵ� 1327-5','6��');
insert into branch_address values('branch09','13481','���� ��걸 ��������� 3','�ľϵ� 30-66','7��');
insert into branch_address values('branch10','06040','��õ ���� ���� 35','���絿 851-2','8��');
insert into branch_address values('branch11','06309','���� ���α� ����� 6','���е� 14','9��');
insert into branch_address values('branch12','07741','���� �߱� ���Ϸ� 30','������1�� 126-2','10��');
insert into branch_address values('branch13','06621','���� �߱� �������� 31','�ʵ� 107-12','11��');
insert into branch_address values('branch14','13482','���� �߱� ���� 15','���빮��5�� 84-17','12��');
insert into branch_address values('branch15','06040','���� ���α� ����� 58','�� 96-18','13��');
insert into branch_address values('branch16','06309','���� ���α� ������ 65','������ 262-85','14��');
insert into branch_address values('branch17','07741','���� ��걸 �ҿ��� 66','�ľϵ� 448-103','15��');
insert into branch_address values('branch18','06621','���� �߱� ��ȣ�� 296','���浿2�� 186-69','16��');
insert into branch_address values('branch19','13483','���� ���ʱ� ���ʴ��74�� 45 2��','���ʵ� 1330-3','17��');
insert into branch_address values('branch20','06040','���� ������ ������111�� 16','������ 193-38','18��');
insert into branch_address values('branch21','06309','���� �߱� ����36�� 10','�ʵ�2�� 80-2','19��');
insert into branch_address values('branch22','07741','���� ���α� ���̷�5�� 62','�Ұݵ� 122-3','20��');
insert into branch_address values('branch23','06621','���� ���α� ���ϴ��32�� 55-4','��ϵ� 51','21��');
insert into branch_address values('branch24','13484','���� �߱� ���빮����4�� 39-1','��â�� 48-12','22��');
insert into branch_address values('branch25','06040','���� ���α� �λ絿12�� 3','���Ƶ� 68','23��');
insert into branch_address values('branch26','06309','���� ���ʱ� �Ź����� 329','����� 40-9','24��');
insert into branch_address values('branch27','07741','���� ������ �ھ��18�� 95','���ǵ� 221-28','25��');
insert into branch_address values('branch28','06621','���� ���ϱ� �ȾϷ� 81','�Ⱦϵ�5�� 104-35','26��');
insert into branch_address values('branch29','13485','���� ���α� ����32�� 23-5','����5�� 395-10','27��');
insert into branch_address values('branch30','06040','���� �߱� â��÷� 62-29','�ֱ��� 118-1','28��');
insert into branch_address values('branch31','06309','���� ������ ������� 452','���ﵿ 809-13','29��');
insert into branch_address values('branch32','07741','���� ������ ������ 327','�Ż絿 652-16','30��');
insert into branch_address values('branch33','06621','���� �߱� ��10�� 29','��2�� 25-2','31��');
insert into branch_address values('branch34','13486','���� ������ �������9�� 8','������2�� 277-135','32��');
insert into branch_address values('branch35','06040','���� ��걸 ���¿���42�� 28-4','�ѳ��� 683-63','33��');
insert into branch_address values('branch36','06309','���� ������ ������3�� 9','������2�� 301-16','34��');
insert into branch_address values('branch37','07741','���� ���α� ��ǥ��28�� 23','�ͼ��� 174','35��');
insert into branch_address values('branch38','06621','���� ������ �е��� 305-3','������ 115-14','36��');
insert into branch_address values('branch39','13487','���� �������� ��ȸ���76�� 10','���ǵ��� 13-1','37��');
insert into branch_address values('branch40','06040','���� ���α� ���з�9�� 12','���4�� 107','38��');
insert into branch_address values('branch41','06309','���� ������ ������ 267','������ 229-67','39��');
insert into branch_address values('branch42','07741','���� �߱� ������ 12-15','���� 28-2','40��');
insert into branch_address values('branch43','06621','���� �߱� ��������� 627','���嵿 ��5-6','41��');
insert into branch_address values('branch44','13488','���� �߱� ����ܷ� 275','������6�� 18-12','42��');
insert into branch_address values('branch45','06040','���� ������ ������� 418','�Ｚ�� 113','43��');
insert into branch_address values('branch46','06309','���� ������ ������ 24','������ 147-6','44��');
insert into branch_address values('branch47','07741','���� ������ �������94�� 9','���ﵿ 818-14','45��');
insert into branch_address values('branch48','06621','���� ��걸 ���¿���15�� 1','���¿��� 181-8','46��');
insert into branch_address values('branch49','13489','���� �߱� ���ַ� 26','�ʵ�3�� 1-5','47��');
insert into branch_address values('branch50','06040','���� �߱� ������3�� 24','�ٵ� 121-4','48��');
insert into branch_address values('branch51','06309','���� ������ ���ַ�107�� 7','���ﵿ 655-12','49��');
insert into branch_address values('branch52','07741','���� ������ �����̷� 78','������2�� 322-32','50��');
insert into branch_address values('branch53','06621','���� ���α� ���� 19','û���� 146','51��');
insert into branch_address values('branch54','13490','���� ������ ����� 118','���ﵿ 833','52��');
insert into branch_address values('branch55','06040','���� ��걸 ���ӹ����� 10','������ 8-1','53��');
insert into branch_address values('branch56','06309','���� ���ʱ� ���ʴ��50�� 24 ûȭ���� 2��','���ʵ� 1571-18','54��');
insert into branch_address values('branch57','07741','���� �߱� �湫��14�� 2-1','������ 161','55��');
insert into branch_address values('branch58','06621','���� �������� ���Ǵ�� 24','���ǵ��� 28-1','56��');
insert into branch_address values('branch59','13491','���� ���ı� ������з�45�� 38','���ĵ� 57','57��');
insert into branch_address values('branch60','06040','���� ������ �Ϳ��� 101','������ 343-10','58��');
insert into branch_address values('branch61','06309','���� ������ �е���2�� 56?','������ 164-14','59��');
insert into branch_address values('branch62','07741','���� ������ �ܴٸ��� 123','������ 469-67','60��');
insert into branch_address values('branch63','06621','���� ������ ��ȭ���� 10','������ 381-64','61��');
insert into branch_address values('branch64','13492','���� ������ �б�����38�� 14','�Ż絿 619-4','62��');
insert into branch_address values('branch65','06040','���� ������ ������ 67-9','����� 317-3','63��');
insert into branch_address values('branch66','06309','���� ���ı� ������71�� 1-4','���̵� 205-8','64��');
insert into branch_address values('branch67','07741','���� ������ ���ַ� 835','�Ż絿 623-5','65��');
insert into branch_address values('branch68','06621','���� ���α� ����40���� 18','����5�� 265-22','66��');
insert into branch_address values('branch69','13493','���� ������ �е���2�� 45','������ 163-3','67��');
insert into branch_address values('branch70','06040','���� ���ı� ���ʼ���� 10','���̵� 44-5','68��');
insert into branch_address values('branch71','06309','���� ������ �Ϳ���21�� 36-6?','������ 358-49','69��');
insert into branch_address values('branch72','07741','���� ���빮�� �����11���� 23','���� 190-4','70��');
insert into branch_address values('branch73','06621','���� ���Ǳ� ������ 60','�Ÿ��� 546-1','71��');
insert into branch_address values('branch74','13494','���� ������ �Ϳ���21�� 20-11','������ 358-121','72��');
insert into branch_address values('branch75','06040','���� ������ ������94�� 25-3','���ﵿ 670-20','73��');
insert into branch_address values('branch76','06309','���� ���ϱ� ���Ϸ� 7','���ϵ�1�� 35-5','74��');
insert into branch_address values('branch77','07741','���� ���۱� ���۴��7�� 19','��絿 1032-1','75��');
insert into branch_address values('branch78','06621','���� �������� �������� 159 1��','��굿1�� 79-5','76��');
insert into branch_address values('branch79','13495','���� ���Ǳ� �����뿪�� 8','��õ�� 1660-7','77��');
insert into branch_address values('branch80','06040','���� ���ʱ� ���ʴ��78�� 22','���ʵ� 1327-2','78��');
insert into branch_address values('branch81','06309','���� ������ �սʸ��� 96','������1�� 656-442','79��');
insert into branch_address values('branch82','07741','���� ���ʱ� ���õ��2�� 25','��赿 449-5','80��');
insert into branch_address values('branch83','06621','���� ���ϱ� 4.19�� 69','������ 563-14','81��');
insert into branch_address values('branch84','13496','���� ���α� �����1�� 74-9','�Ұݵ� 158-1','82��');
insert into branch_address values('branch85','06040','���� ���Ǳ� ���μ�ȯ��234�� 19','��õ�� 1620-3','83��');
insert into branch_address values('branch86','06309','���� ���ϱ� ���Ϸ�23�� 4','���ϵ� 109-2','84��');
insert into branch_address values('branch87','07741','���� ���ϱ� ������ 395','�Ͽ�� 221','85��');
insert into branch_address values('branch88','06621','���� ������ �սʸ��� 331','�Ͽսʸ��� 966-12','86��');
insert into branch_address values('branch89','13497','���� ������ ������� 217','������ 448-24','87��');
insert into branch_address values('branch90','06040','���� ��õ�� �߾ӷ�32�� 61','������ 1021-9','88��');
insert into branch_address values('branch91','06309','���� �߱� ���ķ� 107','���嵿 8-53','89��');
insert into branch_address values('branch92','07741','���� ������ �������162�� 31','�Ż絿 523-16','90��');
insert into branch_address values('branch93','06621','���� ��걸 ������� 69?','��굿5�� 24-1','91��');
insert into branch_address values('branch94','13498','���� ������ �����35�� 68','���嵿 439-1','92��');

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

---------------------------------------------------------------------------------

