    -- [IV] ������ �Լ�
    -- �Լ� = �������Լ� + �׷��Լ�(�����Լ�)
    
    -- ������ ����(INPUT 1�� -> OUTPUT 1��)
    SELECT HIREDATE, TO_CHAR(HIREDATE, 'YYYY-MM-DD')FROM EMP;
    --�׷��Լ� (INPUT�� N�� - > OUTPUT 1��)
    SELECT SUM(SAL), AVG(SAL) FROM EMP;
    --DEPTNO�� �׷��Լ� ����(INPUT N�� -> OUTPUT 1��)
    SELECT DEPTNO, SUM(SAL), AVG(SAL) FROM EMP GROUP BY DEPTNO;
    
    -- ������ �Լ� : 1.���ڰ����Լ�, 2.���ڰ����Լ�, 3.��¥�����Լ�, 4.����ȯ�Լ�, 5.NVL(), 6.ETC...
    
    -- DUAL ���̺� : ����Ŭ���� ������ 1��1��¥�� DUMMY TABLE
        SELECT * FROM DUAL;
        SELECT * FROM DUMMY;
    
    --1. ���ڰ����Լ�
    -- (FLOOR)
    SELECT FLOOR(34.5678) FROM DUAL; -- �Ҽ������� ����(����)
    SELECT FLOOR(34.5678*100)/100 FROM DUAL; -- �Ҽ��� �ι�° �ڸ����� ����(����)
    -- (TRUNC)
    SELECT TRUNC(34.5678,2) FROM DUAL; -- �Ҽ��� �ι�° �ڸ����� ����(����)
    SELECT TRUNC(34.5678, -1) FROM DUAL; -- ���� �ڸ����� ����(����)
    
    -- EX EXP���̺��� �̸�, �޿�(�����ڸ� ����)
    SELECT ENAME, TRUNC(SAL, -2), SAL FROM EMP;
    -- (ROUND)
    SELECT ROUND(34.5678) FROM DUAL; -- �Ҽ������� �ݿø�(35)
    SELECT ROUND(34.5678, 2) FROM DUAL; -- �Ҽ��� �ι�° �ڸ����� �ݿø�(34.57)
    SELECT ROUND(34.5678, -1) FROM DUAL; -- ���� �ڸ����� �ݿø�(30)
    -- (CEIL)
    SELECT CEIL (34.5678) FROM DUAL; -- �Ҽ������� �ø�(35)
    SELECT CEIL (34.5678*100)/100 FROM DUAL; -- �Ҽ��� �ι�°�ڸ����� �ø�(34.57)
    -- ������ ������(MOD)
    SELECT MOD(9, 2) FROM DUAL; -- 9%2
        -- Ȧ���⵵�� �Ի��� ����� ��� ���� ���
    SELECT * FROM EMP WHERE MOD(TO_CHAR(HIREDATE, 'RR'),2) = 1;  
    
    -- [2].���ڰ����Լ�
    
    -- [1].��ҹ��� ���� --
    SELECT INITCAP ('WELCOME TO ORACLE')FROM DUAL; -- ���������� ������ ù���ڸ� �빮�ڷ�
    
    SELECT UPPER('ABCabc') FROM DUAL; -- ������ �빮�ڷ�
    
    SELECT LOWER('ABCabc') FROM DUAL; -- ������ �ҹ��ڷ�
    -- EX. �̸��� Scott�� ������ ��� �ʵ�
    SELECT * FROM EMP WHERE UPPER(ENAME)='SCOTT';
    SELECT * FROM EMP WHERE INITCAP(ENAME)='Scott';
    SELECT * FROM EMP WHERE LOWER(ENAME)='scott';
    
    -- [2]. ���ڿ���(CONCAT�Լ�, ||������)
    SELECT 'AB'||'CD'||'EF'||'GH' FROM DUAL; -- ���Ῥ����
    SELECT CONCAT('AB','CD','EF','GH') FROM DUAL; --�Ұ�
    SELECT CONCAT(CONCAT('AB','CD'), CONCAT('EF','GH') ) FROM DUAL; -- CONCAT�Լ�
    
        --EX. SMITH�� MANAGER��
    SELECT ENAME ||'��' || JOB || '��'FROM EMP;
    SELECT CONCAT(CONCAT(ENAME, '��'), CONCAT(JOB,'��')) FROM EMP;
    
    -- [3]. SUBSTR(STR, ������ġ, ���ڰ���) : STR�� ������ġ���� ���ڰ�����ŭ ����
                                    -- ������ġ�� 1���� ����, ��ġ�� �����̸� ������ �ڸ����� ���ϴ�
         -- SUBSTRB(STR, ���۹���Ʈ��ġ, �������Ʈ��) : STR�� ���۹���Ʈ��ġ���� ����Ʈ���� ����
    SELECT SUBSTR('ORACLE', 3, 2) FROM DUAL;  -- 3��° ���ں��� �α��� �����Ͷ�
    SELECT SUBSTRB('ORACLE', 3, 2) FROM DUAL; -- 3��° ���ں��� 2����Ʈ �����Ͷ�
    SELECT SUBSTR('�����ͺ��̽�', 4, 3) FROM DUAL; --4��° ���ں��� 3���� �����Ͷ�
    SELECT SUBSTRB('�����ͺ��̽�', 4, 3) FROM DUAL; --4��° ���ں��� 3���� �����Ͷ�
    
        -- O R A C L E
        -- 1 2 3 4 5 6 (��ġ)
        -- 6 5 4 3 2 1 (��ġ)
    SELECT SUBSTR ('010-9999-1234', -4, 4) FROM DUAL; -- 4��° ���ں��� 4���� ����
    SELECT SUBSTR('ORACLE', -1, 1) FROM DUAL; -- ���������ڸ� ����
    
    SELECT SUBSTR(123, -1, 1) FROM DUAL; -- ���� ������ ����
    --EX. 9�Ͽ� �Ի��� ����� ��� ����
    SELECT * FROM EMP WHERE SUBSTR(HIREDATE, -2, 2)='09'; -- 9�Ͽ� �Ի��� ��� ����
    SELECT * FROM EMP WHERE SUBSTR(TO_CHAR(HIREDATE,'RR/MM/DD'), -2, 2) = '09';
    SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'DD') = '09'; 
    
    -- [4] LENGTH(STR) : STR�� ���ڼ�
        --   LENGTHB(STR) : STR�� ����Ʈ ��
        SELECT LENGTH('ABC') FROM DUAL;
        SELECT LENGTHB('ABC') FROM DUAL;
        SELECT LENGTH('����Ŭ') FROM DUAL;
        SELECT LENGTHB('����Ŭ') FROM DUAL;
        
    -- [5] LPAD(STR, �ڸ���,  ä�﹮��) : STR�� �ڸ�����ŭ Ȯ���ϰ� ���� ���ڸ��� ä�﹮�ڷ� ���
         -- LPAD(STR, �ڸ���) : STR�� �ڸ�����ŭ Ȯ�� ���� ���ڸ��� ' ' �� ���
         -- RPAD(STR, �ڸ���,  ä�﹮��) : STR�� �ڸ�����ŭ Ȯ���ϰ� ������ ���ڸ��� ä�﹮�ڷ� ���
         -- RPAD(STR, �ڸ���) : STR�� �ڸ�����ŭ Ȯ���ϰ� ������ ���ڸ��� ' '�� ���
         
    SELECT LPAD('ORACLE', 10, '#') LPAD FROM DUAL;  -- ���� ���ڸ�
    SELECT RPAD('ORACLE', 10, '*') FROM DUAL;  -- ������ ���ڸ�
    SELECT ENAME, LENGTH(ENAME), LENGTH(SAL) FROM EMP; -- ENAME 10���� ����, SAL�� 5�ڸ� ���� ����
    DESC EMP;
    SELECT  RPAD(ENAME, 11, '-')ENAME, LPAD(SAL, 6, '*') SAL FROM EMP;
    SELECT  LPAD(ENAME, 11, '-')ENAME, RPAD(SAL, 6, '*') SAL FROM EMP;
    -- EX1. ��� �̸�(7369, S****, 7521 W***, ..) : SUBSTR, LENGTH, RPAD 
    SELECT  EMPNO,
        RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') ENAME
            FROM EMP;

    DESC EMP;
    -- EX2. ���, �̸�, ��å(9�ڸ� Ȯ��), �Ի��� (7396 SMITH _________****K 80/12/**) : LPAD, 
    SELECT EMPNO, 
        INITCAP(ENAME) ENAME, 
        LPAD(LPAD(SUBSTR(JOB, -1, 1), LENGTH(JOB),'*'),  9) JOB, 
        RPAD(TO_CHAR(HIREDATE , 'RR/MM/'), 8, '*') HIREDATE
        FROM EMP;
    -- �����ǵ� �ٸ� ����
    SELECT EMPNO, 
        ENAME, 
        LPAD(LPAD(SUBSTR(JOB, -1, 1), LENGTH(JOB),'*'),  9) JOB, 
        TO_CHAR(HIREDATE , 'RR/MM/') || '**' HIREDATE
        FROM EMP;

    --  [6] INSTR(STR, ã������) : STR���� ù��°���ں��� ã�����ڰ� ������ ��ġ(������ 0)
    --  INSTR(STR, ã������, ������ġ)  : STR���� ������ġ���� ã�� ���ڰ� ������ ��ġ
    SELECT INSTR('ABCABC', 'B') FROM DUAL;
    SELECT INSTR('ABCABC', 'B', 3)FROM DUAL; -- 3��°���ں��� ã�� ó�� ������ B��ġ : 5
    SELECT INSTR('ABCABC', 'B', -3)FROM DUAL; -- ���̳ʽ��� �ں��� 3��° ���ں��� �ڷ� ã�� ó�� ������ B��ġ : 2
    -- EX.  9���� �Ի��� ����� ��� ������ ���(INSTR)
    SELECT * FROM EMP WHERE INSTR(HIREDATE,'09', 4)= 4;
    SELECT * FROM EMP WHERE INSTR(TO_CHAR(HIREDATE, 'RR/MM/DD'), '09', 4)=4;
    -- EX.  9���� �Ի��� ����� ��� ������ ���(INSTR)
    SELECT * FROM EMP WHERE INSTR(HIREDATE, '09', 7)=7;
    
    -- [7] �������� : TRIM(STR), LTRIM(STR), RTRIM(STR)
SELECT '    ORACLEQ     ' MSG FROM DUAL;
SELECT TRIM(  '    ORACLEQ     ') MSG FROM DUAL;
SELECT LTRIM('    ORACLEQ     ') MSG FROM DUAL;
SELECT RTRIM('    ORACLEQ     ') MSG FROM DUAL;
    
    -- [8] REPLACE(STR, �ٲ���ҹ���, �ٲ���) : STR���� �ٲ���� ���ڸ� �ٲܹ��ڷ� ��ü
    SELECT ENAME. REPLACE(ENAME, 'A', 'XXX') REPLACENAME  FROM EMP;
    SELECT REPLACE(SAL, '0', '*') FROM EMP;
    SELECT REPLACE(HIREDATE, '0','*') FROM EMP;
    
    --��¥ ���� �Լ� �� �����
    -- [1] SYSDATE :  ����
    SELECT SYSDATE FROM DUAL;
    ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD HH24:MI:SS';
    ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD'; -- ��¥���󺹱�
    SELECT * FROM EMP;
    -- [2] ��¥��� : ����Ŭ Ÿ��(��¥, ����, ����) �� ��¥�� ���ڴ� ���갡��
    ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD HH24:MI:SS';
    SELECT SYSDATE -1 �����̽ð�, SYSDATE, SYSDATE+1 �����̽ð� FROM DUAL;
    ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD'; -- ��¥���󺹱�
    --EX. �ݳ�������
    SELECT SYSDATE+14 FROM DUAL;
    --EX. �������� ~ ������� ���� ������?
    SELECT TRUNC (SYSDATE -TO_DATE('23/06/26 09:30', 'RR/MM/DD HH24:MI')) DAY FROM DUAL;
    --EX. ����~ �������(23.12.11 13:20)���� ���� ��������
    SELECT TRUNC (TO_DATE('23/12/11 13:20', 'RR/MM/DD HH24:MI')- SYSDATE) FROM DUAL; 
    --EX. EMP���� �̸�, �Ի���, �ٹ��ϼ�
    SELECT ENAME, HIREDATE, TRUNC(SYSDATE-HIREDATE) DAY FROM EMP;
    --EX. EMP���� �̸�, �Ի���, �ٹ���, �ٹ��ּ�, �ٹ����
    SELECT ENAME, HIREDATE,
        TRUNC (SYSDATE-HIREDATE) DAY,  
        TRUNC ( (SYSDATE-HIREDATE) /7) WEEK,
        TRUNC ( (SYSDATE-HIREDATE) /365.25) YEAR
        FROM EMP;
    
    -- [3] MONTHS_BETWEEN(����1, ����2) : �� �������� ������(����1�� ���߽���)
    --EX. �̸�, �Ի���, �ٹ�����
    SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) MONTH FROM EMP;
    --EX. �̸�, �Ի��� ���� ȸ�翡�� ���� ���� �� �󿩱�(������ �Ѵ޿� �ѹ�, �󿩱� 1��2��)
    SELECT ENAME, 
        SAL * TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE) ) +
        NVL(COMM, 0) * 2 +TRUNC((SYSDATE-HIREDATE)/365) COST
    FROM EMP;
    
    -- [4] ADD_MONTHS(Ư������, ������): Ư���������� �����
    --�̸�, �Ի���, �����������(�����Ⱓ 3����)
    SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE ,3) ADD_MONTHS FROM EMP;
    --�Ի����� 22.11.30�̸� �����Ⱓ�� 23.2.28
    SELECT * FROM EMP;
    INSERT INTO EMP VALUES (8000, 'ȫ�浿', NULL, NULL, '22/11/30', NULL, NULL, 40);
    SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 3) ADD_MONTHS FROM EMP;
    ROLLBACK;
    
    -- [5] NEXT_DAY(Ư������, '��') : Ư���������� ó�� �����ϴ� �����
    SELECT NEXT_DAY(SYSDATE, '��') FROM DUAL;
    
    -- [5] LAST_DAY(Ư������,) : Ư�������� ����(28,29,30,31)
    SELECT LAST_DAY(SYSDATE) FROM DUAL;
    -- �̸�, �Ի���, ù ���޳�(���޳��� �̹��� ���� -> ������ ����)
    SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE) ���޳� FROM EMP; -- �̹��� ����
    SELECT ENAME, HIREDATE, ADD_MONTHS(LAST_DAY(HIREDATE),1) ���޳� FROM EMP; -- ������ ����
    SELECT ENAME, HIREDATE, LAST_DAY(ADD_MONTHS(HIREDATE ,1)) ���޳� FROM EMP; -- ������ ����(�����Ŷ� �Ȱ���.)
    
    -- [7]  ROUND(��¥, XX); ��¥�� �ݿø� (XX:YEAR. MONTH, DAY)
    SELECT ROUND(34.5678, 1 ) FROM DUAL;
    SELECT ROUND(SYSDATE, 'YEAR') FROM DUAL; -- ��� : ����� 1��1��
    SELECT ROUND(SYSDATE, 'MONTH') FROM DUAL; -- ��� : ����� 1��(1~15�ϱ����� �̹��� 1�� / 16�� ���ĸ� ������ 1��)
    SELECT ROUND(SYSDATE) FROM DUAL; -- ��� : ����� 6��
    SELECT ROUND(SYSDATE, 'DAY') FROM DUAL; -- ��� :  ����� �Ͽ���
    SELECT TRUNC(SYSDATE, 'DAY') FROM DUAL; -- ��� :  ���� �Ͽ���
    SELECT TRUNC(SYSDATE, 'MONTH') FROM DUAL; -- ��� : �̹���1��
    SELECT TRUNC(SYSDATE, 'YEAR') FROM DUAL; -- ��� : ���� 1��1��
    -- �̸�, �Ի���, ù���޳�(16��) : 1~15�� �Ի�� �̹��� 16���� ����, 16�� ���Ŀ� �Ի�� ������ 16�� �Ա�
    SELECT ENAME, HIREDATE, ROUND(HIREDATE, 'MONTH')+15 ù���޳� FROM EMP;
    -- �̸�, �Ի���, ù���޳�(10��) : 1~9�� �Ի�� �̹��� 10���� ����, 10�� ���Ŀ� �Ի�� ������ 10�� ����
    SELECT ENAME, HIREDATE, ROUND(HIREDATE+6, 'MONTH')+9 ù���޳� FROM EMP;
    -- �̸�, �Ի���, ù���޳�(20��) : 1~19�� �Ի�� �̹��� 20���� ����, 20�� ���Ŀ� �Ի�� ������ 20�� ����
    SELECT ENAME, HIREDATE, ROUND(HIREDATE-4, 'MONTH')+19 ù���޳� FROM EMP;
    
    -- [4] ����ȯ �Լ� 
    -- TO_CHAR : ���ڷ� ����ȯ / TO_DATE : ��¥�� ����ȯ / TO_NUMBER: ���ڷ� ����ȯ) 
    -- (1) TO_CHAR(��¥��, '��¹��')
        -- ������� : YYYY�⵵ 4�ڸ� / RR �⵵ 2�ڸ� / MM �� / DD �� / DY ���� / HH24 / HH12 / AM �̳� PM / MI�� / SS��
        -- ������Ŀ� ���ڸ� ������ ��� " " �ȿ�
        SELECT ENAME, TO_CHAR(HIREDATE, 'YYYY-MM-DD-DY"����" HH24:MI:SS') FROM EMP;
        SELECT ENAME, TO_CHAR(HIREDATE, 'RR"��"MM"��"DD"��" DY"����" AM HH12"��"MI"��"SS"��"') FROM EMP;
        
    -- (2) TO_CHAR(������, '�������')
        -- ������� 0 : �ڸ���, ��������� �ڸ����� �����������ͺ��� ������ 0���� ä��
        -- ��¹�� 9 : �ڸ���, ��������� �ڸ����� �����������ͺ��� ���Ƶ� �����������͸� ���
        -- ��¹�� , .
        -- ��¹�� L : ������ȭ������ �߰�
        -- ��¹�� $ : ��ȭ���� $ �߰�
        SELECT TO_CHAR(12345678, '000,000') FROM DUAL;
        SELECT TO_CHAR(12345, '999,999') FROM DUAL;
        SELECT TO_CHAR(1004.76, '99,999.9') FROM DUAL;
        SELECT TO_CHAR(1200, 'L9,999') FROM DUAL;
        -- EX. �̸�, �޿�, $���ڸ����� �޸��� �߰��� SAL
        DESC EMP;
                -- SAL�� 7�ڸ� ���� �� �Ҽ��� 2�ڸ�.
        SELECT ENAME, SAL, TO_CHAR(SAL, '$99,999') FROM EMP;
        
        
    -- (3) TO_DATE(����, '����')
        -- EX. 81/5/1 ~ 83/5/1 ���̿� �Ի��� ������ ��� �ʵ�
        SELECT * FROM EMP
            WHERE HIREDATE BETWEEN TO_DATE('05/01/81', 'MM/DD/RR') AND TO_DATE('05/01/83', 'MM/DD/RR'); -- TO_DATE �̿�
         
         SELECT * FROM EMP
            WHERE TO_CHAR(HIREDATE, 'RR/MM/DD') BETWEEN '81/05/01' AND '83/05/01'; --TO_CHAR()�̿�
        
    -- (4) TO_NUMBER(����, ����X)
    SELECT TO_NUMBER('3.456' , '9,999') + / 1 FROM DUAL;
    SELECT '3,456' + 1 FROM DUAL;
        
    -- (5) NVL(���ϼ��� �ִ� ������, ���̸� ����� �� ) - �Ű����� 2���� Ÿ���� ��ġ
    -- EX ����̸�, ��������̸�(���ӻ�簡 ������ CEO�� ���)
    SELECT W.ENAME, MGR
    FROM EMP W, DEPT D
        WHERE W.MGR = M.EMPNO(+);
    -- EX ����̸�, ����ǻ��(����� ����� ������ CEO�� ���
    SELECT ENAME, NVL(TO_CHAR(MGR), 'CEO') MGR FROM EMP;
        
-- [6] ETC ...
    -- (1) EXTRACT : ��¥�� �����Ϳ��� �⵵, ��, �ϸ� �����ϰ��� �Ҷ�
    SELECT HIREDATE, EXTRACT(YEAR FROM HIREDATE) YEAR FROM EMP;
    SELECT HIREDATE, TO_CHAR(HIREDATE, 'YYYY') YEAR FROM EMP;
    SELECT HIREDATE, EXTRACT(MONTH FROM HIREDATE) MONTH FROM EMP;
    SELECT HIREDATE, TO_CHAR(HIREDATE, 'MM') MONTH FROM EMP;
    SELECT HIREDATE, EXTRACT(DAY FROM HIREDATE) DAY FROM EMP;
    SELECT HIREDATE, TO_CHAR(HIREDATE, 'DD') MONTH FROM EMP;
    
-- (2) ������ ���
    SELECT ENAME, SAL FROM EMP;
    SELECT LEVEL, LPAD('��',LEVEL*2) || ENAME, SAL FROM EMP
        START WITH MGR IS NULL
        CONNECT BY PRIOR EMPNO=MGR;
    
-- <�� ��������>

-- 1. ���� ��¥�� ����ϰ� TITLE�� ��Current Date���� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT SYSDATE "Current Date" FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'RR/MM/DD') "Current Date" FROM DUAL;
    
-- 2. EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� ����Ͽ�,
-- �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase)�� ����ϴ� SELECT ����
SELECT EMPNO, ENAME, JOB, SAL, SAL*1.15 "NEW SALARY", SAL*0.15 INCREASE FROM EMP;

--3. �̸�, �Ի���, �Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, HIREDATE,
    NEXT_DAY(ADD_MONTHS(HIREDATE, 6), '��' ) MONDAYIN6MONTHS
    FROM EMP;

--4. �̸�, �Ի���, �Ի��Ϸκ��� ��������� ������, �޿�, �Ի��Ϻ��� ��������� ���� �޿��� �Ѱ踦 ���
SELECT ENAME, HIREDATE, 
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) NUMBER_OF_MONTH,
    SAL,
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) *SAL SALSUM
FROM EMP;

--5. ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ �� ���� ��*���� ��ġ)�� ���
SELECT ENAME, LPAD(SAL, 15, '*') SAL FROM EMP;

--6. ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE, 'DY"����"') WEEK FROM EMP;

--7. �̸��� ���̰� 6�� �̻��� ����� ������ �̸�,�̸��� ���ڼ�,������ ���
SELECT ENAME, LENGTH(ENAME), JOB FROM EMP WHERE LENGTH(ENAME)>= 6;

--8. ��� ����� ������ �̸�, ����, �޿�, ���ʽ�, �޿�+���ʽ��� ���
SELECT ENAME, JOB, SAL, COMM, SAL+NVL(COMM, 0) FROM EMP;

-- 9.��� ���̺��� ������� 2��° ���ں��� 3���� ���ڸ� �����Ͻÿ�. 
SELECT SUBSTR(ENAME, 2, 3) FROM EMP;

--10. ��� ���̺��� �Ի����� 12���� ����� ���, �����, �Ի����� �˻��Ͻÿ�. 
--  �ý��ۿ� ���� DATEFORMAT �ٸ� �� �����Ƿ� �Ʒ��� ����� �˾ƺ���
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE EXTRACT(MONTH FROM HIREDATE)=12;

--11. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
--EMPNO		ENAME		�޿�
--7369		       SMITH		*******800
--7499		       ALLEN		******1600
--7521		       WARD		******1250
--����. 
SELECT EMPNO, ENAME, LPAD(SAL, 10, '*') �޿� FROM EMP;

-- 12. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
-- EMPNO	 ENAME 	�Ի���
-- 7369	  SMITH		1980-12-17
-- ��.
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY-MM-DD') �Ի��� FROM EMP;

--13. ��� ���̺��� �μ� ��ȣ�� 20�� ����� ���, �̸�, ����, �޿��� ����Ͻÿ�.
    --(�޿��� �տ� $�� �����ϰ�3�ڸ����� ,�� ����Ѵ�)
   SELECT EMPNO, ENAME, JOB, TO_CHAR(SAL, '$99,999') FROM EMP WHERE DEPTNO=20;
   SELECT * FROM EMP;
   INSERT INTO EMP WALUES (8000, 'ȫ�浿', NULL, NULL, SYSDATE, 100000, NULL, 40);  -- ����
    
    