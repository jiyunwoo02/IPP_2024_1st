-- �������α׷����� SQL�ǽ�

select * from BOOKINFO_TBL;

select GOODS from BOOKINFO_TBL where SUTHOR='�ڰ�'; --1

select SUTHOR, GOODS from BOOKINFO_TBL; --2

select SUTHOR, PHONE from BOOKINFO_TBL; --3

select GOODS from BOOKINFO_TBL; --4

select distinct GOODS from BOOKINFO_TBL; --5

select * from DM_TBL;

select CONTENTS from DM_TBL where DEPT=20; --6

select * from BOOKINFO_TBL where GOODS like '%ǰ%'; --7

select * from BOOKINFO_TBL where area='����' and goods='��ǻ��'; -- 8

select GOODS from BOOKINFO_TBL order by GOODS asc; -- 9

select COUNT(SUTHOR) from BOOKINFO_TBL; -- 10

