DROP table DM_TBL;
DROP table bookinfo_tbl;
DROP table CUSTINFO_TBL;

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
    
-- 1. DM발송목록 테이블을 생성하시오.    
desc DM_TBL;

create table CUSTINFO_TBL(
    custid varchar2(10) NOT NULL,
    author varchar2(20),
    goods char(10),
    phone varchar2(13),
    email varchar2(20),
    area varchar2(20),
    constraint custid primary key (custid)
    );

-- 2. 고객정보 테이블을 생성하시오.
desc CUSTINFO_TBL;

-- 3. 샘플데이터 참조해 데이터 생성하시오.

insert into DM_TBL values(1, 'aaa', to_date('20171201', 'YYYYMMDD'), '안녕하세요?', '10', '1', 'C1');
insert into DM_TBL values(2, 'bbb', to_date('20171201', 'YYYYMMDD'), '안녕하세요?', '10', '2', 'C1');
insert into DM_TBL values(3, 'ccc', to_date('20171201', 'YYYYMMDD'), '안녕하세요?', '10', '3', 'C1');
insert into DM_TBL values(4, 'ddd', to_date('20171224', 'YYYYMMDD'), '안녕하세요?', '20', 'V', 'C2');
insert into DM_TBL values(5, 'eee', to_date('20171224', 'YYYYMMDD'), '안녕하세요?', '20', 'VV', 'C2');
insert into DM_TBL values(6, 'fff', to_date('20171224', 'YYYYMMDD'), '안녕하세요?', '30', '1', 'C3');

select * from DM_TBL;

insert into CUSTINFO_TBL values('aaa', '김고객', '의류', '010-1111-1111', 'aaa@korea.com', '서울');
insert into CUSTINFO_TBL values('bbb', '이고객', '의류', '010-1111-1112', 'bbb@korea.com', '서울');
insert into CUSTINFO_TBL values('ccc', '박고객', '식료품', '010-1111-1113', 'ccc@korea.com', '경기');
insert into CUSTINFO_TBL values('ddd', '홍고객', '공산품', '010-1111-1114', 'ddd@korea.com', '대전');
insert into CUSTINFO_TBL values('eee', '조고객', '컴퓨터', '010-1111-1115', 'eee@korea.com', '대전');
insert into CUSTINFO_TBL values('fff', '백고객', '관광', '010-1111-1116', 'fff@korea.com', '울산');

select * from CUSTINFO_TBL;

-- 4. 고객발송내역 조회문

SELECT 
    DM_TBL.dmno as 발송번호,
    CUSTINFO_TBL.custid as 고객ID,
    CUSTINFO_TBL.author as 고객명,
    DM_TBL.maildate as 발송일,
    DM_TBL.contents as 내용,
    DM_TBL.campain as 캡페인구분
FROM 
    CUSTINFO_TBL
INNER JOIN 
    DM_TBL
ON 
    CUSTINFO_TBL.custid = DM_TBL.custid;
    
-- 5. 고객정보저장
insert into CUSTINFO_TBL 
values (custid, author, goods, phone, email, area);

-- 6. 지역별 DM 발송 건수 통계
SELECT 
    c.area AS 지역,
    COUNT(d.dmno) AS 발송건수
FROM 
    CUSTINFO_TBL c
INNER JOIN 
    DM_TBL d 
    ON c.custid = d.custid
GROUP BY 
    c.area
ORDER BY 
    발송건수 DESC;