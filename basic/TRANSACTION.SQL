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


도부이결다조

원자값이 아닌 도메인 분해
부분적 함수 종속 제약조건제거
이행적 함수 종속 제약조건제거
결정자이면서 후보키가 아닌것 제약조건제거
다시 종속제거
조인 종속성 이용

함수적 종속성f(X)=y


--DB 서버구성
DB의 사용성에 문제가 생기지 않고록 하는 고가용성 확보를 위한 방안
클러스터링
    1대의 스토리지와 여러대의 서버운영
    active/active , active/stanby  
    VIP - virture IP

레플리카   
    n개의 (스토리지, 서버)를 운영 한쌍
샤딩 
    같은 테이블 스키마를 가진 데이터를 다수의 데이터베이스에 분산하여 저장하는 방법

HA -> proxy(대리인), 로드밸런서(라운드로빈)
nginx, reverse proxy용도로 많이 사용

haproxy는 mssql 멀티서버 구성에서 많이 사용하는 프로그램
    sudo apt-get insatll haproxy는

HA 구성 절차
    mariadb 서버 2대를 3306, 3307 포트로 실행
    사용자의 엔드포인트로 사용하고자 하는 가상의 IP를 지정
    각각 서버가 다른 IP에 존재할수 있으므로 단일 엔드포인트 필요    192.168.1.100라 가정
    haproxy config파일 생성
    ex) backend mysql_back
        balace roundrobin
        server mysql 192.168.1.101.3306

        thread-task의 단위
        process - 프로그램

--redis 
모든 key값 조회
keys*
키삭제
DEL key명
전체 key 삭제 flushdb


list
    redis 리스트는 간단한 메시징 큐로 사용될 수 있음
    데이트추가 LPUSH RPUSH
    데이터 추출 LPOP KEY , RPOP key
    데이터 개수 LLEN key
    member 조회 lrange key 명 
    TTL(TIME TO LIVE)
    만료시간 지정
    expire my_claases_name 30
    ttl[key]
        남은 만료시간 확인


SET관련
    고유한 사용자 ID 목록 , 이벤트에서 한 번만 참여할 수 있는 사용자 관리 등에 사용 가능
    set(집합)에 멤버 추가  
    SADD myset member
    set(집합)의 모든 멤버 반환
    SMEMBERS myset
    특정 멤버 삭제
    SREM myset member1 member2
    set의 멤버 개수 반환
    scard myset

zset(정렬된 집합)
    주식 코인등의 실시간 시세 또는 게임등의 사용자의 점수나 순위를 관리하는데 사용 
    기본문법
        ZADD key score member   
            score : 멤버를 정렬하는 데 사용되는 점수
            member형식을 json형식으로도 가능
                ex)zadd my_key 1 '{"hello":"world"}'
        ZREM key member
            특정키의 특정멤버 삭제
        ZRANK key member
            특정멤버의 위치 정보 반환
        ZRANGE stock_prices 0 -1
            score기준 오름차순 조회
        ZREVRANGE stock_prices 0 -1
            score기준 내림차순 조회 
        INCR keyname
        DECR keyname
        키조회
