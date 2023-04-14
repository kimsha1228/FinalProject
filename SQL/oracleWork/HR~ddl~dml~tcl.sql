-- DDL DML TCL

--DDL �ѹ��� �Ұ����ϴ�, DDL ��������� Ŀ�Ե������� ������� ���� �ڵ����� Ŀ�Եȴ�
--CREATE , DROP, ALTER , TRUNCATE

CREATE TABLE sample1(
    num number primary key,
    fname varchar2(20),
    lname varchar2(20) not null,
    tel varchar2(20) not null,
    addr varchar2(100),
    regdate date default sysdate
);

CREATE SEQUENCE sample1_seq; --�ڵ���ȣ �ο��� ������ ����!

--���̺� ����
CREATE TABLE emp as select * from employees; --������ �����ͱ��� ����
CREATE TABLE emp as select * from employees where 1=2; --������ ����

drop table emp;

--���̺� ������ �����ҋ�
CREATE table sample2 (num number);

ALTER table sample2 add (fname varchar2(20));
ALTER table sample2 add (lname varchar2(20));
ALTER table sample2 add (tel varchar2(20));
ALTER table sample2 add (addr varchar2(100));
ALTER table sample2 add (memo varchar2(100));

 --default sysdate�� �����͸� �η� ���θ� �ڵ����� �ý��۳�¥�� ä������
ALTER TABLE sample2 modify(memo date default sysdate);

INSERT INTO sample2(num,fname,lname,tel,addr) values(SAMPLE1_SEQ.nextval,'gildong','Hong','020','Seoul');

--PK �߰�
ALTER TABLE sample2 modify(num number primary key);

--�� ��Ī�� �����ϰ� ������
alter table sample2 rename column memo to regdate;

--���� �����ϰ� ������
alter table sample2 drop column addr;

ALTER table sample2 add (add1 varchar2(100));
ALTER table sample2 add (add2 varchar2(100));
ALTER table sample2 add (add3 varchar2(100));

--������� �ʴ� �÷� ����
ALTER table sample2 SET UNUSED COLUMN add1;
ALTER table sample2 SET UNUSED (add2,add3);
ALTER table sample2 DROP UNUSED COLUMNS;

------------------------------------------------------------------------------------
--���������� �߰�

CREATE TABLE sample3(
num number,
join_id varchar(20)
); --PK �߰��ϴ°� �����ߴ�


--�׷��� NUM���ٰ� PK�� �ο��ϴ� ddl�� �ۼ�
alter table sample3 add CONSTRAINT sample3_PK PRIMARY KEY(num);
alter table sample3 drop CONSTRAINT sample3_PK;


CREATE TABLE sample4(
join_id varchar(20) primary key
); --FK ������ 

--sample3 ���̺��� join_id�� ���� sample4�� join_id�� �����ϰ� �ȴ�
--�� sample4�� �ִ� join_id�� �߰��ɼ� �ִ�
alter table sample3 add CONSTRAINT sample_fk3_join_id
FOREIGN key (join_id) REFERENCES sample4(join_id);��



--ORA-02291: integrity constraint (HR.SAMPLE_FK3_JOIN_ID) violated - parent key not found
insert into sample3(num,join_id) values(1,'j001');

--sample4�� join_id ���� ���� �߰��س���
insert into sample4(join_id) values('j001');
insert into sample3(num,join_id) values(1,'j001'); --�߰��� �ȴ�

--��������
--ORA-02292: integrity constraint (HR.SAMPLE_FK3_JOIN_ID) violated - child record found
delete from sample4 where join_id='j001'; --sample3 1�࿡�� �긦 �����ϰ� �ֱ⶧���� �����ɼ� ����

--�ܷ�Ű �������� ����
alter table sample3 drop CONSTRAINT sample_fk3_join_id;
delete from sample4 where join_id='j001'; --����  ������ �ȴ�

alter table sample3 read only; --�̰� �ϸ� �� �߰��� �ȵȴ�
alter table sample3 read write;

--�������� �ɸ� ���̺� ����
drop table sample4; --sample3�� sample4�� �����ϰ��־ ������ �ȵȴ�
drop table sample4 CASCADE CONSTRAINT; --���������� �����ϰ� ����

--�����͸� �� ����������
TRUNCATE TABLE sample3;



--DML : INSERT, UPDATE, DELETE
--�����͸� ����, ����, ����, ������ �Ҽ��ִ� manipulation ���
--INSERT
select dbms_random.string('A',10),dbms_random.string('Q',10) from dual; --�̸��� �����ϰ� �ο��ϰ������

INSERT INTO sample1(
  num, fname, lname, tel, addr
) values(
sample1_seq.nextval,
dbms_random.string('A',10),
dbms_random.string('Q',10),
'010-0000-0000',
'seoul'
);

--PL/SQL�� �ٸ��� �����Ҷ��� �ڵ� ����ǹǷ� ����ϰ� ���� �ּ�ó���� ������Ѵ�.

--BEGIN
--  for i in 1..50 loop --50�� ���� ���ٴ�!
--  INSERT INTO sample1(
--            num, fname, lname, tel, addr
--        ) values(
--            sample1_seq.nextval,
--            dbms_random.string('A',10),
--            dbms_random.string('Q',10),
--            '010-0000-0000',
--            'seoul'
--        );
--  end loop; --for�� ��
--  commit; --�������� Ŀ����
--END;

select count(*) from sample1;

--���ν��� ���� ���
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

--MERGE ��

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

--TESTmerge�� test1 ���̺� ����
MERGE INTO test_merge tm USING test1 t1
    ON (tm.pnum=t1.pnum)
    WHEN MATCHED THEN
UPDATE SET tm.p2num=t1.p2num ,tm.pcount=t1.pcount
    WHEN NOT MATCHED THEN
    INSERT VALUES(t1.pnum, t1.p2num, t1.pcount, t1.price);
  
--TESTmerge�� test2 ���̺� ����  
MERGE INTO test_merge tm USING test2 t2
    ON (tm.pnum=t2.pnum)
WHEN MATCHED THEN
    UPDATE SET tm.p2num=t2.p2num , tm.pcount=t2.pcount --�߰� ������ ������ ������ �޸��� �߰��Ѵ�.
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

-- TO�� �ٿ��� ������ ���̺� ����Ʈ�� �ѹ�ȴ�
ROLLBACK to p02;
ROLLBACK to p01;





--[�ǽ�] �Խ���(test_board) ���̺��� ������.
--( CREATE, INSERT, UPDATE, DELETE, DROP ,ALTER,TRUNCATE)
--[ �÷� ]
--�۹�ȣ(����) WNUM �⺻Ű
--�ۼ���(����) WRITER NULL������
--������(����) TITLE NULL������
--�۳���(����) CON NULL������
--�ۼ���¥(����) WDATE NULL������ �⺻�� �ý������糯��
--��ȸ��(����) VCOUNT �⺻�� 0
--- �۹�ȣ�� �ڵ���ȣ �ο��ؼ� ������ų ��.
--- ������ �����͸� 10�� �߰�.
--- �۹�ȣ�� 4���� �����͸� ����.
--- �ۼ��ڷε� �����͸� ����.
--- �ۼ��� YANGSSEM �߰�
--- �ۼ��ڰ� ��YANGSSEM�� ����� �۳����� ����ſ� ORACLE SQL�� �� ����.
--- �������̳� �����߿� ORACLE ��� �ܾ �ִ� ��� �� �˻�.
--- ������(COMM_CH,����) �÷� �߰�
--- ��絥���͸� �߶󳻽ÿ�.
--- ���̺��� ���� �غ�����.


--���̺� ����
CREATE TABLE test_BOARD(
    WNUM NUMBER PRIMARY KEY,
    WRITER VARCHAR2(20) NOT NULL,
    TITLE  VARCHAR2(100) NOT NULL,
    CONTENT VARCHAR2(4000) NOT NULL,
    WDATE DATE DEFAULT SYSDATE NOT NULL, --�ۼ����ڴ� �⺻������ ����
    VCOUNT NUMBER DEFAULT 0 --��ȸ���� �⺻���� 0���� ����
);

--1���� �����ϴ� ������ �߰�
CREATE SEQUENCE TEST_BOARD_SEQ;
DROP SEQUENCE TEST_BOARD_SEQ;

--������ ������ �߰�... �������� ���� Ȱ��
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

--�ش�
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

--4���� �� ����
DELETE FROM TEST_BOARD WHERE wnum=4;

--�ۼ��� �Ѹ� ����
DELETE FROM TEST_BOARD WHERE WRITER='kim1';

--�ۼ��� ��� �߰�
INSERT INTO TEST_BOARD(
WNUM, WRITER, TITLE, CONTENT
) VALUES(
    TEST_BOARD_SEQ.NEXTVAL, 
    'YANGSSEM',
    DBMS_RANDOM.string('Q',10),
    DBMS_RANDOM.string('A',10)
);

--�� ������ ���� ���� 
UPDATE TEST_BOARD
SET CONTENT='��ſ� ORACLE SQL'
WHERE WRITER = 'YANGSSEM';

--�����̳� ���뿡 ORACLE�� ����ִ� �׸� �˻�
SELECT * 
FROM TEST_BOARD
WHERE TITLE LIKE '%ORACLE%'
OR CONTENT LIKE '%ORACLE%';

--���̺� ������ ���ο� �� �߰�
ALTER TABLE TEST_BOARD ADD (COMM_CH VARCHAR2(20));

desc test_board; --���̺� ���� ��ȸ

--��� ������ ����
TRUNCATE TABLE TEST_BOARD;

--- ���̺��� ���� �غ�����.
DROP TABLE TEST_BOARD;
SELECT * FROM tab; --���̺� ����Ʈ ��ȸ
