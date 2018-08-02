
-- 매장 기본 정보
select * from branch_info;

-- 해당 매장의 이미지
select * from branch_image;

-- 매장의 메뉴
select * from branch_menu;

-- 매장 주소
select * from branch_address;

-- 매장 예약 리스트
select * from reserve_list;

-- 매장 대기표
select * from ticketing;


create table branch_info(
	id varchar(20) primary key,
	branchname varchar(20) not null,
	opTime varchar(20) not null,
	breakTime varchar(20) not null,
	opDate varchar(20) not null,
	phoneNum varchar(20) not null,
	score int not null,
	state varchar(20) not null,
	category varchar(20) NOT NULL,
	branchExplain varchar(40) NOT NULL,
 	maxTable int not null,
 	tableState int not null,
 	acctepState varchar(10) not null,
	waitingNum int not null
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
  	image6 varchar(40),
  	image7 varchar(40),
  	image8 varchar(40),
  	constraint fk_img_id foreign key (id) references branch_info (id) on delete cascade
);

create table branch_menu(
  id varchar(20) not null ,
  menu varchar(20) NOT NULL,
  price varchar(20) NOT NULL,
  mainMenu varchar(20) NOT NULL,
  constraint fk_me_id foreign key (id) references branch_info (id) on delete cascade
);

create table branch_address(
  	id varchar(20) primary key NOT NULL,
  	zoneCode varchar(10) NOT NULL ,
  	roadAddress varchar(50) NOT NULL,
  	jibunAddress varchar(30) NOT NULL,
  	detailAddress varchar(30) NOT null,
	sido varchar(20) NOT null,
	sigungu varchar(20) NOT null,
	bname1 varchar(20),
	bname2 varchar(20) NOT null,
	latlngx varchar(20) NOT NULL,
	latlngy varchar(20) NOT NULL,
  constraint fk_id foreign key (id) references branch_info (id) on delete cascade
);

create table reserve_list(
   branchID varchar(20) not null,       # 매장id
   clientID varchar(20) not null,       # 고객id
   reserveTime varchar(20) not null,    # 예약된시간
   checkTime datetime not null,         # 예약한시간
   personel int not null,               # 인원
   request varchar(100) not null,       # 요청사항
   useState varchar(10) NOT NULL        # 이용여부
);

create table ticketing(
	branchID varchar(20) ,
	clientID varchar(20) ,
	ticketingTime datetime not null,
	waitingNum int not null
);

