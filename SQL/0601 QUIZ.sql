-- 서버프로그램설계 0601 퀴즈
-- sql의 데이터를 eclipse에서 사용해 웹에 띄우기 위해서는
-- dbUrl을 사용한다~
-- JDBC: Java Database Connectivity, 자바언어와 DB를 연결해주는 통로와 같은 것.

-- 등록화면에서 데이터를 직접 등록,
-- jdbc를 활용해 데이터를 연결하도록 한다

create table custom_01(
    p_id varchar2(10) NOT NULL,
    p_pw varchar2(10),
    c_name varchar2(20),
    c_email varchar2(20),
    c_tel varchar2(14),
    constraint p_id primary key (p_id)
    );
    
desc custom_01;

insert into custom_01 values('aaa','1234','김회원','aaa@korea.com','010-1111-1111');
insert into custom_01 values('bbb','1234','이회원','bbb@korea.com','010-1111-1112');
insert into custom_01 values('ccc','1234','박회원','ccc@korea.com','010-1111-1113');
insert into custom_01 values('ddd','1234','오회원','ddd@korea.com','010-1111-1114');
insert into custom_01 values('eee','1234','최회원','eee@korea.com','010-1111-1115');
insert into custom_01 values('fff','1234','조회원','fff@korea.com','010-1111-1116');

select * from custom_01;

TRUNCATE TABLE custom_01; -- 테이블 안의 모든 데이터 삭제

desc custom_01;
select * from custom_01; -- INSERT한 데이터가 사라진 것을 알 수 있다
