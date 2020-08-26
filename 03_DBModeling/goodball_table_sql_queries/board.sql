CREATE TABLE BOARD(
    board_num NUMBER PRIMARY KEY,
    writer_email VARCHAR2(40) NOT NULL,
    board_title VARCHAR2(50) NOT NULL,
    board_content VARCHAR2(200) NOT NULL,
    board_img VARCHAR2(50),
    board_date DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT FK_BOARD_WRITER_EMAIL FOREIGN KEY(writer_email) REFERENCES MEMBER(email) ON DELETE SET NULL
);

CREATE SEQUENCE SEQ_BOARD_NUM
START WITH 1
INCREMENT BY 1
MAXVALUE 1000
NOCYCLE
NOCACHE;