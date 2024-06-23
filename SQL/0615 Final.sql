-- 서버프로그램설계 0615 기말고사
drop table custom_01;

create table test_custom(
    		p_id varchar2(10) NOT NULL,
    		p_pw varchar2(10),
    		c_name varchar2(20),
    		c_email varchar2(20),
    		c_tel varchar2(14),
    		constraint p_id primary key (p_id)
    	);
        
desc test_custom;

insert into test_custom values('aaa','1234','김회원','aaa@korea.com','010-1111-1111');
insert into test_custom values('bbb','1234','이회원','bbb@korea.com','010-1111-1112');
insert into test_custom values('ddd','1234','오회원','ddd@korea.com','010-1111-1114');
insert into test_custom values('eee','1234','최회원','eee@korea.com','010-1111-1115');
insert into test_custom values('fff','1234','조회원','fff@korea.com','010-1111-1116');

TRUNCATE TABLE test_custom; -- 테이블 안의 모든 데이터 삭제

-- 문제 4개
SELECT c_email, c_tel FROM test_custom WHERE c_name='김회원';
SELECT c_name, c_tel FROM test_custom;
SELECT count(p_id) FROM test_custom;
SELECT * FROM test_custom WHERE c_name LIKE '최%';

select count(*) from test_custom;

select * from test_custom;
TRUNCATE TABLE test_custom;
