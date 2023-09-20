-- drop & create 테이블(friend-no, name, tel)과 시퀀스(friend_no_seq)
DROP TABLE FRIEND; -- 테이블 삭제
DROP SEQUENCE FRIEND_NO_SEQ; -- 시퀀스 삭제
CREATE SEQUENCE FRIEND_NO_SEQ; -- 시퀀스 생성
CREATE TABLE FRIEND(
    NO NUMBER(5) PRIMARY KEY,
    NAME VARCHAR2(50) NOT NULL,
    TEL VARCHAR2(50) NOT NULL
);

-- dao에 들어갈 query
-- 친구추가
INSERT INTO FRIEND (NO, NAME, TEL)
    VALUES (FRIEND_NO_SEQ.NEXTVAL, '홍범도', '010-1234-1234');
-- 친구들 출력
select * from friend order by no;
commit;



