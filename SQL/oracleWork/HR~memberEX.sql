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
-- ���̺� ����
drop table "HR"."MEMBER";

-- ������ : ��ȣ �ڵ� ���� ��Ű��
CREATE SEQUENCE SEQ_MEMBER; --�ƹ��͵� �� ������ �⺻������ 1�� �����ϴ½�
DROP SEQUENCE SEQ_MEMBER;

--�� ����
INSERT INTO MEMBER(NUM,ID,PASSWORD,NAME,TEL) 
values(SEQ_MEMBER.nextval,'admin2'||SEQ_MEMBER.nextval,'hi2222','kim2','02');



select * from member;

TRUNCATE table member; --��� �� ����(�ѹ�Ұ�)

commit;
rollback;