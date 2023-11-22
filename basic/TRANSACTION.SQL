★동시성이슈
commit 확정
rollback 
공유락 
베타락 성능이떨어짐
베타적락 - 데드락

INNER JOIN

SELECT * FROM tableA INNER JOIN tableB ON tableA.ID=TABLEB.author_id
SELECT * FROM talbeA AS a INNER JOIN tableb AS b on a.ID= b a_id;

count(*) 총갯수

소수점 round(대상값, 원하는소숫점자릿수)

SELECT AVG(PRICE) FROM POST;

GROUP by

select author_id, sum(price) from post group by author_id ; 

select author_id, avg(price) from post where price > 100 group by author_id;

select author_id, avg(price) from post group by having avg(price) >=100

-- 입양시각구하기

select date_format(datetime, '%H') as hour, count(*) as count from ANIMAL_OUTS AO WHERE 
date_format(DATETIME, '%H:%I')BETWEEN '09:00' AND '19:00'
group by hour order by hour;                

제기문
WITH RECURSIVE number_sequence(HOUR) AS (
        SELECT 0
        UNION ALL   
        SELECT HOUR + 1 FROM number_sequence WHERE HOUR < 23)
        SELECT HOUR, 0 as COUNT from number_sequence


INDEX
조회속도는 증가 하지만 삽입 수정이 좋지않다.

종류가 다양할수록 CARDINALITY가 높은거임

CARDINALITY가 높은곳에 INDEX를 걸어야한다.

조회 select * from author where name ='인덱스명'

-- 사용자관리
특정사용자에게 특정권한만 줄수 잇다
게정생성
마케팅팀에게 select 권한 준다고 

-- view는 가상의 테이블                       
뷰(view)는 데이터베이스의 테이블과 유사한 구조를 가지지만, 가상의 테이블로서 실제 데이터를 저 장하지  않는 데이터베이스, 실제 제이터베이스를 참조만

기본문법
    CREATE VIEW 뷰네임 AS
    SELECT 컬럼1, 컬럼2..
    FROM 테이블명

    GRANT SELECT ON[데이터베이스 이름].[뷰이름]TO 

-- 유저생성

CREATE USER 'testuser'@'localhost' IDENTIFIED BY ‘testpw’;
CREATE USER 'testuser'@'%' IDENTIFIED BY ‘testpw’;
REVOKE FROM권한 제거
-- 지우기
DROP USER 'testuser'@'localhost';;R

--데이타베이스에 절차저장 쿼리를 저장한다.

GRANT EXECUTE ON PROCEDURE 데이터베이스명.프로시저명 TO 'testuser'@'localhost'

프로시저 기본문법
    프로시저 생성
        DELIMITER $$
        CREATE PROCEDURE procedure_name (parameters)
        BEGIN
            --SQL문법
        END $$  
        DELIMITER $$;
    프로시저 호출시
        CALL 포로시저명();

    파라미터는 생략가능하고 , 함수와 같이 parameter를 전달하여 실행하는 것도 가능 
    기본 형식은(IN 변수명 변수타입) 

    저장 프로스저

    변수선언
        DECLARE 변수명 변수타입[DEFAULT default_value];
        반드시 프로시저나 함수의 본문 시작 부분,즉 BEGIN 바로 뒤에 위치
    변수 수정
        SET 변수명 = 수정할값;
    제어문
        IF문
            IF 조건식 THEN  
                -- 조건이 참일 때 실행할 명령
            ELSE
                -- 조건이 거짓일 때 실행할 명령
                END IF;
        
        "select 컬럼명 into 변수" 문과 함께 많이 사용

    while문
        WHILE 조건식 DO
        --조건이 참일 동안 반복 실행할 명령
        END  WHILE;          


데이터베이스 dump
mysqldump -u root -p --default-character-set=utf8mb4 board > dumpfile.sql
