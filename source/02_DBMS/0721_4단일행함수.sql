    -- [IV] 단일행 함수
    -- 함수 = 단일행함수 + 그룹함수(집계함수)
    
    -- 단일행 적용(INPUT 1행 -> OUTPUT 1행)
    SELECT HIREDATE, TO_CHAR(HIREDATE, 'YYYY-MM-DD')FROM EMP;
    --그룹함수 (INPUT이 N행 - > OUTPUT 1행)
    SELECT SUM(SAL), AVG(SAL) FROM EMP;
    --DEPTNO별 그룹함수 적용(INPUT N행 -> OUTPUT 1행)
    SELECT DEPTNO, SUM(SAL), AVG(SAL) FROM EMP GROUP BY DEPTNO;
    
    -- 단일행 함수 : 1.숫자관련함수, 2.문자관련함수, 3.날짜관련함수, 4.형변환함수, 5.NVL(), 6.ETC...
    
    -- DUAL 테이블 : 오라클에서 제공한 1행1열짜리 DUMMY TABLE
        SELECT * FROM DUAL;
        SELECT * FROM DUMMY;
    
    --1. 숫자관련함수
    -- (FLOOR)
    SELECT FLOOR(34.5678) FROM DUAL; -- 소수점에서 내림(버림)
    SELECT FLOOR(34.5678*100)/100 FROM DUAL; -- 소수점 두번째 자리에서 내림(버림)
    -- (TRUNC)
    SELECT TRUNC(34.5678,2) FROM DUAL; -- 소수점 두번째 자리에서 내림(버림)
    SELECT TRUNC(34.5678, -1) FROM DUAL; -- 일의 자리에서 내림(버림)
    
    -- EX EXP테이블에서 이름, 급여(십의자리 내림)
    SELECT ENAME, TRUNC(SAL, -2), SAL FROM EMP;
    -- (ROUND)
    SELECT ROUND(34.5678) FROM DUAL; -- 소수점에서 반올림(35)
    SELECT ROUND(34.5678, 2) FROM DUAL; -- 소수점 두번째 자리에서 반올림(34.57)
    SELECT ROUND(34.5678, -1) FROM DUAL; -- 일의 자리에서 반올림(30)
    -- (CEIL)
    SELECT CEIL (34.5678) FROM DUAL; -- 소수점에서 올림(35)
    SELECT CEIL (34.5678*100)/100 FROM DUAL; -- 소수점 두번째자리에서 올림(34.57)
    -- 나누기 연산자(MOD)
    SELECT MOD(9, 2) FROM DUAL; -- 9%2
        -- 홀수년도에 입사한 사원의 모든 정보 출력
    SELECT * FROM EMP WHERE MOD(TO_CHAR(HIREDATE, 'RR'),2) = 1;  
    
    -- [2].문자관련함수
    
    -- [1].대소문자 관련 --
    SELECT INITCAP ('WELCOME TO ORACLE')FROM DUAL; -- 어절단위로 나눠서 첫글자만 대문자로
    
    SELECT UPPER('ABCabc') FROM DUAL; -- 무조건 대문자로
    
    SELECT LOWER('ABCabc') FROM DUAL; -- 무조건 소문자로
    -- EX. 이름이 Scott인 직원의 모든 필드
    SELECT * FROM EMP WHERE UPPER(ENAME)='SCOTT';
    SELECT * FROM EMP WHERE INITCAP(ENAME)='Scott';
    SELECT * FROM EMP WHERE LOWER(ENAME)='scott';
    
    -- [2]. 문자연결(CONCAT함수, ||연산자)
    SELECT 'AB'||'CD'||'EF'||'GH' FROM DUAL; -- 연결연산자
    SELECT CONCAT('AB','CD','EF','GH') FROM DUAL; --불가
    SELECT CONCAT(CONCAT('AB','CD'), CONCAT('EF','GH') ) FROM DUAL; -- CONCAT함수
    
        --EX. SMITH는 MANAGER다
    SELECT ENAME ||'는' || JOB || '다'FROM EMP;
    SELECT CONCAT(CONCAT(ENAME, '는'), CONCAT(JOB,'다')) FROM EMP;
    
    -- [3]. SUBSTR(STR, 시작위치, 문자갯수) : STR을 시작위치부터 문자갯수만큼 추출
                                    -- 시작위치가 1부터 시작, 위치가 음수이면 끝부터 자리수를 셉니다
         -- SUBSTRB(STR, 시작바이트위치, 추출바이트수) : STR을 시작바이트위치부터 바이트수만 추출
    SELECT SUBSTR('ORACLE', 3, 2) FROM DUAL;  -- 3번째 글자부터 두글자 가져와라
    SELECT SUBSTRB('ORACLE', 3, 2) FROM DUAL; -- 3번째 글자부터 2바이트 가져와라
    SELECT SUBSTR('데이터베이스', 4, 3) FROM DUAL; --4번째 글자부터 3글자 가져와라
    SELECT SUBSTRB('데이터베이스', 4, 3) FROM DUAL; --4번째 글자부터 3글자 가져와라
    
        -- O R A C L E
        -- 1 2 3 4 5 6 (위치)
        -- 6 5 4 3 2 1 (위치)
    SELECT SUBSTR ('010-9999-1234', -4, 4) FROM DUAL; -- 4번째 글자부터 4글자 추출
    SELECT SUBSTR('ORACLE', -1, 1) FROM DUAL; -- 마지막글자만 추출
    
    SELECT SUBSTR(123, -1, 1) FROM DUAL; -- 숫자 데이터 적용
    --EX. 9일에 입사한 사원의 모든 정보
    SELECT * FROM EMP WHERE SUBSTR(HIREDATE, -2, 2)='09'; -- 9일에 입사한 사람 추출
    SELECT * FROM EMP WHERE SUBSTR(TO_CHAR(HIREDATE,'RR/MM/DD'), -2, 2) = '09';
    SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'DD') = '09'; 
    
    -- [4] LENGTH(STR) : STR의 글자수
        --   LENGTHB(STR) : STR의 바이트 수
        SELECT LENGTH('ABC') FROM DUAL;
        SELECT LENGTHB('ABC') FROM DUAL;
        SELECT LENGTH('오라클') FROM DUAL;
        SELECT LENGTHB('오라클') FROM DUAL;
        
    -- [5] LPAD(STR, 자리수,  채울문자) : STR을 자리수만큼 확보하고 왼쪽 빈자리에 채울문자로 출력
         -- LPAD(STR, 자리수) : STR을 자리수만큼 확보 왼쪽 빈자리에 ' ' 로 출력
         -- RPAD(STR, 자리수,  채울문자) : STR을 자리수만큼 확보하고 오른쪽 빈자리에 채울문자로 출력
         -- RPAD(STR, 자리수) : STR을 자리수만큼 확보하고 오른쪽 빈자리에 ' '로 출력
         
    SELECT LPAD('ORACLE', 10, '#') FROM DUAL;  -- 왼쪽 빈자리
    SELECT RPAD('ORACLE', 10, '*') FROM DUAL;  -- 오른쪽 빈자리
    SELECT ENAME, LENGTH(ENAME), LENGTH(SAL) FROM EMP; -- ENAME 10글자 까지, SAL은 5자리 까지 가능
DESC EMP;
    SELECT  RPAD(ENAME, 11, '-')ENAME, LPAD(SAL, 6, '*') SAL FROM EMP;
    SELECT  LPAD(ENAME, 11, '-')ENAME, RPAD(SAL, 6, '*') SAL FROM EMP;
    -- EX1. 사번 이름(7369, S****, 7521 W***, ..) : SUBSTR, LENGTH, RPAD 
SELECT  EMPNO,
        RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') ENAME
            FROM EMP;

DESC EMP;
    -- EX2. 사번, 이름, 직책(9자리 확보), 입사일 (7396 SMITH _________****K 80/12/**) : LPAD, 
SELECT EMPNO, 
        ENAME, 
        LPAD(SUBSTR(JOB, -1, '1'), 9,  '_') JOB, 
        RPAD(TO_CHAR(HIREDATE , 'RR/MM/'), 8, '*') HIREDATE
    FROM EMP;
    -- 같은건데 다른 느낌
SELECT EMPNO, 
        ENAME, 
        JOB, 
        TO_CHAR(HIREDATE , 'RR/MM/') || '**' HIREDATE
    FROM EMP;

