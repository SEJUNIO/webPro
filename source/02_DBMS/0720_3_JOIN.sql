-- [III] JOIN (2�� �̻��� ���̺��� �����Ͽ� �����͸� �˻��ϴ� ���)
SELECT * FROM EMP WHERE ENAME = 'SCOTT'; -- 1��
SELECT * FROM DEPT; -- 4��
    -- CROSS JOIN(FROM ���� ���̺��� 2���̻�)
SELECT * FROM EMP, DEPT WHERE ENAME ='SCOTT'; -- 1*4 = 4��
SELECT * FROM EMP,DEPT; --EMP�� 14 * DEPT�� 4 = 56��

-- 1. EQUI JOIN (��������) : �����ʵ�(DEPTNO)�� ���� ��ġ�Ǵ� ���Ǹ� JOIN
SELECT * FROM EMP, DEPT
    WHERE EMP.DEPTNO=DEPT.DEPTNO AND ENAME='SCOTT'; 
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPT.DEPTNO,DNAME, LOC
    FROM EMP, DEPT
    WHERE EMP.DEPTNO=DEPT.DEPTNO;
SELECT EMPNO "NO", ENAME, JOB, MGR, HIREDATE, SAL, COMM, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D --���̺��� ��Ī�� ������� �����̺� ���� ����� �� ���� ��Ī�� ���
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY EMPNO;
    -- EX. �޿��� 2000�̻��� ������ �̸�, ��å, �޿�, �μ���, �ٹ��� ���
SELECT ENAME, JOB, SAL, DNAME, LOC, E.DEPTNO
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND SAL>=2000;
    -- EX. 20�� �μ��� ������ �̸�, �μ���ȣ, �ٹ��� ���
SELECT ENAME, E.DEPTNO, LOC
    FROM EMP E ,DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO=20;
    -- EX. �ٹ���(LOC)�� CHICAGO�� ����� �̸�, ����, �޿�, �μ���ȣ ���
SELECT ENAME, JOB, SAL, D.DEPTNO
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND LOC = 'CHICAGO';
    -- EX. �μ���ȣ�� 10�̰ų� 20�� ����� �̸�, ����, �ٹ���(�޿���)
SELECT ENAME, JOB, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO IN (10,20)
    ORDER BY SAL;
    -- EX. JOB�� SALESMAN�̰ų� MANAGER�� ����� �̸�, �޿�, ��, ����=(SAL+COMM)*12 , �μ���, �ٹ���(������ ū��)
SELECT ENAME, SAL, COMM, (SAL + NVL(COMM, 0))*12 ANNUAL, DNAME, LOC 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND JOB IN ('SALESMAN', 'MANAGER')
    ORDER BY ANNUAL DESC;
    -- EX. COM�� NULL�̰� SAL�� 1200�̻��� ����� �̸�, �޿�, �Ի���, �μ���ȣ, �μ���( �μ��� �� ,�޿� ū �� ����)
SELECT ENAME, SAL, HIREDATE, E.DEPTNO,DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND COMM IS NOT NULL AND SAL >=1200
    ORDER BY DNAME ,SAL DESC;
    
    -- źź1 ���忡�� �ٹ��ϴ� ����� �̸��� �޿��� ����Ͻÿ�
SELECT ENAME, SAL 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO  AND LOC = 'NEW YORK';
    -- źź2 ACCOUNTING �μ� �Ҽ� ����� �̸��� �Ի����� ����Ͻÿ�
SELECT ENAME, HIREDATE
    FROM EMP E ,DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND DNAME ='ACCOUNTING';
	-- źź3 ������ MANAGER�� ����� �̸�, �μ����� ����Ͻÿ�
SELECT ENAME, JOB
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND JOB = 'MANAGER';
	-- źź4 Comm�� null�� �ƴ� ����� �̸�, �޿�, �μ��ڵ�, �ٹ����� ����Ͻÿ�.
SELECT ENAME, SAL, E.DEPTNO, LOC, COMM
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND COMM IS NOT NULL;

-- 2. NON-EQUL JOIN --BETWEEN ���ֻ��
SELECT * FROM EMP WHERE ENAME ='SCOTT';  -- SAL��3000
SELECT * FROM SALGRADE; -- �޿� ��� ����
SELECT * FROM EMP, SALGRADE
    WHERE ENAME = 'SCOTT'; -- CROSS JOIN (EMP 1��*SALGRADE�� 5�� = 5��)
SELECT * FROM EMP, SALGRADE 
    WHERE SAL BETWEEN LOSAL AND HISAL AND ENAME='SCOTT';  -- �����ุ ���
-- EX. ��� ����� ���, �̸�, ��å, �����, �޿�, �޿����(1���, 2���, ...)
SELECT EMPNO, ENAME, JOB, MGR, SAL, GRADE||'���' GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;
-- źź1. Comm�� null�� �ƴ� ����� �̸�, �޿�, ���, �μ���ȣ, �μ��̸�, �ٹ����� ����Ͻÿ�.
SELECT ENAME, SAL, GRADE, E.DEPTNO, DNAME, LOC 
    FROM EMP E, DEPT D, SALGRADE --14*14*15 = 280��
    WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL AND COMM IS NOT NULL;

-- 3.
-- 4.

-- <�� ��������>
    --  PART2 
-- 1. ��� ����� ���� �̸�, �μ���ȣ, �μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT*FROM 
    EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
 
-- 2. NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�, ����, �޿�, �μ����� ���
SELECT  ENAME, JOB, SAL, DNAME, LOC 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND LOC ='NEW YORK';
      
-- 3. ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ���
SELECT ENAME, COMM, DNAME, LOC 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND COMM IS NOT NULL AND COMM!=0;

--4. �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ���
SELECT ENAME, JOB, DNAME, LOC 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND ENAME LIKE '%L%';

--5. ���, �����, �μ��ڵ�, �μ����� �˻��϶�. ������������ ������������
SELECT EMPNO, ENAME, D.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO 
    ORDER BY ENAME;

--6. ���, �����, �޿�, �μ����� �˻��϶�. 
    --�� �޿��� 2000�̻��� ����� ���Ͽ� �޿��� �������� ������������ �����Ͻÿ�
SELECT EMPNO, ENAME, SAL, DNAME
  FROM EMP E, DEPT D
  WHERE E.DEPTNO=D.DEPTNO AND SAL>=2000
  ORDER BY SAL DESC;

--7. ���, �����, ����, �޿�, �μ����� �˻��Ͻÿ�. �� ������ MANAGER�̸� �޿��� 2500�̻���
-- ����� ���Ͽ� ����� �������� ������������ �����Ͻÿ�.
SELECT EMPNO, ENAME, JOB, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND JOB='MANAGER' AND SAL>=2500
    ORDER BY EMPNO;



