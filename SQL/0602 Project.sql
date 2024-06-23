-- 데이터베이스 보기
show databases;

DROP DATABASE IF EXISTS market_kw; -- 만약 market_kw가 존재하면 우선 삭제한다!
CREATE DATABASE market_kw; -- 데이터베이스 생성
USE market_kw; -- 해당 데이터베이스를 사용하겠다!

-- 해당 테이블이 이미 존재하면 삭제하겠다!
drop table if exists user;
drop table if exists goods;
drop table if exists orders;
drop table if exists situation;
drop table if exists detail;

-- 1) 회원 테이블 생성
-- 기본키 지정을 안했으면 not null 유니크가 기본키가 된다!
CREATE TABLE user
(	
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    login_id VARCHAR(50) NOT NULL UNIQUE,
    username VARCHAR(20) NOT NULL,
    userpwd VARCHAR(128) NOT NULL
);
desc user;
insert into user(user_id,login_id,username,userpwd) values (1,'hgd12','홍길동','1234');
select * from user;

-- 2) 상품 테이블
CREATE TABLE goods
(
	goods_id INT AUTO_INCREMENT PRIMARY KEY,
    goodsName VARCHAR(30) NOT NULL,
    category VARCHAR(30) NOT NULL,
    brand VARCHAR(30) NOT NULL,
    goodsDesc VARCHAR(150) NULL,
    goodsImg TEXT NULL,
    price INT NOT NULL,
    discountPrice INT NULL
);
desc goods;
insert into goods(goods_id,goodsName,category,brand,goodsDesc,goodsImg,price,discountPrice) 
	values (1,'꿈나무연필12자루','필기구','꿈나무','연필 12자루가 들어있는 패키지',
			'https://i.namu.wiki/i/BplQJDHnRNwuNhgAmXSlolLa5p2rSaj6zDPipUSRhF7DM4Y8ul0LJZUWBV8ujil8pYlW3O0DUsBLDmzU6ulyLA.webp', 
			2000, 1800);
select * from goods;

-- 3) 주문 테이블
CREATE TABLE orders
(
	order_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    item_id INT NOT NULL,
    itemCnt INT NOT NULL,
    itemPrice INT NOT NULL,
    totalPrice INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);
desc orders;
insert into orders(order_id,user_id,item_id,itemCnt,itemPrice,totalPrice)
	values (11,1,3,2,4000,8000);
select * from orders;

-- 4) 상황 테이블
CREATE TABLE situation
(
	situation_id INT AUTO_INCREMENT PRIMARY KEY,
    situationCategory VARCHAR(50) NOT NULL,
    situation VARCHAR(30) NOT NULL,
    keyword VARCHAR(30) NOT NULL,
    headline VARCHAR(50) NOT NULL UNIQUE
);
desc situation;
insert into situation(situation_id,situationCategory,situation,keyword,headline)
	values (1,'직장인의 모든 것','출근길','출근준비','활기찬 하루의 시작');
select * from situation;

-- 5) 세부 항목 테이블
CREATE TABLE detail
(
	situation_id INT NOT NULL,
    detail_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    detail VARCHAR(150) NOT NULL,
    FOREIGN KEY (situation_id) REFERENCES situation(situation_id)
);
desc detail;
insert into detail(situation_id,detail_id,detail)
	values (1,1,'커피믹스');
select * from detail;

-- 데이터베이스 내 테이블 조회
show tables;