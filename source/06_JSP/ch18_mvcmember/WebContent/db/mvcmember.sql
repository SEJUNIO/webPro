-- 테이블 제거
DROP TABLE MVC_MEMBER;
-- 테이블 생성
CREATE TABLE MVC_MEMBER(
    mID VARCHAR2(30) PRIMARY KEY,
    mPW VARCHAR2(30) NOT NULL,
    mNAME VARCHAR2(30) NOT NULL,
    mEMAIL VARCHAR2(30),
    mPHOTO VARCHAR2(30) NOT NULL, -- 회원가입시 사진업로드를 안할 경우 기본이미지로
    mBIRTH DATE,
    mADDRESS VARCHAR2(300),
    mRDATE DATE DEFAULT SYSDATE NOT NULL
);
-- 더미데이터
INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)
    VALUES ('gayun','1','김가연','gayun@naver.com','gayun.jpg','1972/09/09','광주광역시');
INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)
    VALUES ('gico','1','지코','gico@naver.com','gico.jpg','1992/09/14','서울시');
INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)
    VALUES ('go','1','고소영','go@naver.com','go.jpg','1972/10/06','서울시');
INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)
    VALUES ('son','1','손흥민','son@naver.com','son.jpg','1992/07/08','강원도');
INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)
    VALUES ('han','1','한지민','han@naver.com','han.jpg','1982/11/05','서울시');
SELECT * FROM MVC_MEMBER ORDER BY mRDATE DESC;
SELECT * FROM MVC_MEMBER;
-- DAO에 들어갈 QUERY

-- (1) 회원 MID 중복체크
SELECT * FROM MVC_MEMBER WHERE mID='go';
-- (2) 회원가입
INSERT INTO MVC_MEMBER (mID, mPw, mName, mEmail, mPhoto, mBirth, mAddress)
    VALUES ('park','1','박세준','han@naver.com','han.jpg','1996/08/06','서울시');
-- (3) 로그인
SELECT * FROM MVC_MEMBER WHERE mID='go' AND mPW = '1';
-- (4) MID로 DTO 가져오기 (로그인 성공시 SESSION에 SETATTRIBUTE하기 위함)
SELECT * FROM MVC_MEMBER WHERE mID='go';
-- (5) 회원정보수정( 특정 MID의 정보수정)
UPDATE MVC_MEMBER
SET mPW = '111',
    mNAME = '김가연',
    mEMAIL = 'seo@naver.com',
    mPHOTO = 'NOIMG.JPG',
    mBirth = '72/10/10',
    mAddress = '서울시'
WHERE mID = 'gayun';
-- (6) 회원리스트(TOP-N) 구문
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM MVC_MEMBER ORDER BY mRDATE DESC) A)
    WHERE RN BETWEEN 4 AND 6;
-- (7) 회원수
SELECT COUNT(*) CNT FROM MVC_MEMBER;
-- (8) 회원탈퇴
COMMIT ;
DELETE FROM MVC_MEMBER WHERE mID='park';
ROLLBACK;





