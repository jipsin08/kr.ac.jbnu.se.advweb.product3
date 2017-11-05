
-- create database and set previledge to root account
create database simpleweb;
use simpleweb;
grant all privileges on simpleweb.* to root@localhost ;


-- Create table

create table user_account
(
user_id varchar(20) NOT NULL,
user_major varchar(20) NOT NULL,
user_name varchar(10) NOT NULL,
user_email varchar(20) NOT NULL,
user_password varchar(20) NOT NULL,
PRIMARY KEY(user_id)
);
 

create table PRODUCT
(
CODE  VARCHAR(20) not null,
NAME  VARCHAR(128) not null,
PRICE FLOAT not null,
primary key (CODE)
) ;

create table cart
(
cart_id INT NOT NULL AUTO_INCREMENT,
cart_user varchar(30) NOT NULL,
cart_item varchar(20) NOT NULL,
PRIMARY KEY(cart_id),
FOREIGN KEY(cart_user) references user_account (USER_ID),
FOREIGN KEY(cart_item) references product (CODE)
);
 
-- Insert data: ---------------------------------------------------------------
 
INSERT INTO user_account                                
VALUES ('201215466', '소프트웨어공학과', '박도현', 'dohun94@naver.com' , '1234');       
 
insert into product (CODE, NAME, PRICE)
values ('P001', 'Java Core', 100);
 
insert into product (CODE, NAME, PRICE)
values ('P002', 'C# Core', 90);
select * from product;
select * from user_account;
