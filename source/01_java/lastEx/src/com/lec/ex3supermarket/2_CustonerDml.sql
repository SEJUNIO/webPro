-- ���α׷��� �ʿ��� ����
-- 1. ȸ������(������ȭ�� �����̸��� �Է¹޾� INSERT)
-- public int insertCustomer(String ctel, String cname)
-- public int insertCustoner(
INSERT INTO CUSTOMER (CID, CTEL, CNAME)
    VALUES (CUSTOMER_CID_SEQ.NEXTVAL, '010-6666-6666', '���浿');
ROLLBACK;
-- 2. ����4�ڸ�(FULL) �˻� searchTEL�� �޾� CID, CNAME, CPOINT, CAMOUNT, LEVELNAME, forLevelUp)
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
-- 3. ��ǰ���� (1000000��¥���� ������ ���. ����Ʈ�� ���űݾ��� 5%)
    --(cid, price�� �޾�, ���ž��� 5%�� Cpoint ����, ���ž��� CAMOUNT ����, �ٲ� CAMOUNT�� ���� LEVELNO����)
    -- public int buy(int cid, int price)
    -- 1�ܰ� : CPOINT�� CAMOUNT ����
UPDATE CUSTOMER SET CPOINT = CPOINT + (1000000*0.05), CAMOUNT = CAMOUNT + 1000000
    WHERE CID=1;
    SELECT*FROM CUSTOMER;
    
    -- 2�ܰ� : �ٲ� CAMOUNT�� ���� LEVELNO����
SELECT CNAME, CAMOUNT, C.LEVELNO ���緹��, L.LEVELNO �ٲ𷹺�, LOW, HIGH
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE CAMOUNT BETWEEN LOW AND HIGH AND CID=1;
    SELECT L.LEVELNO
        FROM CUSTOMER C, CUS_LEVEL L
        WHERE CAMOUNT BETWEEN LOW AND HIGH AND CID=1;-- UPDATE�� SUBQUERY�� �� �κ�
    UPDATE CUSTOMER
        SET LEVELNO = (SELECT L.LEVELNO
        FROM CUSTOMER C, CUS_LEVEL L
        WHERE CAMOUNT BETWEEN LOW AND HIGH AND CID=1)
        WHERE CID=1;
        SELECT * FROM CUSTOMER WHERE CID=1;
        
        -- DAO�� �� QUERY (1�ܰ�+2�ܰ�)

-- ��ǰ���Ž� UPDATE �ʿ�(���Ŵ����ݾ�, ����Ʈ UPDATE�� LEVELNO UPDATE)
-- public int buy(int cAmount, int cId)
-- 4. ��޺���� ? CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, �����������Ѿ���


-- public ArrayList<CustomerDto> levelNameGetCustomers(String levelName)
-- 5. ��ü��� ? CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, �����������Ѿ���


-- public ArrayList<CustomerDto> getCustomers()
-- 6. ȸ��Ż�� : public int deleteCustomer(String cTel)