DROP table DM_TBL;
DROP table bookinfo_tbl;

create table DM_TBL(
    dmno number(8) NOT NULL,
    custid varchar2(10),
    maildate date,
    contents varchar2(20),
    dept char(2),
    grade char(5),
    campain char(2),
    constraint dmno primary key (dmno)
    );
    
desc DM_TBL;

create table bookinfo_tbl(
    custid varchar2(10) NOT NULL,
    author varchar2(20),
    goods char(10),
    phone varchar2(13),
    email varchar2(20),
    area varchar2(20),
    constraint custid primary key (custid)
    );

desc bookinfo_tbl;

insert into DM_TBL values(1, 'aaa', to_date('20171201', 'YYYYMMDD'), '안녕하세요?', '10', '1', 'C1');
insert into DM_TBL values(2, 'bbb', to_date('20171201', 'YYYYMMDD'), '안녕하세요?', '10', '2', 'C1');
insert into DM_TBL values(3, 'ccc', to_date('20171201', 'YYYYMMDD'), '안녕하세요?', '10', '3', 'C1');
insert into DM_TBL values(4, 'ddd', to_date('20171224', 'YYYYMMDD'), '안녕하세요?', '20', 'V', 'C2');
insert into DM_TBL values(5, 'eee', to_date('20171224', 'YYYYMMDD'), '안녕하세요?', '20', 'VV', 'C2');
insert into DM_TBL values(6, 'fff', to_date('20171224', 'YYYYMMDD'), '안녕하세요?', '30', '1', 'C3');

select * from DM_TBL;

insert into bookinfo_tbl values('aaa', '김고객', '의류', '010-1111-1111', 'aaa@korea.com', '서울');
insert into bookinfo_tbl values('bbb', '이고객', '의류', '010-1111-1112', 'bbb@korea.com', '서울');
insert into bookinfo_tbl values('ccc', '박고객', '식료품', '010-1111-1113', 'ccc@korea.com', '경기');
insert into bookinfo_tbl values('ddd', '홍고객', '공산품', '010-1111-1114', 'ddd@korea.com', '대전');
insert into bookinfo_tbl values('eee', '조고객', '컴퓨터', '010-1111-1115', 'eee@korea.com', '대전');
insert into bookinfo_tbl values('fff', '백고객', '관광', '010-1111-1116', 'fff@korea.com', '울산');

select * from bookinfo_tbl;

-- 0518 서버프로그램설계 실습
-- 1. ‘박고객’의 관심상품을 찾으시오.
select goods from bookinfo_tbl where author='박고객';

-- 2. 모든 고객의 이름과 관심상품을 검색하시오. 
select author, goods from bookinfo_tbl;

-- 3. 모든 고객의 이름과 전화번호를 검색하시오.(출력은 아래와 같이, AS)
select author as 성명, phone as 전화번호 from bookinfo_tbl;

-- 4. 고객정보 테이블에서 모든 관심상품을 검색하시오.
select goods from bookinfo_tbl;
    
-- 5. 고객정보 테이블에서 모든 관심상품을 검색하시오.(중복 제거 SELECT DISTINCT)
select distinct goods from bookinfo_tbl;

-- 6. DM 발송테이블에서 발송부서 ‘20’이 발송한 내용을 검색하시오. 
select contents from DM_TBL where dept=20;

-- 7. 관심상품에서 ‘품’이 포함된 고객을 검색하시오. 
select author from bookinfo_tbl where goods like '%품%';

-- 8. 관심상품에서 대전지역의 컴퓨터에 관심있는 고객을 검색하시오.
select author from bookinfo_tbl where area='대전' and goods='컴퓨터';

-- 9. 고객의 관심상품을 가나다 순으로 정렬하여 검색하시오.(ORDER BY)
select goods from bookinfo_tbl order by goods asc;

-- 10. 고객의 수를 구하시오.(COUNT)
select count(author) from bookinfo_tbl;

-- 11. 고객이름과 고객등급을 출력하시오. 
select author as 성명, grade as 고객등급
    from DM_TBL
    inner join bookinfo_tbl
    on DM_TBL.custid = bookinfo_tbl.custid;