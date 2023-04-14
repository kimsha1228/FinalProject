-- DDL DML TCL

--DDL 롤백이 불가능하다, DDL 실행시점에 커밋되지않은 내용들은 전부 자동으로 커밋된다
--CREATE , DROP, ALTER , TRUNCATE

CREATE TABLE sample1(
    num number primary key,
    fname varchar2(20),
    lname varchar2(20) not null,
    tel varchar2(20) not null,
    addr varchar2(100),
    regdate date default sysdate
);

CREATE SEQUENCE sample1_seq; --자동번호 부여용 시퀀스 생성!

--테이블 복사
CREATE TABLE emp as select * from employees; --구조와 데이터까지 복사
CREATE TABLE emp as select * from employees where 1=2; --구조만 복사

drop table emp;

--테이블 구조를 변경할떄
CREATE table sample2 (num number);

ALTER table sample2 add (fname varchar2(20));
ALTER table sample2 add (lname varchar2(20));
ALTER table sample2 add (tel varchar2(20));
ALTER table sample2 add (addr varchar2(100));
ALTER table sample2 add (memo varchar2(100));

 --default sysdate는 데이터를 널로 놔두면 자동으로 시스템날짜로 채워진다
ALTER TABLE sample2 modify(memo date default sysdate);

INSERT INTO sample2(num,fname,lname,tel,addr) values(SAMPLE1_SEQ.nextval,'gildong','Hong','020','Seoul');

--PK 추가
ALTER TABLE sample2 modify(num number primary key);

--열 명칭을 변경하고 싶을때
alter table sample2 rename column memo to regdate;

--열을 삭제하고 싶을때
alter table sample2 drop column addr;

ALTER table sample2 add (add1 varchar2(100));
ALTER table sample2 add (add2 varchar2(100));
ALTER table sample2 add (add3 varchar2(100));

--사용하지 않는 컬럼 삭제
ALTER table sample2 SET UNUSED COLUMN add1;
ALTER table sample2 SET UNUSED (add2,add3);
ALTER table sample2 DROP UNUSED COLUMNS;

------------------------------------------------------------------------------------
--제약조건을 추가

CREATE TABLE sample3(
num number,
join_id varchar(20)
); --PK 추가하는걸 깜빡했다


--그래서 NUM에다가 PK를 부여하는 ddl문 작성
alter table sample3 add CONSTRAINT sample3_PK PRIMARY KEY(num);
alter table sample3 drop CONSTRAINT sample3_PK;


CREATE TABLE sample4(
join_id varchar(20) primary key
); --FK 연동용 

--sample3 테이블의 join_id가 이제 sample4의 join_id를 참조하게 된다
--즉 sample4에 있는 join_id만 추가될수 있다
alter table sample3 add CONSTRAINT sample_fk3_join_id
FOREIGN key (join_id) REFERENCES sample4(join_id);ㅈ



--ORA-02291: integrity constraint (HR.SAMPLE_FK3_JOIN_ID) violated - parent key not found
insert into sample3(num,join_id) values(1,'j001');

--sample4에 join_id 값을 먼저 추가해놔야
insert into sample4(join_id) values('j001');
insert into sample3(num,join_id) values(1,'j001'); --추가가 된다

--삭제오류
--ORA-02292: integrity constraint (HR.SAMPLE_FK3_JOIN_ID) violated - child record found
delete from sample4 where join_id='j001'; --sample3 1행에서 얘를 참조하고 있기때문에 삭제될수 없다

--외래키 제약조건 삭제
alter table sample3 drop CONSTRAINT sample_fk3_join_id;
delete from sample4 where join_id='j001'; --이제  삭제가 된다

alter table sample3 read only; --이걸 하면 행 추가가 안된다
alter table sample3 read write;

--제약조건 걸린 테이블 삭제
drop table sample4; --sample3가 sample4을 참고하고있어서 삭제가 안된다
drop table sample4 CASCADE CONSTRAINT; --제약조건을 무시하고 삭제

--데이터를 다 날려버릴때
TRUNCATE TABLE sample3;



--DML : INSERT, UPDATE, DELETE
--데이터를 삽입, 갱신, 삭제, 병합을 할수있는 manipulation 언어
--INSERT
select dbms_random.string('A',10),dbms_random.string('Q',10) from dual; --이름을 랜덤하게 부여하고싶을떄

INSERT INTO sample1(
  num, fname, lname, tel, addr
) values(
sample1_seq.nextval,
dbms_random.string('A',10),
dbms_random.string('Q',10),
'010-0000-0000',
'seoul'
);

--PL/SQL은 다른줄 실행할때도 자동 실행되므로 사용하고 나선 주석처리를 해줘야한다.

--BEGIN
--  for i in 1..50 loop --50번 루프 돌겟다!
--  INSERT INTO sample1(
--            num, fname, lname, tel, addr
--        ) values(
--            sample1_seq.nextval,
--            dbms_random.string('A',10),
--            dbms_random.string('Q',10),
--            '010-0000-0000',
--            'seoul'
--        );
--  end loop; --for문 끝
--  commit; --최종으로 커밋함
--END;

select count(*) from sample1;

--프로시저 실행 명령
exec SAMPLE1_INSERT;


--update

update sample1 set 
fname='yangssem',
lname = 'gunho'
where num = 21;
select fname,lname from sample1 where num = 21;

--delete

delete from sample1 where num = 12;
delete from sample1 where fname like '%yang%';

select * from sample1;

--MERGE 문

create table TEST1 (pnum number,p2num number,pcount number,price number);
insert into test1 values(1001,2001,100,5000);
insert into test1 values(1002,2002,100,3000);
insert into test1 values(1003,2003,100,2000);
create table TEST2 (pnum number,p2num number,pcount number,price number);
insert into test2 values(6001,7001,300,7000);
insert into test2 values(6002,7002,300,8000);
insert into test2 values(6003,7003,300,9000);
insert into test2 values(6004,7777,300,9000);

update test1 set price=5000 , pcount = 222 where pnum=1001;

select * from test1;

update test2 set p2num=8888 , pcount = 3333 where pnum=6004;

select * from test2;

create table TEST_merge (pnum number,p2num number,pcount number,price
number);

select * from test_merge;

--TESTmerge랑 test1 테이블 병합
MERGE INTO test_merge tm USING test1 t1
    ON (tm.pnum=t1.pnum)
    WHEN MATCHED THEN
UPDATE SET tm.p2num=t1.p2num ,tm.pcount=t1.pcount
    WHEN NOT MATCHED THEN
    INSERT VALUES(t1.pnum, t1.p2num, t1.pcount, t1.price);
  
--TESTmerge랑 test2 테이블 병합  
MERGE INTO test_merge tm USING test2 t2
    ON (tm.pnum=t2.pnum)
WHEN MATCHED THEN
    UPDATE SET tm.p2num=t2.p2num , tm.pcount=t2.pcount --추가 변경할 내용이 있으면 콤마로 추가한다.
WHEN NOT MATCHED THEN
    INSERT VALUES(t2.pnum, t2.p2num, t2.pcount, t2.price);



--TCL : COMMIT , ROLLBACK , SAVEPOINT
CREATE TABLE TEST_TCL
AS SELECT * FROM DEPARTMENTS;

select * from test_tcl;

COMMIT;

update TEST_TCL SET DEPARTMENT_ID=111
WHERE DEPARTMENT_ID = 10;

SAVEPOINT p01;

update TEST_TCL SET DEPARTMENT_ID=111
WHERE DEPARTMENT_ID = 30;

SAVEPOINT p02;

delete from test_tcl;

-- TO를 붙여야 지정된 세이브 포인트로 롤백된다
ROLLBACK to p02;
ROLLBACK to p01;





--[실습] 게시판(test_board) 테이블을 만들자.
--( CREATE, INSERT, UPDATE, DELETE, DROP ,ALTER,TRUNCATE)
--[ 컬럼 ]
--글번호(정수) WNUM 기본키
--작성자(문자) WRITER NULL허용안함
--글제목(문자) TITLE NULL허용안함
--글내용(문자) CON NULL허용안함
--작성날짜(날자) WDATE NULL허용안함 기본값 시스템현재날자
--조회수(정수) VCOUNT 기본값 0
--- 글번호는 자동번호 부여해서 증가시킬 것.
--- 임의의 데이터를 10개 추가.
--- 글번호가 4번인 데이터를 삭제.
--- 작성자로도 데이터를 삭제.
--- 작성자 YANGSSEM 추가
--- 작성자가 ‘YANGSSEM’ 사람의 글내용을 ‘즐거운 ORACLE SQL’ 로 수정.
--- 글제목이나 내용중에 ORACLE 라는 단어가 있는 모든 글 검색.
--- 댓글허용(COMM_CH,문자) 컬럼 추가
--- 모든데이터를 잘라내시오.
--- 테이블을 삭제 해보세요.


--테이블 생성
CREATE TABLE test_BOARD(
    WNUM NUMBER PRIMARY KEY,
    WRITER VARCHAR2(20) NOT NULL,
    TITLE  VARCHAR2(100) NOT NULL,
    CONTENT VARCHAR2(4000) NOT NULL,
    WDATE DATE DEFAULT SYSDATE NOT NULL, --작성일자는 기본적으로 오늘
    VCOUNT NUMBER DEFAULT 0 --조회수는 기본으로 0으로 시작
);

--1부터 시작하는 시퀸스 추가
CREATE SEQUENCE TEST_BOARD_SEQ;
DROP SEQUENCE TEST_BOARD_SEQ;

--임의의 데이터 추가... 시퀸스와 랜덤 활용
INSERT INTO TEST_BOARD(
    WNUM, 
    WRITER, 
    TITLE,
    CONTENT
) VALUES(
    TEST_BOARD_SEQ.NEXTVAL, 
    DBMS_RANDOM.string('A',10),
    DBMS_RANDOM.string('Q',10),
    DBMS_RANDOM.string('A',10)
);

--해답
--BEGIN
--    FOR i in 1..10 loop
--        INSERT INTO TEST_BOARD(
--            WNUM, 
--            WRITER, 
--            TITLE,
--            CONTENT
--        ) VALUES(
--            TEST_BOARD_SEQ.NEXTVAL, 
--            'kim'||TEST_BOARD_SEQ.NEXTVAL,
--            'title'||TEST_BOARD_SEQ.NEXTVAL,
--            'content'||TEST_BOARD_SEQ.NEXTVAL
--        );
--    END LOOP;
--END;

--4번인 행 삭제
DELETE FROM TEST_BOARD WHERE wnum=4;

--작성자 한명 삭제
DELETE FROM TEST_BOARD WHERE WRITER='kim1';

--작성자 양쌤 추가
INSERT INTO TEST_BOARD(
WNUM, WRITER, TITLE, CONTENT
) VALUES(
    TEST_BOARD_SEQ.NEXTVAL, 
    'YANGSSEM',
    DBMS_RANDOM.string('Q',10),
    DBMS_RANDOM.string('A',10)
);

--글 내용을 내용 변경 
UPDATE TEST_BOARD
SET CONTENT='즐거운 ORACLE SQL'
WHERE WRITER = 'YANGSSEM';

--제목이나 내용에 ORACLE이 들어있는 항목 검색
SELECT * 
FROM TEST_BOARD
WHERE TITLE LIKE '%ORACLE%'
OR CONTENT LIKE '%ORACLE%';

--테이블 구조에 새로운 행 추가
ALTER TABLE TEST_BOARD ADD (COMM_CH VARCHAR2(20));

desc test_board; --테이블 구조 조회

--모든 데이터 삭제
TRUNCATE TABLE TEST_BOARD;

--- 테이블을 삭제 해보세요.
DROP TABLE TEST_BOARD;
SELECT * FROM tab; --테이블 리스트 조회
