CREATE TABLE STADIUM(
    stadium_num VARCHAR2(10) PRIMARY KEY,
    branch_num VARCHAR2(10) NOT NULL,
    stadium_name VARCHAR2(10) NOT NULL,
    stadium_match_member VARCHAR2(10),
    stadium_reservation_start_time NUMBER NOT NULL,
    stadium_reservation_last_time NUMBER NOT NULL,
    CONSTRAINT FK_STADIUM_BRANCH_NUM FOREIGN KEY(branch_num) REFERENCES BRANCH(branch_num) ON DELETE SET NULL
);
