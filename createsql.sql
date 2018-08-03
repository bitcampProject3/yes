
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
)
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
)
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
)
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
)
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
)
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
)
;

create table c_counsel_images
(
	`index` int not null,
	imageName varchar(100) null
)
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
)
;

create table guest
(
	sabun int auto_increment
		primary key,
	name varchar(45) null,
	nalja date null,
	pay int null
)
;

create table notice
(
	`index` int auto_increment
		primary key,
	title varchar(20) not null,
	content varchar(100) not null,
	writer varchar(20) not null,
	calendar date null
)
;

create table notice_images
(
	`index` int not null,
	imageName varchar(100) null
)
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
)
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
	rating decimal(2,1) default '0.0' not null
)
;

create table review_comment
(
	comment_idx int(10) auto_increment
		primary key,
	review_idx int(10) not null,
	comment longtext null,
	writer varchar(50) null,
	reg_date datetime null
)
;

create table review_images
(
	idx int not null,
	imageName varchar(100) not null
		primary key
)
;

create table review_like
(
	review_idx int(10) not null,
	writer varchar(50) not null,
	checked tinyint(1) default '0' not null,
	click_date datetime not null
)
;

create table s_counsel_images
(
	`index` int not null,
	imageName varchar(100) null
)
;

create table ticketing
(
	branchID varchar(20) null,
	clientID varchar(20) null,
	ticketingTime datetime not null,
	waitingNum int not null
)
;

create table user_info
(
	id varchar(30) not null
		primary key,
	password varchar(30) not null,
	name varchar(30) not null,
	nickname varchar(30) not null,
	email varchar(30) not null,
	phoneNum varchar(30) not null,
	pwQuestion varchar(100) not null,
	birthDate date not null,
	registNum varchar(30) null
)
;

