-- ��� ���̺��� ��ȸ
SELECT
    *
FROM
    tab;

-- * �� ��� Į���� ����
--SELECT country_id,country_name,region_id from countries;  �� ����
SELECT
    *
FROM
    countries;

-- ���̺� Į������� �����ش�
DESC countries;

SELECT
    *
FROM
    departments;

--��� ������� ��� Į������
SELECT
    *
FROM
    employees;

--150������ ū ����� �����ȣ �̸� �� �޿�, �� �޿����� ������������
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    employee_id > 150
ORDER BY
    salary DESC;

--Distinct(�ߺ��� ����)
--select job_id from employees;
--��� ����� �����߿��� job_id�� ���
--select all job_id from employees;
--��� ����� �����߿��� job_id�� ���, �ߺ��� ����
SELECT DISTINCT
    job_id
FROM
    employees;

--ORDER BY
--��� ������� �����߿��� ����� �޿��� ���
SELECT
    employee_id,
    salary
FROM
    employees;
--��� ������� �����߿��� ����� �޿��� ����ϰ� �� �޿��� �������� ������ ����
SELECT
    employee_id,
    salary
FROM
    employees
ORDER BY
    salary;

SELECT
    employee_id,
    salary
FROM
    employees
ORDER BY
    salary ASC; --���� �����Ͱ� ���� ȿ��, ��������
--��� ������� �����߿��� ����� �޿��� ����ϰ� �� �޿��� �������� ������ ����
SELECT
    employee_id,
    salary
FROM
    employees
ORDER BY
    salary DESC; --��������
--��� ������� �����߿��� ����� �޿��� ����ϰ� �� job_id�� ���� �����ϰ� �޿��������� ����
SELECT
    job_id,
    salary
FROM
    employees
ORDER BY
    job_id,
    salary; --�ϴ� job_id �������� ������ ����, job_id�� ���� row���� salary �������� �ٽ� ����

SELECT
    job_id,
    salary
FROM
    employees
ORDER BY
    job_id ASC,
    salary ASC;
--��� ������� �����߿��� ����� �޿��� ����ϰ� �� job_id�� ���� �����ϰ� �޿��������� ������ ����
SELECT
    job_id,
    salary
FROM
    employees
ORDER BY
    job_id,
    salary DESC; --�ϴ� job_id �������� ������ ����, job_id�� ���� row���� salary �������� �������� ����
--��� ������� �����߿��� ����� �޿��� ����ϰ� �� job_id�� ���� ������ �����ϰ� �޿��������� ������ ����
SELECT
    job_id,
    salary
FROM
    employees
ORDER BY
    job_id DESC,
    salary DESC; --�Ѵ� ������������
    
--ALIAS (��Ī) ���ڳ� Ư���� �����Ŷ�� ""���� ������� �Ѵ�.
--��� ��� ���� �߿��� ����(��Ī�� ��ġ��)�� ����(��Ī�� ��ġ��)�� ���
SELECT
    job_id  "����",
    salary  "����"
FROM
    employees;

SELECT
    job_id  ����,     --���ڳ� Ư���� �ƴ϶� �������� �ʾƵ� ������
    salary  "����"
FROM
    employees;

SELECT
    job_id  "����",
    salary  "���� #@" --Ư���� ���� ""���� ��������Ѵ�
FROM
    employees;

SELECT
    job_id,
    salary AS "���� \õ��" -- ������ AS�� �ٿ��ߵ����� �� �ٿ��� ��Ī���� ����
FROM
    employees;

SELECT
    job_id  id,
    salary  AS ����
FROM
    employees;

SELECT
    job_id  AS id,
    salary  AS "1004"
FROM
    employees;

-- where ���ǹ�
--��� ����߿��� �μ���ȣ�� 10�� ����� ���,�μ���ȣ ���
SELECT
    employee_id,
    department_id
FROM
    employees
WHERE
    department_id = 10;

--employee id�� 100���� �����̶� �ƹ��͵� ��ȸ�����ʴ´�
--select salary, employee_Id from employees;
SELECT
    salary,
    employee_id
FROM
    employees
WHERE
    employee_id = 30;

SELECT
    salary,
    department_id
FROM
    employees
WHERE
    department_id = 30
ORDER BY
    salary DESC;

-- ��� ����߿��� job_id�� IT_PROG�� ����� job_id�� first_name���� ����ϵ� firstname������������
SELECT
    job_id,
    first_name
FROM
    employees
WHERE
    job_id = 'IT_PROG' --""�δ� ��ȸ�� �ȵȴ�
ORDER BY
    first_name;

SELECT
    employee_id,
    first_name,
    hire_date
FROM
    employees
WHERE
    hire_date = '07/12/07';
    
    --��� ������ ( * , / , + , - )
--��� ������� 10�� �μ��� ������� �̸�, �޿��� 10�����λ� �� ���¸� ���
SELECT
    first_name,
    last_name,
    salary * 1.1 AS "�޿�10�����λ��",
    salary + 1000,
    salary / 1000,
    salary - 1000
FROM
    employees
WHERE
    department_id = 10;

--��� ������� �޿��� 15000�̻��� ������� �� �̸� �޿� ���
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 15000;

--��� ������� �μ���ȣ�� 50�� �ƴ� ������� �� �̸� �μ���ȣ ���

SELECT
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id != 50;
    
--�� ������ (AND OR NOT)
SELECT
    first_name,
    last_name,
    salary,
    department_id
FROM
    employees
WHERE
        department_id != 20
    AND salary > 10000;

--��� ������� �޿��� 11000,12000,15000�� ������� �� �̸� �޿� �μ���ȣ ���
SELECT
    first_name,
    last_name,
    salary,
    department_id
FROM
    employees
WHERE
--salary in(11000,12000,15000) �̷��� �Ҽ��� �ִ�.
            salary = 11000
    OR salary = 12000
    OR salary = 15000;

SELECT
    first_name,
    last_name,
    salary,
    department_id
FROM
    employees
WHERE
--salary BETWEEN 10000 and 17000 �̶�� �������ִ�.
    salary >= 10000 AND salary <= 17000;

SELECT
    first_name,
    last_name,
    salary,
    department_id
FROM
    employees
WHERE
--salary BETWEEN 10000 and 17000 �̶�� �������ִ�.
    NOT ( salary >= 10000 AND salary <= 17000 );
    
SELECT
    first_name,
    last_name,
    salary,
    department_id
FROM
    employees
WHERE
    NOT (salary BETWEEN 10000 AND 17000) 
    AND department_id is null; --�μ� ������ �ȵ� ����� ���� ���
    
    --���� ������ (UNION, UNION ALL, INTERSECT, MINUS)
SELECT
    employee_id,
    salary
FROM
    employees
WHERE
    salary >= 20000
    OR salary <= 2100
--UNION --�ߺ��Ȱ��� �Ѱ��� 
--UNION ALL --�ߺ��� �������� �ʰ� ����Ѵ�
--INTERSECT --�ߺ��Ȱ͸� ������ش�.
MINUS --���� �˻��� ������� �ڿ��˻� ����� ���°�.
SELECT
    employee_id,
    salary
FROM
    employees
WHERE
    salary <= 2200;

--���� (= or)�� �����ϴ� �Ŷ��
SELECT
    department_id,
    salary
FROM
    employees
WHERE
    department_id IN ( 10, 20, 100 );
    
--ANY�� ���� ũ��,�۴�,�̻�,���ϸ� �����ϴ°�, �������� ���� ���������� ����ؼ� �������ش�
--ANY : > �϶������͵��߿��� ���� ���� �ͺ��� ū�͵�
--ANY : < �϶������͵��߿��� ���� ū �ͺ��� �����͵�
--ALL : > �϶������͵��߿��� ���� ū �ͺ��� ū�͵�
--ALL : < �϶������͵��߿��� ���� ���� �ͺ��� �����͵�
SELECT
    department_id,
    salary
FROM
    employees
WHERE
    department_id > ANY ( 50,
                          20,
                          100 ); --���� ���� �ͺ��� ū�͵�
    
SELECT
    department_id,
    salary
FROM
    employees
WHERE
    department_id < ANY ( 50,
                          20,
                          100 ); --���� ū �ͺ��� �����͵�
    
SELECT
    department_id,
    salary
FROM
    employees
WHERE
    department_id > ALL ( 50,
                          20,
                          100 ); --���� ū �ͺ��� ū�͵�
    
SELECT
    department_id,
    salary
FROM
    employees
WHERE
    department_id < ALL ( 50,
                          20,
                          100 ); --���� ���� �ͺ��� �����͵�
    
--LIKE
SELECT
    first_name,
    last_name
FROM
    employees
WHERE
--    last_name LIKE 'King'; -- last_name = 'King'; �� ���� ȿ��
--    last_name LIKE 'K%'; --last_name�� K�� �����ϴ�
--    last_name LIKE '%t%'; --t��� ���ڰ� ���Ե�
--    last_name LIKE '%ing'; --last_name�� ing�� ������
        last_name LIKE '_e%'; -- �ι�° ���ڰ� e�� �����ϴ�

-- ���� ������( || )
SELECT
    first_name || last_name --�� �پ ��µȴ�
FROM
    employees;

SELECT
    first_name || ' ' || last_name
FROM
    employees;
    
SELECT
    first_name || ' ' || last_name || '�� ����[' || salary || ']' AS "����"
FROM
    employees;


select employee_id from employees
where not (salary >1000 and salary < 12000);

--LIKE ���� %_ �˻��ϴ¹�
create table test2(fname varchar2(20));
insert into test2 values('S1234');
insert into test2 values('1234S_1234');
insert into test2 values('$S_1234');
insert into test2 values('sssS_1234');
insert into test2 values('THE X\_Y');
insert into test2 values('THE1 X_Y');
insert into test2 values('THE X\&Y');
insert into test2 values('THE X&Y');
insert into test2 values('THE2 X_Y');
insert into test2 values('THE2 90%');
insert into test2 values('THE2 30%');

select fname from test2 where fname like '%\%%' escape '\';
select fname from test2 where fname like '%\_%' escape '\';