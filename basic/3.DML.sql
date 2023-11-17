-- insert, select, update, delete 
INSERT
    테이블에 새로운 레코드를 추가
    INSERT INTO 테이블이름(name,emaill,password ..)VALUES
    EX) insert into author(id, name, email) values(1, 'kim','abc@naver.com');
    select* from author;  (*은 all의 의미)

    update  
        테이블 레코드의 내용을수정
        UPDATE 테이블이름 SET 필드이름1=데이터값1,필드이름2=데이터값2, ...WHERE필드이름 =데이터값
        만약 WHERE 절을 생략하면, 해당 테이블의 모든 레코드값이 위 설정대로 수정되므로 유의 
        예ㅔ
            update author set email='abc2@test.com'where id=1;

            여기서 =의 쓰임새는 2가지
            where문 뒤에 나오는 비교문은 java기준으로 ==로
            어떤 값을 set할때도 =을 사용하여 대입(java =과 동일)

DELETE
    DELETE FROM 테이블이름 WHERE 필드이름=데이터값
    WHERE 절을 생략하면, 해당 테이블에 저장된 모든 데이터가 삭제

    예시)DELETE FROM author WHERE author_id=5;

    DELETE FROM author WHERE author_id=4;

drop은 테이블 구조까지 전체 삭제
delete와 truncate의 차이
delete는 storage까지 삭제하지는 않아 복구가 가능
delete는 log를 남김
delete의 삭제속도는 truncate보다 느림

select  
    select 필드의 이름 from 테이블이름[where 조건]

    모든 필드 선택 

    select * from author;                (*=전체)

    select * from author where id=1;
    select name, email from author where id=1;
    select from author where id>1;
    select from author where id>AND name = 'kim'
    select * from author where id > 10;
    select * from author where id > 10 and name = 'abc';    

-- 이름 중복제거하고 조회
select distinct name from author;

-- 선택한 결과의 정렬
    -- order by
    select * from author order by name desc;
    -- order by 멀티 : 먼저쓴컬럼 우선정렬. asc/desc 생략시 asc적용
    select * from author order by name, email;
    -- limit 
    select * from author order by id desc limit 2;

    기본설정은 오름차순(ASC)이며 내림차순시 DESC
    여러 필드의 데이터를 쉼표(,)를 사용하여 여러기준으로 정렬할 수도있다.
    order by 생략시 pk를 기준으로 오름차순 정렬하여 결과값 반환
    SELECT * FROM author limit number : 반환할 행의 최대 수를 지정

    별칭(allias)를 이용한 처리
    테이블과 필드에 임시로 별칭을 부여하고 해당 별칭을 select 문에서 사용
    select 필드이름 as 별칭 from 테이블이름;
    select 필드이름 from 테이블이름 as 별칭
    
-- alias를 이용한 select문
select name as 이름 from author; (as는 생략이가능) ex) select name, email from author as a;

테이블의 타입 확인
DESCRIBE 테이블명;

숫자 타입
정수
    TINYINT
        -128~127범위, 1바이트 EX)AGE 
        -java byte와 매핑
    INT
        4바이트
        java int타입과 매핑
    BIGINT
        8바이트
        java의 long타입과 매핑
    UNSIGNED 타입을 사용하여 양수만 표현가능
        표현값 2배로 증가
        TINYINT UNSIGNED 이렇게 사용한다면 255까지 사용가능 EX(나이)
    실수 
        부동 소수점 타입
                FLOAT.DOUBLE
                오차가 발생할 여지가 있음
        
        고정 소수점 타입
            DECIMAL(M,D)                  (소수점쓸거면 DECIMAL을 쓰자)
                java의 Bigdecimal
                M은 총자릿수 (정수부+소수부)를 의미 하고, 65자리까지 표현가능
                D는 소수부 의미
                정확한 숫자 표현을 위해 사용

CHAR와 VARCHAR  
    CHAR(255) > 10바이트 > 255바이트 차지
        M은 문자열의 최대 길이를 의미
        고정 길이의 문자열(0~255까지 설정가능)
        정해진 자릿수 문자에 제한을 두기 위해서는 사용
    VARCHAR(255) > 10바이트 > 10바이트 차지
        java의 String사용시 VARCHAR  
        0부터 65.535까지 설정가능
        가변 길이의 문자열(M을 통해 길이지정)
        길이를 지정하더라도 실제 입력된 문자열의 길이만큼만 저장하고 사용
        일반적으로 가장 많이 사용
    TEXT
        가변 길이 문자열
        TEXT :65.535바이트 저장 가능한 일반적인 문자열을 위한 타입  (name Text)
        VARCHAR보다 더 큰 범위의 표현이 가능 ex) LONGTXT는 4GB
        disk에 저장해서 조회속도가 VARCHAR(메모리저장)에 비해 느림
        ★index 사용의 어려움(B-tree인덱싱 불가, Full-Text인덱스 가능 ) 
    blob)longblob
        다양한 크기의 바이너리 데이터를 저장할 수 있는 타입
        일반적으로 PNG와 같은 이미지파일을 저장할 때 지정하는 타입
        INSERT INTO table_blob (id, myimg) VALUE(1, LOAD_FILE('C:\\test_picture.jpg'));
        select HEX(MODIFY
        
        ENUM
            미리 들어갈수 있는 특정 데이터의 값을 지정
            컬럼명 ENUM('데이터값1','데이터값2')
            NOT NULL DEFAULT    'user'등의 옵션도 추가 기능

DATE
    날짜를 저장할 수 있는 타입  
    YYYY-MM-DD
DATETIME(m)
    날짜와 함께 시간까지 저장, m지정시 소수점 microseconds
    YYYY-MM-DD HH:MM:DD
    가장많이 사용
    java의 localdatetime 과 sync

DATETIME DEFAULT CURRENT_TIMESTAMP
    현재시간을 default로 삽입하는 형식

검색 패턴 
LIKE 
    특정 패턴을 포함하는 데이터만을 검색하기 위한 와일드카드(wildcard) 문자
    일반적으로 %와 함께 사용됨
    SELECT * FROM author WHERE name LIKE '홍%';
    SELECT * FROM author WHERE name LIKE '%동';
    SELECT * FROM author WHERE name LIKE '%길%';
NOT LIKE 

REGEXP
    정규표현식을 토대로 패턴 연산 수행
    SELECT * FROM author WHERE name REGEXP'[a-z]';
    SELECT * FROM author WHERE name REGEXP'[가-힣]';

NOT REGEXP

CAST
    CAST(a AS Type)
    a값을 type으로 변환
    보통 정수 값을 DATE 타입으로 변환하는데 사용
    SELECT CAST(20200101 AS DATE); =>2020-01-01

CONVERT
    문자열을 날짜/시간으로 변환하는 데 사용
    CONVERT('2020-01-01',DATE);=>2020-01-01

DATE_FORMAT
    DATE_FORMAT 함수는 날짜/시간 타입의 데이터를 지정된 형식의 문자열로 변환
    가장많이 사용
    DATE_FORMAT(DATE, FORMAT)
        Ex)SELECT DATE_FORMAT('2020-01-01 17:12:00', '%Y-%M-%d'); =>2020-01-01