-- JOIN!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

--�ϴ� ��ȸ
SELECT Employee_id,  first_name,department_id
from employees;

--department_id�� �̸��� �˰�;�...
select department_id,department_name
from departments;

--�Ѳ����� ������ ����? department_id�������� ������ �����ұ�?
SELECT employee_id, first_name, 
employees.department_id,
departments.department_name
from employees, departments
where employees.department_id = departments.department_id; --����Ŭ�� ����
--NULL�� �ִ°�(employees.department_id�� NULL�γ�)�� �����Ǽ� 106���� ���´�.

SELECT employee_id, first_name, 
employees.department_id,
departments.department_name
from employees join departments
on employees.department_id = departments.department_id; --ANSI�� ����

--2) ������̺�� �μ����̺��� �����ؼ� ���ID�� 100�� ����� ���ID�� �ٹ�
--��ID�� ����ض�.
SELECT employee_id, first_name, 
departments.location_id
from employees, departments
where employees.department_id = departments.department_id
AND employees.employee_id=100 ; --����Ŭ�� ����
SELECT employee_id, first_name, 
departments.location_id
from employees JOIN departments
on employees.department_id = departments.department_id
AND employee_id=100 ; --ANSI�� ����

--���̺� ��Ī �ο�
SELECT employee_id, first_name, 
e.department_id,
d.department_name
from employees e, departments d --AS�� ���̸� ����
where e.department_id = d.department_id; --����Ŭ�� ����
SELECT employee_id, first_name, 
e.department_id,
d.department_name
from employees e join departments d --AS�� ���̸� ����
on e.department_id = d.department_id; --ANSI ����

--3 ���̺����� ���� 
--�ϴ� emps+jobs�� ����
Select e.employee_id as �����ȣ, j.job_title as ��������
from employees e , jobs j
where e.job_id=j.job_id; --����Ŭ��
Select e.employee_id as �����ȣ, j.job_title as ��������
from employees e join jobs j
on (e.job_id=j.job_id); --ANSI ��

--(emps join dept) join job ����Ŭ���� ���μ����� �� ���Ѿ��Ѵ� 
Select e.employee_id as �����ȣ,
    d.department_name as �ٹ��μ�, 
    j.job_title as ��������
from employees e , departments d, jobs j
where e.department_id=d.department_id 
    and e.job_id=j.job_id; --����Ŭ��
    
Select e.employee_id as �����ȣ,
    d.department_name as �ٹ��μ�, 
    j.job_title as ��������
from employees e 
    join departments d on (e.department_id=d.department_id)
    join jobs j on (e.job_id=j.job_id); --ANSI ��

--������̺�� �μ����̺�,�������̺��� �����ؼ� ���ID�� 100�� ����� ���ID
--�� �ٹ���ID,�������� ����ض�.
SELECT e.employee_id ���ID, d.location_id �ٹ���ID, j.job_title ��������
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
    AND j.job_id = e.job_id
    AND e.employee_id=100; --����Ŭ��
    
SELECT e.employee_id ���ID, d.location_id �ٹ���ID, j.job_title ��������
FROM employees e 
join departments d
on e.department_id = d.department_id
join jobs j
on j.job_id = e.job_id
WHERE employee_id=100; --ANSI��


--(depts join loc) join country
select d.department_id,d.department_name,l.city, l.country_id, c.country_name
from departments d join locations l
on (d.location_id=l.location_id)
join countries c
on (l.country_id=c.country_id);

--Q1) employees �� departments ���̺��� �����Ͽ� ����̸��� ��Steven����
--����� �̸��� ��, �μ����� ����ϵ� �μ����� Executive�϶��� ����
--��, Shipping�϶��� �߼ۺζ�� ����϶�.
Select e.first_name AS �̸� ,e.last_name AS ��,
CASE
    WHEN d.department_name ='Executive' THEN '������'
    WHEN d.department_name ='Shipping' THEN '�߼ۺ�'
    ELSE '����'
END AS �μ���,
CASE d.department_name
    WHEN 'Executive' THEN '������'
    WHEN 'Shipping' THEN '�߼ۺ�'
    ELSE '����'
END AS �μ���
FROM employees e join departments d
on e.department_id = d.department_id
WHERE e.first_name='Steven';


--Q2) employees �� departments ���̺��� �����Ͽ� �޿��� 12000�̻���
--����� �μ�ID,�μ���,�̸�,�޿��� ����϶�.(�޿��� ������������ ����)
SELECT e.department_id as �μ�ID, 
    d.department_name as �μ���,
    e.first_name as �̸�,
    e.salary as �޿�
FROM employees e JOIN departments d
ON e.department_id=d.department_id
WHERE e.salary >= 12000
ORDER BY e.salary DESC;


----------------------------
--NON EQUI Join
select e.employee_id,e.salary,s.min_sal,s.max_sal,s.grade
from employees e 
join sal_grade s 
    ON e.salary between s.min_sal and s.max_sal
where department_id=30;


-- SELF JOIN
--employees ���̺��� �ڽ��� �Ŵ����� �̸��� �˻��ϼ���.
Select e1.employee_id,e1.first_name as ���, e2.first_name as �Ŵ���
FROM employees e1, employees e2
WHERE e1.manager_id = e2.employee_id
order by e1.employee_id;


--left outer join
--���� ���̺��� �ش絥���Ͱ� �����ϴµ� �ٸ��� ���̺� ��������
--������� ��� �����͸� ����ϰ� �ϴ� ����
select e1.employee_id,e1.first_name,e2.first_name
from employees e1, employees e2
WHERE e1.manager_id = e2.employee_id (+)
order by e1.employee_id; --����Ŭ��

select e1.employee_id,e1.first_name,e2.first_name
from employees e1 left join employees e2
on e1.manager_id = e2.employee_id
order by e1.employee_id; --ANSI��

--right outer join
-- �����ʿ��ִ� ���͵��� ���´�
-- ���� �� ����� ���� �μ��� ���� ��µǵ��� �Ұ�
select e1.employee_id,e1.first_name, d.department_name
from employees e1, departments d
where e1.department_id(+)  = d.department_id;
select e1.employee_id,e1.first_name, d.department_name
from employees e1 right join departments d
on e1.department_id  = d.department_id;

--������ �μ������� �ȵ� ����� ����Ұ�!
select e1.employee_id,e1.first_name, d.department_name
from employees e1 left join departments d
on e1.department_id  = d.department_id;

--using
--on e1.department_id  = d.department_id; ������ ����ؼ� ���� ����
select e1.employee_id,e1.first_name, d.department_name
from employees e1 join departments d
using (department_id);

--full outer join
--���ʿ� �ΰ��̶� �����ʿ� �ִ� �ΰ��� �� ������ش�
select nvl(e1.employee_id, 0 ) as ���, --����� ���̸� 0 ��� (NUMBER)
NVL(e1.first_name,'�������') AS �̸�, --����� ���̸� ��������� ���
NVL(d.department_name,'�μ�����') AS �μ��� --�μ����� ������ �μ������� ���
from employees e1 full join departments d
using (department_id);
