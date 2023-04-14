--��������
ALTER TABLE TEST1 
MODIFY (PNUM NOT NULL);

ALTER TABLE TEST1
ADD CONSTRAINT TEST1_UK1 UNIQUE 
(
  P2NUM 
)
ENABLE;

-----------------------------------------------
CREATE TABLE DEPT(
    DEPTNO NUMBER(2) primary key
);

CREATE TABLE EMP_TAB(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB_ID VARCHAR2(9),
    MGR NUMBER(4) CONSTRAINT EMP_SELF_KEY REFERENCES EMP_TAB(EMPNO), --�ڱ� �ڽ��� ����, ������ ������ �Ŵ����ΰ�
    HIRE_DATE DATE,
    SAL NUMBER(7),
    COMM NUMBER(1),
    DEPTNO NUMBER(2) NOT NULL,
    CONSTRAINT EMP_DEPTNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO),
    CONSTRAINT EMP_EMPNO_PK PRIMARY KEY(EMPNO)
);

SELECT CONSTRAINT_NAME from user_constraints;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

CREATE TABLE TEST_EMP 
(
  NO NUMBER(4) NOT NULL 
, NAME VARCHAR2(20) NOT NULL 
, LOC VARCHAR2(4) 
, JUMIN CHAR(13) 
, DEPTNO NUMBER 
, CONSTRAINT TEST_EMP_PK PRIMARY KEY 
  (
    NO 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX TABLE1_PK ON TEST_EMP (NO ASC) 
  )
  ENABLE 
);

ALTER TABLE TEST_EMP
ADD CONSTRAINT TEST_EMP_UK1 UNIQUE 
(
  JUMIN 
)
ENABLE;

ALTER TABLE TEST_EMP
ADD CONSTRAINT TEST_EMP_FK1 FOREIGN KEY
(
  DEPTNO 
)
REFERENCES TEST_DEPT
(
  DEPTNO 
)
ENABLE;

ALTER TABLE TEST_EMP
ADD CONSTRAINT TEST_EMP_CHK1 CHECK 
(LOC IN('����','�λ�'))
ENABLE;

SELECT CONSTRAINT_NAME from user_constraints;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------


INSERT INTO test_dept (deptno, loc) VALUES(10, '2');
INSERT INTO test_dept VALUES(20, '��ȹ��', '1');
INSERT INTO test_dept VALUES(30, '������', '2');
INSERT INTO test_dept VALUES(40, '������', '1');
INSERT INTO test_dept VALUES(50, '����2��', '3'); --����, 3������ ������ �������� 1,2�� �־���Ѵٴ°ſ� �ɸ�


select * from test_dept;

INSERT INTO TEST_EMP VALUES(100, 'Kim', '����', '292929-292929',10);
INSERT INTO TEST_EMP VALUES(101, 'Kim1', '�λ�', '292929-292930',10);

select * from test_emp;

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

CREATE TABLE TEST_BOARD 
(
  WNUM NUMBER(4) NOT NULL 
, WRITER VARCHAR2(10) NOT NULL 
, TITLE VARCHAR2(100) NOT NULL 
, CONTENT VARCHAR2(2000) NOT NULL 
, WDATE DATE DEFAULT SYSDATE NOT NULL 
, VCOUNT NUMBER(2) 
, CONSTRAINT TEST_BOARD_PK PRIMARY KEY 
  (
    WNUM 
  )
  ENABLE 
);

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

CREATE TABLE TEST_BOARD_COMM(
COMM_ID NUMBER(4),
WRITER VARCHAR2(10) CONSTRAINT test_b_com_writer_nn NOT NULL,
TITLE VARCHAR2(100) CONSTRAINT test_b_com_title_nn NOT NULL,
CONTENT VARCHAR2(1000) CONSTRAINT test_b_com_con_nn NOT NULL,
WDATE DATE default SYSDATE CONSTRAINT test_b_com_wdate_nn NOT NULL,
wnum NUMBER(4) ,
VCOUNT NUMBER(2),
CONSTRAINT test_b_com_id_wnum_pk PRIMARY KEY (COMM_ID) ,
CONSTRAINT test_b_com_wnum_fk FOREIGN KEY (wnum)
REFERENCES TEST_BOARD(wnum)
);

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
--�ε���
select rownum,rowid,d.*
from test_dept d
where dname>'0';

create index test_tab_idx2 on test_dept(loc);
drop index test_tab_idx;
select index_name from SYS.user_indexes;

select /*+index_desc(test_dept test_tab_idx)*/d.* --����Ŭ��Ʈ�����..
from test_dept d
where dname>'0';

select /*+index_desc(test_dept test_tab_idx)*/max(dname) --����Ŭ��Ʈ�����..
from test_dept d
where dname>'0';