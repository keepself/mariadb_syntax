★동시성이슈
commit 확정
rollback 
공유락 
베타락 성능이떨어짐
베타적락 - 데드락

INNER JOIN

SELECT * FROM talbeA INNER JOIN TABLeB ON tableA.ID=TABLEB.author_id
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