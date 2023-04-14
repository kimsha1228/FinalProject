--��������

--������ ��������
select * from employees where salary < 6000;
select round(avg(salary)) from employees; --��������

select employee_id, first_name,last_name,salary,hire_date,job_id from employees where salary <
(select round(avg(salary)) from employees); --��ģ��

select MAX(salary) from employees; --��������

select * from employees where salary=(select MAX(salary) from employees); -- ��ģ��

-- ������ ����Į��
--all
select salary from employees where department_id=30; --��������

select * from employees where salary > all --ūū
(select salary from employees where department_id=30);


--IN
--���� ���� ����� �߿��� �񱳰��� ���� ���� ã����
--������̺��� �������� �ּ� �޿��� �޴� ����� ������ �����ȣ,
--�̸�,����,�Ի�����,�޿�,�μ���ȣ�� ����϶�.

select min(salary) from employees group by job_id;

select employee_id, first_name||' '||last_name,job_id,hire_date,salary,department_id
from employees
where salary in (select min(salary) from employees group by job_id);

SELECT first_name||' '||last_name,job_id,hire_date,salary,department_id
FROM employees
WHERE salary > ANY
(select avg(salary) from employees
where salary>= 14000 group by job_id);

--80�� �μ� ������� �޿����� ���� �޿��� �޴� ����� ����϶�.
select salary from employees where department_id=80;
select * from employees
where salary < all
(select salary from employees where department_id=80);

--EXISTS
SELECT DISTINCT department_id from employees;

select * from departments
where exists (
SELECT DISTINCT department_id from employees
WHERE departments.department_id = employees.department_id);

-- ��� ���̺��� ���������� ���� ����� ��� ������ exists�� �̿��Ͽ� �ۼ�
-- ��, ���� ������ ���� ����鸸 ����ϼ���.
select * from employees e1
where not exists(
select employee_id from employees e2
where e1.employee_id = e2.manager_id);



--������ ����Į��

--�������� �ּұ޿��� �޴� ����� ������ �����ȣ,�̸�,����,�޿�,�μ���ȣ�� ����Ͽ���.

SELECT * FROM employees
where (job_id,salary) in 
(SELECT job_id,min(salary) FROM employees
group by job_id);


SELECT job_id,min(salary) FROM employees
group by job_id;

--���̺��� ��� �Ѹ��� ������κ��� ���� ������ �ִ� �����������
--�����ȣ,�̸�,����,�Ի�����,�޿��� ����϶�.
-- ��, ������� ���� ������ �ִ� ����鸸 ����ϼ���.
select * from employees e1
where exists(
select employee_id from employees e2
where e1.employee_id = e2.manager_id);

--�ҼӺμ��� ��� �޿����� ���� �޿��� �޴� ����� ����϶�.
select * from employees e1
where salary > (
select avg(salary) from employees e2
where e1.department_id = e2.department_id);


--insert into table_name(columns,,,) values(datas,,,,);
--update table_name set column = ' ', column2=' ' where ~~~~
--delete from table_name where ~~~
--commit or rollback ����

--Ư������ �޿��� �ٲ��
update employees set salary=(select salary from employees where employee_id=101) 
where employee_id=100;

select salary from employees where employee_id=101;

select * from employees;

--Ư������ ������ �ٲ��
update employees set job_id = 
(SELECT job_id FROM employees WHERE first_name = 'John' and last_name = 'Chen')
where first_name='David' and last_name = 'Austin';

SELECT job_id FROM employees WHERE first_name = 'David' and last_name = 'Austin';

--DELETE subQuery
--�ּұ޿��� �޴� ������� ���� �϶�.

delete from employees where salary=(select min(salary) from employees);

select min(salary) from employees;

select * from employees;


--jdbc subquery
select employee_id, first_name,last_name,salary,hire_date,job_id 
from employees 
where salary >
(select round(avg(salary)) from employees);

