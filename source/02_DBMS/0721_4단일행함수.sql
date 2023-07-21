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
         
    SELECT LPAD('ORACLE', 10, '#') FROM DUAL;  -- ���� ���ڸ�
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
        ENAME, 
        LPAD(SUBSTR(JOB, -1, '1'), 9,  '_') JOB, 
        RPAD(TO_CHAR(HIREDATE , 'RR/MM/'), 8, '*') HIREDATE
    FROM EMP;
    -- �����ǵ� �ٸ� ����
SELECT EMPNO, 
        ENAME, 
        JOB, 
        TO_CHAR(HIREDATE , 'RR/MM/') || '**' HIREDATE
    FROM EMP;

