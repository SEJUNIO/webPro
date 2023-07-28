[VII] DDL, DML, DCL
-- SQL = DDL (���̺� ����, ���̺� ����, ���̺� ��������, ���̺��� ��� ������ ����)
-- SQL = DML (SELECT, INSERT, UPDATE, DELETE)
-- SQL = DCL (����ڰ��� ����, ����ڿ��� ���Ѻο�, ���ѹ�Ż, ����ڰ��� ����, Ʈ�����Ǹ�ɾ�)

-- �� �� �� DDL �� �� ��

-- 1. ���̺� ����(CREATE TABLE ���̺�� ....) : ���̺� ������ ����
CREATE TABLE BOOK (
  BOOKID   NUMBER(4), -- BOOKID ��Ʈ�� Ÿ���� ����4�ڸ�
  BOOKNAME VARCHAR2(20), -- BOOKNAME �ʵ��� Ÿ���� ���� 20BYTE
  PUBLISHER VARCHAR2(20), -- PUBLISHER �ʵ��� Ÿ���� ���� 20BYTE
  RDATE     DATE,         -- RDATE �ʵ��� Ÿ���� DATE
  PRICE     NUMBER(7,2),   -- PRICE�ʵ��� Ÿ���� ���� ��ü 7�ڸ�. �Ҽ������ϴ� 2�ڸ�, �Ҽ����� 5�ڸ�
  PRIMARY KEY(BOOKID)     -- �������� : BOOKID�ʵ尡 PRIMARY KEY(��Ű) : UNIQUE, NOT NULL
);
SELECT * FROM BOOK;

CREATE TABLE BOOK(
    BOOKID NUMBER(4), PRIMARY KEY,
    BOOKNAME VARCHAR2(20), -- BOOKNAME �ʵ��� Ÿ���� ���� 20 BYTE
    PUBLISHER VARCHAR2(20), -- PUBLISHER �ʵ��� Ÿ���� ���� 20 BYTE
    ROATE      DATE,        -- ROATE �ʵ��� Ÿ���� DATE
    PRICE       NUMBER(7,2)      --PRICE �ʵ��� Ÿ���� ���� ��ü 7�ڸ�, �Ҽ������ϴ� 2�ڸ�, �Ҽ����� 5�ڸ�
);

-- DEPT01 : DEPTNO(��2:PK), DANME(����14), LOC(����13)
CREATE TABLE DEPT01(
    DEPTNO NUMBER (2) PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);
-- EMP01 : EMPNO(��4:PK��Ű), ENAME(����10), SAL(��7,2), DEPTNO(��2:FK�ܷ�Ű)
CREATE TABLE EMP01 (
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10),
    SAL NUMBER(7,2),
    DEPTNO NUMBER(2) REFERENCES DEPT01 (DEPTNO)
);
SELECT * FROM EMP01;

--------------------------------------------------------------------------------------------------------------
-- ���������� �̿��� ���̺� ����
CREATE TABLE EMP02
    AS
    SELECT * FROM EMP; -- �������� ����� EMP02 ���̺� ������ �����ͷ� ��(�������� ������)
    
SELECT * FROM EMP02;

--------------------------------------------------------------------------------------------------------------
-- EMP03 -- EMP�� Ư�� �ʵ�
CREATE TABLE EMP03
    AS
    SELECT EMPNO, ENAME, DEPTNO FROM EMP; -- EMP���̺��� EMPNO, ENAME, DEPTNO�� ������ �����Ͱ� EMP03 
    
SELECT * FROM EMP03;

--------------------------------------------------------------------------------------------------------------
-- EMP04. -- EMP�� Ư�� ��
CREATE TABLE EMP04
    AS
    SELECT * FROM EMP WHERE DEPTNO = 10; -- EMP���� 10�� �μ��� �����͸� �����ؼ� EMP04
SELECT * FROM EMP04;

--------------------------------------------------------------------------------------------------------------
-- EMP05 -- EMP�� ������ ����(������ �������� ����)
CREDATE TABLE EMP05
    AS
    SELECT * FROM EMP WHERE 1=0;
SELECT * FROM EMP05;
SELECT ROWNUM, EMPNO, ENAME FROM EMP; -- ROWNUM : ���̺��� ���� �о���� ����

--------------------------------------------------------------------------------------------------------------

-- 2. ���̺� �������� ( ALTER TABLE ���̺�� ADD || MODIFY || DROP ~)
    -- (1) �ʵ��߰�(ADD)
SELECT * FROM EMP03; -- EMPNO(���� 4) ,ENAME(���� 10) ,DEPTNO(���� 2)
ALTER TABLE EMP03 ADD ( JOB VARCHAR2(20), SAL NUMBER(7) );
SELECT * FROM EMP03; -- �߰��� �ʵ�� NULL �����ͷ� ä����
    -- (2) �ʵ����(MODIFY)
ALTER TABLE EMP03 MODIFY (EMPNO VARCHAR02(4)); -- ���� �����Ͱ� ����־� ���ڷθ� ���氡��(���ں��� ū ������θ�)
ALTER TABLE EMP03 MODIFY (EMPNO NUMBER(5));
ALTER TABLE EMP03 MODIFY (JOB NUMBER(5)); -- NULL �ʵ�� ������� ���� ����
SELECT MAX(LENGTH(ENAME)) FROM EMP03; -- EMP03�� ENAME�� 6���ڰ� �������
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(6)); -- ���ڵ����͸� �ø��ų� ���̴µ��� ���� �����Ϳ� ���� ����
    -- (3) �ʵ� ���� ( DROP)
ALTER TABLE EMP03 DROP COLUMN JOB; -- JOB �ʵ� ����
SELECT * FROM EMP03;

-- 3. ���̺� ���� (DROP TABLE ���̺��)
DROP TABLE EMP01;
DROP TABLE DEPT; -- EMP���̺��� DEPT�� DEPTNO�� �����ϴ� ��� EMP���̺��� ������ �� DEPT�� ����

-- 4. ���̺��� ��� ���� ���� 
SELECT * FROM EMP03;
TRUNCATE TABLE EMP03; -- ROLLBACK �Ұ�
SELECT * FROM EMP03;

-- 5. ���̺���� ( RENAME ���̺�� TO �ٲ����̺��)
SELECT * FROM EMP02;
RENAME EMP02 TO EMP2;
SELECT * FROM EMP2;

-- 6. ������ ��ųʸ�(�����ͺ��̽� �ڿ��� ȿ�������� �����ϱ� ���� �ý��� ���̺� : ���� �Ұ�)
--       VS
--  ������ ��ųʸ� �� (���ٰ���)�� ����
-- (1) USER_XXX : ���������� �����ϰ� �ִ� ��ü(���̺�, ��������, ��, �ε���)
SELECT * FROM USER_TABLES;
SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_VIEWS;
SELECT * FROM USER_INDEXES;
-- (2) ALL_XXX : �� �������� ���ٰ����� ��ü(���̺�, ��������, ��, �ε���)
SELECT * FROM ALL_TABLES;
SELECT * FROM ALL_CONSTRAINTS;
SELECT * FROM ALL_VIEWS;
SELECT * FROM ALL_INDEXES;
-- (3) DBA_XXX : DBA���ѿ����� ���� ���� DEMS�� ��� ��ü(���̺�, ��������, ��, �ε���)
SELECT * FROM DBA_TABLES;
SELECT * FROM DBA_CONSTRAINTS;
SELECT * FROM DBA_VIEWS;
SELECT * FROM DBA_INDEXES;

-- �� �� �� DML �� �� ��
-- (1). INSERT INTO ���̺�� VALUES (��1, ��2, ...);
    -- INSERT INTO ���̺�� (�ʵ�1, �ʵ�2, ..)VALUES (��1, ��2, ...);
SELECT *FROM DEPT01;
INSERT INTO DEPT01 VALUES(50, 'ACCOUNTING', 'SEOUL');
INSERT INTO DEPT01 VALUES(60, 'SALES', NULL); -- ��������� NULL �߰�
INSERT INTO DEPT01 (DEPTNO, LOC, DNAME) VALUES (70, '���빮', 'RESEARCH');
INSERT INTO DEPT01 (DEPTNO, DNAME) VALUES(80, 'IT'); -- ���������� NULL�߰� (��õ��� ���� �ʵ尪�� NULL)
COMMIT;   -- ����Ŭ�� ���������� �����ϴ� ��ɾ�(Ʈ������ ��ɾ� ) : DML��ɾ ���� : ������ ó���� ���� �� ����.

-- ���������� �̿��� INSERT
    -- DEPT���̺��� 10~30 �μ��� DEPT01�� INSERT
INSERT INTO DEPT01 SELECT * FROM DEPT WHERE DEPTNO BETWEEN 10 AND 30;

-- �� �������� ��
DROP TABLE SAM01;
CREATE TABLE SAM01(
  EMPNO  NUMBER(4) PRIMARY KEY,
  ENAME VARCHAR2(10),
  JOB   VARCHAR2(9),
  SAL     NUMBER(7,2)     
);
INSERT INTO SAM01 VALUES(1000, 'APPLE', 'POLICE',10000);
INSERT INTO SAM01 VALUES(1010, 'BANANA', 'NURSE', 15000);
INSERT INTO SAM01 VALUES(1020, 'ORANGE', 'DOCTOR',25000);
INSERT INTO SAM01 (EMPNO, ENAME,SAL) VALUES(1030, 'VERY', 25000); -- ������ NULL �߰�
-- INSERT INTO SAM01 VALUES(1030, 'VERY', NULL, 25000);
INSERT INTO SAM01 (EMPNO, ENAME,SAL) VALUES(1040, 'CAT', 2000);
INSERT INTO SAM01 SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE DEPTNO =10;
SELECT * FROM SAM01;
COMMIT;

-- 2. UPDATE ���̺� SET �ʵ��1=��1, �ʵ��2=��2,...(WHERE ����) :
DROP TABLE EMP01;
SELECT * FROM EMP01;
CREATE TABLE EMP01 AS SELECT EMPNO, ENAME, SAL, HIREDATE, DEPTNO FROM EMP;
    --EX. �μ���ȣ�� 30���� ����
    UPDATE EMP01 SET DEPTNO=30;
    ROLLBACK;
    -- ��� ����(EMP01)�� �޿�(SAL)�� 10% �λ�
    UPDATE EMP01 SET SAL = SAL*1.1;
    -- EX. EMP01 : 10�� �μ� ������ �Ի����� ����, �μ���ȣ�� 30������ ����
    UPDATE EMP01
        SET HIREDATE = SYSDATE,
            DEPTNO = 30 
            WHERE DEPTNO = 10;
    -- EX3. �޿��� 3000�̻��� ����� �޿��� 10%�λ�
    UPDATE EMP01
        SET SAL = SAL*1.1
        WHERE SAL >=3000;
    -- EX4. �ٹ����� 'DALLAS'�� ������ �޿��� 1000$ �λ�
    UPDATE EMP01 SET SAL = SAL+1000
        WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC ='DALLAS');
    -- SCOTT����� �μ���ȣ�� 20������, ������ MANAGER�� �Ѳ����� ����
SELELCT * FROM EMP WHERE ENAME = 'SCOTT'; 
    -- UPDATE EMP SET DEE
    -- �޿��� 1500 ������ ������ �޿��� 1500 ���� ����(EM01
SELECT * FROM EMP01;
UPDATE EMP01 SET SAL = 1500 WHERE SAL<=1500;
    -- EX. ��� ����� �޿��� �Ի����� 'KING' �� �޿��� �Ի��� ����
    UPDATE EMP01
        SET SAL = (SELECT SAL FROM EMP01 WHERE ENAME = 'KING',
        HIREDATE = (SELECT HIREDATE FROM EMP01 WHERE ENAME  = 'KING';

-- 1. EMP ���̺�� ���� ������ ���� ������ ���̺� EMP01�� ����(���̺��� ������ ��������)�ϰ�, ��� ����� �μ���ȣ�� 30������ �����մϴ�.

-- 2. EMP01���̺��� ��� ����� �޿��� 10% �λ��Ű�� UPDATE���� �ۼ�
SELECT * FROM EMP01;
UPDATE EMP01 SET SAL = SAL*1.1 WEHRE ENAME (SELECT * FROM EMP01);
-- 3. �޿��� 3000�̻��� ����� �޿��� 10%�λ�
UPDATE EMP01 SET SAL = SAL*1.1WHERE SAL >=3000;
-- 4. EMP01���̺��� ��DALLAS������ �ٹ��ϴ� �������� ������ 1000�λ�
UPDATE EMP01 SET SAL = SAL+1000
        WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC ='DALLAS');
-- 5. SCOTT����� �μ���ȣ�� 20������, ������ MANAGER�� �Ѳ����� ����
SELELCT * FROM EMP WHERE ENAME = 'SCOTT'; 
-- 6. �μ����� SALES�� ����� ��� �����ϴ� SQL�ۼ�
SELECT * FROM DEPT01;

-- 7. ������� ��FORD���� ����� �����ϴ� SQL �ۼ�
SELECT * FROM EMP01;
DELETE FROM EMP01 WHERE ENAME = 'FORD';
-- 8. SAM01 ���̺��� JOB�� NULL�� ����� �����Ͻÿ�
SELECT * FROM  SAM01 WHERE JOB IS NULL;
DELETE FROM SAM01 WHERE JOB IS NULL;
-- 9. SAM01���̺��� ENAME�� ORANGE�� ����� �����Ͻÿ�
SELECT * FROM SAM01;
DELETE FROM SAM01 WHERE ENAME = 'ORANGE';
-- 10. �޿��� 1500������ ����� �޿��� 1500���� ����
SELECT * FROM EMP01;
UPDATE EMP01 SET SAL =1500 WHERE SAL<=1500;
-- 11. JOB�� ��MANAGER���� ����� �޿��� 10%�����Ͻ�    

    
 -- �� �������� ( CREATE, TABLE, DROP, TABLE, INSERT, UPDATE, DELETE, COMMIT)   
 ? SQL Ȱ�� ��Ʈ������
--1. �Ǝm�� ������ �����ϴ� MY_DATA ���̺��� �����Ͻÿ�. �� ID�� PRIMARY KEY�̴�.
DROP TABLE MY_DATA;
SELECT * FROM MY_DATA;
CREATE TABLE MY_DATA(
  ID        NUMBER(4) PRIMARY KEY,
  NAME     VARCHAR2(10),
  USERID    VARCHAR2(30),
  SALARY    NUMBER(10,2)     
);
-- 2. ������ ���̺� ���� ��ǥ�� ���� ���� �Է��ϴ� SQL���� �ۼ��Ͻÿ�.
INSERT INTO MY_DATA VALUES(1, 'SCOTT', 'sscott', 1000000);
INSERT INTO MY_DATA VALUES(2, 'FORD', 'fford', 1300000);
INSERT INTO MY_DATA VALUES(3, 'PATEL', 'ppatel', 3300000);
INSERT INTO MY_DATA VALUES(4, 'REPORT', 'rreport', 2350000);
INSERT INTO MY_DATA VALUES(5, 'GOOD', 'ggood', 4445000);

-- 3. TO_CHAR ���� �Լ��� �̿��Ͽ� �Է��� �ڷḦ ���� ��ǥ�� ���� �������� ����ϴ�
--SQL���� �ۼ��Ͻÿ�
SELECT ID, INITCAP(NAME), USERID, TO_CHAR(SALARY, '99,999,999.99')  FROM MY_DATA;

-- 4. �ڷḦ ���������� �����ͺ��̽��� ����ϴ� ��ɾ �ۼ��Ͻÿ�.
COMMIT;

-- 5. ID�� 3���� ����� �޿��� 65000.00���� �����ϰ� ���������� �����ͺ��̽��� �ݿ��϶�.
UPDATE MY_DATA SET SALARY = 65000.00 WHERE ID = 3;

-- 6. NAME�� Ford�� ����� �����ϰ� ���������� �����ͺ��̽��� �ݿ��϶�.
DELETE FROM MY_DATA WHERE NAME = 'FORD';

-- 7. SALARY�� 15,000.00 ������ ����� �޿��� 15,000.00���� �����϶�
UPDATE MY_DATA SET SALARY = 15000 WHERE SALARY <= 15000;

-- 8. ������ ������ ���̺��� �����϶�.   
DROP TABLE MY_DATA;   

-- �� �� �� �� ��������
-- (1) PRIMARY KEY : ���̺��� �� ���� ������ ������ �ĺ��ϱ� ���� �ʵ�
-- (2) FOREIGN KEY : ���̺��� ���� �ٸ� ���̺��� ���� ����
-- (3) NOT NULL : NULL�� �������� ����
-- (4) UNIQUE : ��� ���� ���� ����. NULL ���� ���(NULL�� ������ ����)
-- (5) CHECK(����) : �ش� ������ ����(NULL�� ���)
-- DEFAULT �⺻�� : �⺻������(�ش� ���� �����͸� �Է����� ������ ������ NULL�� �� ���� DEFALUT������ �Է�)
SELECT *FROM DEPT01;
INSERT INTO DEPT01 (DEPTNO, DNAME) VALUES (99, 'XX');

-- DEPT1 ���̺� ����
DROP TABLE DEPE1;
CREATE TABLE DEPT1 (
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME VARCHAR2(14) NOT NULL UNIQUE,
    LOC VARCHAR2(13) NOT NULL
);
SELECT * FROM DEPT1;
SELECT * FROM USER_TABLES;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='DEPT1';

-- EMP1 ���̺� ����
CREATE TABLE EMP1 (
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9) NOT NULL,
    MGR NUMBER(4),
    HIREDATE DATE DEFAULT SYSDATE,
    SAL NUMBER(7,2) CHECK(SAL>0),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) REFERENCES DEPT1(DEPTNO)
);
SELECT * FROM EMP1;
 CREATE TABLE EMP1 (
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9) NOT NULL,
    MGR NUMBER(4),
    HIREDATE DATE DEFAULT SYSDATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    PRIMARY KEY(EMPNO),
     CHECK(SAL>0),
     FOREIGN KEY(DEPTNO) REFERENCES DEPT1(DEPTNO)
);   
INSERT INTO EMP1 (EMPNO, ENAME, JOB) VALUES (1000, 'ȫ�浿','MANAGER');    
INSERT INTO EMP1 (EMPNO, ENAME, JOB, DEPTNO)
    VALUES (1001, '��浿', 'SALESMAN', 10); -- ����
INSERT INTO DEPT1 SELECT * FROM DEPT; -- 10,20,30,40 �Է�
INSERT INTO DEPT1 VALUES (40, 'IT', 'SEOUL'); --����
INSERT INTO DEPT1 VALUES (50, 'SALES', 'SEOUL'); --����
INSERT INTO DEPT1 (DEPTNO ,DNAME) VALUES (50, 'IT'); --���� (NOT NULL)
INSERT INTO DEPT1 VALUES (50, 'IT', 'SEOUL');

INSERT INTO EMP1 (EMPNO, ENAME, JOB, DEPTNO)
    VALUES (1001, '��浿', 'MANAGER', 60); -- ����(FK)
INSERT INTO EMP1 (EMPNO, ENAME, JOB, SAL, DEPTNO)
    VALUES (1001, '��浿', 'MANAGER', 0, 50); -- ����(CHECK)
INSERT INTO EMP1 (EMPNO, ENAME, JOB, SAL, DEPTNO)
    VALUES (1001, '��浿', 'MANAGER', 2000, 50); 
SELECT * FROM EMP1;
    
    -- BOOK -& BOOKCATEGORY
    
DROP TABLE BOOK;
DROP TABLE BOOKCATEGORY;
DROP TABLE BOOKCATEGORY CASCADE CONSTRAINTS; -- �����ϴ� ���̺� �������
CREATE TABLE BOOKCATEGORY (
    categoryCODE NUMBER(3) PRIMARY KEY,
    categoryNAME VARCHAR2(50) UNIQUE,
    OFFICE_LOC   VARCHAR2(50) NOT NULL
);
CREATE TABLE BOOK(
    BOOKNO VARCHAR2(10) PRIMARY KEY,
    CATEGORYCODE	NUMBER(3)	REFERENCES BOOKCATEGORY(categoryCODE),
    BOOKNAME VARCHAR2(50) NOT NULL,
    PUBLISHER VARCHAR2(50),
    PUBYEAR NUMBER(4) DEFAULT EXTRACT(YEAR FROM SYSDATE)
);
SELECT * FROM BOOKCATEGORY;
SELECT * FROM BOOK;
--
INSERT INTO BOOKCATEGORY VALUES (100, 'ö��', '3���ι���');
INSERT INTO BOOKCATEGORY VALUES (400, 'IT', '4�����н�');

INSERT INTO BOOK (BOOKNO, CATEGORYCODE, BOOKNAME, PUBLISHER) VALUES ('100A01', 100, 'ö������ ��', '��������');
INSERT INTO BOOK VALUES ('400A01', 400, '�̰���DB��', '��������',2022);
    
SELECT bookNo, bookNAME, PUBLISHER, PUBYEAR, categoryNAME, OFFICE_LOC
    FROM BOOK B, BOOKCATEGORY C
    WHERE B.categoryCODE = C.categoryCODE;
    
CREATE TABLE MAJOR(
    mCODE NUMBER(2) PRIMARY KEY,
    mNAME VARCHAR2(50) UNIQUE,
    mOFFICE VARCHAR2(255));
);   
CREATE TABLE STUDENT(
     SNO VARCHAR2(10) PRIMARY KEY,
    sNAME VARCHAR2(50) ,
    sSCORE NUMBER(3) CHECK (sSCORE BETWEEN 0 AND 100),
    mCODE NUMBER(2) REFERENCES MAJOR(mCODE) );
);
SELECT * FROM MAJOR;   
SELECT * FROM STUDENT;
DROP TABLE MAJOR;
DROP TABLE STUDENT;
INSERT INTO STUDENT VALUES ('101','ȫ�浿', 99, 1);
INSERT INTO STUDENT VALUES ('102','�ű浿',100, 2);
INSERT INTO STUDENT VALUES ('103','�ű浿',-9, 3); -- CHECK ��������
INSERT INTO STUDENT VALUES (NULL,'�ű浿',90, 3);  -- PRIMARY KEY ��������=(NOT NULL+UNIQUE)
    
SELECT sNO, sNAME, SCORE, mCODE, mNAME, mOFFICE
    FROM MAJOR E, STUDENT S
    WHERE E.mCODE = S.mCODE;
    
    SELECT S.*, mNAME, mOFFICE
    FROM STUDENT S, MAJOR M 
    WHERE S.mCODE=M.mCODE;
    
-- ��  �� �� DCL : �������� ���Ѻο�, ���ѹ�Ż, �������� ��  �� ��  
-- ��������
create user scott2 IDENTIFIED BY tiger;  
-- ���� �ο� (���Ǳ��� == �α��� ����)
GRANT CREATE SESSION TO scott2;
GRANT CREATE TABLE TO scott2;
GRANT ALL ON EMP TO scott2;
GRANT SELECT ON DEPT TO SCOTT2;
-- ���� ��Ż(DEPT, EMP)
REVOKE ALL ON EMP FROM SCOTT2;
REVOKE SELECT ON DEPT FROM SCOTT2;
    
-- ���� ����(SCOTT2) -- ��������
DROP USER SCOTT2 CASCADE;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

