# database management system
mysql mariaDB postgres (관계형 데이터베이스) MongoDB,Redit >> nosql
mariaDB는 fork(복사본) MySQL의 포크로 2009년에 시작 MYSQL이랑 대부분이 호환가능하다.

서비스단위 스키마 EX) 계시판 주문시스템 
colum=열=속성
DBMS에서 사용하는 프로그래밍 언어 > SQL
언어의 큰틀은 CRUD로 정리가능함
CREAT READ UPDATE DELETE
SQL 구문도 위의 목적에 맞게 크게 세가지로구분
DDL DATE DEFINITION LANGUAGE
    데이터베이스나 티블 등을 생성 삭제하거나 그 구조를 변경 
    CREATE ALTER DROP
DML
    Data Manipulation Language
    디에터베이스에 저장된 데이터를 처리하거나 조회
    INSERT,UPDATE,DELETE,SELECT 등
DCL
    Data control Language
    사용자 권한 부여 등
    GRANT, REVOKE 등

열(Column)
    
    열은 필드 또는 속성 이라고 정의할수도 있음
    다마느 구체적으로는 속성은 컬럼의 성격 그 자체를 의미
    필드는 컬럼의 구체적인 데이터 하나하나의 개별 데이터 항목을 의미

행(row)

    튜플(tuple) 또는 레코드

값(vlaue)

    데이터라고도 칭함

키(key)

    행의 식별자로 이용되는 열

drop database board;
show 

