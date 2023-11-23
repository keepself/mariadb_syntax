
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