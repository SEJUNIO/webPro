-- 프로그램에 필요한 쿼리
-- 1. 회원가입(고객전화와 고객이름은 입력받아 INSERT)
-- public int insertCustomer(String ctel, String cname)
-- public int insertCustoner(
INSERT INTO CUSTOMER (CID, CTEL, CNAME)
    VALUES (CUSTOMER_CID_SEQ.NEXTVAL, '010-6666-6666', '유길동');
ROLLBACK;
-- 2. 폰뒤4자리(FULL) 검색 searchTEL를 받아 CID, CNAME, CPOINT, CAMOUNT, LEVELNAME, forLevelUp)
 -- public ArrayList<
SELECT CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, HIGH+1-CAMOUNT forLevelUp
FROM CUSTOMER C, CUS_LEVEL L
    WHERE C.LEVELNO = L.LEVELNO;

SELECT CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME,
    (SELECT HIGH+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=5 AND CID=C.CID) forLevelUp
        FROM CUSTOMER C, CUS_LEVEL L 
        WHERE C.LEVELNO = L.LEVELNO AND CTEL LIKE '%'||'9999'
        ORDER BY CAMOUNT DESC, CID;
-- public ArrayList<CustomerDto> cTelGetCustomers(String cTel);
-- 3. 물품구매 (1000000원짜리를 구매할 경우. 포인트는 구매금액의 5%)
    --(cid, price를 받아, 구매액의 5%를 Cpoint 누적, 구매액을 CAMOUNT 누적, 바뀐 CAMOUNT에 따라 LEVELNO수정)
    -- public int buy(int cid, int price)
    -- 1단계 : CPOINT와 CAMOUNT 누적
UPDATE CUSTOMER SET CPOINT = CPOINT + (1000000*0.05), CAMOUNT = CAMOUNT + 1000000
    WHERE CID=1;
    SELECT*FROM CUSTOMER;
    
    -- 2단계 : 바뀐 CAMOUNT에 따라 LEVELNO조정
SELECT CNAME, CAMOUNT, C.LEVELNO 현재레벨, L.LEVELNO 바뀔레벨, LOW, HIGH
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE CAMOUNT BETWEEN LOW AND HIGH AND CID=1;
    SELECT L.LEVELNO
        FROM CUSTOMER C, CUS_LEVEL L
        WHERE CAMOUNT BETWEEN LOW AND HIGH AND CID=1;-- UPDATE안 SUBQUERY로 들어갈 부분
    UPDATE CUSTOMER
        SET LEVELNO = (SELECT L.LEVELNO
        FROM CUSTOMER C, CUS_LEVEL L
        WHERE CAMOUNT BETWEEN LOW AND HIGH AND CID=1)
        WHERE CID=1;
        SELECT * FROM CUSTOMER WHERE CID=1;
        
        -- DAO에 들어갈 QUERY (1단계+2단계)

-- 물품구매시 UPDATE 필요(구매누적금액, 포인트 UPDATE와 LEVELNO UPDATE)
-- public int buy(int cAmount, int cId)
-- 4. 등급별출력 ? CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 레벨업을위한쓸돈


-- public ArrayList<CustomerDto> levelNameGetCustomers(String levelName)
-- 5. 전체출력 ? CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 레벨업을위한쓸돈


-- public ArrayList<CustomerDto> getCustomers()
-- 6. 회원탈퇴 : public int deleteCustomer(String cTel)
