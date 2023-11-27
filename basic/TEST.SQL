
스키마 추가 및 변경 
author 테이블을 나누어 author_address 테이블 추가	
country,state_city, details, zip code, phonenumber
on delete cascade옵션
1:1 관계 설정
author post의 관계가 N:M 즉 여러명이서 한 post를 수정할 수 있도록 스키마수정

create table author_address(id INT PRIMARY KEY
, country VARCHAR(255)
, details VARCHAR(255)
, zipcode varchar(255)
, phonenumber INT(11), 
author_id INT
, FOREIGN KEY(author_id) 
REFERENCES author(id) on delete cascade);


CREATE Database ORDER_SYSTEM;
create table MEMEBERS(
    MEMEBERS_id BIGINT PRIMARY KEY AUTO_INCREMENT,  -- ID
    MEMEBERS_role enum('USER', 'ADMIN', 'SELLER') NOT NULL DEFAULT 'USER'   -- USER 종류
    MEMEBERS_NAME varchar(255) NOT NULL,     -- USER 이름
    MEMEBERS_PHONE varchar(255) NOT NULL,    -- USER 종류
    MEMEBERS_EMAIL varchar(255) NOT NULL     -- USER 메일
);
create table ITEMS(
    ITEMS_id BIGINT PRIMARY KEY AUTO_INCREMENT,     -- ID
    ITEMS_NAME VARCHAR(255)  NOT NULL,    -- 상품 이름
    ITEMS_PRICE BIGINT NOT NULL,     -- 상품 가격
    ITEMS_COUNT INT,        -- 상품 재고 수
    SELLER_id BIGINT NOT NULL,       -- 판매자 ID
    FOREIGN KEY(SELLER_id) REFERENCES MEMEBERS(MEMEBERS_id) ON DELETE CASCADE
);
create table ORDERS(J
    ORDER_id BIGINT PRIMARY KEY AUTO_INCREMENT,     -- 기본키
    USER_id BIGINT NOT NULL,     -- 주문한 사람의 id
    MEMEBERS_ADDRESS_id BIGINT NOT NULL, -- 배송지
    ORDERS_Progress enum('구매요청', '상품 준비중', '배송중', '배송완료') NOT NULL DEFAULT '구매요청'   -- 주문 상태
    FOREIGN KEY(USER_id) REFERENCES MEMEBERS(MEMEBERS_id),
    FOREIGN KEY(MEMEBERS_ADDRESS_id) REFERENCES MEMEBERS_ADDRESS(MEMEBERS_ADDRESS_id)
);
create table ORDER_DETAILS(
    ORDER_DETAILS_id BIGINT PRIMARY KEY AUTO_INCREMENT, -- 기본키
    ORDER_ITEM_COUNT INT NOT NULL,    -- 구매 갯수
    ORDER_id BIGINT NOT NULL,    -- 주문 id
    ITEMS_id BIGINT NOT NULL,    -- 상품 id
    FOREIGN KEY(ORDER_id) REFERENCES ORDERS(ORDER_id),
    FOREIGN KEY(ITEMS_id) REFERENCES MEMEBERS(MEMEBERS_id)
);
create table MEMEBERS_ADDRESS(      -- 배송지가 여러 곳일 가능성
    MEMEBERS_ADDRESS_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    MEMEBERS_SI VARCHAR(255) NOT NULL,
    MEMEBERS_DO VARCHAR(255) NOT NULL,
    MEMEBERS_DETAIL VARCHAR(255) NOT NULL,
    MEMEBERS_id BIGINT NOT NULL,
    FOREIGN KEY(MEMEBERS_id) REFERENCES MEMEBERS(MEMEBERS_id) ON DELETE CASCADE,
);
-- 회원가입 (판매자)    : MEMEBERS INSERT
-- 회원가입 (구매자)    : MEMEBERS INSERT
-- 상품등록 (판매자)    : ITEMS INSERT
-- 상품구매 (구매자)
    -- 배송지 입력         : MEMEBERS_ADDRESS INSERT
    -- 구매내용 등록       : ORDERS INSERT
    -- 구매상새 내용 등록   : ORDER_DETAILS INSERT
    -- 상품 재고 수정       : ITEMS UPDATE


CREATE DATABASE ordersystem;
USE ordersystem;
CREATE TABLE MEMEBER(
id INT PRIMARY KEY
, member_age INT(11) NOT NULL
, member_role enum('user','admin','seller') NOT NULL
, member_sex varchar(255)
, member_phone varchar(255) NOT NULL
, member_photo varchar(255) 
);


CREATE TABLE ITEM(
item_id bigint primary key auto_increment
, item_name varchar(255) NOT NULL
, item_price INT(11) NOT NULL
, item_count INT(11) NOT NULL
, seller_id INT NOT NULL
, FOREIGN KEY(seller_id)
REFERENCES memeber(id));

CREATE TABLE ORDERS(
ORDER_ID varchar(255) PRIMARY KEY auto_increment
, USER_ID bigint NOT NULL
, ORDER_ADDRESS VARCHAR(255) NOT NULL
, ORDER_ITEM VARCHAR(255) NOT NULL
,  FOREIGN KEY(USER_ID)
REFERENCES memeber(id)
);

CREATE TABLE ORDER_detail(
ORDER_DETAIL_ID VARCHAR(255) PRIMARY KEY
, ORDER_ITEMCOUNT VARCHAR(255)
, ORDER_TIME VARCHAR(255) AUTO_INCREMENT
, ORDER_ITEMBRAND VARCHAR(255)
, ORDER_PAYMENT VARCHAR(255)
);

 






