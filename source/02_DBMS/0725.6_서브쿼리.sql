-- [VI] Sub Qeruy : 메인 query(SQL문)안에 query(SQL문)가 내포
-- ★ 1. 서브 쿼리 개념
  -- 서브쿼리가 필요한 ex. 급여를 제일 많이 받는 사람의 모든 정보
SELECT MAX(SAL) FROM EMP; -- 서브쿼리
SELECT * FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP); -- 메인 쿼리
  
  -- 서브쿼리의 종류(1)단일행 서브쿼리(서브쿼리의 실행결과가 단일행) : = > >= < <= !=
    -- ex. SCOTT과 동일한 부서에서 근무하는 사원의 이름, 급여
SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'; -- 단일행 서브쿼리
SELECT ENAME, SAL
      FROM EMP
      WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT')
          AND ENAME <> 'SCOTT'; -- 메인쿼리
  -- 서브쿼리의 종류(2)다중행 서브쿼리(서브쿼리의 실행결과가 2행이상) : IN, > ALL, > ANY(SOME), EXISTS
    -- ex. SCOTT이나 KING과 동일한 부서에서 근무하는 사원의 이름, 급여 
SELECT DEPTNO FROM EMP WHERE ENAME IN ('SCOTT', 'KING'); -- 다중행 서브쿼리 10,20
SELECT ENAME, SAL
      FROM EMP
      WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME IN ('SCOTT', 'KING')); -- 메인쿼리
  
-- ★ 2. 단일행 서브쿼리
  -- ex1. SCOTT과 동일한 근무지에서 근무하는 사원의 모든 정보
    -- 데이터 추가(DALLAS 50번부터, 50번부서에 근무하는 홍길동 사원)
INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
INSERT INTO EMP (EMPNO, ENAME, DEPTNO) VALUES (8000, '홍길동', 50);
SELECT * FROM DEPT;
SELECT * FROM EMP;
  SELECT LOC 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND ENAME='SCOTT'; -- 서브쿼리
  SELECT E.*, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND LOC=(SELECT LOC 
                                      FROM EMP E, DEPT D
                                      WHERE E.DEPTNO=D.DEPTNO AND ENAME='SCOTT')
                          AND ENAME <> 'SCOTT'; -- 메인쿼리
  ROLLBACK; -- DML(추가, 삭제, 수정, 검색) 명령어 취소 
  -- ex2. 최초입사직원이름과 최초입사일
  SELECT MIN(HIREDATE) FROM EMP; -- 서브쿼리(최초입사일)
  SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP); -- 메인쿼리
  -- ex3. 최근입사직원이름과 최근입사일
  SELECT MAX(HIREDATE) FROM EMP; -- 서브쿼리(최근입사일)
  SELECT ENAME, HIREDATE FROM EP WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP); -- 메인쿼리
  -- ex4. 최초입사직원이름과 최초입사일, 최근입사직원이름과 최근입사일 (ex2 + eX3)
  SELECT E1.ENAME, E1.HIREDATE, E2.ENAME, E2.HIREDATE
    FROM EMP E1, EMP E2
    WHERE E1.HIREDATE = (SELECT MIN(HIREDATE) FROM EMP) AND
          E2.HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);
  
SELECT 
    (SELECT ENAME FROM EMP WHERE HIREDATE=(SELECT MIN(HIREDATE) FROM EMP) ) 최초입사자,
    (SELECT MIN(HIREDATE) FROM EMP) 최초입사일,
    (SELECT ENAME FROM EMP WHERE HIREDATE=(SELECT MAX(HIREDATE) FROM EMP)) 최근입사자,
    (SELECT MAX(HIREDATE) FROM EMP) 최근입사일
  FROM DUAL;
  -- ex5. SCOTT과 같은 부서에 근무하는 사람들의 급여합 
SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'; -- 서브쿼리
SELECT SUM(SAL) FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'); -- 메인쿼리
    -- EX6. SCOTT과 동일한 JOB을 가진 사원의 모든 필드(정보)
    
SELECT JOB FROM EMP WHERE ENAME = 'SCOTT'; -- 서브쿼리
SELECT * FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'SCOTT'); -- 메인쿼리
    
    -- EX. 7 DALLAS에 근무하는 사원의 이름과 부서번호 ( 서브쿼리, JOIN)
SELECT DEPTNO FROM DEPT WHERE LOC= 'DALLAS'; -- 단일행 서브쿼리
SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC= 'DALLAS'); -- 메인쿼리
    
SELECT ENAME, E.DEPTNO FROM EMP E, DEPT D WHERE E.DEPTNO = D. DEPTNO AND LOC='DALLAS';  -- JOIN 이용
    
    -- EX.8 'KING'이 직속상사인 사원의 이름과 급여( 서브쿼리, SELF-JOIN)
SELECT EMPNO FROM EMP WHERE ENAME = 'KING'; -- 서브쿼리
SELECT ENAME, SAL FROM EMP WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING'); -- 메인쿼리

SELECT W.ENAME, W.SAL
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO AND M.ENAME = 'KING'; -- 셀프조인 이용
    -- EX.9 평균급여 이하로 받는 사원의 이름과 급여를 출력
SELECT ENAME, SAL FROM EMP WHERE SAL <=(SELECT AVG(SAL) FROM EMP);
    -- EX.10 평균급여 이하로 받는 사원의 이름, 급여,  평균급여(소수점1자리반올림)을 출력
SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP), 1) AVG
    FROM EMP
    WHERE SAL <=(SELECT AVG(SAL) FROM EMP);
    -- EX.11 평균급여 이하로 받는 사원의 이름, 급여, 평균급여와의 차이(소수점1자리 반올림)을 출력
SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP)-SAL, 1) DIEE
    FROM EMP
    WHERE SAL <=(SELECT AVG(SAL) FROM EMP);
    
    -- 단일행 다중열 서브쿼리
    -- SCOTT의 JOB과 부서번호과 같은 직원의 모든 필드 출력
SELECT JOB, DEPTNO FROM EMP WHERE ENAME = 'SCOTT';
SELECT * FROM EMP                                                                      
    WHERE (JOB, DEPTNO) = (SELECT JOB, DEPTNO FROM EMP WHERE ENAME = 'SCOTT') AND ENAME <> 'SCOTT';
    
-- ★. (3). 다중행 서브쿼리  : IN, ALL, ANY(=SOME), EXISTS
    -- (1) -- IN : 서브쿼리의 결과 중 하나라도 일치하면 참
    -- EX. 부서별 입사일이 가장 늦은 사람의 이름, 입사일, 부서번호
SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO; -- 다중행 다중열 서브쿼리
SELECT ENAME, HIREDATE, DEPTNO
    FROM EMP
    WHERE (DEPTNO, HIREDATE) IN (SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO); -- 메인쿼리
    --EX. 급여가 3000이상 받는 사원이 소속된 부서사원들의 모든 필드
SELECT DEPTNO FROM EMP WHERE SAL >= 3000; -- 다중행 서브쿼리 (20,10,20)
SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL >= 3000);








    
-- ★ ★ ★ <총 연습문제> ★ ★ ★  
-- 1~13번 : 단일행서브쿼리

--1. 사원테이블에서 가장 먼저 입사한 사람의 이름, 급여, 입사일
SELECT MIN(HIREDATE) FROM EMP;

SELECT ENAME, SAL, HIREDATE
    FROM EMP
    WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP);

-- 2. 회사에서 가장 급여가 적은 사람의 이름, 급여
SELECT MIN(SAL) FROM EMP;

SELECT ENAME, SAL 
    FROM EMP 
    WHERE SAL = (SELECT MIN(SAL) FROM EMP);

-- 3. 회사 평균보다 급여를 많이 받는 사람의 이름, 급여, 부서코드
SELECT AVG(SAL) FROM EMP; 

SELECT ENAME, SAL, DEPTNO 
    FROM EMP 
    WHERE SAL > (SELECT AVG(SAL) FROM EMP);

--4. 회사 평균 이하의 급여를 받는 사람의 이름, 급여, 부서명
SELECT ENAME, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND SAL <=(SELECT AVG(SAL) FROM EMP);
--5. SCOTT보다 먼저 입사한 사람의 이름, 급여, 입사일, 급여 등급
SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT';
SELECT ENAME, SAL, HIREDATE, GRADE
    FROM EMP E, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL AND  HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT');

--6. 5번(SCOTT보다 먼저 입사한 사람의 이름, 급여, 입사일, 급여 등급)에 부서명 추가하고 급여가 큰 순 정렬
SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT';
SELECT ENAME, SAL, HIREDATE, DNAME, GRADE
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL 
    AND  HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT');
--7. BLAKE 보다 급여가 많은 사원들의 사번, 이름, 급여
SELECT SAL FROM EMP WHERE ENAME = 'BLAKE';
SELECT EMPNO, ENAME, SAL FROM EMP 
    WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'BLAKE');
--8. MILLER보다 늦게 입사한 사원의 사번, 이름, 입사일
SELECT HIREDATE FROM EMP WHERE ENAME = 'MILLER';  -- 82/01/23
SELECT EMPNO, ENAME, HIREDATE 
    FROM EMP
        WHERE HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'MILLER');
--9. 사원전체 평균 급여보다 급여가 많은 사원들의 사번, 이름, 급여
SELECT  AVG(SAL) FROM EMP;
SELECT EMPNO, ENAME, SAL 
    FROM EMP
        WHERE SAL > (SELECT  AVG(SAL) FROM EMP);
        
--10. CLARK와 같은 부서번호이며, 사번이 7698인 직원의 급여보다 많은 급여를 받는 사원의 사번, 이름, 급여
SELECT DEPTNO FROM EMP WHERE ENAME = 'CLARK'; -- 서브쿼리1 
SELECT SAL FROM EMP WHERE EMPNO=7698; -- 서브쿼리2
SELECT EMPNO, ENAME, SAL
    FROM EMP
        WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'CLARK') 
        AND SAL > (SELECT SAL FROM EMP WHERE EMPNO=7698);
SELECT * FROM DEPT;        
--11.  응용심화. CLARK와 같은 부서명이며, 사번이 7698인 직원의 급여보다 많은 급여를 받는 사원의 사번, 이름, 급여
SELECT DNAME FROM DEPT WHERE DEPTNO = 10; -- 서브쿼리1 
SELECT SAL FROM EMP WHERE EMPNO=7698; -- 서브쿼리2
SELECT EMPNO, ENAME, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO 
    AND DNAME = (SELECT DNAME FROM DEPT WHERE DEPTNO = 10) 
    AND SAL > (SELECT SAL FROM EMP WHERE EMPNO=7698);
--12. BLAKE와 같은 부서에 있는 모든 사원의 이름과 입사일자
SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE';
SELECT ENAME, HIREDATE FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE');
    
--13. 평균 급여 이상을 받는 모든 종업원에 대해서 사원번호와 이름 단 급여가 많은 순으로 출력)

SELECT  AVG(SAL) FROM EMP;
SELECT EMPNO, ENAME
    FROM EMP
        WHERE SAL >= (SELECT  AVG(SAL) FROM EMP)
        ORDER BY SAL;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    