
# 테이블 생성
create table br_accept
(
  licenceNum varchar(20) not null
    primary key,
  name varchar(20) not null,
  address varchar(20) not null,
  opTime varchar(20) not null,
  menu varchar(20) not null,
  image varchar(20) not null,
  phoneNum varchar(20) not null,
  cartegory varchar(20) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table branch_counsel
(
  `index` int auto_increment
    primary key,
  title varchar(30) not null,
  content varchar(100) not null,
  writer varchar(20) not null,
  calendar date not null,
  comment varchar(100) null,
  questionSelect varchar(100) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table branch_info
(
  id varchar(20) not null
    primary key,
  branchname varchar(20) not null,
  opTime varchar(20) not null,
  breakTime varchar(20) not null,
  opDate varchar(20) not null,
  phoneNum varchar(20) not null,
  score decimal(2,1) null,
  state varchar(20) not null,
  category varchar(20) not null,
  branchExplain varchar(40) not null,
  maxTable int not null,
  tableState int not null,
  acceptState varchar(10) not null,
  waitingNum int not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table branch_address
(
  id varchar(20) not null
    primary key,
  zoneCode varchar(10) not null,
  roadAddress varchar(50) not null,
  jibunAddress varchar(30) not null,
  detailAddress varchar(30) not null,
  sido varchar(20) not null,
  sigungu varchar(20) not null,
  bname1 varchar(20) null,
  bname2 varchar(20) not null,
  latlngx varchar(20) not null,
  latlngy varchar(20) not null,
  constraint fk_id
  foreign key (id) references branch_info (id)
    on delete cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table branch_image
(
  id varchar(20) not null
    primary key,
  markerImage varchar(40) not null,
  mainImage varchar(40) not null,
  image1 varchar(40) not null,
  image2 varchar(40) null,
  image3 varchar(40) null,
  image4 varchar(40) null,
  image5 varchar(40) null,
  image6 varchar(40) null,
  image7 varchar(40) null,
  image8 varchar(40) null,
  constraint fk_img_id
  foreign key (id) references branch_info (id)
    on delete cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table branch_menu
(
  id varchar(20) not null,
  menu varchar(20) not null,
  price varchar(20) not null,
  mainMenu varchar(20) not null,
  constraint fk_me_id
  foreign key (id) references branch_info (id)
    on delete cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table c_counsel_images
(
  `index` int not null,
  imageName varchar(100) null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table client_counsel
(
  branchID varchar(20) not null,
  clientID varchar(45) not null,
  `index` int auto_increment
    primary key,
  title varchar(45) not null,
  content varchar(100) not null,
  writer varchar(45) not null,
  calendar datetime not null,
  comment varchar(100) null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table guest
(
  sabun int auto_increment
    primary key,
  name varchar(45) null,
  nalja date null,
  pay int null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table notice
(
  `index` int auto_increment
    primary key,
  title varchar(20) not null,
  content varchar(100) not null,
  writer varchar(20) not null,
  calendar date null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table notice_images
(
  `index` int not null,
  imageName varchar(100) null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table reserve_list
(
  branchID varchar(20) not null,
  clientID varchar(20) not null,
  reserveTime varchar(20) not null,
  checkTime datetime not null,
  personel int not null,
  request varchar(100) not null,
  useState varchar(10) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table review
(
  branchID varchar(20) not null,
  clientID varchar(20) not null,
  idx int auto_increment
    primary key,
  title varchar(20) not null,
  content varchar(100) not null,
  calendar datetime not null,
  rating int not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table review_comment
(
  comment_idx int(10) auto_increment
    primary key,
  review_idx int(10) not null,
  comment longtext null,
  writer varchar(50) null,
  reg_date datetime null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table review_images
(
  idx int not null,
  imageName varchar(100) not null
    primary key
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table review_like
(
  review_idx int(10) not null,
  writer varchar(50) not null,
  checked tinyint(1) default '0' not null,
  click_date datetime not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table s_counsel_images
(
  `index` int not null,
  imageName varchar(100) null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table ticketing
(
  branchID varchar(20) null,
  clientID varchar(20) null,
  ticketingTime datetime not null,
  waitingNum int not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

create table user_info
(
  id varchar(30) primary key,
  password varchar(30) ,
  name varchar(30) ,
  nickname varchar(30) ,
  email varchar(30) ,
  phoneNum varchar(30) ,
  pwQuestion varchar(100) ,
  birthDate date ,
  registNum varchar(30) null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;

alter database mydb default character set utf8;
show variables like 'c%';


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