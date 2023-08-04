-- Ex1. 사용자로부터 부서번호 받아 부서정보 출력
SELECT *FROM DEPT WHERE DEPTNO=50;

-- EX2. 부서정보, (사번, 이름, 급여, 상사이름) 출력
SELECT *FROM DEPT WHERE DEPTNO=10;
SELECT W.EMPNO, W.ENAME, W.SAL, M.ENAME MANAGER
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+) AND W.DEPTNO = 10;
    
-- EX3. 사용자로부터 부서명을 받아 부서정보 출력
SELECT * FROM DEPT WHERE DNAME='SALES';
SELECT * FROM DEPT WHERE DNAME=UPPER('SALES');