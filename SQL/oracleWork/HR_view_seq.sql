--VIEW

--사전생성되어잇는 뷰
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
--조인한 질의문
select e.employee_id, d.department_id, d.department_name,e.salary
from employees e join departments d
on e.department_id=d.department_id;


--이걸 뷰로 만들면 앞으로 불러오기 편하다
CREATE OR REPLACE  --뒤에 OR REPLACE를 안 붙이면 같은 이름의 뷰 대체 불가
VIEW VIEW_EMP_DEPT(empno,fname,deptno,deptname,salary,commpct) --뒤에 붙이는건 별칭이다
AS select e.employee_id, e.first_name, d.department_id, d.department_name,e.salary,e.commission_pct
from employees e join departments d
on e.department_id=d.department_id
WITH READ ONLY;

--조회
SELECT * from view_emp_dept;

---------------------------------------------
--뷰 옵션 FROM CHECK OPTION의 활용
--일단 데이터 삽입
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

--뷰에다가 데이터 삽입
--ORA-01402: view WITH CHECK OPTION where-clause violation
insert into view_board values(10,'writer1','title1','content1');
--ORA-00001: unique constraint (HR.TEST_BOARD_PK) violated
insert into view_board values(20,'writer1','title1','content1');
--ORA-01402: view WITH CHECK OPTION where-clause violation
insert into view_board values(40,'writer1','title1','content1');
--ORA-01402: view WITH CHECK OPTION where-clause violation
insert into view_board values(60,'writer1','title1','content1');
--즉 뷰의 WNUM은 WHERE절에 있는 20과 30만이 삽입이 허용되나 WNUM은 이미 PK이고 만들어져있던게 있어서 안된다
-- WNUM이 PK가 아니라면 삽입이 가능할것

SELECT * FROM view_board;

--------------------------------------------------------------------------
--실습
--테이블1
CREATE TABLE TEST4_DEPT 
(
  DEPTNO NUMBER(2) NOT NULL 
, DNAME VARCHAR2(15) DEFAULT '개발부' 
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

--테이블2
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

--데이터삽입
INSERT INTO test4_dept VALUES(10, '영업부', '1');
INSERT INTO test4_dept VALUES(20, '기획부', '1');
INSERT INTO test4_dept VALUES(30, '홍보부', '2');
INSERT INTO test4_dept VALUES(40, '관리부', '2');
INSERT INTO test4_emp VALUES(1001, '홍길동', '서울', '1234561234567', 10,3000);
INSERT INTO test4_emp VALUES(1002, '최길동', '서울', '1234561234568', 10,4000);
INSERT INTO test4_emp VALUES(1003, '박길동', '경기', '1234561234569', 20,5000);
INSERT INTO test4_emp VALUES(1004, '양길동', '경기', '1234561234571', 30,6000);
INSERT INTO test4_emp VALUES(1005, '한길동', '서울', '1234561234572', 40,7000);
INSERT INTO test4_emp VALUES(1006, '강길동', '서울', '1234561234573', 40,8000);

select * from test4_dept;
select * from test4_emp;

--실습1-1
--부서ID가 10번인 사원데이터를 갖는 이름이 test4_emp_view 인 뷰를 생성시
--empno, ename 두개 컬럼만으로 생성후, 뷰검색, 뷰구조 확인하라.

CREATE OR REPLACE VIEW test4_emp_view(empno,ename) AS
SELECT empno,ename
FROM test4_emp
WHERE deptno=10;

select * from test4_emp_view;

--실습1-2
--부서ID가 20번인 부서데이터를 갖는 이름이 test4_dept_view 인 뷰를 생성시
--deptno, dname 두개 컬럼만으로 생성 후, 뷰검색, 뷰구조 확인하라.

CREATE OR REPLACE VIEW test4_dept_view AS
SELECT deptno,dname
FROM test4_dept
WHERE deptno=20;

select * from test4_dept_view;

--실습2-1
--부서ID가 10번인 사원데이터를 갖는 이름이 test4_emp_view 인
--뷰를 생성시, 컬럼 이름을 empno를 employee_id,
--ename을 employee_name으로 별칭 설정하라

CREATE OR REPLACE VIEW test4_emp_view(employee_id,employee_name) AS
SELECT empno,ename
FROM test4_emp
WHERE deptno=10;

select * from test4_emp_view;

--실습2-2
--부서ID가 20번인 부서데이터를 갖는 이름이 test4_dept_view 인
--뷰를 생성시, 컬럼 이름을 deptno 를 department_id,
--dname 을 department_name 으로 별칭설정하라.

CREATE OR REPLACE VIEW test4_dept_view(department_id,department_name) AS
SELECT deptno,dname
FROM test4_dept
WHERE deptno=20;

select * from test4_dept_view;

--실습3
--test4_emp 테이블과 test4_dept 테이블을 조인하여
--empno를 사원번호로,
--ename을 사원명으로,
--dname을 부서명으로,
--loc_name 을 지역명으로
--바꾸는 test4_emp_join_dept_view 를 생성하시오.

CREATE OR REPLACE VIEW test4_emp_join_dept_view("사원번호","사원명","부서명","지역명") AS
SELECT e.empno,e.ename,d.dname,e.loc_name
FROM test4_emp e join test4_dept d
using(deptno);

select * FROM test4_emp_join_dept_view;

--실습4
--test4_emp 테이블과 test4_dept 테이블을 조인하여
--dname를 부서명 으로,
--min(e.sal)을 최저급여 으로,
--max(e.sal)을 최고급여 으로,
--avg(e.sal) 을 평균급여 으로
--바꾸고 부서이름별로 test4_emp_join_dept_view 를 생성하시오.

CREATE OR REPLACE VIEW test4_emp_join_dept_view("부서명","최저급여","최고급여","평균급여") AS
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
--사원테이블(employees)에서 
--가장 최근에 입사한 사원 순으로 5명을 출력하자.

--이건 제대로 안 나오니 서브쿼리를 활용해야된다
--select ROWNUM,employee_id,first_name,last_name,hire_date from employees
--where ROWNUM <=5 order by hire_date desc;

--서브쿼리 활용
select ROWNUM,employee_id,first_name,last_name,hire_date 
from (
select employee_id,first_name,last_name,hire_date 
from employees
order by hire_date desc
)
where ROWNUM <=5;


--사원테이블(employees)에서 
--사번 내림차순으로 6번째부터 10번째 사원 5명을 출력하자.

--내가 생각한것
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

-- 다른 사람의 풀이
Select *
FROM (
    SELECT ROWNUM as rnum, e.* FROM EMPLOYEES e ORDER BY EMPLOYEE_ID DESC
) 
WHERE rnum >= 6 and rnum <= 10;

--해답
select * from (select rownum rnum,employee_id,first_name,last_name,hire_date 
from (select employee_id,first_name,last_name,hire_date  
from employees order by employee_id desc))
where rnum>=6 and rnum<=10;


-----------------------------------------------------------------------------
--ROLLUP, CUBE ,소계 총계
--부서번호가 40번 이하인 사원중 부서별 직업별 월급과 출력하라
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
--서브쿼리의 다른 표현 방식
--부서번호가 50번인 사원들 중, 이 부서의
--평균 급여액 보다 낮은 월급을 받는 사원명단을 추출하라.
select e.employee_id, e.last_name, e.salary
from
    (select employee_id,manager_id, salary, last_name
        from employees
        where department_id=50) e,
    (select avg(salary) avg_salary
        from employees
        where department_id=50) d
where e.salary < d.avg_salary;

--with를 사용한 방식
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


---예2)전체 부서별 평균 급여액보다 부서별 급여합계액이 큰 부서의 명단을 추출하라.
--부서별 급여 합계
SELECT d.department_name,sum(e.salary)
from employees e join departments d
using (department_id)
group by department_name;

--부서별 전체평균 : 전사원 급여총계 나누기 부서수
WITH e as
    (select sum(e.salary) sum_amt from employees e, departments d
         where e.department_id = d.department_id),
        d as
    (SELECT count(*) cnt FROM Departments d
    where d.department_id in (select department_id from employees))
select e.sum_amt/d.cnt 부서평균
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
select e.sum_amt/d.cnt 부서평균
from e,d
) b
WHERE a.sum_sal > b.부서평균;

WITH a as
(
    SELECT d.department_name ,sum(e.salary) sum_sal
    from employees e join departments d
    using (department_id)
    group by department_name, d.department_name
),
b as
(
    select dt.sum_amt/dc.cnt 부서평균
    from    (select sum(e.salary) sum_amt from employees e, departments d
                    where e.department_id = d.department_id) dt,
              (select count(*) cnt from departments d
                    where d.department_id IN (select department_id from employees)) dc
)
SELECT a.department_name,a.sum_sal
FROM a,b
WHERE a.sum_sal > b.부서평균;
