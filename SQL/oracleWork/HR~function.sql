--function
--단일행 함수 >> 통계함수- SUM,COUNT,MAX,MIN,AVG 등등..
--복수행 함수 >> 예 : 각종변환함수 tochar같은

--통계함수
--전체사원수 검색
SELECT
    COUNT(*)
FROM
    employees; --employees 테이블의 행의 수를 반환
    
--COUNT는 NULL을 세지않는다
SELECT 
    COUNT(*),
    COUNT(commission_pct) 
FROM 
    employees;


--매달 나가는 전체사원의 급여의 합
SELECT
    SUM(salary)
FROM
    employees;

--사원들의 최고급여
SELECT
    MAX(salary)
FROM
    employees;

--사원들의 최저급여
SELECT
    MIN(salary)
FROM
    employees;

--사원들의 평균급여
SELECT
    round(AVG(salary), 2)
FROM
    employees;
    
--NULL 값인것도 평균 셈에 넣어야되면 NVL을 넣어줘야한다
SELECT avg(commission_pct), --NULL값은 아예 평균갯수에서 배제한다
        avg(nvl(commission_pct,0)) 
FROM employees;

--아스키코드
SELECT
    CHR(97)
FROM
    dual; --chr은 숫자를 아스키코드를 기준으로 변환
SELECT
    ascii('a')
FROM
    dual; --ASCII은 문자를 아스키코드 숫자로 반환

--CONCAT 문자열 붙이기
SELECT
    first_name,
    job_id
FROM
    employees;

SELECT
    first_name || job_id
FROM
    employees; --밑이랑 같은 결과
SELECT
    concat(first_name, job_id)
FROM
    employees; --공백은 _로 표시해준다
SELECT
    concat(first_name, ' is a '),
    job_id
FROM
    employees; --공백은 _로 표시해준다

--대소문자변형
SELECT
    lower(first_name),
    upper(first_name)
FROM
    employees;

--PAD 여백주기
SELECT
    lpad('yangssem', 17, '!@#')
FROM
    dual;

SELECT
    lpad(first_name, 13, '!@#'),
    rpad(first_name, 13, '!@#')
FROM
    employees;

--TRIM 원하는 문자를 제거(문장의 앞뒤에만 관여한다)
SELECT
    ltrim('AA123456AA', 'AA')
FROM
    dual;

SELECT
    rtrim('AA123456AA', 'AA')
FROM
    dual;

--실데이터의 수정은 아니고 출력시에만 수정하는것
SELECT
    replace('YANG AND SAM', 'SA', 'SEX')
FROM
    dual;

SELECT
    job_id,
    replace(job_id, 'AC', 'TC')
FROM
    employees;

-- 문자열 일부 추출
SELECT
    substr('ABCDEFG', 3, 2)
FROM
    dual;

SELECT
    substr('ABCDEFG', 3, 4)
FROM
    dual;

--INSTR 자바의 indexof와 비슷하며 찾는 문자열의 위치를 반환한다!
SELECT
    instr('010-2222-8888', '-')
FROM
    dual;
--INSTR(‘원문자열', ‘찾고싶은 문자열', 몇번째부터, 몇번째중복문자인가)
SELECT
    instr('CORPORATE FLOOR', 'OR', 1, 2)
FROM
    dual;

--문자열의 길이
SELECT
    first_name,
    length(first_name)
FROM
    employees;

--사원들의 이름중 7글자이상인 사람들만 출력
SELECT
    first_name,
    length(first_name)
FROM
    employees
WHERE
    length(first_name) >= 7;

--GREATEST 가장 큰놈, 문자열중 최대값
SELECT
    greatest('CC', 'ABCDE', 'ADBDDW')
FROM
    dual; --여기선 C가 가장 크다
SELECT
    greatest('12', '132', '34')
FROM
    dual; --문자열이므로 3이 제일 크다
SELECT
    greatest(12, 132, 34)
FROM
    dual; --정수형이므로 132이 제일 크다

--LEAST 가장 작은놈, 문자열중 최소값
SELECT
    least('CC', 'ABCDE', 'ADBDDW')
FROM
    dual; --여기선 AB% 가 가장 작다
SELECT
    least('123', '132', '34')
FROM
    dual; --문자열이므로 12%가 제일 작다
SELECT
    least(123, 132, 34)
FROM
    dual; --정수형이므로 34이 제일 작다

--NVL 만약 NULL이 올때의 대체값 설정
--NVL(컬럼명,숫자) 컬럼이 NULL이면 숫자로 대체
SELECT
    salary,
    commission_pct,
    nvl(commission_pct, 5),
    salary + ( salary * nvl(commission_pct, 5) )
FROM
    employees;

--NVL2(컬럼명,숫자1,숫자2) 컬럼이 NULL이면 숫자2, NULL이 아니면 숫자1
SELECT
    salary,
    commission_pct,
    nvl2(commission_pct, 5, 10),
    salary + ( salary * nvl2(commission_pct, 5, 10) )
FROM
    employees;

--DECODE 컬럼에 적용하는 분기문 (행이면 WHERE)
--DECODE (컬럼명,'문자열',참일경우)
--DECODE (컬럼명,'문자열',참일경우,거짓일경우)
--DECODE (컬럼명,'문자열1',참일경우,'문자열2',참일경우,거짓일경우)
SELECT
    last_name,
    job_id,
    salary,
    decode(job_id, 'IT_PROG', salary * 1.1, salary) AS "실수령액"
FROM
    employees;

SELECT
    last_name,
    job_id,
    salary,
    decode(job_id, 'IT_PROG', salary * 1.1, 'AD_VP', salary * 1.2,
           'AD_PRES', salary * 1.5, salary) AS "실수령액"
FROM
    employees;

--DECODE 대신 CASE~WHEN~THEN~END를 쓸수도 있다
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
    END AS "실수령액"
FROM
    employees;
    
    
------------------------------------------------ 2) 날짜관련함수
SELECT SYSDATE FROM DUAL; --오늘 날짜를 반환

SELECT HIRE_DATE, ADD_MONTHS(HIRE_DATE, -3)
from employees where employee_id=100;

SELECT sysdate,
ADD_MONTHS(sysdate, 1),
ADD_MONTHS('23/05/05', 1),
ADD_MONTHS('23/12/06', 1)
from dual;

--해당 월의 마지막 일!
select HIRE_DATE, LAST_DAY(HIRE_DATE), from employees;

-- NEW_TIME 표준시를 변환해준다
select HIRE_DATE, NEW_TIME(HIRE_DATE, 'GMT', 'PDT')
from employees where EMPLOYEE_ID=100;

--MONTHS_BETWEEN 날짜사이의 개월수를 알려준다
select hire_date, sysdate, MONTHS_BETWEEN(sysdate, hire_date)
from employees where employee_id = 100;
--고용일로부터 오늘까지 몇개월이나 일했나?
select sysdate,hire_date, MONTHS_BETWEEN(sysdate,hire_date) from employees;

--NEXT_DAY 가장 가까운 요일숫자(1:일요일 2:월요일 .... 7:토요일)
SELECT NEXT_DAY(sysdate,3) from dual; --가장 가까운 화요일이 언제인가?

-- TO_CHAR: 날짜 데이터나 날짜 컬럼을 특정 형식으로 반환
SELECT SYSDATE, 
TO_CHAR(SYSDATE,'D'), --1~7 일~토
TO_CHAR(SYSDATE,'DAY'), --한글로 무슨요일인지
TO_CHAR(SYSDATE,'DY'), -- 한글로 무슨요일인지 한글자로
TO_CHAR(SYSDATE,'DD'),  -- 달력상 며칠
TO_CHAR(SYSDATE,'MM'), --달력상 몇월
TO_CHAR(SYSDATE,'MONTH'), --몇월인지 한글로
TO_CHAR(SYSDATE,'YYYY') --달력상 몇년
from dual;

SELECT SYSDATE, 
TO_CHAR(SYSDATE,'YYYY-MM-DD'),
TO_CHAR(SYSDATE,'fmYYYY-MM-DD') --0을 제거함
from dual; 

SELECT SYSDATE, 
TO_CHAR(SYSDATE,'YYYY-MM-DD'),
TO_CHAR(SYSDATE,'HH:MI:SS') --시분초
from dual; 

--숫자 변환 함수, 오라클의 자동캐스팅기능도 있다.
select TO_NUMBER('100')+1, '100'+1 from dual; --문자열 100을 정수형 100으로 변환
select to_number('3.14') from dual;

--날짜 형식으로 변환하는 함수
SELECT sysdate, TO_DATE(sysdate,'yy/mm/dd') from dual;
SELECT '13일-03월-20년', TO_DATE('13-03-20','dd/mm/yy') from dual;

--USER 현재 DB를 사용중인 유저 반환
SELECT USER from dual; --커넥트가 된 HR이 반환된다



---------------------------------------------숫자 관련 함수

--ABS //절대값 - 또는 + 부호를 떼어낸 수
SELECT ABS(-5135) from dual;

--올림
SELECT CEIL(11.001) FROM DUAL;  --무조건 반올림한다

--내림
SELECT FLOOR(11.9999) FROM DUAL; --무조건 내린다

--반올림
SELECT ROUND(22.5) FROM dual;
SELECT ROUND(22.005, 2 ) FROM dual; -- 2자리까지 반올림함
--예제
SELECT AVG(Salary),
CEIL(AVG(Salary)),
FLOOR(AVG(Salary)),
ROUND(AVG(Salary)), --반올림
ROUND(AVG(Salary),2) from employees; 

-- 사인 코사인 탄젠트
SELECT COS(180*3.14/180) from dual;

--MOD(num1,num2) num1을 num2로 나눈 나머지값이 반환
SELECT MOD(11,4) from dual;

--POWER 제곱
SELECT POWER(2,7) from dual; --2에 7제곱

--TRUNC = ROUND+FLOOR = 특정자리수 밑까지 컷
SELECT TRUNC( 99.123456 , 3 ) FROM DUAL;

--------------------------GROUP BY절과 HAVING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT department_id,salary from employees; --여기서 부서별로 평균이 보고싶다?

--부서별로 묶어라!
SELECT department_id, FLOOR(AVG(salary)) from employees
GROUP BY department_id; --그룹된 칼럼은 SELECT에 반드시 넣어야 된다

--NULL인건 제외하고 싶은데.. HAVING의 등장
SELECT department_id, FLOOR(AVG(salary)) from employees
--WHERE department_id is not null --그룹별 처리전 조건절
GROUP BY department_id
HAVING department_id is not null; --그룹별 처리후 조건절

--업무별 급여 평균?
SELECT job_id, FLOOR(AVG(salary)) from employees
GROUP BY job_id; --그룹된 칼럼은 SELECT에 반드시 넣어야 된다

SELECT location_id,department_name
from departments
group by location_id,department_name; --GROUPBY에 들어간건 SELECT에 반드시 넣어야한다

--업무별 총 급여액
SELECT job_id, FLOOR(SUM(salary)) from employees
GROUP BY job_id; --그룹된 칼럼은 SELECT에 반드시 넣어야 된다
















------------------------문제풀기--------------------------------
--Q1:연봉 8000이상인 사원들의 부서별 평균연봉의 반올림값을 출력하라
SELECT department_id, ROUND(AVG(salary))
FROM EMPLOYEES
WHERE salary >=8000
GROUP BY department_id;

--Q2:연봉 8000이상인 사원들의 부서별 평균연봉의 반올림값
--을 부서번호의 내림차순으로 정렬하라
select department_id, ROUND(AVG(salary))
from employees
WHERE salary >= 8000
GROUP BY department_id
ORDER BY department_id DESC;

--//Q3:연봉 8000이상인 사원들의 부서별 평균연봉의 반올림값
--을 평균연봉의 반올림값으로 오름차순 정렬하라
SELECT department_id, ROUND(AVG(Salary))
FROM EMPLOYEES
where salary >= 8000
GROUP BY department_id
ORDER BY ROUND(AVG(Salary));

--해답
--SELECT DEPARTMENT_ID,ROUND(AVG(SALARY)) AS R FROM EMPLOYEES
--WHERE SALARY>=8000
--GROUP BY DEPARTMENT_ID
--ORDER BY R ASC;


--Q4:연봉 10000이상인 사원들의 부서별 평균연봉의 반올림값
--을 부서번호로 오름차순 정렬하라
SELECT department_id, ROUND(AVG(salary)) AS "평균연봉"
FROM employees
WHERE salary >= 10000
GROUP BY department_id
ORDER BY department_id ASC;

--Q5:각 부서별 같은 업무를 하는 사람의 인원수를 구하여
--부서번호,업무명,인원수를 출력하라.
--(단, 부서번호와 업무명으로 각각 내림차순 정렬!)
SELECT department_id AS "부서번호",job_id AS "업무명",COUNT(*) AS "인원수"
FROM employees
GROUP BY department_id,job_id
ORDER BY 부서번호 desc,
              업무명 desc;
            
--해답
--SELECT DEPARTMENT_ID,JOB_ID,count(*) FROM EMPLOYEES
--GROUP BY DEPARTMENT_ID,JOB_ID
--ORDER BY DEPARTMENT_ID DESC,JOB_ID DESC;

--Q6:사원 테이블에서 연봉과 사원ID를 출력하되
--연봉이 12000인 사원은 고액연봉자라고 출력하라.
SELECT salary,employee_id,DECODE(salary,12000,'고액연봉자')
FROM EMPLOYEES;

--//Q7:사원 테이블에서 연봉과 사원ID를 출력하되
--연봉이 12000이상인 사원은 비고에 고액연봉자라고
--출력하라. (단, 최고연봉액은 24000이다.)
SELECT salary, employee_id,
    CASE WHEN
         SALARY >= 12000 THEN '고액연봉자'
    END AS "비고"
FROM EMPLOYEES;

--해답
--select salary,employee_id,case when salary between 12000 and
--24000 then '고액연봉자' end 비고 from employees;

--//Q8:사원 테이블에서 연봉과 사원ID를 출력하되
--연봉이 20000이상인 사원은 1급연봉자,
--연봉이 15000 에서 19000 이하인 사원은 2급연봉자,
--연봉이 기타연봉인 사원은 3급연봉자 라고 출력하라.
--(단, 최고연봉액은 24000이다.)

SELECT salary, employee_id,
    CASE
        WHEN salary >= 20000 THEN '1급연봉자'
        WHEN salary BETWEEN 15000 and 19000 THEN '2급연봉자'
        ELSE '3급연봉자'
    END AS "비고"
FROM EMPLOYEES
ORDER BY SALARY;

select floor(dbms_random.value()*49)+1 from dual;