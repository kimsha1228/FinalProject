--JAVA JDBC 연동계정
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
--INSERT INTO 테이블(칼럼명들) VALUES(값들);--기본뼈대
INSERT INTO TEST(NUM,NAME,AGE) VALUES(1,'kim1',11);
INSERT INTO TEST(NUM,NAME,AGE) VALUES(2,'kim1',11);
--INSERT INTO TEST_TABLE(NUM,NAME,AGE) VALUES(3,'',11); --공간에 아무것도 안 넣어도 NULL로 인식해서 오류
INSERT INTO TEST(NUM,NAME,AGE) VALUES(3,'kim3',11);