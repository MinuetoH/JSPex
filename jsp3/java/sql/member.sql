-- member.sql : 회원정보 테이블
create table member (
	id varchar(20) primary key,
	pass varchar(20),
	name varchar(20),
	gender number(1),
	tel varchar(20),
	email varchar2(100),
	picture varchar2(200)
)

select * from member

delete from member where id=''

