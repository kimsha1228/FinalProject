-- 모든 테이블을 조회
SELECT
    *
FROM
    tab;

-- * 은 모든 칼럼을 선택
--SELECT country_id,country_name,region_id from countries;  와 같다
SELECT
    *
FROM
    countries;

-- 테이블 칼럼명들을 보여준다
DESC countries;

SELECT
    *
FROM
    departments;

--모든 사원들의 모든 칼럼정보
SELECT
    *
FROM
    employees;

--150번보다 큰 사번을 사원번호 이름 성 급여, 단 급여에서 내림차순정령
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

--Distinct(중복을 제거)
--select job_id from employees;
--모든 사원들 정보중에서 job_id을 출력
--select all job_id from employees;
--모든 사원들 정보중에서 job_id을 출력, 중복은 제거
SELECT DISTINCT
    job_id
FROM
    employees;

--ORDER BY
--모든 사원들의 정보중에서 사번과 급여가 출력
SELECT
    employee_id,
    salary
FROM
    employees;
--모든 사원들의 정보중에서 사번과 급여가 출력하고 단 급여를 기준으로 오름차 정렬
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
    salary ASC; --적지 않은것과 같은 효과, 오름차순
--모든 사원들의 정보중에서 사번과 급여가 출력하고 단 급여를 기준으로 내림차 정렬
SELECT
    employee_id,
    salary
FROM
    employees
ORDER BY
    salary DESC; --내림차순
--모든 사원들의 정보중에서 사번과 급여가 출력하고 단 job_id를 먼저 정렬하고 급여기준으로 정렬
SELECT
    job_id,
    salary
FROM
    employees
ORDER BY
    job_id,
    salary; --일단 job_id 기준으로 정렬한 다음, job_id가 같은 row들을 salary 기준으로 다시 정렬

SELECT
    job_id,
    salary
FROM
    employees
ORDER BY
    job_id ASC,
    salary ASC;
--모든 사원들의 정보중에서 사번과 급여가 출력하고 단 job_id를 먼저 정렬하고 급여기준으로 내림차 정렬
SELECT
    job_id,
    salary
FROM
    employees
ORDER BY
    job_id,
    salary DESC; --일단 job_id 기준으로 정렬한 다음, job_id가 같은 row들을 salary 기준으로 내림차순 정렬
--모든 사원들의 정보중에서 사번과 급여가 출력하고 단 job_id를 먼저 내림차 정렬하고 급여기준으로 내림차 정렬
SELECT
    job_id,
    salary
FROM
    employees
ORDER BY
    job_id DESC,
    salary DESC; --둘다 내림차순으로
    
--ALIAS (별칭) 숫자나 특문을 넣을거라면 ""으로 덮어줘야 한다.
--모든 사원 정보 중에서 직업(별칭을 눈치껏)과 봉급(별칭을 눈치껏)을 출력
SELECT
    job_id  "직업",
    salary  "봉급"
FROM
    employees;

SELECT
    job_id  직업,     --숫자나 특문은 아니라서 덮어주지 않아도 동작함
    salary  "봉급"
FROM
    employees;

SELECT
    job_id  "직업",
    salary  "봉급 #@" --특문이 들어가서 ""으로 덮어줘야한다
FROM
    employees;

SELECT
    job_id,
    salary AS "봉급 \천원" -- 원래는 AS를 붙여야되지만 안 붙여도 별칭으로 동작
FROM
    employees;

SELECT
    job_id  id,
    salary  AS 봉급
FROM
    employees;

SELECT
    job_id  AS id,
    salary  AS "1004"
FROM
    employees;

-- where 조건문
--모든 사원중에서 부서번호가 10인 사원의 사번,부서번호 출력
SELECT
    employee_id,
    department_id
FROM
    employees
WHERE
    department_id = 10;

--employee id는 100부터 시작이라 아무것도 조회되지않는다
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

-- 모든 사원중에서 job_id가 IT_PROG인 사원의 job_id와 first_name으로 출력하되 firstname기준으로정렬
SELECT
    job_id,
    first_name
FROM
    employees
WHERE
    job_id = 'IT_PROG' --""로는 조회가 안된다
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
    
    --산술 연산자 ( * , / , + , - )
--모든 사원들중 10번 부서인 사원들의 이름, 급여가 10프로인상 된 상태를 출력
SELECT
    first_name,
    last_name,
    salary * 1.1 AS "급여10프로인상분",
    salary + 1000,
    salary / 1000,
    salary - 1000
FROM
    employees
WHERE
    department_id = 10;

--모든 사원들중 급여가 15000이상인 사원들의 성 이름 급여 출력
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 15000;

--모든 사원들중 부서번호가 50이 아닌 사원들의 성 이름 부서번호 출력

SELECT
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id != 50;
    
--논리 연산자 (AND OR NOT)
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

--모든 사원들중 급여가 11000,12000,15000인 사원들의 성 이름 급여 부서번호 출력
SELECT
    first_name,
    last_name,
    salary,
    department_id
FROM
    employees
WHERE
--salary in(11000,12000,15000) 이렇게 할수도 있다.
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
--salary BETWEEN 10000 and 17000 이라고 쓸수도있다.
    salary >= 10000 AND salary <= 17000;

SELECT
    first_name,
    last_name,
    salary,
    department_id
FROM
    employees
WHERE
--salary BETWEEN 10000 and 17000 이라고 쓸수도있다.
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
    AND department_id is null; --부서 배정이 안된 사원은 빼고 출력
    
    --집합 연산자 (UNION, UNION ALL, INTERSECT, MINUS)
SELECT
    employee_id,
    salary
FROM
    employees
WHERE
    salary >= 20000
    OR salary <= 2100
--UNION --중복된것은 한개만 
--UNION ALL --중복을 제거하지 않고 출력한다
--INTERSECT --중복된것만 출력해준다.
MINUS --먼저 검색한 결과에서 뒤에검색 결과를 빼는것.
SELECT
    employee_id,
    salary
FROM
    employees
WHERE
    salary <= 2200;

--여러 (= or)을 연산하는 거라면
SELECT
    department_id,
    salary
FROM
    employees
WHERE
    department_id IN ( 10, 20, 100 );
    
--ANY는 여러 크다,작다,이상,이하를 연산하는것, 실전에선 보통 서브쿼리를 사용해서 지정해준다
--ANY : > 일땐데이터들중에서 가장 작은 것보다 큰것들
--ANY : < 일땐데이터들중에서 가장 큰 것보다 작은것들
--ALL : > 일땐데이터들중에서 가장 큰 것보다 큰것들
--ALL : < 일땐데이터들중에서 가장 작은 것보다 작은것들
SELECT
    department_id,
    salary
FROM
    employees
WHERE
    department_id > ANY ( 50,
                          20,
                          100 ); --가장 작은 것보다 큰것들
    
SELECT
    department_id,
    salary
FROM
    employees
WHERE
    department_id < ANY ( 50,
                          20,
                          100 ); --가장 큰 것보다 작은것들
    
SELECT
    department_id,
    salary
FROM
    employees
WHERE
    department_id > ALL ( 50,
                          20,
                          100 ); --가장 큰 것보다 큰것들
    
SELECT
    department_id,
    salary
FROM
    employees
WHERE
    department_id < ALL ( 50,
                          20,
                          100 ); --가장 작은 것보다 작은것들
    
--LIKE
SELECT
    first_name,
    last_name
FROM
    employees
WHERE
--    last_name LIKE 'King'; -- last_name = 'King'; 과 같은 효과
--    last_name LIKE 'K%'; --last_name이 K로 시작하는
--    last_name LIKE '%t%'; --t라는 문자가 포함된
--    last_name LIKE '%ing'; --last_name이 ing로 끝나는
        last_name LIKE '_e%'; -- 두번째 글자가 e로 시작하는

-- 결합 연산자( || )
SELECT
    first_name || last_name --딱 붙어서 출력된다
FROM
    employees;

SELECT
    first_name || ' ' || last_name
FROM
    employees;
    
SELECT
    first_name || ' ' || last_name || '의 연봉[' || salary || ']' AS "정보"
FROM
    employees;


select employee_id from employees
where not (salary >1000 and salary < 12000);

--LIKE 에서 %_ 검색하는법
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