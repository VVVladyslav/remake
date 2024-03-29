-- H2 2.2.224;
;             
CREATE USER IF NOT EXISTS "" SALT '' HASH '' ADMIN;           
CREATE CACHED TABLE "PUBLIC"."WORKER"(
    "ID" INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL,
    "NAME" CHARACTER VARYING(1000) NOT NULL,
    "BIRTHDAY" DATE,
    "LEVEL" CHARACTER VARYING(20) NOT NULL,
    "SALARY" INTEGER
);  
ALTER TABLE "PUBLIC"."WORKER" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_9" PRIMARY KEY("ID");       
-- 10 +/- SELECT COUNT(*) FROM PUBLIC.WORKER; 
INSERT INTO "PUBLIC"."WORKER" VALUES
(1, 'John', DATE '2020-07-11', 'Trainee', 800),
(2, 'Jane', DATE '2001-02-12', 'Junior', 900),
(3, 'Jim', DATE '2005-02-13', 'Middle', 1800),
(4, 'Joe', DATE '2010-05-14', 'Senior', 1900),
(5, 'Jamal', DATE '2010-10-15', 'Senior', 1000),
(6, 'Jocker', DATE '2009-10-16', 'Senior', 1100),
(7, 'Janister', DATE '2007-11-17', 'Senior', 1200),
(8, 'Jupiter', DATE '2004-12-18', 'Middle', 5000),
(9, 'Jimison', DATE '2003-03-19', 'Trainee', 5200),
(10, 'Jared', DATE '2000-01-13', 'Middle', 5200);   
CREATE CACHED TABLE "PUBLIC"."CLIENT"(
    "ID" INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL,
    "NAME" CHARACTER VARYING(1000) NOT NULL
);            
ALTER TABLE "PUBLIC"."CLIENT" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_7" PRIMARY KEY("ID");       
-- 5 +/- SELECT COUNT(*) FROM PUBLIC.CLIENT;  
INSERT INTO "PUBLIC"."CLIENT" VALUES
(1, 'Oleg Cl'),
(2, 'Olyena Cl'),
(3, 'Oksana Cl'),
(4, 'Oman Cl'),
(5, 'Omrika Cl');               
CREATE CACHED TABLE "PUBLIC"."PROJECT"(
    "ID" INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL,
    "CLIENT_ID" INTEGER,
    "START_DATE" DATE,
    "FINISH_DATE" DATE
);              
ALTER TABLE "PUBLIC"."PROJECT" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_1" PRIMARY KEY("ID");      
-- 7 +/- SELECT COUNT(*) FROM PUBLIC.PROJECT; 
INSERT INTO "PUBLIC"."PROJECT" VALUES
(1, 1, DATE '2000-01-01', DATE '2001-06-30'),
(2, 2, DATE '2000-02-15', DATE '2002-11-30'),
(3, 3, DATE '2000-06-10', DATE '2003-02-20'),
(4, 4, DATE '2003-07-20', DATE '2004-01-10'),
(5, 5, DATE '2004-03-05', DATE '2005-04-20'),
(6, 5, DATE '2003-07-22', DATE '2004-01-11'),
(7, 4, DATE '2003-07-21', DATE '2004-01-12');
CREATE CACHED TABLE "PUBLIC"."PROJECT_WORKER"(
    "PROJECT_ID" INTEGER NOT NULL,
    "WORKER_ID" INTEGER NOT NULL
);      
ALTER TABLE "PUBLIC"."PROJECT_WORKER" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_5" PRIMARY KEY("PROJECT_ID", "WORKER_ID");          
-- 10 +/- SELECT COUNT(*) FROM PUBLIC.PROJECT_WORKER;         
INSERT INTO "PUBLIC"."PROJECT_WORKER" VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 6),
(4, 7),
(5, 8),
(5, 9),
(5, 10);       
ALTER TABLE "PUBLIC"."WORKER" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_98F54" CHECK(("SALARY" >= 100)
    AND ("SALARY" <= 100000)) NOCHECK;      
ALTER TABLE "PUBLIC"."WORKER" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_98" CHECK((CHAR_LENGTH("NAME") >= 2)
    AND (CHAR_LENGTH("NAME") <= 1000)) NOCHECK;       
ALTER TABLE "PUBLIC"."CLIENT" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_76" CHECK((CHAR_LENGTH("NAME") >= 2)
    AND (CHAR_LENGTH("NAME") <= 1000)) NOCHECK;       
ALTER TABLE "PUBLIC"."WORKER" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_98F5" CHECK("LEVEL" IN('Trainee', 'Junior', 'Middle', 'Senior')) NOCHECK;   
ALTER TABLE "PUBLIC"."WORKER" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_98F" CHECK(EXTRACT(YEAR FROM "BIRTHDAY") > 1900) NOCHECK;   
ALTER TABLE "PUBLIC"."PROJECT" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_18" FOREIGN KEY("CLIENT_ID") REFERENCES "PUBLIC"."CLIENT"("ID") NOCHECK;   
ALTER TABLE "PUBLIC"."PROJECT_WORKER" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_5B" FOREIGN KEY("PROJECT_ID") REFERENCES "PUBLIC"."PROJECT"("ID") NOCHECK;          
ALTER TABLE "PUBLIC"."PROJECT_WORKER" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_5B3" FOREIGN KEY("WORKER_ID") REFERENCES "PUBLIC"."WORKER"("ID") NOCHECK;           
