--JAVA JDBC ��������
CREATE TABLE TEST
(
  NUM NUMBER NOT NULL 
, NAME VARCHAR2(20) NOT NULL 
, AGE NUMBER NOT NULL 
, CONSTRAINT TEST__PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);
-------------------------------------------------------------------------------

--Data Insert
--INSERT INTO ���̺�(Į�����) VALUES(����);--�⺻����
INSERT INTO TEST(NUM,NAME,AGE) VALUES(1,'kim1',11);
INSERT INTO TEST(NUM,NAME,AGE) VALUES(2,'kim1',11);
--INSERT INTO TEST_TABLE(NUM,NAME,AGE) VALUES(3,'',11); --������ �ƹ��͵� �� �־ NULL�� �ν��ؼ� ����
INSERT INTO TEST(NUM,NAME,AGE) VALUES(3,'kim3',11);