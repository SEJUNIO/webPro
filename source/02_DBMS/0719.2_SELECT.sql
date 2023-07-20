    -- [II] SELECT문 -조회
-- 1. SELECT 문장 작성법 (실행방법 : CTRL+ENTER) SQL문은 대소문자 구분X
    SHOW USER;
    SELECT * FROM TAB;  -- 현계정이 가지고 있는 테이블 정보
    SELECT * FROM EMP;  -- EMP테이블의 모든 열(필드), 모든 행
    SELECT * FROM DEPT; -- DEPT테이블의 모든열(필드), 모든 행
    SELECT * FROM SALGRADE ; -- SALGRAD테이블의 모든 열(필드), 모든 행

-- 2. 특정 열만 출력
    DESC EMP;    
    -- EMP테이블 구조
    SELECT EMPNO, ENAME, SAL, JOB FROM EMP;
    -- EMPNO, ENAME, SAL, JOB필드의 모든행 출력
    SELECT EMPNO, ENAME, SAL, JOB, MGR, COMM FROM EMP;
    SELECT EMPNO AS "사 번", ENAME AS "이름", SAL AS "급여", JOB AS "직책" 
        FROM EMP;
    SELECT EMPNO AS "사 번", ENAME AS 이름, SAL AS 급여, JOB AS 직책 
        FROM EMP;
    SELECT EMPNO "N O", ENAME NAME, SAL SALARY, JOB FROM EMP; -- 필드의 별칭을 두는 경우            
            
-- 3. 특정 행 출력  : WHERE절(조건절) -- 비교 연산자(=),다르다(!=, ^=, <>) >, >=, <, <=
    SELECT EMPNO "사번", ENAME "이름", SAL "급여" FROM EMP WHERE SAL=3000; -- 같다
    SELECT EMPNO "사번", ENAME "이름", SAL "급여" FROM EMP WHERE SAL!=3000; -- 다르다
    SELECT EMPNO "사번", ENAME "이름", SAL "급여" FROM EMP WHERE SAL^=3000; -- 다르다
    SELECT EMPNO "사번", ENAME "이름", SAL "급여" FROM EMP WHERE SAL<>3000; -- 다르다
    SELECT * FROM EMP WHERE SAL<3000; //이것도 주석인가
    -- 비교연산자는 숫자형(NUMBER), 문자(VARCHAR2), 날짜(DATE) 모두 가능
    -- EX1. 사원이름(ENAME)이 'A', 'B', 'C'로 시작하는 사원의 모든 필드 출력
    -- A < AA < AAA < AAAA < AAAA ...A < B < BA < BAA..A< BB ...
    SELECT * FROM EMP WHERE ENAME < 'D';
    -- EX2. 81년도 이전에 입사한 사원의 모든 필드
    SELECT * FROM EMP WHERE HIREDATE < '81/01/01';
    -- EX3. 부서번호(DEPTNO)가 10번 부서인 사원의 모든 필드
    SELECT * FROM EMP WHERE DEPTNO=10;
    -- EX4. 이름(ENAME)이 FORD인 직원의 사번(EMPNO), 이름(ENAME), 상사의 사번(MGR)을 출력
    SELECT EMPNO, ENAME, MGR FROM EMP WHERE ENAME = 'FORD';
    -- SQL문 대소문자 구별 없음. 데이터은 대소문자 구별
    select empno, ename, mgr from emp where ename = 'ford';

-- 4. 조건절의 논리연산자 : AND, OR, NOT 
    -- EX1. RMQDU(SAL)가 2000이상, 3000이하인 직원의 모든 필드를 출력
    SELECT * FROM EMP WHERE SAL>=2000 AND SAL<=3000;
    -- EX2. 82년도에 입사한 사원의 모든 필드
    SELECT * FROM EMP WHERE HIREDATE >='82,1,1' AND HIREDATE <='82,12,31';
    -- 날짜 표기법 셋팅(현재 : YY/MM/DD 또는 RR/MM/DD)
    ALTER SESSION SET NLS_DATE_FORMAT = 'MM--DD-YYYY';
    SELECT * FROM EMP WHERE HIREDATE>='01-01-1982' AND HIREDATE<='12-31-1982';
    SELECT * FROM EMP
        WHERE TO_CHAR(HIREDATE, 'RR/MM/DD') >= '82/01/01'
            AND TO_CHAR(HIREDATE, 'RR/MM/DD') <= '82/12/31';
    -- 날짜 표기법 복귀
    ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
    -- EX3. 연봉이 2400이상인 직원의 ENMAE, SAL, 연봉(SAL*12)을 출력
    SELECT ENAME, SAL, SAL*12 "ANNUALSAL" -- 수행순서(3)
        FROM EMP   -- 수행순서(1)
            WHERE SAL*12 >= 2400; -- 수행순서(2) WHERE절에는 필드의 별칭 사용 불가 
    -- EX4. 연봉이 2400이상인 직원의 ENMAE, SAL, 연봉(SAL*12)을 출력 (연봉순으로)
    SELECT ENAME ,SAL, SAL*12 ANNUALSAL  -- (3)
        FROM EMP    -- (1)
            WHERE SAL*12 >= 2400  -- (2)
            ORDER BY ANNUALSAL; -- (4) ORDER BY절에서는 필드의 별칭 사용 가능
    -- EX5. 10부서(DEPTNO) 이거나 JOB이 MANAGER인 직원의 모든 필드
    SELECT * FROM EMP WHERE DEPTNO=10 OR JOB='MANAGER';
    -- EX6. 부서번호가 10번 부서가 아닌 직원의 모든 필드
    SELECT * FROM EMP WHERE DEPTNO !=10; 
    SELECT * FROM EMP WHERE DEPTNO ^=10; 
    SELECT * FROM EMP WHERE DEPTNO <>10; 
    SELECT * FROM EMP WHERE NOT DEPTNO=10; 
--5 산술연산자 (SELECT절, 조건절, ORDER BY절)
    SELECT EMPNO, ENAME, SAL 현재월급, SAL*1.1 올릴월급 FROM EMP;
        --EX. 모든 사원의 이름(ENAME), 월급(SAL), 연봉(SAL*12+COMM)을 출력
    SELECT ENAME, SAL, SAL*12+COMM ANNUALSAL FROM EMP;
    -- 산술연산의 결과는 NULL을 포함하면 결과도 NULL
    -- NVL(NULL일수도 있는 필드명, 대치값)을 이용 : 필드명과 대체값은 타입이 일치해야 한다.
    SELECT ENAME, SAL, SAL*12+NVL(COMM, 0) ANNUALSAL FROM EMP;
    -- 모든 사원의 ENAME, MGR(상사의 사번)을 출력(상사의 사번없으면-1)
    SELECT ENAME, NVL(MGR, -1) FROM EMP; 
    -- 모든 사원의 ENAME, MGR(상사의 사번)을 출력(상사가 없으면 'CEO'라고 출력)
    SELECT ENAME, NVL(TO_CHAR(MGR), 'CEO') FROM EMP;
    
    -- 연결연산자(||) : 필드나 문자를 연결
    SELECT ENMAE || '은(는)' || JOB || '다' MESSAGE FROM EMP;
    -- EX 모든 사원에 대해 SMITH : ANNUAL SALARY == XX포멧으로 출력(연봉 =SAL*12+COMM)
    SELECT ENAME || ': ANNUAL SALARY =' || ( SAL*12+NVL(COMM, 0) ) MESSAGE FROM EMP;
    
--7. 중복제거 (DISTINCT)
    SELECT DISTINCT JOB FROM EMP;
    SELECT DISTINCT DEPTNO FROM EMP;

    --1. emp 테이블의 구조 출력
    DESC EMP;
    --2. emp 테이블의 모든 내용을 출력 
    SELECT * FROM EMP;
    --3. 현 scott 계정에서 사용가능한 테이블 출력
    SELECT * FROM EMP TAB;
    --4. emp 테이블에서 사번, 이름, 급여, 업무, 입사일 출력
    SELECT EMPNO, ENAME, SAL, JOB, HIREDATE FROM EMP;
    --5. emp 테이블에서 급여가 2000미만인 사람의 사번, 이름, 급여 출력
    SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL < 2000;    
    --6. 입사일이 81/02이후에 입사한 사람의 사번, 이름, 업무, 입사일 출력
    SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE, 'RR/MM/DD') >'81/02/01';
    --7. 업무가 SALESMAN인 사람들 모든 자료 출력
    SELECT * FROM EMP WHERE JOB ='SALESMAN' ;
    --8. 업무가 CLERK이 아닌 사람들 모든 자료 출력
    SELECT * FROM EMP WHERE JOB !='CLERK' ;
    --9. 급여가 1500이상이고 3000이하인 사람의 사번, 이름, 급여 출력
    SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL>=1500 AND SAL<=3000;
    --10. 부서코드가 10번이거나 30인 사람의 사번, 이름, 업무, 부서코드 출력
    SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP  WHERE DEPTNO =10 OR DEPTNO =30;
    --11. 업무가 SALESMAN이거나 급여가 3000이상인 사람의 사번, 이름, 업무, 부서코드 출력
    SELECT EMPNO, ENAME, SAL, JOB FROM EMP WHERE JOB ='SALESMAN' OR SAL>=3000;
    --12. 급여가 2500이상이고 업무가 MANAGER인 사람의 사번, 이름, 업무, 급여 출력
    SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL >=2500 AND JOB = 'MANAGER'; 
    --※※※(예제못품 복습)13.“ename은 XXX 업무이고 연봉은 XX다” 스타일로 모두 출력(연봉은 SAL*12+COMM)
    SELECT ENAME || '은 ' || JOB || '업무이고 연봉은 ' || (SAL*12+NVL(COMM,0)) || '다' MESSAGE FROM EMP;
    -- 연결연산자 사용시 NULL을 포함하면 출력 안됨       
    -- 산술연산자 사용시 NULL을 포함하면 결과 NULL
    
-- 8.  SQL연산자 (BETWEEN A AND B), IN(A, B), LIKE(패턴), IS NULL)
    -- (1) BETWEEN A AND B : A부터 B까지 (A,B포함 A<B)
    -- EX. 급여가 1500이상이고 3000이하인 사람의 사번, 이름, 급여 출력
  SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL>1500 AND SAL<=3000;
  SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL BETWEEN 1500 AND 3000;
  SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL BETWEEN 3000 AND 1500; -- 불가하다.
    -- EX. 급여가 1500 미만, 3000초과인 사람의 모든 필드
    SELECT * FROM EMP WHERE SAL NOT BETWEEN 1500 AND 3000;
    -- EX. 이름이 'A', 'B', 'C'로 시작하는 직원의 모든 필드
    SELECT * FROM EMP WHERE ENAME BETWEEN 'A' AND 'D' AND ENAME !='D';
    -- EX. 82년도에 입사한 직원의 모든 필드
    SELECT * FROM EMP WHERE HIREDATE BETWEEN '82/01/01' AND '82/12/31';
    
    --(2) IN 연산자
    -- EX. 부서번호(DEPTNO)가 10, 20, 40번 부서인 직원의 모든 필드
    SELECT * FROM EMP WHERE DEPTNO=10 OR DEPTNO=20 OR DEPTNO=40; // IN을 안쓸때
    SELECT * FROM EMP WHERE DEPTNO IN (10,20,40); // IN연산자 사용
    -- EX. 부서번호가 10, 20, 40번 부서를 제외한 직원의 모든 필드
    SELECT * FROM EMP WHERE DEPTNO!=10 AND DEPTNO!=20 AND DEPTNO!=40;// IN을 안쓸때
    SELECT * FROM EMP WHERE DEPTNO NOT IN (10,20,40); // NOT IN 연산자 사용
    -- EX. 사번(EMPNO)이 7902, 7788, 7566인 사원의 모든정보
    SELECT * FROM EMP WHERE EMPNO IN (7902, 7788, 7566);
            
     -- (3) LIKE 패턴 : %(0글자이상), _(한글자)을 포함한 패턴
     -- EX. 이름이 N으로 시작하는 사원의 모든 필드 ; M,MA,MXXXXX
     SELECT * FROM EMP WHERE ENAME LIKE 'M%'; //M으로 시작하는 이름 찾아라
     -- EX. 이름에 M이 들어가는 사원의 모든 필드
     SELECT * FROM EMP WHERE ENAME LIKE '%M%'; //M을 포함하는 모든 이름 찾아라
     -- EX. 이름에 N이 들어가거나 JOB에 N이 들어가는 사원의 모든 필드
     SELECT * FROM EMP WHERE ENAME LIKE '%N%' OR JOB LIKE '%N%';
     -- EX. 이름이 'S'로 끝나는 사원의 모든 필드
     SELECT * FROM EMP WHERE ENAME LIKE '%S'; //S로 끝나는 이름을 찾아라
     -- EX. SAL이 5 로 끝나는 사원의 모든 필드
     SELECT * FROM EMP WHERE SAL LIKE '%5';
     -- EX. 82년도에 입사한 사원의 모든 필드
     SELECT * FROM EMP WHERE HIREDATE LIKE '82/%';
     SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'RR/MM/DD') LIKE '82/__/__';
     -- EX. 1월에 입사한 사원의 모든 필드
     SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'RR/MM/DD') LIKE '__/01/__';
     
     --(4) IS NULL (NULL인지를 검색할 때)
     -- EX. 상여금(COMM)이 없는 사원의 모든 필드
     SELECT * FROM EMP WHERE COMM IS NULL OR COMM = 0;
     -- EX. 상여금이 있는 사원(COMM이 NULL도 아니고 0도 아닌)의 모든 필드
     SELECT * FROM EMP WHERE COMM IS NOT NULL; //상여금이 있는 사원을 출력할때
     SELECT * FROM EMP WHERE COMM IS NOT NULL AND COMM!=0; //IS NULL도 아니고 0도 아닌 상여값이 있는 사람만 출력
     --SELECT * FROM EMP WHERE COMM NOT IS NULL; -- 불가
     
-- 9. 정렬 (오름차순, 내림차순) ;ORDER BY절
    SELECT ENAME, SAL, HIREDATE FROM EMP ORDER BY SAL ASC; -- 급여 오름차순 정렬
    -- ASC (생략가능)
    SELECT ENAME, SAL, HIREDATE FROM EMP ORDER BY SAL DESC; -- 급여 내림차순 정렬
    SELECT ENAME, SAL, HIREDATE FROM EMP ORDER BY SAL DESC, HIREDATE DESC;
                                                --급여 내림차순 정렬 ,급여가 같은경우 최신 입사일 순
    SELECT ENAME, SAL, HIREDATE FROM EMP ORDER BY SAL DESC, HIREDATE;
                                                --급여 내림차순 정렬, 급여가 같은 경우 입사순
    SELECT ENAME, SAL, HIREDATE FROM EMP ORDER BY ENAME;  -- 이름 오름차순 정렬(ABC순)
    SELECT ENAME, SAL, HIREDATE FROM EMP ORDER BY HIREDATE; -- 입사일 오름차순 정렬
    SELECT ENAME, SAL, HIREDATE FROM EMP ORDER BY HIREDATE DESC; -- 입사일 내림차순 정렬(최신순)
     
    -- 1.	EMP 테이블에서 sal이 3000이상인 사원의 empno, ename, job, sal을 출력
    SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL >=3000;
    -- 2.	EMP 테이블에서 empno가 7788인 사원의 ename과 deptno를 출력
    SELECT ENAME, DEPTNO, EMPNO FROM EMP WHERE EMPNO IN (7788); 
    -- 3.	연봉이 24000이상인 사번, 이름, 급여 출력 (급여순정렬)
    SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL>=2400 ORDER BY SAL;
    -- 4.	입사일이 1981년 2월 20과 1981년 5월 1일 사이에 입사한 사원의 사원명, 직책, 입사일을 출력 (단 hiredate 순으로 출력)
    SELECT ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE BETWEEN '81/2/20' AND '81/5/1' ORDER BY HIREDATE;
    -- 5.	deptno가 10,20인 사원의 모든 정보를 출력 (단 ename순으로 정렬)
    SELECT * FROM EMP WHERE DEPTNO IN (10,20) ORDER BY ENAME;
    -- 6.	sal이 1500이상이고 deptno가 10,30인 사원의 ename과 sal를 출력
    -- (단 HEADING을 employee과 Monthly Salary로 출력)
    SELECT ENAME, SAL, DEPTNO FROM EMP WHERE  SAL >=1500 AND DEPTNO IN(10,30) ;
    -- 7.	hiredate가 1982년인 사원의 모든 정보를 출력
    SELECT * FROM EMP WHERE HIREDATE BETWEEN '82/01/01' AND '82/12/31';
    -- 8.	이름의 첫자가 C부터  P로 시작하는 사람의 이름, 급여 이름순 정렬
    SELECT ENAME, SAL FROM EMP WHERE ENAME LIKE 'C%' OR ENAME LIKE 'P%'; 
    -- 9.	comm이 sal보다 10%가 많은 모든 사원에 대하여 이름, 급여, 상여금을 
    --출력하는 SELECT 문을 작성
    SELECT ENAME, SAL, COMM FROM EMP WHERE COMM > SAL*1.1;
    -- 10.	job이 CLERK이거나 ANALYST이고 sal이 1000,3000,5000이 아닌 모든 사원의 정보를 출력
    SELECT * FROM EMP WHERE  JOB = 'CLERK' OR JOB = 'ANALYST' OR SAL NOT IN (1000,3000,5000); 
    -- 11.	ename에 L이 두 자가 있고 deptno가 30이거나 또는 mgr이 7782인 사원의 
    --모든 정보를 출력하는 SELECT 문을 작성하여라.
    SELECT * FROM EMP WHERE ENAME LIKE '%LL%' AND DEPTNO ='30' OR MGR='7782';
    -- 12.	입사일이 81년도인 직원의 사번,사원명, 입사일, 업무, 급여를 출력
    SELECT EMPNO, ENAME, HIREDATE, JOB , SAL FROM EMP WHERE HIREDATE BETWEEN '81/01/01' AND '81/12/31';
    -- 13.	입사일이81년이고 업무가 'SALESMAN'이 아닌 직원의 사번, 사원명, 입사일, 
    -- 업무, 급여를 검색하시오.
    SELECT EMPNO, ENAME, HIREDATE, JOB, SAL FROM EMP WHERE HIREDATE BETWEEN '81/01/01' AND '81/12/31' OR NOT IN = SALESMAN;
    -- 14.	사번, 사원명, 입사일, 업무, 급여를 급여가 높은 순으로 정렬하고, 
    -- 급여가 같으면 입사일이 빠른 사원으로 정렬하시오.
    SELECT EMPNO, ENAME, HIREDATE, JOB, SAL FROM EMP ORDER BY SAL DESC, HIREDATE DESC;
    -- 15.	사원명의 세 번째 알파벳이 'N'인 사원의 사번, 사원명을 검색하시오
    SELECT EMPNO, ENAME FROM EMP WHERE ENAME LIKE '%N%';
    -- 16.	사원명에 'A'가 들어간 사원의 사번, 사원명을 출력
    
    -- 17.	연봉(SAL*12)이 35000 이상인 사번, 사원명, 연봉을 검색 하시오.


     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
            
    
    
    
    
    
    
