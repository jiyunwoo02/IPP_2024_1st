-- 산학설계 데이터베이스 구상
-- 나의 상황, 회사에서 업무에 필요한 상황(컨택스트)를 입력하면 관련된 상품을 추천

-- 테이블 존재하면 삭제
DROP table MS_TBL;
DROP table CUST_tbl;

-- 테이블1 생성: 메시지 발송 테이블 -> 먼가 구매완료 메시지나,, 추천상품 어떠냐 메시지,, 같은거?
create table MS_TBL(
    mno number(8) NOT NULL, -- 메시지 발송 번호
    id varchar2(10), -- 고객id
    mdate date, -- 발송일자
    mcontent varchar2(20), -- 메시지 내용
    mdept char(2), -- 발송부서
    mgrade char(5), -- 고객 등급 (올리브영-베이비/핑크/그린 등등)
    constraint mno primary key (mno), -- 발송번호 PK
    constraint id foreign key (id) references CUST_TBL(id)
    );
    
-- 테이블1
desc MS_TBL;

-- 테이블2 생성: 고객 테이블
create table CUST_tbl(
    id varchar2(10) NOT NULL, -- 고객아이디
    custname varchar2(20), -- 이름
    product char(10), -- 관심상품 <- 회사 대/중/소분류나 주요 업무? 자기 분야? 로도 가능할듯
    phnum varchar2(13), -- 전화번호
    emailad varchar2(20), -- 이메일주소
    karea varchar2(20), -- 지역
    constraint id primary key (id) -- 고객 아이디 PK - 중복X
    );

-- 테이블2
desc bookinfo_tbl;

-- 테이블1에 값 넣기
insert into MS_TBL values(1, 'aaa', to_date('20171201', 'YYYYMMDD'), '안녕하세요?', '10', 'A');
insert into MS_TBL values(2, 'bbb', to_date('20171201', 'YYYYMMDD'), '안녕하세요?', '10', 'B');
insert into MS_TBL values(3, 'ccc', to_date('20171201', 'YYYYMMDD'), '안녕하세요?', '10', 'C');
insert into MS_TBL values(4, 'ddd', to_date('20171224', 'YYYYMMDD'), '안녕하세요?', '20', 'V');
insert into MS_TBL values(5, 'eee', to_date('20171224', 'YYYYMMDD'), '안녕하세요?', '20', 'VV');
insert into MS_TBL values(6, 'fff', to_date('20171224', 'YYYYMMDD'), '안녕하세요?', '30', 'D');

-- 테이블1 값
select * from MS_TBL;

-- 테이블2에 값 넣기
insert into CUST_tbl values('aaa', '홍길동', '의류', '010-1111-1111', 'aaa@korea.com', '서울');
insert into CUST_tbl values('bbb', '고길동', '필기구', '010-1111-1112', 'bbb@korea.com', '용인');
insert into CUST_tbl values('ccc', '이수지', '청소도구', '010-1111-1113', 'ccc@korea.com', '부산');
insert into CUST_tbl values('ddd', '이지우', '간식', '010-1111-1114', 'ddd@korea.com', '대전');
insert into CUST_tbl values('eee', '박원빈', '컴퓨터', '010-1111-1115', 'eee@korea.com', '경주');
insert into CUST_tbl values('fff', '김석진', '관광', '010-1111-1116', 'fff@korea.com', '울산');

-- 테이블2 값
select * from CUST_tbl;




    