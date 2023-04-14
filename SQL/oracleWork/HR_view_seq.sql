--VIEW

--���������Ǿ��մ� ��
SELECT
    *
FROM
    emp_details_view; 
    SELECT
      e.employee_id,
      e.job_id,
      e.manager_id,
      e.department_id,
      d.location_id,
      l.country_id,
      e.first_name,
      e.last_name,
      e.salary,
      e.commission_pct,
      d.department_name,
      j.job_title,
      l.city,
      l.state_province,
      c.country_name,
      r.region_name
  FROM
      employees    e,
      departments  d,
      jobs         j,
      locations    l,
      countries    c,
      regions      r
  WHERE
          e.department_id = d.department_id
      AND d.location_id = l.location_id
      AND l.country_id = c.country_id
      AND c.region_id = r.region_id
      AND j.job_id = e.job_id;
      
------------------------------------------------------------------------
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM EMPLOYEES;
------------------------------------------------------------------------
CREATE VIEW view_emp
AS SELECT employee_id, first_name , salary FROM employees WITH READ ONLY;

drop view view_emp;

select * from view_emp;

-----------------------------------------------------------------------------
--������ ���ǹ�
select e.employee_id, d.department_id, d.department_name,e.salary
from employees e join departments d
on e.department_id=d.department_id;


--�̰� ��� ����� ������ �ҷ����� ���ϴ�
CREATE OR REPLACE  --�ڿ� OR REPLACE�� �� ���̸� ���� �̸��� �� ��ü �Ұ�
VIEW VIEW_EMP_DEPT(empno,fname,deptno,deptname,salary,commpct) --�ڿ� ���̴°� ��Ī�̴�
AS select e.employee_id, e.first_name, d.department_id, d.department_name,e.salary,e.commission_pct
from employees e join departments d
on e.department_id=d.department_id
WITH READ ONLY;

--��ȸ
SELECT * from view_emp_dept;

---------------------------------------------
--�� �ɼ� FROM CHECK OPTION�� Ȱ��
--�ϴ� ������ ����
select * from test_board;
insert into test_board values(10,'aaa','bbb','ccc',sysdate,10);
insert into test_board values(20,'aaa','bbb','ccc',sysdate,10);
insert into test_board values(30,'aaa','bbb','ccc',sysdate,10);
insert into test_board values(50,'kim','title10','content10',sysdate,0);

CREATE OR REPLACE VIEW view_board as
SELECT WNUM,WRITER,TITLE,CONTENT
FROM test_board
WHERE WNUM IN(20,30)
WITH CHECK OPTION;

--�信�ٰ� ������ ����
--ORA-01402: view WITH CHECK OPTION where-clause violation
insert into view_board values(10,'writer1','title1','content1');
--ORA-00001: unique constraint (HR.TEST_BOARD_PK) violated
insert into view_board values(20,'writer1','title1','content1');
--ORA-01402: view WITH CHECK OPTION where-clause violation
insert into view_board values(40,'writer1','title1','content1');
--ORA-01402: view WITH CHECK OPTION where-clause violation
insert into view_board values(60,'writer1','title1','content1');
--�� ���� WNUM�� WHERE���� �ִ� 20�� 30���� ������ ���ǳ� WNUM�� �̹� PK�̰� ��������ִ��� �־ �ȵȴ�
-- WNUM�� PK�� �ƴ϶�� ������ �����Ұ�

SELECT * FROM view_board;

--------------------------------------------------------------------------
--�ǽ�
--���̺�1
CREATE TABLE TEST4_DEPT 
(
  DEPTNO NUMBER(2) NOT NULL 
, DNAME VARCHAR2(15) DEFAULT '���ߺ�' 
, LOC_ID CHAR(1) 
, CONSTRAINT TEST4_DEPT_DEPTNO_PK PRIMARY KEY 
  (
    DEPTNO 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX TEST4_DEPT_PK ON TEST4_DEPT (DEPTNO ASC) 
  )
  ENABLE 
);

ALTER TABLE TEST4_DEPT
ADD CONSTRAINT TEST4_DEPT_CHK1 CHECK 
(loc_id in ('1','2'))
ENABLE;

--���̺�2
ALTER TABLE TEST4_EMP 
RENAME CONSTRAINT TEST4_EMP_PK TO TEST4_EMP_NO_PK;

ALTER TABLE TEST4_EMP
ADD CONSTRAINT TEST4_EMP_JUMIN_UQ UNIQUE 
(
  JUMIN 
)
USING INDEX 
(
    CREATE UNIQUE INDEX TEST4_EMP_JUMIN_UK ON TEST4_EMP (JUMIN ASC) 
)
 ENABLE;

ALTER TABLE TEST4_EMP
ADD CONSTRAINT TEST4_EMP_FK1 FOREIGN KEY
(
  DEPTNO 
)
REFERENCES TEST4_DEPT
(
  DEPTNO 
)
ENABLE;

--�����ͻ���
INSERT INTO test4_dept VALUES(10, '������', '1');
INSERT INTO test4_dept VALUES(20, '��ȹ��', '1');
INSERT INTO test4_dept VALUES(30, 'ȫ����', '2');
INSERT INTO test4_dept VALUES(40, '������', '2');
INSERT INTO test4_emp VALUES(1001, 'ȫ�浿', '����', '1234561234567', 10,3000);
INSERT INTO test4_emp VALUES(1002, '�ֱ浿', '����', '1234561234568', 10,4000);
INSERT INTO test4_emp VALUES(1003, '�ڱ浿', '���', '1234561234569', 20,5000);
INSERT INTO test4_emp VALUES(1004, '��浿', '���', '1234561234571', 30,6000);
INSERT INTO test4_emp VALUES(1005, '�ѱ浿', '����', '1234561234572', 40,7000);
INSERT INTO test4_emp VALUES(1006, '���浿', '����', '1234561234573', 40,8000);

select * from test4_dept;
select * from test4_emp;

--�ǽ�1-1
--�μ�ID�� 10���� ��������͸� ���� �̸��� test4_emp_view �� �並 ������
--empno, ename �ΰ� �÷������� ������, ��˻�, �䱸�� Ȯ���϶�.

CREATE OR REPLACE VIEW test4_emp_view(empno,ename) AS
SELECT empno,ename
FROM test4_emp
WHERE deptno=10;

select * from test4_emp_view;

--�ǽ�1-2
--�μ�ID�� 20���� �μ������͸� ���� �̸��� test4_dept_view �� �並 ������
--deptno, dname �ΰ� �÷������� ���� ��, ��˻�, �䱸�� Ȯ���϶�.

CREATE OR REPLACE VIEW test4_dept_view AS
SELECT deptno,dname
FROM test4_dept
WHERE deptno=20;

select * from test4_dept_view;

--�ǽ�2-1
--�μ�ID�� 10���� ��������͸� ���� �̸��� test4_emp_view ��
--�並 ������, �÷� �̸��� empno�� employee_id,
--ename�� employee_name���� ��Ī �����϶�

CREATE OR REPLACE VIEW test4_emp_view(employee_id,employee_name) AS
SELECT empno,ename
FROM test4_emp
WHERE deptno=10;

select * from test4_emp_view;

--�ǽ�2-2
--�μ�ID�� 20���� �μ������͸� ���� �̸��� test4_dept_view ��
--�並 ������, �÷� �̸��� deptno �� department_id,
--dname �� department_name ���� ��Ī�����϶�.

CREATE OR REPLACE VIEW test4_dept_view(department_id,department_name) AS
SELECT deptno,dname
FROM test4_dept
WHERE deptno=20;

select * from test4_dept_view;

--�ǽ�3
--test4_emp ���̺�� test4_dept ���̺��� �����Ͽ�
--empno�� �����ȣ��,
--ename�� ���������,
--dname�� �μ�������,
--loc_name �� ����������
--�ٲٴ� test4_emp_join_dept_view �� �����Ͻÿ�.

CREATE OR REPLACE VIEW test4_emp_join_dept_view("�����ȣ","�����","�μ���","������") AS
SELECT e.empno,e.ename,d.dname,e.loc_name
FROM test4_emp e join test4_dept d
using(deptno);

select * FROM test4_emp_join_dept_view;

--�ǽ�4
--test4_emp ���̺�� test4_dept ���̺��� �����Ͽ�
--dname�� �μ��� ����,
--min(e.sal)�� �����޿� ����,
--max(e.sal)�� �ְ�޿� ����,
--avg(e.sal) �� ��ձ޿� ����
--�ٲٰ� �μ��̸����� test4_emp_join_dept_view �� �����Ͻÿ�.

CREATE OR REPLACE VIEW test4_emp_join_dept_view("�μ���","�����޿�","�ְ�޿�","��ձ޿�") AS
SELECT d.dname, min(e.sal),max(e.sal), avg(e.sal)
FROM test4_emp e join test4_dept d
using(deptno)
GROUP BY d.dname;

select * FROM test4_emp_join_dept_view;

---------------------------------------------------------------

--	private int employee_id;
--	private String first_name;
--	private String last_name;
--	private int salary;
--	private Date hire_date;
--	private String job_id;

select * from view_emp_dept;

select rownum,employee_id,first_name,last_name
from emp order by employee_id asc;


---------------------------------------------------------------------------------------------------------
--ROWID,ROWNUM
--������̺�(employees)���� 
--���� �ֱٿ� �Ի��� ��� ������ 5���� �������.

--�̰� ����� �� ������ ���������� Ȱ���ؾߵȴ�
--select ROWNUM,employee_id,first_name,last_name,hire_date from employees
--where ROWNUM <=5 order by hire_date desc;

--�������� Ȱ��
select ROWNUM,employee_id,first_name,last_name,hire_date 
from (
select employee_id,first_name,last_name,hire_date 
from employees
order by hire_date desc
)
where ROWNUM <=5;


--������̺�(employees)���� 
--��� ������������ 6��°���� 10��° ��� 5���� �������.

--���� �����Ѱ�
SELECT
    ROWNUM,
    EMP.*
FROM
    (
        SELECT
            *
        FROM
            employees
        WHERE
            employee_id >= (
                SELECT
                    MAX(employee_id) - 9
                FROM
                    employees
            )
    ) EMP
WHERE
    ROWNUM <=5;

-- �ٸ� ����� Ǯ��
Select *
FROM (
    SELECT ROWNUM as rnum, e.* FROM EMPLOYEES e ORDER BY EMPLOYEE_ID DESC
) 
WHERE rnum >= 6 and rnum <= 10;

--�ش�
select * from (select rownum rnum,employee_id,first_name,last_name,hire_date 
from (select employee_id,first_name,last_name,hire_date  
from employees order by employee_id desc))
where rnum>=6 and rnum<=10;


-----------------------------------------------------------------------------
--ROLLUP, CUBE ,�Ұ� �Ѱ�
--�μ���ȣ�� 40�� ������ ����� �μ��� ������ ���ް� ����϶�
select department_id,job_id,sum(salary)
from employees
where department_id<=40
group by ROLLUP(department_id,job_id)
order by department_id;

select department_id,job_id,sum(salary)
from employees
where department_id<=40
group by CUBE(department_id,job_id)
--having department_id is null
order by department_id;

--------------------------------------------------------------------------
--���������� �ٸ� ǥ�� ���
--�μ���ȣ�� 50���� ����� ��, �� �μ���
--��� �޿��� ���� ���� ������ �޴� �������� �����϶�.
select e.employee_id, e.last_name, e.salary
from
    (select employee_id,manager_id, salary, last_name
        from employees
        where department_id=50) e,
    (select avg(salary) avg_salary
        from employees
        where department_id=50) d
where e.salary < d.avg_salary;

--with�� ����� ���
with e as
     (select employee_id,manager_id, salary, last_name
        from employees
        where department_id=50),
     d as 
        (select avg(salary) avg_salary
            from employees
            where department_id=50) 
select e.employee_id, e.last_name, e.salary
from e,d
where e.salary < d.avg_salary;


---��2)��ü �μ��� ��� �޿��׺��� �μ��� �޿��հ���� ū �μ��� ����� �����϶�.
--�μ��� �޿� �հ�
SELECT d.department_name,sum(e.salary)
from employees e join departments d
using (department_id)
group by department_name;

--�μ��� ��ü��� : ����� �޿��Ѱ� ������ �μ���
WITH e as
    (select sum(e.salary) sum_amt from employees e, departments d
         where e.department_id = d.department_id),
        d as
    (SELECT count(*) cnt FROM Departments d
    where d.department_id in (select department_id from employees))
select e.sum_amt/d.cnt �μ����
from e,d;

SELECT a.department_name,a.sum_sal
FROM (
    SELECT d.department_name ,sum(e.salary) sum_sal
    from employees e join departments d
    using (department_id)
    group by department_name, d.department_name
) a,
(
WITH e as
    (select sum(e.salary) sum_amt from employees e, departments d
         where e.department_id = d.department_id),
        d as
    (SELECT count(*) cnt FROM Departments d
    where d.department_id in (select department_id from employees))
select e.sum_amt/d.cnt �μ����
from e,d
) b
WHERE a.sum_sal > b.�μ����;

WITH a as
(
    SELECT d.department_name ,sum(e.salary) sum_sal
    from employees e join departments d
    using (department_id)
    group by department_name, d.department_name
),
b as
(
    select dt.sum_amt/dc.cnt �μ����
    from    (select sum(e.salary) sum_amt from employees e, departments d
                    where e.department_id = d.department_id) dt,
              (select count(*) cnt from departments d
                    where d.department_id IN (select department_id from employees)) dc
)
SELECT a.department_name,a.sum_sal
FROM a,b
WHERE a.sum_sal > b.�μ����;
