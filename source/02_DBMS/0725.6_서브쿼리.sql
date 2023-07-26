-- [VI] Sub Qeruy : ���� query(SQL��)�ȿ� query(SQL��)�� ����
-- �� 1. ���� ���� ����
  -- ���������� �ʿ��� ex. �޿��� ���� ���� �޴� ����� ��� ����
SELECT MAX(SAL) FROM EMP; -- ��������
SELECT * FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP); -- ���� ����
  
  -- ���������� ����(1)������ ��������(���������� �������� ������) : = > >= < <= !=
    -- ex. SCOTT�� ������ �μ����� �ٹ��ϴ� ����� �̸�, �޿�
SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'; -- ������ ��������
SELECT ENAME, SAL
      FROM EMP
      WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT')
          AND ENAME <> 'SCOTT'; -- ��������
  -- ���������� ����(2)������ ��������(���������� �������� 2���̻�) : IN, > ALL, > ANY(SOME), EXISTS
    -- ex. SCOTT�̳� KING�� ������ �μ����� �ٹ��ϴ� ����� �̸�, �޿� 
SELECT DEPTNO FROM EMP WHERE ENAME IN ('SCOTT', 'KING'); -- ������ �������� 10,20
SELECT ENAME, SAL
      FROM EMP
      WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME IN ('SCOTT', 'KING')); -- ��������
  
-- �� 2. ������ ��������
  -- ex1. SCOTT�� ������ �ٹ������� �ٹ��ϴ� ����� ��� ����
    -- ������ �߰�(DALLAS 50������, 50���μ��� �ٹ��ϴ� ȫ�浿 ���)
INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
INSERT INTO EMP (EMPNO, ENAME, DEPTNO) VALUES (8000, 'ȫ�浿', 50);
SELECT * FROM DEPT;
SELECT * FROM EMP;
  SELECT LOC 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND ENAME='SCOTT'; -- ��������
  SELECT E.*, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND LOC=(SELECT LOC 
                                      FROM EMP E, DEPT D
                                      WHERE E.DEPTNO=D.DEPTNO AND ENAME='SCOTT')
                          AND ENAME <> 'SCOTT'; -- ��������
  ROLLBACK; -- DML(�߰�, ����, ����, �˻�) ��ɾ� ��� 
  -- ex2. �����Ի������̸��� �����Ի���
  SELECT MIN(HIREDATE) FROM EMP; -- ��������(�����Ի���)
  SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP); -- ��������
  -- ex3. �ֱ��Ի������̸��� �ֱ��Ի���
  SELECT MAX(HIREDATE) FROM EMP; -- ��������(�ֱ��Ի���)
  SELECT ENAME, HIREDATE FROM EP WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP); -- ��������
  -- ex4. �����Ի������̸��� �����Ի���, �ֱ��Ի������̸��� �ֱ��Ի��� (ex2 + eX3)
  SELECT E1.ENAME, E1.HIREDATE, E2.ENAME, E2.HIREDATE
    FROM EMP E1, EMP E2
    WHERE E1.HIREDATE = (SELECT MIN(HIREDATE) FROM EMP) AND
          E2.HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);
  
SELECT 
    (SELECT ENAME FROM EMP WHERE HIREDATE=(SELECT MIN(HIREDATE) FROM EMP) ) �����Ի���,
    (SELECT MIN(HIREDATE) FROM EMP) �����Ի���,
    (SELECT ENAME FROM EMP WHERE HIREDATE=(SELECT MAX(HIREDATE) FROM EMP)) �ֱ��Ի���,
    (SELECT MAX(HIREDATE) FROM EMP) �ֱ��Ի���
  FROM DUAL;
  -- ex5. SCOTT�� ���� �μ��� �ٹ��ϴ� ������� �޿��� 
SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'; -- ��������
SELECT SUM(SAL) FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'); -- ��������
    -- EX6. SCOTT�� ������ JOB�� ���� ����� ��� �ʵ�(����)
    
SELECT JOB FROM EMP WHERE ENAME = 'SCOTT'; -- ��������
SELECT * FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'SCOTT'); -- ��������
    
    -- EX. 7 DALLAS�� �ٹ��ϴ� ����� �̸��� �μ���ȣ ( ��������, JOIN)
SELECT DEPTNO FROM DEPT WHERE LOC= 'DALLAS'; -- ������ ��������
SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC= 'DALLAS'); -- ��������
    
SELECT ENAME, E.DEPTNO FROM EMP E, DEPT D WHERE E.DEPTNO = D. DEPTNO AND LOC='DALLAS';  -- JOIN �̿�
    
    -- EX.8 'KING'�� ���ӻ���� ����� �̸��� �޿�( ��������, SELF-JOIN)
SELECT EMPNO FROM EMP WHERE ENAME = 'KING'; -- ��������
SELECT ENAME, SAL FROM EMP WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING'); -- ��������

SELECT W.ENAME, W.SAL
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO AND M.ENAME = 'KING'; -- �������� �̿�
    -- EX.9 ��ձ޿� ���Ϸ� �޴� ����� �̸��� �޿��� ���
SELECT ENAME, SAL FROM EMP WHERE SAL <=(SELECT AVG(SAL) FROM EMP);
    -- EX.10 ��ձ޿� ���Ϸ� �޴� ����� �̸�, �޿�,  ��ձ޿�(�Ҽ���1�ڸ��ݿø�)�� ���
SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP), 1) AVG
    FROM EMP
    WHERE SAL <=(SELECT AVG(SAL) FROM EMP);
    -- EX.11 ��ձ޿� ���Ϸ� �޴� ����� �̸�, �޿�, ��ձ޿����� ����(�Ҽ���1�ڸ� �ݿø�)�� ���
SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP)-SAL, 1) DIEE
    FROM EMP
    WHERE SAL <=(SELECT AVG(SAL) FROM EMP);
    
    -- ������ ���߿� ��������
    -- SCOTT�� JOB�� �μ���ȣ�� ���� ������ ��� �ʵ� ���
SELECT JOB, DEPTNO FROM EMP WHERE ENAME = 'SCOTT';
SELECT * FROM EMP                                                                      
    WHERE (JOB, DEPTNO) = (SELECT JOB, DEPTNO FROM EMP WHERE ENAME = 'SCOTT') AND ENAME <> 'SCOTT';
    
-- ��. (3). ������ ��������  : IN, ALL, ANY(=SOME), EXISTS
    -- (1) -- IN : ���������� ��� �� �ϳ��� ��ġ�ϸ� ��
    -- EX. �μ��� �Ի����� ���� ���� ����� �̸�, �Ի���, �μ���ȣ
SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO; -- ������ ���߿� ��������
SELECT ENAME, HIREDATE, DEPTNO
    FROM EMP
    WHERE (DEPTNO, HIREDATE) IN (SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO); -- ��������
    --EX. �޿��� 3000�̻� �޴� ����� �Ҽӵ� �μ�������� ��� �ʵ�
SELECT DEPTNO FROM EMP WHERE SAL >= 3000; -- ������ �������� (20,10,20)
SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL >= 3000);

-- (2) ALL : �������� ��� ��� �����ϸ� ��
  -- ex. 30�� �μ����� ��� �޿����� ū ������ ��� �ʵ�
  SELECT SAL FROM EMP WHERE DEPTNO=30; -- 950, 1250, 1500, 1600, 2850
  SELECT * FROM EMP
    WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO=30); -- ������ �������� �̿�
    -- = 30�� �μ������� �ִ� �޿����� �޿��� ū ������ ��� �ʵ�
  SELECT * FROM EMP
    WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30); -- ������ �������� �̿�
    
-- (3) ANY(=SOME) : �������� ����� �ϳ��̻� �����ϸ� ��
  -- 30�� �μ� ���� �Ѹ��̶� �޿��� ū ������ ��� �ʵ�
  SELECT SAL FROM EMP WHERE DEPTNO=30; -- �������� ��� : 950, 1250, 1500, 1600, 2850
  SELECT * FROM EMP
    WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO=30); -- �������� : ������ �������� �̿�
  -- = 30�� �μ������� �ּ� �޿����� ���� �޴� ������ ��� �ʵ�
  SELECT * FROM EMP 
    WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30); -- �������� : ������ �������� �̿�


-- (4) EXISTS : �������� ����� �����ϸ� ��
    -- EX. ���Ӻ��ϰ� �ִ� �������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL
    FROM EMP MANAGER
    WHERE EXISTS (SELECT *FROM EMP WHERE MANAGER.EMPNO=MGR); -- �������� �̿�
    
SELECT DISTINCT M.EMPNO, M.ENAME, M.SAL
    FROM EMP W, EMP M
    WHERE W.MGR= M.EMPNO; -- SELF-JOIN �̿�
    -- EX. ���Ӻ��ϰ� ���� �������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL 
    FROM EMP M
    WHERE NOT EXISTS (SELECT * FROM EMP WHERE  M.EMPNO=MGR); -- �������� �̿�

SELECT W.ENAME, M.EMPNO, M.ENAME, M.SAL
    FROM EMP W, EMP M
    WHERE W.MGR(+)= M.EMPNO;

-- źź1. �μ����� ���� �޿��� ���� �޴� ����� ��� ������ ���(IN������ ���)
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO; -- ��������
SELECT E.*, GRADE, DNAME, LOC
FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL 
    AND (E.DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO)
    ORDER BY E.DEPTNO;
    
-- źź2. ����(JOB)�� MANAGER�� ����� ���� �μ��� �μ� ��ȣ�� �μ���� ������ ���(IN)
SELECT DEPTNO FROM EMP WHERE JOB = 'MANAGER'; 
SELECT * FROM DEPT
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB = 'MANAGER');
-- źź3. �޿��� 3000�̻��� ����� �� ���� ����� ����� �ش� ��޺� �ְ� �޿��� �޴� ������� ���, �̸�, ����, �Ի���, �޿�, �޿������ ���
SELECT GRADE , MAX(SAL) 
    FROM SALGRADE ,EMP
    WHERE SAL BETWEEN LOSAL AND HISAL AND SAL >=3000
    GROUP BY GRADE; -- �������� (������)

SELECT EMPNO, ENAME, JOB, HIREDATE, SAL, GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL 
    AND (GRADE, SAL) IN (SELECT GRADE , MAX(SAL) 
                            FROM SALGRADE ,EMP
                            WHERE SAL BETWEEN LOSAL AND HISAL AND SAL >=3000
                            GROUP BY GRADE); 
-- źź4. �����ȭ : �Ի��� �б⺰�� ���� ���� ������ �޴� ������� �б�, ���, �̸�, JOB, �����, �Ի���, �޿�, �󿩸� ����ϼ���
SELECT HIREDATE, TRUNC(EXTRACT(MONTH FROM HIREDATE)/3)+1 "QUARTER" FROM EMP; -- �б�
SELECT HIREDATE, TO_CHAR(HIREDATE, 'Q') QUARTER FROM EMP; 

SELECT TO_CHAR(HIREDATE, 'Q'), MAX(SAL)
    FROM EMP GROUP BY TO_CHAR(HIREDATE, 'Q'); -- �������� (�б⺰ �ְ� �޿�)
SELECT TO_CHAR(HIREDATE, 'Q') QUARTER, EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM
    FROM EMP
    WHERE(TO_CHAR(HIREDATE, 'Q'), SAL) IN (SELECT TO_CHAR(HIREDATE, 'Q'), MAX(SAL)
                                            FROM EMP 
                                            GROUP BY TO_CHAR(HIREDATE, 'Q'));
-- źź5. �޿��� 3000�̸��� ��� �߿� ���� �ֱٿ� �Ի��� ����� �����ȣ�� �̸�, �޿�, �Ի����� ���
SELECT MAX(HIREDATE) FROM EMP WHERE SAL<=3000;

SELECT EMPNO, ENAME, SAL, HIREDATE 
    FROM EMP
        WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP WHERE SAL<=3000);


-- źź6. SALESMAN ��� ����� ���� �޿��� ���� �޴� ������� �̸��� �޿��� ����(��� ����)�� ����ϵ� ���� ����� ������� �ʴ´�.(ALL�̿�)
SELECT SAL FROM EMP WHERE JOB = 'SALESMAN';

SELECT ENAME, SAL, JOB 
    FROM EMP
    WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN'); -- ALL �̿�
    
SELECT ENAME, SAL, JOB
    FROM EMP    
    WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN');

-- źź7. SALESMAN �Ϻ� � �� ������� �޿��� ���� �޴� ������� �̸��� �޿��� ����(��� ����)�� ����ϵ� ���� ����� ���(ANY)

   SELECT ENAME, SAL, JOB 
    FROM EMP
    WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN'); -- ANY �̿�
    
SELECT ENAME, SAL, JOB
    FROM EMP    
    WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE JOB = 'SALESMAN'); 
    
    
    
    
-- �� �� �� <�� ��������> �� �� ��  
-- 1~13�� : �����༭������

--1. ������̺��� ���� ���� �Ի��� ����� �̸�, �޿�, �Ի���
SELECT MIN(HIREDATE) FROM EMP;

SELECT ENAME, SAL, HIREDATE
    FROM EMP
    WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP);

-- 2. ȸ�翡�� ���� �޿��� ���� ����� �̸�, �޿�
SELECT MIN(SAL) FROM EMP;

SELECT ENAME, SAL 
    FROM EMP 
    WHERE SAL = (SELECT MIN(SAL) FROM EMP);

-- 3. ȸ�� ��պ��� �޿��� ���� �޴� ����� �̸�, �޿�, �μ��ڵ�
SELECT AVG(SAL) FROM EMP; 

SELECT ENAME, SAL, DEPTNO 
    FROM EMP 
    WHERE SAL > (SELECT AVG(SAL) FROM EMP);

--4. ȸ�� ��� ������ �޿��� �޴� ����� �̸�, �޿�, �μ���
SELECT ENAME, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND SAL <=(SELECT AVG(SAL) FROM EMP);
--5. SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���
SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT';
SELECT ENAME, SAL, HIREDATE, GRADE
    FROM EMP E, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL AND  HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT');

--6. 5��(SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���)�� �μ��� �߰��ϰ� �޿��� ū �� ����
SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT';
SELECT ENAME, SAL, HIREDATE, DNAME, GRADE
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL 
    AND  HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT');
--7. BLAKE ���� �޿��� ���� ������� ���, �̸�, �޿�
SELECT SAL FROM EMP WHERE ENAME = 'BLAKE';
SELECT EMPNO, ENAME, SAL FROM EMP 
    WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'BLAKE');
--8. MILLER���� �ʰ� �Ի��� ����� ���, �̸�, �Ի���
SELECT HIREDATE FROM EMP WHERE ENAME = 'MILLER';  -- 82/01/23
SELECT EMPNO, ENAME, HIREDATE 
    FROM EMP
        WHERE HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'MILLER');
--9. �����ü ��� �޿����� �޿��� ���� ������� ���, �̸�, �޿�
SELECT  AVG(SAL) FROM EMP;
SELECT EMPNO, ENAME, SAL 
    FROM EMP
        WHERE SAL > (SELECT  AVG(SAL) FROM EMP);
        
--10. CLARK�� ���� �μ���ȣ�̸�, ����� 7698�� ������ �޿����� ���� �޿��� �޴� ����� ���, �̸�, �޿�
SELECT DEPTNO FROM EMP WHERE ENAME = 'CLARK'; -- ��������1 
SELECT SAL FROM EMP WHERE EMPNO=7698; -- ��������2
SELECT EMPNO, ENAME, SAL
    FROM EMP
        WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'CLARK') 
        AND SAL > (SELECT SAL FROM EMP WHERE EMPNO=7698);
SELECT * FROM DEPT;        
--11.  �����ȭ. CLARK�� ���� �μ����̸�, ����� 7698�� ������ �޿����� ���� �޿��� �޴� ����� ���, �̸�, �޿�
SELECT DNAME FROM DEPT WHERE DEPTNO = 10; -- ��������1 
SELECT SAL FROM EMP WHERE EMPNO=7698; -- ��������2
SELECT EMPNO, ENAME, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO 
    AND DNAME = (SELECT DNAME FROM DEPT WHERE DEPTNO = 10) 
    AND SAL > (SELECT SAL FROM EMP WHERE EMPNO=7698);
--12. BLAKE�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի�����
SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE';
SELECT ENAME, HIREDATE FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE');
    
--13. ��� �޿� �̻��� �޴� ��� �������� ���ؼ� �����ȣ�� �̸� �� �޿��� ���� ������ ���)

SELECT  AVG(SAL) FROM EMP;
SELECT EMPNO, ENAME
    FROM EMP
        WHERE SAL >= (SELECT  AVG(SAL) FROM EMP)
        ORDER BY SAL;
    
-- ���⼭���ʹ� �����༭�������� �����༭������, ������ �����༭������

-- 14.  �̸��� ��T���� �ִ� ����� �ٹ��ϴ� �μ����� �ٹ��ϴ� ��� ������ ��� ��ȣ,�̸�,�޿�(�� ��� �� ���)
SELECT ENAME FROM EMP WHERE ENAME LIKE '%T%' ;

SELECT EMPNO, ENAME, SAL
    FROM EMP
        WHERE ENAME IN (SELECT ENAME FROM EMP WHERE ENAME LIKE '%T%');
-- 15. �μ� ��ġ�� Dallas�� ��� �������� ���� �̸�,����,�޿�
SELECT LOC FROM DEPT WHERE LOC = 'DALLAS';

SELECT ENAME, JOB, SAL 
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO AND LOC IN (SELECT LOC FROM DEPT WHERE LOC = 'DALLAS');
-- 16. EMP ���̺��� King���� �����ϴ� ��� ����� �̸��� �޿�
SELECT ENAME FROM EMP WHERE ENAME !='KING';

SELECT ENAME, SAL
    FROM EMP
        WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME ='KING');
-- 17. SALES�μ� ����� �̸�, ����
SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES';

SELECT ENAME, DNAME 
    FROM EMP E,DEPT D
        WHERE E.DEPTNO= D.DEPTNO AND DNAME IN (SELECT DNAME FROM EMP WHERE DNAME = 'SALES');
-- 18. ������ �μ� 30�� ���� ���޺��� ���� ����� ��� �ʵ�
SELECT SAL FROM EMP WHERE DEPTNO = 30 AND SAL > 950; 

SELECT * FROM EMP 
    WHERE SAL IN (SELECT SAL FROM EMP WHERE DEPTNO = 30 AND SAL > 950);
-- 19.  FORD�� ������ ���޵� ���� ����� ��� �ʵ�
SELECT JOB, SAL FROM EMP WHERE ENAME = 'FORD';

SELECT * FROM EMP
    WHERE  (JOB, SAL) IN (SELECT JOB, SAL FROM EMP WHERE ENAME = 'FORD') AND ENAME !='FORD';
-- 20. �̸��� JONES�� ������ JOB�� ���ų� FORD�� SAL �̻��� �޴� ����� ������ �̸�, ����, �μ���ȣ, �޿�
    -- ��, ������ ���ĺ� ��, ������ ���� ������ ���
SELECT ENAME FROM EMP WHERE JOB = 'MANAGER';
SELECT ENAME, SAL FROM EMP WHERE SAL >=3000;

SELECT ENAME, JOB, DEPTNO, SAL 
    FROM EMP
    WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'JONES') OR SAL >= (SELECT SAL FROM EMP WHERE ENAME='FORD')
    ORDER BY JOB;
-- 21. SCOTT �Ǵ� WARD�� ������ ���� ����� ������ �̸�,����,�޿�
SELECT ENAME, JOB, SAL FROM EMP WHERE SAL = 3000;
SELECT ENAME, JOB, SAL FROM EMP WHERE SAL = 1250;

SELECT ENAME, JOB, SAL 
    FROM EMP 
        WHERE (ENAME,JOB,SAL) IN (SELECT ENAME, JOB, SAL FROM EMP WHERE SAL = 3000) OR
             (ENAME,JOB,SAL) IN  (SELECT ENAME, JOB, SAL FROM EMP WHERE SAL = 1250);
-- 22. CHICAGO���� �ٹ��ϴ� ����� ���� ������ �ϴ� ������� �̸�,����
SELECT LOC FROM DEPT WHERE LOC = 'CHICAGO';

SELECT ENAME, JOB 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND LOC IN (SELECT LOC FROM DEPT WHERE LOC = 'CHICAGO');
-- 23. �μ� ��� ���޺��� ������ ���� ����� ���, �̸�, �޿�, �μ���ȣ
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP E
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);
    -- �μ� ��� ���޺��� ������ ���� ����� ���, �̸�, �޿�, �μ���ȣ 
SELECT EMPNO, ENAME, SAL, DEPTNO, ROUND((SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO)) AVG
    FROM EMP E
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);
    
-- 24. �������� ��� ���޺��� ���� ������ �޴� ����� �μ���ȣ, �̸�, �޿�
SELECT DEPTNO, ENAME, SAL, JOB 
    FROM EMP E
    WHERE SAL < (SELECT AVG(SAL) FROM EMP WHERE JOB=E.JOB);
-- 25. ��� �� �� �̻����κ��� ���� ���� �� �ִ� ����� ����, �̸�, ���, �μ���ȣ�� ���(��, �μ���ȣ ������ �������� ����)
SELECT JOB, ENAME, EMPNO, DEPTNO
    FROM EMP M
    WHERE EXISTS (SELECT * FROM EMP WHERE MGR=M.EMPNO); --EXISTS ������ �̿�(��������)
    
SELECT JOB, ENAME, EMPNO, DEPTNO
    FROM EMP
    WHERE EMPNO IN (SELECT MGR FROM EMP); -- IN ������ �̿�(��������)
-- 26.  ���� ����� ���, �̸�, ����, �μ���ȣ
SELECT * FROM EMP;
SELECT EMPNO, ENAME, JOB, DEPTNO
    FROM EMP M
    WHERE NOT EXISTS (SELECT * FROM EMP WHERE  M.EMPNO=MGR); 

SELECT JOB, ENAME, EMPNO, DEPTNO
    FROM EMP
    WHERE EMPNO IN (SELECT DISTINCT MGR FROM EMP);
    
    
    
    
    
    
    
    
    
    
    
    