--insert, select, update, delete
insert into author (id, name, email , password) values(1, 'kim', 'abc@naver.com', 'abc')
insert into author (id, name, email , password) values(2, 'kim', 'abc@naver.com', 'abc')
insert into author (id, name, email , password) values(3, 'kim', 'abc@naver.com', 'abc')
insert into author (id, name, email , password) values(4, 'kim', 'abc@naver.com', 'abc')
insert into author (id, name, email , password) values(5, 'kim', 'abc@naver.com', 'abc')



insert into post(id, title, contents, author_id) values(1, 'hello1', shoe, 1 )
insert into post(id, title, contents, author_id) values(1, 'hello1', shoe  2 )
insert into post(id, title, contents, author_id) values(1, 'hello1', shoe  3 )
insert into post(id, title, contents, author_id) values(1, 'hello1', shoe  4 )
insert into post(id, title, contents, author_id) values(1, 'hello1', shoe  5 )


-- author 데이터 중 id가 4인 데이터를 email을 abc@naver.com, name을 abc로 변경
update author set email='abc@naver.com', name='abc'where id=4;
-- post 

-- post에 글쓴적이 있는 author r데이터 1개 삭제 > 에러 > 조치후 삭제
delete from post where author_id = 2;
delete from author where id = 2;
-- 방법2.
update post set author_id = null where author_id =2;
delete from author where id = 2;