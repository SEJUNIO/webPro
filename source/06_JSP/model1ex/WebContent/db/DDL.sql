-- DROP & TABLE SEQUNCE 
DROP TABLE CUSTOMER;
CREATE TABLE CUSTOMER (
    cID VARCHAR2(50) PRIMARY KEY NOT NULL,
    cPW VARCHAR2(50) NOT NULL,
    cNAME VARCHAR2(50) NOT NULL, 
    cTEL VARCHAR2(50),
    cEMAIL VARCHAR2(50),
    cADDRESS VARCHAR2(50),
    cBIRTH DATE,
    cGENDER VARCHAR2(1),
    cRDATE DATE  DEFAULT SYSDATE NOT NULL
);
SELECT * FROM CUSTOMER;

--1. 회원가입시 아이디 중복 체크 (public int confirmId(String cid)
SELECT * FROM CUSTOMER WHERE cID='aaa';

--2. 회원가입 INSERT public int joinCustomer(CustomerDto dto)
INSERT INTO CUSTOMER(cID, cPW, cNAME, cTEL, cEMAIL, cADDRESS, cBIRTH, cGENDER)
        VALUES('aaa', '111', '박세준', '010-1234-1234', 'aaa@hong.com', '서울', '1996-08-06','m');
        
--3. 로그인 public int loginCheck(String id, String pw)
SELECT * FROM CUSTOMER WHERE cID='aaa';

--4. cID로 DTO 가져오기 public CustomerDto getCustomer(String id)
SELECT * FROM CUSTOMER WHERE cID='aaa';

--5. 회원정보 수정 public int modifyCUSTOMER( CUSTOMER DTO)
UPDATE CUSTOMER
SET cPW = '1111',
    cNAME = '박세동',
    cTEL = '010-1245-1245',
    cEMAIL = 'shin@hong.com',
    cADDRESS = '서울',
    cBIRTH = '1996-07-14',
    cGENDER = 'm'   
WHERE cID = 'aaa';
commit;