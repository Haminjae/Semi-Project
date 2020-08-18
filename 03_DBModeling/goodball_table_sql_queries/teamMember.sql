CREATE TABLE TEAMMEMBER(
    supporter_email VARCHAR2(40) NOT NULL,
    support_team VARCHAR2(10) NOT NULL,
    position VARCHAR2(10) NOT NULL,
    application_status VARCHAR2(10) DEFAULT '�����' NOT NULL CONSTRAINT CK_APPLICATION_STATUS CHECK(application_status IN ('�����', '����')),
    delete_status VARCHAR2(1) DEFAULT 'N' NOT NULL CONSTRAINT CK_DELETE_STATUS CHECK(delete_status IN ('Y', 'N')),
    CONSTRAINT FK_SUPPORTER_EMAIL FOREIGN KEY(supporter_email) REFERENCES MEMBER(email) ON DELETE SET NULL,
    CONSTRAINT FK_SUPPORT_TEAM FOREIGN KEY(support_team) REFERENCES TEAM(team_code) ON DELETE SET NULL
);