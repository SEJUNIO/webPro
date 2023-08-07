DROP TABLE PERSON;
DROP TABLE JOB;
DROP SEQUENCE PERSON_PNO_SQ;

-- 테이블 및 시퀀스 생성
CREATE TABLE JOB (
    JNO NUMBER(2, 0) PRIMARY KEY,
    JNAME VARCHAR2(20) UNIQUE
);
CREATE SEQUENCE PERSON_PNO_SQ MAXVALUE 99999 NOCACHE NOCYCLE; -- 시퀀스 생성
CREATE TABLE PERSON(
    PNO  NUMBER(5) PRIMARY KEY,
    PNAME  VARCHAR2(50),
    JNO NUMBER(2,0) REFERENCES JOB(JNO) NOT NULL,
    KOR NUMBER(3) CHECK( KOR BETWEEN 0 AND 100),
    ENG NUMBER(3) CHECK( ENG BETWEEN 0 AND 100),
    MAT NUMBER(3) CHECK( MAT BETWEEN 0 AND 100)
);
SELECT * FROM JOB;
SELECT * FROM PERSON;
