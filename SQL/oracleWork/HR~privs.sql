--����� ���� ���� pi123456
CREATE USER TEST IDENTIFIED BY pi123456;
GRANT CONNECT, RESOURCE TO TEST;
GRANT CREATE VIEW TO TEST;

SELECT * FROM dba_sys_privs WHERE grantee='HR'; --SYSTEM��������

SELECT * FROM role_sys_privs where role='RESOURCE'; --HR��������