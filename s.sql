CREATE TABLE T2_MEMBER(
	userid VARCHAR2(15) NOT NULL PRIMARY KEY,
	username VARCHAR2(20) NOT NULL,
	password VARCHAR2(10),
	jumin VARCHAR2(13),
	gender CHAR(1),	-- 1 : 남, 2 : 여
	address VARCHAR2(50),
	jobcd CHAR(1),	-- 1: 학생, 2 : 회사원, 3 : 공무원, 4 : 군인, 5 : 기타
	mailrcv CHAR(1),
	intro VARCHAR2(50)
);

-- UPDATE t2_member SET username = ?, password = ?, jumin = ?, gender = ?, address = ?, jobcd = ?, mailrcv = ?, intro = ? WHERE userid = ?;


INSERT INTO T2_MEMBER (userid, username, password, jumin, gender, address,jobcd, mailrcv, intro)
VALUES('pk값', '이름', '비번', '주민번호', '성별', '주소', '직업', '메일주소', '자기소개말');

INSERT INTO T2_MEMBER (userid, username, password, jumin, gender, address,jobcd, mailrcv, intro)
VALUES('seojh', '서장훈', 's123!', '0000001111111', '1', '안양시 안양동', '1', 'Y', '방송인');
INSERT INTO T2_MEMBER (userid, username, password, jumin, gender, address,jobcd, mailrcv, intro)
VALUES('honggd', '홍길동', 'h123!', '1111112222222', '2', '수원시 수원동', '2', 'Y', '축구선수');
INSERT INTO T2_MEMBER (userid, username, password, jumin, gender, address,jobcd, mailrcv, intro)
VALUES('kanggc', '강감찬', 'k123!', '2222223333333', '2', '청주시 청주동', '3', 'N', '농구선수');
INSERT INTO T2_MEMBER (userid, username, password, jumin, gender, address,jobcd, mailrcv, intro)
VALUES('yooks', '유관순', 'y123!', '4444445555555', '1', '과천시 과천동', '3', 'N', '발레리나');
INSERT INTO T2_MEMBER (userid, username, password, jumin, gender, address,jobcd, mailrcv, intro)
VALUES('leess', '이순신', 'e123!', '5555556666666', '2', '성남시 성남동', '1', 'Y', '회사원');

select * from t2_member;

SELECT
	userid,
	username,
	password,
	jumin,
	decode(gender, '1', '남자', '2', '여자') AS gender,
	address,
	decode(jobcd, '1', '학생', '2', '회사원', '3', '공무원', '4', '군인', '5', '기타') AS jobcd,
	decode(mailrcv, 'Y', '허용', 'N', '거부') AS mailrcv,
	intro
FROM t2_member;

SELECT * FROM t2_member WHERE userid = 'seojh';
