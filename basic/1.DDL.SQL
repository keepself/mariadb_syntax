-- 데이터베이스 생성 
CREATE DATABASE board;
-- 데이터베이스 선택
USE board
-- author 테이블 신규 생성
CREATE TABLE author(id INT, name VARCHAR(255)
    email VARCHAR(255), password VARCHAR(255), test1 VARCHAR(255), PRIMARY KEY (id));
-- 테이블 목록조회
SHOW TABLES;
-- 테이블 컬럼조회 
DESCRIBE author;
-- post 테이블 신규 생성
CREATE TABLE posts(id INT PRIMARY KEY, title VARCHAR(255), content VARCHAR(255), author_id INT, FOREIGN KEY(author_id) REFERENCES author(id))

-- 테이블 생성문 조회

SHOW CREATE TABLE posts;
    o   

--  테이블 제약조건 조회
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'posts';

-- 테이블 index 조회
SHOW INDEX FROM posts;

테이블 생성 
CREATE TABLE 테이블이름

필드이름1 필드타입1[제약조건]
필드이름2 필드타입2[제약조건]
...
[테이블제약조건]

필드에 제약조건     
해당필드에 적용할 제약조건을 선택적으로 지정가능

테이블정보 변경
테이블이름 변경
ALTER TABLE 테이블명 RENAME 새로운테이블명;
ALTER TABLE posts RENAME post
컬럼 추가(add)
ALTER TABLE 테이블명 ADD COLUMN 컬럼명 자료명
ALTER TABLE author ADD COLUMN ROLE VARCHAR(100) NOT NULL;

필드 타입 변경(Modify)                                        < 타입변경은 기존데이터를 갈아야되서 어렵다 !>
ALTER TABLE 테이블명 MODIFY COLUMN 컬럼명 타입 [제약조건];
ALTER TABLE author MODIFY COLUMN name VARCHAR(100)NOT NULL;
        
컬럼 이름 변경 > content>contents
ALTER TABLE 테이블명 CHANGE COLUMN 기존컬럼명 새로운컬럼명 타입[제약조건];   VARCHAR(--)

컬럼 삭제 > test1컬럼삭제
ALTER T ABLE 테이블명 DROP COLUMN 컬럼명; 

테이블 삭제 
DROP TABLE

테이블 데이터만을 지우고 싶을 때
DELETE FROM 테이블이름
TRUNCATE TABLE 테이블이름

IF EXISTS
특정 객체 "(예: 데이터베이스나 테이블) 존재하는 경우에만 명령어를 실행
DROP DATABASE 또는 TABLE IF EXISTS abc;'

=
    select * from abc where name = 'honggildong';

!= <>
    select * from abc where name !='honggildong';
<, <=, >, >=
IS NULL, IS NOT NULL
BETWEEN min ADN max
    피연산자의 값이 min 값보다 크거나 max 작으면 참을 반환함.(이상,이하)

IN(), NOT IN ()
프로그래머스 SQL 문제풀이 (비교연산자(IS NULL) - 나이정보가 없는 회원 수 구하기)

AND
    &&도가능        
OR 
    ||
NOT 
    !