--function
--������ �Լ� >> ����Լ�- SUM,COUNT,MAX,MIN,AVG ���..
--������ �Լ� >> �� : ������ȯ�Լ� tochar����

--����Լ�
--��ü����� �˻�
SELECT
    COUNT(*)
FROM
    employees; --employees ���̺��� ���� ���� ��ȯ
    
--COUNT�� NULL�� �����ʴ´�
SELECT 
    COUNT(*),
    COUNT(commission_pct) 
FROM 
    employees;


--�Ŵ� ������ ��ü����� �޿��� ��
SELECT
    SUM(salary)
FROM
    employees;

--������� �ְ�޿�
SELECT
    MAX(salary)
FROM
    employees;

--������� �����޿�
SELECT
    MIN(salary)
FROM
    employees;

--������� ��ձ޿�
SELECT
    round(AVG(salary), 2)
FROM
    employees;
    
--NULL ���ΰ͵� ��� ���� �־�ߵǸ� NVL�� �־�����Ѵ�
SELECT avg(commission_pct), --NULL���� �ƿ� ��հ������� �����Ѵ�
        avg(nvl(commission_pct,0)) 
FROM employees;

--�ƽ�Ű�ڵ�
SELECT
    CHR(97)
FROM
    dual; --chr�� ���ڸ� �ƽ�Ű�ڵ带 �������� ��ȯ
SELECT
    ascii('a')
FROM
    dual; --ASCII�� ���ڸ� �ƽ�Ű�ڵ� ���ڷ� ��ȯ

--CONCAT ���ڿ� ���̱�
SELECT
    first_name,
    job_id
FROM
    employees;

SELECT
    first_name || job_id
FROM
    employees; --���̶� ���� ���
SELECT
    concat(first_name, job_id)
FROM
    employees; --������ _�� ǥ�����ش�
SELECT
    concat(first_name, ' is a '),
    job_id
FROM
    employees; --������ _�� ǥ�����ش�

--��ҹ��ں���
SELECT
    lower(first_name),
    upper(first_name)
FROM
    employees;

--PAD �����ֱ�
SELECT
    lpad('yangssem', 17, '!@#')
FROM
    dual;

SELECT
    lpad(first_name, 13, '!@#'),
    rpad(first_name, 13, '!@#')
FROM
    employees;

--TRIM ���ϴ� ���ڸ� ����(������ �յڿ��� �����Ѵ�)
SELECT
    ltrim('AA123456AA', 'AA')
FROM
    dual;

SELECT
    rtrim('AA123456AA', 'AA')
FROM
    dual;

--�ǵ������� ������ �ƴϰ� ��½ÿ��� �����ϴ°�
SELECT
    replace('YANG AND SAM', 'SA', 'SEX')
FROM
    dual;

SELECT
    job_id,
    replace(job_id, 'AC', 'TC')
FROM
    employees;

-- ���ڿ� �Ϻ� ����
SELECT
    substr('ABCDEFG', 3, 2)
FROM
    dual;

SELECT
    substr('ABCDEFG', 3, 4)
FROM
    dual;

--INSTR �ڹ��� indexof�� ����ϸ� ã�� ���ڿ��� ��ġ�� ��ȯ�Ѵ�!
SELECT
    instr('010-2222-8888', '-')
FROM
    dual;
--INSTR(�������ڿ�', ��ã����� ���ڿ�', ���°����, ���°�ߺ������ΰ�)
SELECT
    instr('CORPORATE FLOOR', 'OR', 1, 2)
FROM
    dual;

--���ڿ��� ����
SELECT
    first_name,
    length(first_name)
FROM
    employees;

--������� �̸��� 7�����̻��� ����鸸 ���
SELECT
    first_name,
    length(first_name)
FROM
    employees
WHERE
    length(first_name) >= 7;

--GREATEST ���� ū��, ���ڿ��� �ִ밪
SELECT
    greatest('CC', 'ABCDE', 'ADBDDW')
FROM
    dual; --���⼱ C�� ���� ũ��
SELECT
    greatest('12', '132', '34')
FROM
    dual; --���ڿ��̹Ƿ� 3�� ���� ũ��
SELECT
    greatest(12, 132, 34)
FROM
    dual; --�������̹Ƿ� 132�� ���� ũ��

--LEAST ���� ������, ���ڿ��� �ּҰ�
SELECT
    least('CC', 'ABCDE', 'ADBDDW')
FROM
    dual; --���⼱ AB% �� ���� �۴�
SELECT
    least('123', '132', '34')
FROM
    dual; --���ڿ��̹Ƿ� 12%�� ���� �۴�
SELECT
    least(123, 132, 34)
FROM
    dual; --�������̹Ƿ� 34�� ���� �۴�

--NVL ���� NULL�� �ö��� ��ü�� ����
--NVL(�÷���,����) �÷��� NULL�̸� ���ڷ� ��ü
SELECT
    salary,
    commission_pct,
    nvl(commission_pct, 5),
    salary + ( salary * nvl(commission_pct, 5) )
FROM
    employees;

--NVL2(�÷���,����1,����2) �÷��� NULL�̸� ����2, NULL�� �ƴϸ� ����1
SELECT
    salary,
    commission_pct,
    nvl2(commission_pct, 5, 10),
    salary + ( salary * nvl2(commission_pct, 5, 10) )
FROM
    employees;

--DECODE �÷��� �����ϴ� �б⹮ (���̸� WHERE)
--DECODE (�÷���,'���ڿ�',���ϰ��)
--DECODE (�÷���,'���ڿ�',���ϰ��,�����ϰ��)
--DECODE (�÷���,'���ڿ�1',���ϰ��,'���ڿ�2',���ϰ��,�����ϰ��)
SELECT
    last_name,
    job_id,
    salary,
    decode(job_id, 'IT_PROG', salary * 1.1, salary) AS "�Ǽ��ɾ�"
FROM
    employees;

SELECT
    last_name,
    job_id,
    salary,
    decode(job_id, 'IT_PROG', salary * 1.1, 'AD_VP', salary * 1.2,
           'AD_PRES', salary * 1.5, salary) AS "�Ǽ��ɾ�"
FROM
    employees;

--DECODE ��� CASE~WHEN~THEN~END�� ������ �ִ�
SELECT
    last_name,
    job_id,
    salary,
    CASE job_id
        WHEN 'IT_PROG'  THEN
            salary * 1.1
        WHEN 'AD_VP'    THEN
            salary * 1.2
        WHEN 'AD_PRES'  THEN
            salary * 1.5
        ELSE
            salary
    END AS "�Ǽ��ɾ�"
FROM
    employees;
    
    
------------------------------------------------ 2) ��¥�����Լ�
SELECT SYSDATE FROM DUAL; --���� ��¥�� ��ȯ

SELECT HIRE_DATE, ADD_MONTHS(HIRE_DATE, -3)
from employees where employee_id=100;

SELECT sysdate,
ADD_MONTHS(sysdate, 1),
ADD_MONTHS('23/05/05', 1),
ADD_MONTHS('23/12/06', 1)
from dual;

--�ش� ���� ������ ��!
select HIRE_DATE, LAST_DAY(HIRE_DATE), from employees;

-- NEW_TIME ǥ�ؽø� ��ȯ���ش�
select HIRE_DATE, NEW_TIME(HIRE_DATE, 'GMT', 'PDT')
from employees where EMPLOYEE_ID=100;

--MONTHS_BETWEEN ��¥������ �������� �˷��ش�
select hire_date, sysdate, MONTHS_BETWEEN(sysdate, hire_date)
from employees where employee_id = 100;
--����Ϸκ��� ���ñ��� ����̳� ���߳�?
select sysdate,hire_date, MONTHS_BETWEEN(sysdate,hire_date) from employees;

--NEXT_DAY ���� ����� ���ϼ���(1:�Ͽ��� 2:������ .... 7:�����)
SELECT NEXT_DAY(sysdate,3) from dual; --���� ����� ȭ������ �����ΰ�?

-- TO_CHAR: ��¥ �����ͳ� ��¥ �÷��� Ư�� �������� ��ȯ
SELECT SYSDATE, 
TO_CHAR(SYSDATE,'D'), --1~7 ��~��
TO_CHAR(SYSDATE,'DAY'), --�ѱ۷� ������������
TO_CHAR(SYSDATE,'DY'), -- �ѱ۷� ������������ �ѱ��ڷ�
TO_CHAR(SYSDATE,'DD'),  -- �޷»� ��ĥ
TO_CHAR(SYSDATE,'MM'), --�޷»� ���
TO_CHAR(SYSDATE,'MONTH'), --������� �ѱ۷�
TO_CHAR(SYSDATE,'YYYY') --�޷»� ���
from dual;

SELECT SYSDATE, 
TO_CHAR(SYSDATE,'YYYY-MM-DD'),
TO_CHAR(SYSDATE,'fmYYYY-MM-DD') --0�� ������
from dual; 

SELECT SYSDATE, 
TO_CHAR(SYSDATE,'YYYY-MM-DD'),
TO_CHAR(SYSDATE,'HH:MI:SS') --�ú���
from dual; 

--���� ��ȯ �Լ�, ����Ŭ�� �ڵ�ĳ���ñ�ɵ� �ִ�.
select TO_NUMBER('100')+1, '100'+1 from dual; --���ڿ� 100�� ������ 100���� ��ȯ
select to_number('3.14') from dual;

--��¥ �������� ��ȯ�ϴ� �Լ�
SELECT sysdate, TO_DATE(sysdate,'yy/mm/dd') from dual;
SELECT '13��-03��-20��', TO_DATE('13-03-20','dd/mm/yy') from dual;

--USER ���� DB�� ������� ���� ��ȯ
SELECT USER from dual; --Ŀ��Ʈ�� �� HR�� ��ȯ�ȴ�



---------------------------------------------���� ���� �Լ�

--ABS //���밪 - �Ǵ� + ��ȣ�� ��� ��
SELECT ABS(-5135) from dual;

--�ø�
SELECT CEIL(11.001) FROM DUAL;  --������ �ݿø��Ѵ�

--����
SELECT FLOOR(11.9999) FROM DUAL; --������ ������

--�ݿø�
SELECT ROUND(22.5) FROM dual;
SELECT ROUND(22.005, 2 ) FROM dual; -- 2�ڸ����� �ݿø���
--����
SELECT AVG(Salary),
CEIL(AVG(Salary)),
FLOOR(AVG(Salary)),
ROUND(AVG(Salary)), --�ݿø�
ROUND(AVG(Salary),2) from employees; 

-- ���� �ڻ��� ź��Ʈ
SELECT COS(180*3.14/180) from dual;

--MOD(num1,num2) num1�� num2�� ���� ���������� ��ȯ
SELECT MOD(11,4) from dual;

--POWER ����
SELECT POWER(2,7) from dual; --2�� 7����

--TRUNC = ROUND+FLOOR = Ư���ڸ��� �ر��� ��
SELECT TRUNC( 99.123456 , 3 ) FROM DUAL;

--------------------------GROUP BY���� HAVING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT department_id,salary from employees; --���⼭ �μ����� ����� ����ʹ�?

--�μ����� �����!
SELECT department_id, FLOOR(AVG(salary)) from employees
GROUP BY department_id; --�׷�� Į���� SELECT�� �ݵ�� �־�� �ȴ�

--NULL�ΰ� �����ϰ� ������.. HAVING�� ����
SELECT department_id, FLOOR(AVG(salary)) from employees
--WHERE department_id is not null --�׷캰 ó���� ������
GROUP BY department_id
HAVING department_id is not null; --�׷캰 ó���� ������

--������ �޿� ���?
SELECT job_id, FLOOR(AVG(salary)) from employees
GROUP BY job_id; --�׷�� Į���� SELECT�� �ݵ�� �־�� �ȴ�

SELECT location_id,department_name
from departments
group by location_id,department_name; --GROUPBY�� ���� SELECT�� �ݵ�� �־���Ѵ�

--������ �� �޿���
SELECT job_id, FLOOR(SUM(salary)) from employees
GROUP BY job_id; --�׷�� Į���� SELECT�� �ݵ�� �־�� �ȴ�
















------------------------����Ǯ��--------------------------------
--Q1:���� 8000�̻��� ������� �μ��� ��տ����� �ݿø����� ����϶�
SELECT department_id, ROUND(AVG(salary))
FROM EMPLOYEES
WHERE salary >=8000
GROUP BY department_id;

--Q2:���� 8000�̻��� ������� �μ��� ��տ����� �ݿø���
--�� �μ���ȣ�� ������������ �����϶�
select department_id, ROUND(AVG(salary))
from employees
WHERE salary >= 8000
GROUP BY department_id
ORDER BY department_id DESC;

--//Q3:���� 8000�̻��� ������� �μ��� ��տ����� �ݿø���
--�� ��տ����� �ݿø������� �������� �����϶�
SELECT department_id, ROUND(AVG(Salary))
FROM EMPLOYEES
where salary >= 8000
GROUP BY department_id
ORDER BY ROUND(AVG(Salary));

--�ش�
--SELECT DEPARTMENT_ID,ROUND(AVG(SALARY)) AS R FROM EMPLOYEES
--WHERE SALARY>=8000
--GROUP BY DEPARTMENT_ID
--ORDER BY R ASC;


--Q4:���� 10000�̻��� ������� �μ��� ��տ����� �ݿø���
--�� �μ���ȣ�� �������� �����϶�
SELECT department_id, ROUND(AVG(salary)) AS "��տ���"
FROM employees
WHERE salary >= 10000
GROUP BY department_id
ORDER BY department_id ASC;

--Q5:�� �μ��� ���� ������ �ϴ� ����� �ο����� ���Ͽ�
--�μ���ȣ,������,�ο����� ����϶�.
--(��, �μ���ȣ�� ���������� ���� �������� ����!)
SELECT department_id AS "�μ���ȣ",job_id AS "������",COUNT(*) AS "�ο���"
FROM employees
GROUP BY department_id,job_id
ORDER BY �μ���ȣ desc,
              ������ desc;
            
--�ش�
--SELECT DEPARTMENT_ID,JOB_ID,count(*) FROM EMPLOYEES
--GROUP BY DEPARTMENT_ID,JOB_ID
--ORDER BY DEPARTMENT_ID DESC,JOB_ID DESC;

--Q6:��� ���̺��� ������ ���ID�� ����ϵ�
--������ 12000�� ����� ��׿����ڶ�� ����϶�.
SELECT salary,employee_id,DECODE(salary,12000,'��׿�����')
FROM EMPLOYEES;

--//Q7:��� ���̺��� ������ ���ID�� ����ϵ�
--������ 12000�̻��� ����� ��� ��׿����ڶ��
--����϶�. (��, �ְ������� 24000�̴�.)
SELECT salary, employee_id,
    CASE WHEN
         SALARY >= 12000 THEN '��׿�����'
    END AS "���"
FROM EMPLOYEES;

--�ش�
--select salary,employee_id,case when salary between 12000 and
--24000 then '��׿�����' end ��� from employees;

--//Q8:��� ���̺��� ������ ���ID�� ����ϵ�
--������ 20000�̻��� ����� 1�޿�����,
--������ 15000 ���� 19000 ������ ����� 2�޿�����,
--������ ��Ÿ������ ����� 3�޿����� ��� ����϶�.
--(��, �ְ������� 24000�̴�.)

SELECT salary, employee_id,
    CASE
        WHEN salary >= 20000 THEN '1�޿�����'
        WHEN salary BETWEEN 15000 and 19000 THEN '2�޿�����'
        ELSE '3�޿�����'
    END AS "���"
FROM EMPLOYEES
ORDER BY SALARY;

select floor(dbms_random.value()*49)+1 from dual;