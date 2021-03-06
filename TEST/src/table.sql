CREATE TABLE TESTUSERS(
    ID VARCHAR2(30) DEFAULT 'DEFAULT_ID' NOT NULL CONSTRAINT USER_PK PRIMARY KEY,
    PASSWORD VARCHAR2(30) DEFAULT 'DEFAULT_PASSWORD' NOT NULL,
    NAME VARCHAR2(30) DEFAULT 'DEFAULT_NAME' NOT NULL,
    HP1 VARCHAR2(30) DEFAULT '010' NOT NULL,
    HP2 VARCHAR2(30) DEFAULT '1111' NOT NULL,
    HP3 VARCHAR2(30) DEFAULT '2222' NOT NULL,
    EMAIL1 VARCHAR2(30) DEFAULT 'DEFAULT_EMAIL' NOT NULL,
    EMAIL2 VARCHAR2(30) DEFAULT '@naver.com' NOT NULL,
    ADDRBASIC VARCHAR2(30) DEFAULT '서울시' NOT NULL,
    ADDRDETAIL VARCHAR2(30) DEFAULT '강남구' NOT NULL,
    REGDATE DATE DEFAULT SYSDATE NOT NULL
);
CREATE SEQUENCE TESTBOARD_SEQ INCREMENT BY 1 START WITH 1;
CREATE TABLE TESTBOARD(
    BNO NUMBER(10,0) DEFAULT TESTBOARD_SEQ.NEXTVAL NOT NULL CONSTRAINT TESTBOARD_BNO_PK PRIMARY KEY,
    WRITER VARCHAR2(50) DEFAULT 'DEFAULT_WRITER' NOT NULL,
    TITLE VARCHAR2(200) DEFAULT 'DEFAULT_TITLE' NOT NULL,
    CONTENT VARCHAR2(2000) DEFAULT 'DEFAULT_CONTENT' NOT NULL,
    REGDATE DATE DEFAULT SYSDATE NOT NULL,
    HIT DEFAULT 0 NOT NULL
);