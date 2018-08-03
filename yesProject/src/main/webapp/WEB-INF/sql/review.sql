CREATE TABLE Review(
	branchID VARCHAR(20)  NOT NULL,
	clientID VARCHAR(20)  NOT NULL,
	idx    INT NOT NULL AUTO_INCREMENT primary key,
	title    VARCHAR(20)  NOT NULL,
	content  VARCHAR(100) NOT NULL,
	calendar DATETIME     NOT NULL,
    rating   decimal(2,1) NOT NULL default 0
);

alter table review auto_increment=1;

create table review_images(

	idx int not null,
    imageName varchar(100) not null primary key
);


create table review_comment (
	
    comment_idx int(10) auto_increment primary key,
    review_idx int(10) not null,
	comment longtext,
    writer varchar(50) default null,
    reg_date datetime default null
);

alter table review_comment auto_increment=1;

create table review_like(
	
    review_idx int(10) not null,
    writer varchar(50) not null,
    checked boolean not null default false,
    click_date datetime not null
);

select * from review;
select * from reserve_list;

update reserve_list set useState = (select useState from reserve_list where reserveTime='2018-12-15-16:00')

