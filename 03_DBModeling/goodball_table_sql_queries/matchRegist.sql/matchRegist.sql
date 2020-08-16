CREATE TABLE MATCHREGIST(
    match_regist_num NUMBER PRIMARY KEY,
    regist_team VARCHAR2(10) NOT NULL,
    reservation_code VARCHAR2(10) NOT NULL,
    match_status VARCHAR2(10) DEFAULT '가능' NOT NULL CONSTRAINT CK_MATCH_STATUS CHECK(match_status IN ('가능', '불가능', '마감')),
    CONSTRAINT FK_MATCH_REGIST_TEAM FOREIGN KEY(regist_team) REFERENCES TEAM(team_code) ON DELETE SET NULL,
    CONSTRAINT FK_MATCH_RESERVATION_CODE FOREIGN KEY(reservation_code) REFERENCES RESERVATION(reservation_code) ON DELETE SET NULL
);