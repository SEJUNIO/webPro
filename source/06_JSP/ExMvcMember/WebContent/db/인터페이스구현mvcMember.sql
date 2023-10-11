-- 테이블 삭제 
DROP TABLE MVC_MEMBER;
-- 테이블 생성
CREATE TABLE MVC_MEMBER(
    mID VARCHAR2(30) PRIMARY KEY NOT NULL,
    mPW VARCHAR2(30) NOT NULL,
    mNAME VARCHAR2(30) NOT NULL,
    mEMAIL VARCHAR2(30),
    mBIRTH DATE,
    mADDRESS VARCHAR2(300),
    mRDATE DATE DEFAULT SYSDATE
);
SELECT * FROM MVC_MEMBER;
-- 더미데이터
INSERT INTO MVC_MEMBER (mID, mPW, mNAME, mEMAIL, mBIRTH, mADDRESS)
    VALUES ('aaa', '111', '박세준', 'aaa@naver.com', '1996-08-06','서울');
-- dao에 들어갈 query

-- 1. mid 중복체크
SELECT * FROM MVC_MEMBER WHERE mID='aaa';
-- 2. 회원가입(mid, mpw, mname, memail, mbirth, maddress)
INSERT INTO MVC_MEMBER (mID, mPW, mNAME, mEMAIL, mBIRTH, mADDRESS)
    VALUES ('bbb', '111', '박솔우', 'bbb@naver.com', '1996-08-06', '대전');
-- 3. 로그인 체크(mid, mpw)
SELECT * FROM MVC_MEMBER WHERE mID='aaa' AND mPW='111';
-- 4. 로그인 성공시 session에 넣을 dto ( mid로 dto 가져오기)
SELECT * FROM MVC_MEMBER WHERE mID='aaa';
commit;