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

DATE_FORMAT    프로그래머스 : 조건에맞는 도서
    DATE_FORMAT 함수는 날짜/시간 타입의 데이터를 지정된 형식의 문자열로 변환
    가장많이 사용
    DATE_FORMAT(DATE, FORMAT)
        Ex)SELECT DATE_FORMAT('2020-01-01 17:12:00', '%Y-%M-%d'); =>2020-01-01          
        
CAST , CONVERT 사용시 유의사항

최신버전 
    CAST('123' as INT) 방식으로 int 사용가능
    CAST('123' as signed)방식으로 signed(또는 unsigned) 사영가능
구버전
    CAST('123' as signed)방식으로 signed(또는 unsigned)만 사용가능

여기서 signed는 부호있는 정수 즉 음수 양수 모두포함
    ungsigned는 부호 없는 정수로서 0이상 양수를 의미

날짜 데이터 조회하는 방식 중 많이 사용 하는 방식
DATE_FORMAT(date, format)을 활용한 조회
Y,mm, dd, H,i,s
LIKE 를 사용하여 문자열 형식으로 조회
SELECT * FROM post where created_time like '2023%';
BETWEEN 연산자
특정 날짜 범위를 지정하여 데이터를 검색
WHERE created_time BETWEEN '2021-01-01' AND '2023-11-17'
날짜 비교 연산자
WHERE created_time >= '2021-01-01' AND created_time<= '2023-11-17'

오늘날짜 관련 함수
now() ex) select now();

제약조건(CONSTRANINT)
    데이터를 입력받을 때 실행되는 검사 귳칙 
    CREATE 문으로 테이블을 생성 또는 ALTER 문으로 필드를 추가할 때 설정
    종류
        NOT NULL    
        PRIMARY KEY> NOT NULL, UNIQUE

제약조건 - NOT NULL
    default값은 nullable

    not null제약 조건이 설정된 필드느느 무조건 데이터를 가지고 있어야 한다
    
    문법 예제 
        CREATE TABLE author 
        (id INT NOT NULL,name VARCHAR(30),..)
    ALTER문을 써서 post의 title을 not null 조건으로 바꿔보자
            이미 NULL인 데이터 삭제
    
    AUTO_INCREMENT 키워드와 함께
        새로운 레코드가 추가될 때마다 1씩 증가된 값을 저장
        author, post 테이블의 id에 auto_increment로 바꿔보자
        ALTER TABLE author modify 컬럼 컬럼이름 type 제약조건 AUTO_INCREMENT


제약조건 - UNIQUE

    UNIQUE 제약 조건을 설정하면, 해당 필드는 값이 UNIQUE해야함을 의미

    방법 1
        create TABLE 테이블이름
        (필드명 필드타입 UNIQUE)

    방법2 
        CREATE TABLE 이름
        (필드이름 필드타입,....[CONSTRANINT 제약조건이름] UNIQUE(필드이름));
        UNIQUE 제약 조건을 별도로 정의하며, 선택적으로 제약 조건에 이름을 부여하는  방법

    UNIQUE 제약 조건을 설정하면, 해당 필드는 자동으로 인덱스(INDEX)로 설정
        show index from 테이블명;
        index삭제 : ALTER TABLE 테이블이름 DROP INDEX 인덱스명.

        UNIQUE ALTER문
        방법
            ALTER TABLE 테이블이름 modify COLUMN 필드이름 필드타입 UNIQUE
        방법 2
            ALTER TABLE 테이블이름 ADD CONSTRAINT 제약조건이름 UNIQUE(필드이름)  ALTER TABLE author ADD CONSTRAINT FAKER UNIQUE(title)
제약조건 제거
        ALTER TABLE 테이블명 DROP CONSTRAINT email;
        ALTER TABLE 테이블명 DROP FOREIGN KEY 제약조건이름
    
        author 테이블 email에 unique 제약 조건 추가될
        컬럼 제약조건으로 추가
        제약조건 제거 및 index 제거
        테이블 제약조건 추가형식으로 추가

        제약조건제거
        ALTER TABLE 테이블명 DROP CONSTRAINT email;
        ALTER TABLE 테이블명 DROP FOREIGN KEY 제약조건이름

        제약조건 SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME = 'author';
        제약조건을 걸면 index가 자동생성된다 제약조건삭제시 index 삭제 = index삭제시 제약조건삭제


        PRIMARY KEY 제약 조건을 가진 컬럼을 기본키(pk)라 함
            NOT NULL과 UNIQUE 제약 조건의 특징을 모두 가진다

        PRIMARY KEY 테이블당 오직 하나의 필드에만 설정
            UNIQUE는 한 테이블의 여러 필드에 설정가능
            NOT NULL도 물론 여러 필드에 설정 가능

        없던 PK를 설정하기 위한 ALTER문 예제
        방법 1
            ALTER TABLE 테이블이름 
            MODIFY COLUMN 필드이름 필드타입 PRIMARY KEY
        방법 2(별도의 제약조건이름 옵션)
        ALTER TABLE 테이블이름  
        ADD CONSTRAINT 제약조건이름 PRIMARY KEY (필드이름)

        제약조건 - FOREIGN KEY  
        외래 키라고 부르며, 한 테이블을 다른 테이블과 연결해주는 역할
            기준이 되는 다른 테이블의 내용을 참조해서 레코드가 입력
            하나의 테이블을 다른 테이블에 의존하게 만드는 것
            다른 테이블의 필드는 반드시 UNIQUE나 PRIMARY KEY 제약 조건이어야  함

        문법 
            CREATE TABLE 테이블이름
            (필드이름 필드타입,....,[CONSTRAINT 제약조건이름]FOREIGN KEY(필드이름)REFERENCES 테이블이름(필드이름)[ON DELETE/UPDATE CASCADE])

            
        참조되는 테이블에서 데이터의 수정이나 삭제가 발생시 영향
            ON DELETE   
            ON UPDATE  
            기본값은 delete, update 모두 restrict옵션이 걸려 있으므로, 변경하고 싶다면 각각 지정필요

        위 설정시 동작옵션
            CASCADE
                참조되는 테이블에서 데이터를 삭제/수정하면 같이 삭제/수정
            SET NULL
                참조되는 테이블에서 데이터를 삭제/수정하면 데이터는 NULL로 변경
            RESTRICT 
                fk로 잡은 테이블의 데이터가 남아 잇으면 fk대상 데이터 수정/삭제 불가
                동작옵션을 주지 않으면 기본은 RESTRICT