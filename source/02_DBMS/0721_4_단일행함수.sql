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
         
    SELECT LPAD('ORACLE', 10, '#') LPAD FROM DUAL;  -- 왼쪽 빈자리
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
        INITCAP(ENAME) ENAME, 
        LPAD(LPAD(SUBSTR(JOB, -1, 1), LENGTH(JOB),'*'),  9) JOB, 
        RPAD(TO_CHAR(HIREDATE , 'RR/MM/'), 8, '*') HIREDATE
        FROM EMP;
    -- 같은건데 다른 느낌
    SELECT EMPNO, 
        ENAME, 
        LPAD(LPAD(SUBSTR(JOB, -1, 1), LENGTH(JOB),'*'),  9) JOB, 
        TO_CHAR(HIREDATE , 'RR/MM/') || '**' HIREDATE
        FROM EMP;

    --  [6] INSTR(STR, 찾을문자) : STR에서 첫번째문자부터 찾을문자가 나오는 위치(없으면 0)
    --  INSTR(STR, 찾을문자, 시작위치)  : STR에서 시작위치부터 찾을 문자가 나오는 위치
    SELECT INSTR('ABCABC', 'B') FROM DUAL;
    SELECT INSTR('ABCABC', 'B', 3)FROM DUAL; -- 3번째문자부터 찾아 처음 나오는 B위치 : 5
    SELECT INSTR('ABCABC', 'B', -3)FROM DUAL; -- 마이너스면 뒤부터 3번째 문자부터 뒤로 찾아 처음 나오는 B위치 : 2
    -- EX.  9월에 입사한 사원의 모든 정보를 출력(INSTR)
    SELECT * FROM EMP WHERE INSTR(HIREDATE,'09', 4)= 4;
    SELECT * FROM EMP WHERE INSTR(TO_CHAR(HIREDATE, 'RR/MM/DD'), '09', 4)=4;
    -- EX.  9월에 입사한 사원의 모든 정보를 출력(INSTR)
    SELECT * FROM EMP WHERE INSTR(HIREDATE, '09', 7)=7;
    
    -- [7] 여백제거 : TRIM(STR), LTRIM(STR), RTRIM(STR)
SELECT '    ORACLEQ     ' MSG FROM DUAL;
SELECT TRIM(  '    ORACLEQ     ') MSG FROM DUAL;
SELECT LTRIM('    ORACLEQ     ') MSG FROM DUAL;
SELECT RTRIM('    ORACLEQ     ') MSG FROM DUAL;
    
    -- [8] REPLACE(STR, 바꿔야할문자, 바뀔문자) : STR에서 바꿔야할 문자를 바꿀문자로 교체
    SELECT ENAME. REPLACE(ENAME, 'A', 'XXX') REPLACENAME  FROM EMP;
    SELECT REPLACE(SAL, '0', '*') FROM EMP;
    SELECT REPLACE(HIREDATE, '0','*') FROM EMP;
    
    --날짜 관련 함수 및 예약어
    -- [1] SYSDATE :  지금
    SELECT SYSDATE FROM DUAL;
    ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD HH24:MI:SS';
    ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD'; -- 날짜원상복구
    SELECT * FROM EMP;
    -- [2] 날짜계산 : 오라클 타입(날짜, 숫자, 문자) 중 날짜와 숫자는 연산가능
    ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD HH24:MI:SS';
    SELECT SYSDATE -1 어제이시간, SYSDATE, SYSDATE+1 내일이시간 FROM DUAL;
    ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD'; -- 날짜원상복구
    --EX. 반납예정일
    SELECT SYSDATE+14 FROM DUAL;
    --EX. 개강시점 ~ 현재까지 몇일 지났니?
    SELECT TRUNC (SYSDATE -TO_DATE('23/06/26 09:30', 'RR/MM/DD HH24:MI')) DAY FROM DUAL;
    --EX. 현재~ 수료시점(23.12.11 13:20)까지 몇일 남았을까
    SELECT TRUNC (TO_DATE('23/12/11 13:20', 'RR/MM/DD HH24:MI')- SYSDATE) FROM DUAL; 
    --EX. EMP에서 이름, 입사일, 근무일수
    SELECT ENAME, HIREDATE, TRUNC(SYSDATE-HIREDATE) DAY FROM EMP;
    --EX. EMP에서 이름, 입사일, 근무일, 근무주수, 근무년수
    SELECT ENAME, HIREDATE,
        TRUNC (SYSDATE-HIREDATE) DAY,  
        TRUNC ( (SYSDATE-HIREDATE) /7) WEEK,
        TRUNC ( (SYSDATE-HIREDATE) /365.25) YEAR
        FROM EMP;
    
    -- [3] MONTHS_BETWEEN(시점1, 시점2) : 두 시점간의 개월수(시점1이 나중시점)
    --EX. 이름, 입사일, 근무월수
    SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) MONTH FROM EMP;
    --EX. 이름, 입사한 이후 회사에서 받은 월급 및 상여금(월급은 한달에 한번, 상여금 1년2번)
    SELECT ENAME, 
        SAL * TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE) ) +
        NVL(COMM, 0) * 2 +TRUNC((SYSDATE-HIREDATE)/365) COST
    FROM EMP;
    
    -- [4] ADD_MONTHS(특정시점, 개월수): 특정시점부터 몇개월후
    --이름, 입사일, 수습종료시점(수습기간 3개월)
    SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE ,3) ADD_MONTHS FROM EMP;
    --입사일이 22.11.30이면 수습기간은 23.2.28
    SELECT * FROM EMP;
    INSERT INTO EMP VALUES (8000, '홍길동', NULL, NULL, '22/11/30', NULL, NULL, 40);
    SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 3) ADD_MONTHS FROM EMP;
    ROLLBACK;
    
    -- [5] NEXT_DAY(특정시점, '토') : 특정시점부터 처음 도래하는 토요일
    SELECT NEXT_DAY(SYSDATE, '토') FROM DUAL;
    
    -- [5] LAST_DAY(특정시점,) : 특정시점의 말일(28,29,30,31)
    SELECT LAST_DAY(SYSDATE) FROM DUAL;
    -- 이름, 입사일, 첫 월급날(월급날은 이번달 말일 -> 다음달 말일)
    SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE) 월급날 FROM EMP; -- 이번달 말일
    SELECT ENAME, HIREDATE, ADD_MONTHS(LAST_DAY(HIREDATE),1) 월급날 FROM EMP; -- 다음달 말일
    SELECT ENAME, HIREDATE, LAST_DAY(ADD_MONTHS(HIREDATE ,1)) 월급날 FROM EMP; -- 다음달 말일(위에거랑 똑같다.)
    
    -- [7]  ROUND(날짜, XX); 날짜를 반올림 (XX:YEAR. MONTH, DAY)
    SELECT ROUND(34.5678, 1 ) FROM DUAL;
    SELECT ROUND(SYSDATE, 'YEAR') FROM DUAL; -- 결과 : 가까운 1월1일
    SELECT ROUND(SYSDATE, 'MONTH') FROM DUAL; -- 결과 : 가까운 1일(1~15일까지는 이번달 1일 / 16일 이후면 다음달 1일)
    SELECT ROUND(SYSDATE) FROM DUAL; -- 결과 : 가까운 6시
    SELECT ROUND(SYSDATE, 'DAY') FROM DUAL; -- 결과 :  가까운 일요일
    SELECT TRUNC(SYSDATE, 'DAY') FROM DUAL; -- 결과 :  지난 일요일
    SELECT TRUNC(SYSDATE, 'MONTH') FROM DUAL; -- 결과 : 이번달1일
    SELECT TRUNC(SYSDATE, 'YEAR') FROM DUAL; -- 결과 : 올해 1월1일
    -- 이름, 입사일, 첫월급날(16일) : 1~15일 입사면 이번달 16일이 월급, 16일 이후에 입사면 다음달 16일 입금
    SELECT ENAME, HIREDATE, ROUND(HIREDATE, 'MONTH')+15 첫월급날 FROM EMP;
    -- 이름, 입사일, 첫월급날(10일) : 1~9일 입사면 이번달 10일이 월급, 10일 이후에 입사면 다음달 10일 월급
    SELECT ENAME, HIREDATE, ROUND(HIREDATE+6, 'MONTH')+9 첫월급날 FROM EMP;
    -- 이름, 입사일, 첫월급날(20일) : 1~19일 입사면 이번달 20일이 월급, 20일 이후에 입사면 다음달 20일 월급
    SELECT ENAME, HIREDATE, ROUND(HIREDATE-4, 'MONTH')+19 첫월급날 FROM EMP;
    
    -- [4] 형변환 함수 
    -- TO_CHAR : 문자로 형변환 / TO_DATE : 날짜로 형변환 / TO_NUMBER: 숫자로 형변환) 
    -- (1) TO_CHAR(날짜형, '출력방식')
        -- 출력형식 : YYYY년도 4자리 / RR 년도 2자리 / MM 월 / DD 일 / DY 요일 / HH24 / HH12 / AM 이나 PM / MI분 / SS초
        -- 출력형식에 문자를 포함할 경우 " " 안에
        SELECT ENAME, TO_CHAR(HIREDATE, 'YYYY-MM-DD-DY"요일" HH24:MI:SS') FROM EMP;
        SELECT ENAME, TO_CHAR(HIREDATE, 'RR"년"MM"월"DD"일" DY"요일" AM HH12"시"MI"분"SS"초"') FROM EMP;
        
    -- (2) TO_CHAR(숫자형, '출력형식')
        -- 출력형식 0 : 자릿수, 출력형식의 자릿수가 숫자형데이터보다 많으면 0으로 채움
        -- 출력방식 9 : 자릿수, 출력형식의 자릿수가 숫자형데이터보다 많아도 숫자형데이터만 출력
        -- 출력방식 , .
        -- 출력방식 L : 지역통화단위를 추가
        -- 출력방식 $ : 통화단위 $ 추가
        SELECT TO_CHAR(12345678, '000,000') FROM DUAL;
        SELECT TO_CHAR(12345, '999,999') FROM DUAL;
        SELECT TO_CHAR(1004.76, '99,999.9') FROM DUAL;
        SELECT TO_CHAR(1200, 'L9,999') FROM DUAL;
        -- EX. 이름, 급여, $세자리마다 콤마가 추가된 SAL
        DESC EMP;
                -- SAL은 7자리 숫자 중 소수점 2자리.
        SELECT ENAME, SAL, TO_CHAR(SAL, '$99,999') FROM EMP;
        
        
    -- (3) TO_DATE(문자, '패턴')
        -- EX. 81/5/1 ~ 83/5/1 사이에 입사한 직원의 모든 필드
        SELECT * FROM EMP
            WHERE HIREDATE BETWEEN TO_DATE('05/01/81', 'MM/DD/RR') AND TO_DATE('05/01/83', 'MM/DD/RR'); -- TO_DATE 이용
         
         SELECT * FROM EMP
            WHERE TO_CHAR(HIREDATE, 'RR/MM/DD') BETWEEN '81/05/01' AND '83/05/01'; --TO_CHAR()이용
        
    -- (4) TO_NUMBER(문자, 패턴X)
    SELECT TO_NUMBER('3.456' , '9,999') + / 1 FROM DUAL;
    SELECT '3,456' + 1 FROM DUAL;
        
    -- (5) NVL(널일수도 있는 데이터, 널이면 대신할 값 ) - 매개변수 2개의 타입이 일치
    -- EX 사원이름, 직종상사이름(직속상사가 없으면 CEO로 출력)
    SELECT W.ENAME, MGR
    FROM EMP W, DEPT D
        WHERE W.MGR = M.EMPNO(+);
    -- EX 사원이름, 상사의사번(상사의 사번이 없으면 CEO로 출력
    SELECT ENAME, NVL(TO_CHAR(MGR), 'CEO') MGR FROM EMP;
        
-- [6] ETC ...
    -- (1) EXTRACT : 날짜형 데이터에서 년도, 월, 일만 추출하고자 할때
    SELECT HIREDATE, EXTRACT(YEAR FROM HIREDATE) YEAR FROM EMP;
    SELECT HIREDATE, TO_CHAR(HIREDATE, 'YYYY') YEAR FROM EMP;
    SELECT HIREDATE, EXTRACT(MONTH FROM HIREDATE) MONTH FROM EMP;
    SELECT HIREDATE, TO_CHAR(HIREDATE, 'MM') MONTH FROM EMP;
    SELECT HIREDATE, EXTRACT(DAY FROM HIREDATE) DAY FROM EMP;
    SELECT HIREDATE, TO_CHAR(HIREDATE, 'DD') MONTH FROM EMP;
    
-- (2) 계층별 출력
    SELECT ENAME, SAL FROM EMP;
    SELECT LEVEL, LPAD('└',LEVEL*2) || ENAME, SAL FROM EMP
        START WITH MGR IS NULL
        CONNECT BY PRIOR EMPNO=MGR;
    
-- <총 연습문제>

-- 1. 현재 날짜를 출력하고 TITLE에 “Current Date”로 출력하는 SELECT 문장을 기술하시오.
SELECT SYSDATE "Current Date" FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'RR/MM/DD') "Current Date" FROM DUAL;
    
-- 2. EMP 테이블에서 현재 급여에 15%가 증가된 급여를 계산하여,
-- 사원번호,이름,업무,급여,증가된 급여(New Salary),증가액(Increase)를 출력하는 SELECT 문장
SELECT EMPNO, ENAME, JOB, SAL, SAL*1.15 "NEW SALARY", SAL*0.15 INCREASE FROM EMP;

--3. 이름, 입사일, 입사일로부터 6개월 후 돌아오는 월요일 구하여 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, HIREDATE,
    NEXT_DAY(ADD_MONTHS(HIREDATE, 6), '월' ) MONDAYIN6MONTHS
    FROM EMP;

--4. 이름, 입사일, 입사일로부터 현재까지의 개월수, 급여, 입사일부터 현재까지의 받은 급여의 총계를 출력
SELECT ENAME, HIREDATE, 
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) NUMBER_OF_MONTH,
    SAL,
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) *SAL SALSUM
FROM EMP;

--5. 모든 사원의 이름과 급여(15자리로 출력 좌측의 빈 곳은 “*”로 대치)를 출력
SELECT ENAME, LPAD(SAL, 15, '*') SAL FROM EMP;

--6. 모든 사원의 정보를 이름,업무,입사일,입사한 요일을 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE, 'DY"요일"') WEEK FROM EMP;

--7. 이름의 길이가 6자 이상인 사원의 정보를 이름,이름의 글자수,업무를 출력
SELECT ENAME, LENGTH(ENAME), JOB FROM EMP WHERE LENGTH(ENAME)>= 6;

--8. 모든 사원의 정보를 이름, 업무, 급여, 보너스, 급여+보너스를 출력
SELECT ENAME, JOB, SAL, COMM, SAL+NVL(COMM, 0) FROM EMP;

-- 9.사원 테이블의 사원명에서 2번째 문자부터 3개의 문자를 추출하시오. 
SELECT SUBSTR(ENAME, 2, 3) FROM EMP;

--10. 사원 테이블에서 입사일이 12월인 사원의 사번, 사원명, 입사일을 검색하시오. 
--  시스템에 따라 DATEFORMAT 다를 수 있으므로 아래의 방법도 알아보자
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE EXTRACT(MONTH FROM HIREDATE)=12;

--11. 다음과 같은 결과를 검색할 수 있는 SQL 문장을 작성하시오
--EMPNO		ENAME		급여
--7369		       SMITH		*******800
--7499		       ALLEN		******1600
--7521		       WARD		******1250
--……. 
SELECT EMPNO, ENAME, LPAD(SAL, 10, '*') 급여 FROM EMP;

-- 12. 다음과 같은 결과를 검색할 수 있는 SQL 문장을 작성하시오
-- EMPNO	 ENAME 	입사일
-- 7369	  SMITH		1980-12-17
-- ….
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY-MM-DD') 입사일 FROM EMP;

--13. 사원 테이블에서 부서 번호가 20인 사원의 사번, 이름, 직무, 급여를 출력하시오.
    --(급여는 앞에 $를 삽입하고3자리마다 ,를 출력한다)
   SELECT EMPNO, ENAME, JOB, TO_CHAR(SAL, '$99,999') FROM EMP WHERE DEPTNO=20;
   SELECT * FROM EMP;
   INSERT INTO EMP WALUES (8000, '홍길동', NULL, NULL, SYSDATE, 100000, NULL, 40);  -- 에러
    
    