/*QUESTION 1*/
CREATE TABLE PersonnelTable(
    ID NUMBER(7) NOT NULL,
    LAST_NAME VARCHAR2(25),
    FIRST_NAME VARCHAR2(25),
    DEPT_ID NUMBER(7) NOT NULL,
    
    PRIMARY KEY(ID)
    /*FOREIGN KEY(DEPT_ID) REFERENCES DEPT(ID);*/
);

/*QUESTION 2*/
ALTER TABLE PersonnelTable
    ADD INCENTIVE NUMBER(2,2);
    
/*QUESTION 3*/
ALTER TABLE PersonnelTable
    MODIFY LAST_NAME VARCHAR2(32);
    
/*QUESTION 4*/
ALTER TABLE PersonnelTable
    DROP COLUMN LAST_NAME;
    
/*QUESTION 5*/
ALTER TABLE PersonnelTable
    SET UNUSED(FIRST_NAME);

/*QUESTION 6*/
ALTER TABLE PersonnelTable
    DROP UNUSED COLUMNS;
    
/*QUESTION 7*/
CREATE TABLE PersonnelTable2
    AS(SELECT * FROM PersonnelTable);
    
ALTER TABLE PersonnelTable2
    DROP COLUMN INCENTIVE;
    
ALTER TABLE PersonnelTable2   
    ADD (
        FIRST_NAME VARCHAR2(25),
        LAST_NAME VARCHAR(32)
        );
        
ALTER TABLE PersonnelTable2
    ADD SALARY NUMBER(2,2);
    
/*QUESTION 8*/
ALTER TABLE PersonnelTable2 READ ONLY;

/*QUESTION 9*/
ALTER TABLE PersonnelTable2
    DROP COLUMN SALARY;
    
/*QUESTION 10*/
ALTER TABLE PersonnelTable2 READ WRITE;

ALTER TABLE PersonnelTable2
    DROP COLUMN SALARY;    

/*Describe tables when complete*/
DESC PersonnelTable;
DESC PersonnelTable2;