--member table!
CREATE TABLE MEMBER 
(
  NUM NUMBER NOT NULL 
, ID VARCHAR2(20) NOT NULL 
, PASSWORD VARCHAR2(20) NOT NULL 
, NAME VARCHAR2(20) NOT NULL 
, TEL VARCHAR2(20) NOT NULL 
, CONSTRAINT MEMBER_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);
-- 테이블 삭제
drop table "HR"."MEMBER";

-- 시퀀스 : 번호 자동 생성 스키마
CREATE SEQUENCE SEQ_MEMBER; --아무것도 안 적으면 기본적으로 1씩 증가하는식
DROP SEQUENCE SEQ_MEMBER;

--행 삽입
INSERT INTO MEMBER(NUM,ID,PASSWORD,NAME,TEL) 
values(SEQ_MEMBER.nextval,'admin2'||SEQ_MEMBER.nextval,'hi2222','kim2','02');



select * from member;

TRUNCATE table member; --모든 행 삭제(롤백불가)

commit;
rollback;