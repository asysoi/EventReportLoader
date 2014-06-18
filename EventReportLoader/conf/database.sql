CREATE USER  BELTPP_ACTION
    IDENTIFIED BY '123456'
    DEFAULT TABLESPACE Users;
    
ALTER USER BELTPP_ACTION quota 100M on USERS;   
    
GRANT CREATE SESSION TO BELTPP_ACTION;

GRANT CREATE TABLE TO BELTPP_ACTION;
GRANT CREATE PROCEDURE TO BELTPP_ACTION;
GRANT CREATE TRIGGER TO BELTPP_ACTION;
GRANT CREATE VIEW TO BELTPP_ACTION;
GRANT CREATE SEQUENCE TO BELTPP_ACTION;
GRANT ALTER ANY TABLE TO BELTPP_ACTION;
GRANT ALTER ANY PROCEDURE TO BELTPP_ACTION;
GRANT ALTER ANY TRIGGER TO BELTPP_ACTION;
GRANT ALTER PROFILE TO BELTPP_ACTION
;
GRANT DELETE ANY TABLE TO BELTPP_ACTION;  
GRANT DROP ANY TABLE TO BELTPP_ACTION;
GRANT DROP ANY PROCEDURE TO BELTPP_ACTION;
GRANT DROP ANY TRIGGER TO BELTPP_ACTION;
GRANT DROP ANY VIEW TO BELTPP_ACTION;
GRANT DROP PROFILE TO BELTPP_ACTION;


CREATE TABLE BELTPP_ACTION.ACTION_TYPE
(
  id    LONG                                    NOT NULL,
  code  VARCHAR2(5)                             NOT NULL,
  name  VARCHAR2(250)
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
NOMONITORING;

--------------------------------------------------------------------------------
ALTER TABLE ACTION_TYPE
 DROP PRIMARY KEY CASCADE;

DROP TABLE ACTION_TYPE CASCADE CONSTRAINTS;

CREATE TABLE ACTION_TYPE
(
  ID    NUMBER                                  NOT NULL,
  CODE  VARCHAR2(5 BYTE),
  NAME  VARCHAR2(250 BYTE)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE UNIQUE INDEX ACTION_TYPE_PK ON ACTION_TYPE
(ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


ALTER TABLE ACTION_TYPE ADD (
  CONSTRAINT ACTION_TYPE_PK
 PRIMARY KEY
 (ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ));
               
-------------------------------------------------------------------
ALTER TABLE REPORT
 DROP PRIMARY KEY CASCADE;

DROP TABLE REPORT CASCADE CONSTRAINTS;

CREATE TABLE REPORT
(
  ID       NUMBER                               NOT NULL,
  YEAR     DATE                                 NOT NULL,
  QUARTER  NUMBER                               NOT NULL,
  OTD_ID   NUMBER                               NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE UNIQUE INDEX REPORT_PK ON REPORT
(ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


ALTER TABLE REPORT ADD (
  CONSTRAINT REPORT_PK
 PRIMARY KEY
 (ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ));

-----------------------------------------------------------------------
ALTER TABLE REPORT_MARK
 DROP PRIMARY KEY CASCADE;

DROP TABLE REPORT_MARK CASCADE CONSTRAINTS;

CREATE TABLE REPORT_MARK
(
  ID        NUMBER                              NOT NULL,
  MARK      VARCHAR2(50 BYTE),
  POSITION  NUMBER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE UNIQUE INDEX REPORT_MARK_PK ON REPORT_MARK
(ID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


ALTER TABLE REPORT_MARK ADD (
  CONSTRAINT REPORT_MARK_PK
 PRIMARY KEY
 (ID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ));
------------------------------------------------------------
DROP TABLE REPORT_VALUE CASCADE CONSTRAINTS;

CREATE TABLE REPORT_VALUE
(
  ID_REPORT  NUMBER,
  ID_MARK    NUMBER,
  ID_ACTION  NUMBER,
  VALUE      NUMBER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;  

CREATE SEQUENCE id_report_seq;

ALTER TABLE REPORT_MARK
MODIFY MARK VARCHAR2(200);

INSERT INTO REPORT_MARK VALUES(1, 'Количество проведенных мероприятий за соответствующий период предыдущего года', 1);
INSERT INTO REPORT_MARK VALUES(2, 'Количество проведенных мероприятий за отчетный период текущего года', 2);
INSERT INTO REPORT_MARK VALUES(3, 'Рост(снижение) количества проведенных мероприятий в ед.', 3);
INSERT INTO REPORT_MARK VALUES(4, 'Рост(снижение) количества проведенных мероприятий в процентах', 4);

INSERT INTO REPORT_MARK VALUES(5, 'Объем оказанных услуг за соответствующий период предыдущего года', 5);
INSERT INTO REPORT_MARK VALUES(6, 'Объем оказанных услуг за отчетный период текущего года', 6);
INSERT INTO REPORT_MARK VALUES(7, 'Рост(снижение) объема оказанных услуг в ед.', 7);
INSERT INTO REPORT_MARK VALUES(8, 'Рост(снижение) объема оказанных услуг в процентах', 8);

INSERT INTO REPORT_MARK VALUES(9, 'Удельный вес в объеме услуг внешнеэкономического характера в %.', 9);
INSERT INTO REPORT_MARK VALUES(10, 'Удельный вес в общем объеме оказанных отделением услуг в %', 10);


CREATE TABLE C_OTD
   (	"OTD_ID" NUMBER, 
	"OTD_NAME" VARCHAR2(255 BYTE), 
	"OTD_NAME_SYN" VARCHAR2(100 BYTE), 
	"OTD_ADDRESS_INDEX" VARCHAR2(15 BYTE), 
	"OTD_ADDRESS_CITY" VARCHAR2(15 BYTE), 
	"OTD_ADDRESS_LINE" VARCHAR2(50 BYTE), 
	"OTD_ADDRESS_HOME" VARCHAR2(10 BYTE), 
	"OTD_ADDRESS_EXP" DATE, 
	 CONSTRAINT "PK_OTD" PRIMARY KEY ("OTD_ID"));


Insert into beltpp_action.C_OTD (OTD_ID,OTD_NAME,OTD_NAME_SYN,OTD_ADDRESS_INDEX,OTD_ADDRESS_CITY,OTD_ADDRESS_LINE,OTD_ADDRESS_HOME,OTD_ADDRESS_EXP) values (1,'Минское оделение','MN',null,null,null,null,null);
Insert into beltpp_action.C_OTD (OTD_ID,OTD_NAME,OTD_NAME_SYN,OTD_ADDRESS_INDEX,OTD_ADDRESS_CITY,OTD_ADDRESS_LINE,OTD_ADDRESS_HOME,OTD_ADDRESS_EXP) values (2,'Могилевское',null,null,null,null,null,null);
Insert into beltpp_action.C_OTD (OTD_ID,OTD_NAME,OTD_NAME_SYN,OTD_ADDRESS_INDEX,OTD_ADDRESS_CITY,OTD_ADDRESS_LINE,OTD_ADDRESS_HOME,OTD_ADDRESS_EXP) values (3,'Гродненсен',null,null,null,null,null,null);
Insert into beltpp_action.C_OTD (OTD_ID,OTD_NAME,OTD_NAME_SYN,OTD_ADDRESS_INDEX,OTD_ADDRESS_CITY,OTD_ADDRESS_LINE,OTD_ADDRESS_HOME,OTD_ADDRESS_EXP) values (4,'Еомельское',null,null,null,null,null,null);
Insert into beltpp_action.C_OTD (OTD_ID,OTD_NAME,OTD_NAME_SYN,OTD_ADDRESS_INDEX,OTD_ADDRESS_CITY,OTD_ADDRESS_LINE,OTD_ADDRESS_HOME,OTD_ADDRESS_EXP) values (5,'Витебское',null,null,null,null,null,null);
INSERT INTO "BELTPP_ACTION"."C_OTD" (OTD_ID, OTD_NAME, OTD_NAME_SYN) VALUES ('6', 'Брестское отделение', 'Вт')

