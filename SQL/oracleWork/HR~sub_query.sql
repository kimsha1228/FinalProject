--서브쿼리

--단일행 서브쿼리
select * from employees where salary < 6000;
select round(avg(salary)) from employees; --서브쿼리

select employee_id, first_name,last_name,salary,hire_date,job_id from employees where salary <
(select round(avg(salary)) from employees); --합친것

select MAX(salary) from employees; --서브쿼리

select * from employees where salary=(select MAX(salary) from employees); -- 합친것

-- 복수행 단일칼럼
--all
select salary from employees where department_id=30; --서브쿼리

select * from employees where salary > all --큰큰
(select salary from employees where department_id=30);


--IN
--여러 개의 결과값 중에서 비교값과 같은 값을 찾을때
--사원테이블에서 업무별로 최소 급여를 받는 사원의 정보를 사원번호,
--이름,업무,입사일자,급여,부서번호를 출력하라.

select min(salary) from employees group by job_id;

select employee_id, first_name||' '||last_name,job_id,hire_date,salary,department_id
from employees
where salary in (select min(salary) from employees group by job_id);

SELECT first_name||' '||last_name,job_id,hire_date,salary,department_id
FROM employees
WHERE salary > ANY
(select avg(salary) from employees
where salary>= 14000 group by job_id);

--80번 부서 사원들의 급여보다 많은 급여를 받는 사원을 출력하라.
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

-- 사원 테이블에서 부하직원이 없는 사원의 모든 정보를 exists를 이용하여 작성
-- 즉, 부하 직원이 없는 사원들만 출력하세요.
select * from employees e1
where not exists(
select employee_id from employees e2
where e1.employee_id = e2.manager_id);



--복수행 복수칼럼

--업무별로 최소급여를 받는 사원의 정보를 사원번호,이름,업무,급여,부서번호를 출력하여라.

SELECT * FROM employees
where (job_id,salary) in 
(SELECT job_id,min(salary) FROM employees
group by job_id);


SELECT job_id,min(salary) FROM employees
group by job_id;

--테이블에서 적어도 한명의 사원으로부터 보고를 받을수 있는 사원의정보를
--사원번호,이름,업무,입사일자,급여를 출력하라.
-- 즉, 보고받을 부하 직원이 있는 사원들만 출력하세요.
select * from employees e1
where exists(
select employee_id from employees e2
where e1.employee_id = e2.manager_id);

--소속부서의 평균 급여보다 많은 급여를 받는 사원을 출력하라.
select * from employees e1
where salary > (
select avg(salary) from employees e2
where e1.department_id = e2.department_id);


--insert into table_name(columns,,,) values(datas,,,,);
--update table_name set column = ' ', column2=' ' where ~~~~
--delete from table_name where ~~~
--commit or rollback 가능

--특정인의 급여로 바꿔라
update employees set salary=(select salary from employees where employee_id=101) 
where employee_id=100;

select salary from employees where employee_id=101;

select * from employees;

--특정인의 업무로 바꿔라
update employees set job_id = 
(SELECT job_id FROM employees WHERE first_name = 'John' and last_name = 'Chen')
where first_name='David' and last_name = 'Austin';

SELECT job_id FROM employees WHERE first_name = 'David' and last_name = 'Austin';

--DELETE subQuery
--최소급여를 받는 사원들을 삭제 하라.

delete from employees where salary=(select min(salary) from employees);

select min(salary) from employees;

select * from employees;


--jdbc subquery
select employee_id, first_name,last_name,salary,hire_date,job_id 
from employees 
where salary >
(select round(avg(salary)) from employees);

