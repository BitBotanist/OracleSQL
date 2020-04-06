
CREATE TABLE AUTHOR(
    AUTHOR_ID VARCHAR2(8) NOT NULL,
    AUTHOR_NAME VARCHAR2(32) NOT NULL,
    
    PRIMARY KEY(AUTHOR_ID)
);

CREATE TABLE BOOKS(
    BOOK_ID VARCHAR2(3) NOT NULL,
    BOOK_NAME VARCHAR2(16) NOT NULL,
    AUTHOR_ID VARCHAR2(3) NOT NULL,
    PRICE NUMBER(2) NOT NULL,
    PUBLISHER_ID VARCHAR2(3) NOT NULL,
    
    PRIMARY KEY(BOOK_ID),
    FOREIGN KEY(AUTHOR_ID) REFERENCES AUTHOR(AUTHOR_ID),
    FOREIGN KEY(PUBLISHER_ID) REFERENCES PUBLISHER(PUBLISHER_ID)
);

CREATE TABLE CUSTOMER(
    CUSTOMER_ID VARCHAR2(3) NOT NULL,
    CUSTOMER_NAME VARCHAR2(16) NOT NULL,
    STREET_ADDRESS VARCHAR2(32),
    CITY VARCHAR2(32),
    PHONE_NUMBER VARCHAR2(13),
    CREDIT_CARD_NUMBER VARCHAR2(19),
    
    PRIMARY KEY(CUSTOMER_ID),
    FOREIGN KEY(CREDIT_CARD_NUMBER) REFERENCES CREDIT_CARD_DETAILS(CREDIT_CARD_NUMBER)
);

CREATE TABLE CREDIT_CARD_DETAILS(
    CREDIT_CARD_NUMBER VARCHAR2(19) NOT NULL,
    CREDIT_CARD_TYPE VARCHAR2(16) NOT NULL,
    EXPIRY_DATE DATE NOT NULL,
    
    PRIMARY KEY(CREDIT_CARD_NUMBER)
);

CREATE TABLE ORDER_DETAILS(
    ORDER_ID NUMBER(1) NOT NULL,
    CUSTOMER_ID VARCHAR2(16) NOT NULL,
    SHIPPING_TYPE VARCHAR2(16) NOT NULL,
    DATE_OF_PURCHASE DATE NOT NULL,
    SHOPPING_CART_ID NUMBER(1) NOT NULL,
    
    PRIMARY KEY(ORDER_ID),
    FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
    FOREIGN KEY(SHIPPING_TYPE) REFERENCES SHIPPING_TYPE(SHIPPING_TYPE),
    FOREIGN KEY(SHOPPING_CART_ID) REFERENCES SHOPPING_CART(SHOPPING_CART_ID)
);

CREATE TABLE PUBLISHER(
    PUBLISHER_ID VARCHAR2(3) NOT NULL,
    PUBLISHER_NAME VARCHAR2(32) NOT NULL,
    
    PRIMARY KEY(PUBLISHER_ID)
);

CREATE TABLE PURCHASE_HISTORY(
    CUSTOMER_ID VARCHAR2(3) NOT NULL,
    ORDER_ID NUMBER(1) NOT NULL,
    
    FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
    FOREIGN KEY(ORDER_ID) REFERENCES ORDER_DETAILS(ORDER_ID)
);

CREATE TABLE SHIPPING_TYPE(
    SHIPPING_TYPE VARCHAR2(16) NOT NULL,
    SHIPPING_PRICE NUMBER(2) NOT NULL,
    
    PRIMARY KEY(SHIPPING_TYPE)
);

CREATE TABLE SHOPPING_CART(
    SHOPPING_CART_ID NUMBER(1),
    BOOK_ID VARCHAR2(3) NOT NULL,
    PRICE NUMBER(2) NOT NULL,
    CURRENT_DATE DATE NOT NULL,
    QUANTITY NUMBER(1) NOT NULL,
    
    PRIMARY KEY(SHOPPING_CART_ID),
    FOREIGN KEY(BOOK_ID) REFERENCES BOOKS(BOOK_ID)
);

DESC AUTHOR
DESC BOOKS
DESC CUSTOMER
DESC CREDIT_CARD_DETAILS
DESC ORDER_DETAILS
DESC PUBLISHER
DESC PURCHASE_HISTORY
DESC SHIPPING_TYPE
DESC SHOPPING_CART


INSERT ALL
    INTO AUTHOR (Author_ID, Author_Name) VALUES ('AID001', 'Leo Tolstoy')
    INTO AUTHOR (Author_ID, Author_Name) VALUES ('AID002', 'John Keats')
    INTO AUTHOR (Author_ID, Author_Name) VALUES ('AID003', 'William Shakespeare')
    INTO AUTHOR (Author_ID, Author_Name) VALUES ('AID004','Emily Dickinson')
    INTO AUTHOR (Author_ID, Author_Name) VALUES ('AID005','H.P. Lovecraft')
    INTO AUTHOR (Author_ID, Author_Name) VALUES ('AID006','Arthur Conan Doyle')
    INTO AUTHOR (Author_ID, Author_Name) VALUES ('AID007','Leo Tolstoy')
    INTO AUTHOR (Author_ID, Author_Name) VALUES ('AID008','Edgar Allan Poe')
    INTO AUTHOR (Author_ID, Author_Name) VALUES ('AID009','Robert Ervin Howard')
    INTO AUTHOR (Author_ID, Author_Name) VALUES ('AID010','Jamie Paugh')
SELECT * FROM dual;

SELECT * FROM AUTHOR
