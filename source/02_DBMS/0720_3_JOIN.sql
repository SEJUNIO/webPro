-- [III] JOIN (2개 이상의 테이블을 연결하여 데이터를 검색하는 방법)
SELECT * FROM EMP WHERE ENAME = 'SCOTT'; -- 1행
SELECT * FROM DEPT; -- 4행
    -- CROSS JOIN(FROM 절에 테이블을 2개이상)
SELECT * FROM EMP, DEPT WHERE ENAME ='SCOTT'; -- 1*4 = 4행
SELECT * FROM EMP,DEPT; --EMP의 14 * DEPT의 4 = 56행

-- 1. EQUI JOIN (동등조인) : 공통필드(DEPTNO)의 값이 일치되는 조건만 JOIN
SELECT * FROM EMP, DEPT
    WHERE EMP.DEPTNO=DEPT.DEPTNO AND ENAME='SCOTT'; 
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPT.DEPTNO,DNAME, LOC
    FROM EMP, DEPT
    WHERE EMP.DEPTNO=DEPT.DEPTNO;
SELECT EMPNO "NO", ENAME, JOB, MGR, HIREDATE, SAL, COMM, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D --테이블의 별칭이 있을경우 원테이블 명을 사용할 수 없고 별칭을 사용
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY EMPNO;
    -- EX. 급여가 2000이상인 직원만 이름, 직책, 급여, 부서명, 근무지 출력
SELECT ENAME, JOB, SAL, DNAME, LOC, E.DEPTNO
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND SAL>=2000;
    -- EX. 20번 부서의 직원만 이름, 부서번호, 근무지 출력
SELECT ENAME, E.DEPTNO, LOC
    FROM EMP E ,DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO=20;
    -- EX. 근무지(LOC)가 CHICAGO인 사람의 이름, 업무, 급여, 부서번호 출력
SELECT ENAME, JOB, SAL, D.DEPTNO
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND LOC = 'CHICAGO';
    -- EX. 부서번호가 10이거나 20인 사원의 이름, 업무, 근무지(급여순)
SELECT ENAME, JOB, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO IN (10,20)
    ORDER BY SAL;
    -- EX. JOB이 SALESMAN이거나 MANAGER인 사원의 이름, 급여, 상여, 연봉=(SAL+COMM)*12 , 부서명, 근무지(연봉이 큰순)
SELECT ENAME, SAL, COMM, (SAL + NVL(COMM, 0))*12 ANNUAL, DNAME, LOC 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND JOB IN ('SALESMAN', 'MANAGER')
    ORDER BY ANNUAL DESC;
    -- EX. COM이 NULL이고 SAL이 1200이상인 사원의 이름, 급여, 입사일, 부서번호, 부서명( 부서명 순 ,급여 큰 순 정렬)
SELECT ENAME, SAL, HIREDATE, E.DEPTNO,DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND COMM IS NOT NULL AND SAL >=1200
    ORDER BY DNAME ,SAL DESC;
    
    -- 탄탄1 뉴욕에서 근무하는 사원의 이름과 급여를 출력하시오
SELECT ENAME, SAL 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO  AND LOC = 'NEW YORK';
    -- 탄탄2 ACCOUNTING 부서 소속 사원의 이름과 입사일을 출력하시오
SELECT ENAME, HIREDATE
    FROM EMP E ,DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND DNAME ='ACCOUNTING';
	-- 탄탄3 직급이 MANAGER인 사원의 이름, 부서명을 출력하시오
SELECT ENAME, JOB
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND JOB = 'MANAGER';
	-- 탄탄4 Comm이 null이 아닌 사원의 이름, 급여, 부서코드, 근무지를 출력하시오.
SELECT ENAME, SAL, E.DEPTNO, LOC, COMM
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND COMM IS NOT NULL;

-- 2. NON-EQUL JOIN --BETWEEN 자주사용
SELECT * FROM EMP WHERE ENAME ='SCOTT';  -- SAL이3000
SELECT * FROM SALGRADE; -- 급여 등급 정보
SELECT * FROM EMP, SALGRADE
    WHERE ENAME = 'SCOTT'; -- CROSS JOIN (EMP 1행*SALGRADE의 5행 = 5행)
SELECT * FROM EMP, SALGRADE 
    WHERE SAL BETWEEN LOSAL AND HISAL AND ENAME='SCOTT';  -- 스콧행만 출력
-- EX. 모든 사원의 사번, 이름, 직책, 상사사번, 급여, 급여등급(1등급, 2등급, ...)
SELECT EMPNO, ENAME, JOB, MGR, SAL, GRADE||'등급' GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;
-- 탄탄1. Comm이 null이 아닌 사원의 이름, 급여, 등급, 부서번호, 부서이름, 근무지를 출력하시오.
SELECT ENAME, SAL, GRADE, E.DEPTNO, DNAME, LOC 
    FROM EMP E, DEPT D, SALGRADE --14*14*15 = 280개
    WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL AND COMM IS NOT NULL;
-- 탄탄2. 이름, 급여, 입사일, 급여등급
SELECT ENAME ,SAL, HIREDATE, D.DEPTNO SALGRADE
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN  LOSAL AND HISAL; 

-- 탄탄3. 이름, 급여, 급여등급, 연봉, 부서명, 부서별 출력, 부서가 같으면 연봉순. 연봉=(sal+comm)*12 comm이 null이면 0
SELECT ENAME, SAL, GRADE, (SAL+NVL(COMM ,0))*12 ANNUAL_SAL, DNAME 
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
    ORDER BY DNAME, SAL;

-- 탄탄4. 이름, 업무, 급여, 등급, 부서코드, 부서명 출력. 급여가 1000~3000사이. 정렬조건 : 부서별, 부서같으면 업무별, 업무같으면 급여 큰순
SELECT ENAME, JOB, SAL, GRADE, E.DEPTNO, DNAME
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
        AND SAL BETWEEN 1000 AND 3000
    ORDER BY E.DEPTNO, JOB, SAL DESC;

-- 탄탄5. 이름, 급여, 등급, 입사일, 근무지. 81년에 입사한 사람. 등급 큰순
SELECT ENAME, SAL, GRADE, HIREDATE, LOC
    FROM EMP E, SALGRADE, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
        AND TO_CHAR(HIREDATE, 'RR') ='81'
    ORDER BY GRADE DESC;

-- 3. SELF JOIN
SELECT EMPNO, ENAME, MGR FROM EMP WHERE ENAME='SMITH'; --SMITH MGR이 7902라고 나옴
SELECT EMPNO, ENAME FROM EMP WHERE EMPNO =7902; -- SMITH상사는 FORD 

--EMP 테이블이 중복되어 WORKER라는 이름과 MANAGER라는 이름 추가 지정
SELECT WORKER.EMPNO, WORKER.ENAME, WORKER.MGR, MANAGER.EMPNO, MANAGER.ENAME
    FROM EMP WORKER, EMP MANAGER  
    -- WORKER.ENAME에서 스미스 상사를 출력 할때 MANAGER.EMPNO와 셀프조인
    WHERE WORKER.ENAME = 'SMITH' AND WORKER.MGR = MANAGER.EMPNO;
    --EX. 모든 사원의 사번, 이름, 상사의 사번(MGR),상사의 이름
SELECT W.EMPNO, W.ENAME, W.MGR, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO; -- 13행 KING의 MGR이 NULL. EMPNO가 NULL
SELECT * FROM EMP; -- 14행
    -- EX. 'SMITH의 상사는 FORD다' 포맷으로 13명 출력
SELECT W.ENAME || '의 상사는' || M.ENAME || '다'
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;
    
--	매니저가 KING인 사원들의 이름과 직급을 출력하시오.
SELECT W.ENAME, W.JOB, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO AND M.ENAME = 'KING';
--	탄탄2. SCOTT과 동일한 부서번호에서 근무하는 사원의 이름을 출력하시오
--  SELECT * FROM EMP WHERE ENAME='SCOTT'; -- SCOTT의 부서번호는 20
--  SELECT ENAME FROM EMP WHERE DEPTNO = 20 AND ENAME !='SCOTT';
SELECT E1.ENAME, E1.DEPTNO, E2.ENAME, E2.DEPTNO
    FROM EMP E1, EMP E2
    WHERE E1.DEPTNO = E2.DEPTNO  -- 1.2끼리 조인
        AND E1.ENAME!=E2.ENAME   -- 1.2조인한 값이 다르다
            AND E2.ENAME='SCOTT'; -- 2. 출력값이 스콧이다.
    
SELECT E1.ENAME,E1.DEPTNO, E2.ENAME, E2.DEPTNO
    FROM EMP E1, EMP E2
    WHERE E1.DEPTNO = E2.DEPTNO AND E2.ENAME='SCOTT' AND E1.ENAME!='SCOTT';
--	탄탄3 .SCOTT과 동일한 근무지에서 근무하는 사원의 이름을 출력하시오(2단계 최종문제)
    -- SELECT * FROM EMP WHERE ENAME = 'SCOTT';
    -- SELECT * FROM DEPT;
--  탄탄3. SCOTT과 동일한 근무지에서 근무하는 사원의 이름을 출력하시오(탄탄2의 심화문제)
    -- DEPT 테이블에 50부서를 입력(DALLAS가 근무지)
SELECT * FROM DEPT;  -- 부서 확인
INSERT INTO DEPT VALUES(50, 'IT', 'DALLAS');
    -- EMP 테이블에 50번 부서 직원 입력( 결론: DALLAS가 근무지인 부서번호 : 20,50)
SELECT * FROM DEPT;
INSERT INTO EMP VALUES (8000,'홍길동', NULL, NULL, NULL, 800, NULL, 50); 
--
SELECT E1.ENAME, D1.LOC, E2.ENAME, D2.LOC
    FROM EMP E1, DEPT D1, EMP E2, DEPT D2 -- 1그룹은 1그룹끼리, 2그룹은 2그룹 끼리 조인
    WHERE E1.DEPTNO = D1.DEPTNO  -- 1그룹끼리 조인
        AND E2.DEPTNO = D2.DEPTNO  -- 2그룹끼리 조인
            AND D1.LOC = D2.LOC    -- D1, D2 근무지의 값이 같다
                AND E1.ENAME != E2.ENAME  --E1, E2 근무지의 값이 다르다.
        AND E2.ENAME = 'SCOTT';  -- E2 사원의 이름은 ?
        
-- 데이터 원상 복귀(DEPT 50 INSERT, EMP 8000번 사원 INSERT)
    ROLLBACK; -- 원상복귀
    SELECT * FROM DEPT;
    SELECT * FROM EMP;
    
-- 4. OUTER JOIN : SELF JOIN 이나 EQUI JOIN 시 조건에 만족하지 않아 출력되지 않는 행까지 나타나게 함
-- (1) SELF JOIN 에서 OUTER JOIN
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM    EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+) AND W.ENAME = 'KING';  -- CEO를 출력 하기위해선 데이터없는 쪽에 (+)
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR(+) = M.EMPNO AND M.ENAME = 'SMITH'; -- 말단 사원을 출력
    -- EX
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);
    
    -- EX 'SMITH의 상사는 FORD다' 포맷 출력 'KING의 상사는 없다'
SELECT W.ENAME ||'의 상사는 ' || NVL(M.ENAME, '없') || '다'
    FROM EMP W, EMP M
    WHERE W. MGR = M.EMPNO(+);
    -- EX. 말단사원만 출력  
SELECT W.EMPNO, W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM EMP W, EMP M 
    WHERE W.MGR(+) = M.EMPNO AND  W.EMPNO IS NULL;
-- (2) EQUI JOIN 에서 OUTER JOIN
SELECT * FROM EMP;   -- 14행
SELECT * FROM DEPT;  -- 4행
SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO; -- 40번부서 출력 안됨
SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO(+) = D.DEPTNO;  --40번 부서 출력

-- <셤 연습문제>
SELECT * FROM EMP;
--1. 이름, 직속상사명
SELECT W.ENAME, M.ENAME MANAGER
    FROM EMP W, EMP M
        WHERE W.MGR = M.EMPNO;

--2. 이름, 급여, 업무, 직속상사명
SELECT W.ENAME, W.SAL, W.JOB, M.ENAME MANAGER
    FROM EMP W, EMP M
        WHERE W.MGR = M.EMPNO;

--3. 이름, 급여, 업무, 직속상사명 . (상사가 없는 직원까지 전체 직원 다 출력.
    --상사가 없을 시 '없음'으로 출력)
SELECT W.ENAME, W.SAL, W.JOB, NVL(M.ENAME, '없음') MANAGER
    FROM EMP W, EMP M
        WHERE W.MGR = M.EMPNO(+);

--4. 이름, 급여, 부서명, 직속상사명
SELECT W.ENAME, W.SAL, DNAME, M.ENAME MANAGER
    FROM EMP W, DEPT D, EMP M
        WHERE W.DEPTNO = D.DEPTNO AND W.MGR = M.EMPNO;
        
--5. 이름, 급여, 부서코드, 부서명, 근무지, 직속상사명, (상사가 없는 직원까지 전체 직원 다 출력)
SELECT W.ENAME, W.SAL, D.DEPTNO, DNAME, LOC, M.ENAME MANAGER
    FROM EMP W, DEPT D, EMP M 
        WHERE W.DEPTNO = D.DEPTNO AND W.MGR = M.EMPNO(+);
        
--6. 이름, 급여, 등급, 부서명, 직속상사명. 급여가 2000이상인 사람
SELECT W.ENAME, W.SAL, DNAME, M.ENAME MANAGER
    FROM EMP W, DEPT D, EMP M
        WHERE W.DEPTNO = D.DEPTNO AND W.MGR = M.EMPNO AND W.SAL>=2000;
        
--7. 이름, 급여, 등급, 부서명, 직속상사명, (직속상사가 없는 직원까지 전체직원 부서명 순 정렬)
SELECT W.ENAME, W.SAL, GRADE, DNAME, M.ENAME 
    FROM EMP W, DEPT D, EMP M, SALGRADE
        WHERE W.DEPTNO = D.DEPTNO AND W.SAL BETWEEN LOSAL AND HISAL AND W.MGR = M.EMPNO(+)
        ORDER BY DNAME;
        
--8. 이름, 급여, 등급, 부서명, 연봉, 직속상사명. 연봉=(급여+comm)*12 단 comm이 null이면 0
SELECT W.ENAME, W.SAL, GRADE, DNAME, (W.SAL+NVL(W.COMM, 0))*12 ANNUALSAL, M.ENAME MANAGER
    FROM EMP W, DEPT D, EMP M, SALGRADE
        WHERE W.DEPTNO = D.DEPTNO AND W.SAL BETWEEN LOSAL AND HISAL AND W.MGR = M.EMPNO(+);
        
--9. 8번을 부서명 순 부서가 같으면 급여가 큰 순 정렬
SELECT W.ENAME, W.SAL, GRADE, DNAME, (W.SAL+NVL(W.COMM, 0))*12 ANNUALSAL, M.ENAME MANAGER
    FROM EMP W, DEPT D, EMP M, SALGRADE
        WHERE W.DEPTNO = D.DEPTNO AND W.SAL BETWEEN LOSAL AND HISAL AND W.MGR = M.EMPNO(+)
        ORDER BY DNAME, W.SAL DESC;
        
    --  PART2 
    
-- 1. 모든 사원에 대한 이름, 부서번호, 부서명을 출력하는 SELECT 문장을 작성하여라.
SELECT*FROM 
    EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
 
-- 2. NEW YORK에서 근무하고 있는 사원에 대하여 이름, 업무, 급여, 부서명을 출력
SELECT  ENAME, JOB, SAL, DNAME, LOC 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND LOC ='NEW YORK';
      
-- 3. 보너스를 받는 사원에 대하여 이름,부서명,위치를 출력
SELECT ENAME, COMM, DNAME, LOC 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND COMM IS NOT NULL AND COMM!=0;

--4. 이름 중 L자가 있는 사원에 대하여 이름,업무,부서명,위치를 출력
SELECT ENAME, JOB, DNAME, LOC 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND ENAME LIKE '%L%';

--5. 사번, 사원명, 부서코드, 부서명을 검색하라. 사원명기준으로 오름차순정열
SELECT EMPNO, ENAME, D.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO 
    ORDER BY ENAME;

--6. 사번, 사원명, 급여, 부서명을 검색하라. 
    --단 급여가 2000이상인 사원에 대하여 급여를 기준으로 내림차순으로 정열하시오
SELECT EMPNO, ENAME, SAL, DNAME
  FROM EMP E, DEPT D
  WHERE E.DEPTNO=D.DEPTNO AND SAL>=2000
  ORDER BY SAL DESC;

--7. 사번, 사원명, 업무, 급여, 부서명을 검색하시오. 단 업무가 MANAGER이며 급여가 2500이상인
-- 사원에 대하여 사번을 기준으로 오름차순으로 정열하시오.
SELECT EMPNO, ENAME, JOB, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND JOB='MANAGER' AND SAL>=2500
    ORDER BY EMPNO;

--8. 사번, 사원명, 업무, 급여, 등급을 검색하시오. 단, 급여기준 내림차순으로 정렬하시오
SELECT EMPNO, ENAME, JOB, SAL, GRADE
    FROM EMP, SALGRADE
        WHERE SAL BETWEEN LOSAL AND HISAL
            ORDER BY SAL DESC;

--9. 사원테이블에서 사원명, 사원의 상사를 검색하시오(상사가 없는 직원까지 전체)
SELECT W.ENAME, M.ENAME MANAGER
    FROM EMP W, EMP M
        WHERE W.MGR=M.EMPNO(+);
  

--10. 사원명, 상사명, 상사의 상사명을 검색하시오
SELECT W.ENAME WORKER, M.ENAME MANAGER, MM.ENAME TOPMANAGER
    FROM EMP W, EMP M, EMP MM
        WHERE W.MGR=M.EMPNO AND M.MGR=MM.EMPNO;

--11. 위의 결과에서 상위 상사가 없는 모든 직원의 이름도 출력되도록 수정하시오
SELECT W.ENAME WORKER, M.ENAME MANAGER, MM.ENAME TOPMANAGER
    FROM EMP W, EMP M, EMP MM
        WHERE W.MGR=M.EMPNO(+) AND M.MGR=MM.EMPNO(+);


