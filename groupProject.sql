
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
---------------------New DML Statements--------------------------
INSERT ALL
    INTO PUBLISHER (Publisher_ID, Publisher_Name) VALUES ('PID001', 'Cengage')
    INTO PUBLISHER (Publisher_ID, Publisher_Name) VALUES ('PID002', 'Apress')
    INTO PUBLISHER (Publisher_ID, Publisher_Name) VALUES ('PID003', 'Pearson')
    INTO PUBLISHER (Publisher_ID, Publisher_Name) VALUES ('PID004', 'RELX Group')
    INTO PUBLISHER (Publisher_ID, Publisher_Name) VALUES ('PID005', 'Thomson Reuters')
    INTO PUBLISHER (Publisher_ID, Publisher_Name) VALUES ('PID006', 'Bertelsmann')
    INTO PUBLISHER (Publisher_ID, Publisher_Name) VALUES ('PID007', 'Wolters Kluwer')
    INTO PUBLISHER (Publisher_ID, Publisher_Name) VALUES ('PID008', 'Hachette Livre')
    INTO PUBLISHER (Publisher_ID, Publisher_Name) VALUES ('PID009', 'Grupo Planeta')
    INTO PUBLISHER (Publisher_ID, Publisher_Name) VALUES ('PID010', 'Springer Nature')
SELECT * FROM dual;

INSERT ALL
    INTO SHIPPING_TYPE (Shipping_Type, Shipping_Price) VALUES ('DHL', 100)
    INTO SHIPPING_TYPE (Shipping_Type, Shipping_Price) VALUES ('Amazon', 150)
    INTO SHIPPING_TYPE (Shipping_Type, Shipping_Price) VALUES ('PIL', 200)
    INTO SHIPPING_TYPE (Shipping_Type, Shipping_Price) VALUES ('Evergreen Marine Corp', 300)
    INTO SHIPPING_TYPE (Shipping_Type, Shipping_Price) VALUES ('ONE', 150)
    INTO SHIPPING_TYPE (Shipping_Type, Shipping_Price) VALUES ('COSCO', 100)
    INTO SHIPPING_TYPE (Shipping_Type, Shipping_Price) VALUES ('CMA CGM',150)
    INTO SHIPPING_TYPE (Shipping_Type, Shipping_Price) VALUES ('MSC',125)
    INTO SHIPPING_TYPE (Shipping_Type, Shipping_Price) VALUES ('Maersk Line',235)
    INTO SHIPPING_TYPE (Shipping_Type, Shipping_Price) VALUES ('Hyundai M.M.',135)
SELECT * FROM dual;

INSERT ALL
    INTO CUSTOMER (Customer_ID, Customer_Name, Street_Address, City, Phone_Number, Credit_Card_Number) VALUES ('CN001','Dean Jones','283 Queen Street','Halifax','237-99-6643','123-456-789-987')
    INTO CUSTOMER (Customer_ID, Customer_Name, Street_Address, City, Phone_Number, Credit_Card_Number) VALUES ('CN002','Maria Osborne','5 Rainbow Cres','Calgary','456-375-2897','123-321-456-321')
    INTO CUSTOMER (Customer_ID, Customer_Name, Street_Address, City, Phone_Number, Credit_Card_Number) VALUES ('CN003','Jonathan Peter','23 Twenty Street', 'Ottawa','613-443-2323','123-231-564-732')
    INTO CUSTOMER (Customer_ID, Customer_Name, Street_Address, City, Phone_Number, Credit_Card_Number) VALUES ('CN004','Lucas Scott','76 Dirt Road','Weyburn','306-848-9129','538-138-162-150')
    INTO CUSTOMER (Customer_ID, Customer_Name, Street_Address, City, Phone_Number, Credit_Card_Number) VALUES ('CN005','Micheal Harvin','4141 Pape Avenue','Toronto','647-881-6805','375-873-023-654')
    INTO CUSTOMER (Customer_ID, Customer_Name, Street_Address, City, Phone_Number, Credit_Card_Number) VALUES ('CN006','Stanley Railey','824 Gorham Street','London','519-932-2929','790-741-144-532')
    INTO CUSTOMER (Customer_ID, Customer_Name, Street_Address, City, Phone_Number, Credit_Card_Number) VALUES ('CN007','Chrystal Soria','4511 St.John Street','Carievale','306-928-3284','051-825-875-734')
    INTO CUSTOMER (Customer_ID, Customer_Name, Street_Address, City, Phone_Number, Credit_Card_Number) VALUES ('CN008','Kathleen Harlow','4755 Cordova Street','Vancouver','604-649-2188','104-777-800-987')
    INTO CUSTOMER (Customer_ID, Customer_Name, Street_Address, City, Phone_Number, Credit_Card_Number) VALUES ('CN009','Jesus Flowers','1668 th Street','478-952-120','478-952-120-273')
    INTO CUSTOMER (Customer_ID, Customer_Name, Street_Address, City, Phone_Number, Credit_Card_Number) VALUES ('CN010','Jessie Parnell','1104 Brand Road','306-242-9963','199-677-519-299')
SELECT * FROM dual;

INSERT ALL
    INTO CREDIT_CARD_DETAILS (Credit_Card_Number, Credit_Card_Type, Expiry_Date) VALUES ('111-111-222-222','AMEX','14-FEB-1982')
    INTO CREDIT_CARD_DETAILS (Credit_Card_Number, Credit_Card_Type, Expiry_Date) VALUES ('222-111-222-111','VISA','19-MAR-2009')
    INTO CREDIT_CARD_DETAILS (Credit_Card_Number, Credit_Card_Type, Expiry_Date) VALUES ('123-456-789-987','MASTERCARD','30-MAY-2013')
    INTO CREDIT_CARD_DETAILS (Credit_Card_Number, Credit_Card_Type, Expiry_Date) VALUES ('199-677-519-299','VISA','12-MAR-2023')
    INTO CREDIT_CARD_DETAILS (Credit_Card_Number, Credit_Card_Type, Expiry_Date) VALUES ('478-952-120-273','AMERICAN_EXPRESS','29-JAN-2006')
    INTO CREDIT_CARD_DETAILS (Credit_Card_Number, Credit_Card_Type, Expiry_Date) VALUES ('104-777-800-987','VISA','09-FEB-2010')
    INTO CREDIT_CARD_DETAILS (Credit_Card_Number, Credit_Card_Type, Expiry_Date) VALUES ('051-825-875-734','VISA','24-MAY-2014')
    INTO CREDIT_CARD_DETAILS (Credit_Card_Number, Credit_Card_Type, Expiry_Date) VALUES ('790-741-144-532','MASTERCARD','12-DEC-2019')
    INTO CREDIT_CARD_DETAILS (Credit_Card_Number, Credit_Card_Type, Expiry_Date) VALUES ('375-873-023-654','AMERICAN_EXPRESS','25-NOV-2010')
    INTO CREDIT_CARD_DETAILS (Credit_Card_Number, Credit_Card_Type, Expiry_Date) VALUES ('538-138-162-150','VISA','02-JUL-2018')
SELECT * FROM dual;

INSERT ALL
    INTO BOOKS (Book_ID, Book_Name, Author_ID, Price, Publisher_ID) VALUES ('BN001','Androcles and the Lion','AID001','200','PID001')
    INTO BOOKS (Book_ID, Book_Name, Author_ID, Price, Publisher_ID) VALUES ('BN002','An Unsocial Socialist','AID002','300','PID002')
    INTO BOOKS (Book_ID, Book_Name, Author_ID, Price, Publisher_ID) VALUES ('BN003','Romeo and Juliet','AID003','100','PID003')
    INTO BOOKS (Book_ID, Book_Name, Author_ID, Price, Publisher_ID) VALUES ('BN004','The Complete Poems','AID004','100','PID004')
    INTO BOOKS (Book_ID, Book_Name, Author_ID, Price, Publisher_ID) VALUES ('BN005','The Call of Cthulhu','AID005','250','PID005')
    INTO BOOKS (Book_ID, Book_Name, Author_ID, Price, Publisher_ID) VALUES ('BN006','The Hound of the Baskervilles','AID006','145','PID006')
    INTO BOOKS (Book_ID, Book_Name, Author_ID, Price, Publisher_ID) VALUES ('BN007','War and Peace','AID007','50','PID007')
    INTO BOOKS (Book_ID, Book_Name, Author_ID, Price, Publisher_ID) VALUES ('BN008','The Raven','AID008','125','PID008')
    INTO BOOKS (Book_ID, Book_Name, Author_ID, Price, Publisher_ID) VALUES ('BN009','The Hour of the Dragon','AID009','175','PID009')
    INTO BOOKS (Book_ID, Book_Name, Author_ID, Price, Publisher_ID) VALUES ('BN010','How to Build Tiny Homes','AID010','300','PID010')
SELECT * FROM dual;

INSERT ALL
    INTO SHOPPING_CART (Shopping_Cart_ID, Book_ID, Price, Shopping_Cart_Date, Quantity) VALUES ('SC001','BN001','150','10-JUN-2003','8')
    INTO SHOPPING_CART (Shopping_Cart_ID, Book_ID, Price, Shopping_Cart_Date, Quantity) VALUES ('SC002','BN002','200','23-JUL-2005','9')
    INTO SHOPPING_CART (Shopping_Cart_ID, Book_ID, Price, Shopping_Cart_Date, Quantity) VALUES ('SC003','BN003','300','25-MAY-2001','4')
    INTO SHOPPING_CART (Shopping_Cart_ID, Book_ID, Price, Shopping_Cart_Date, Quantity) VALUES ('SC004','BN004','250','2-JAN-2004','6')
    INTO SHOPPING_CART (Shopping_Cart_ID, Book_ID, Price, Shopping_Cart_Date, Quantity) VALUES ('SC005','BN005','125','31-OCT-2006','3')
    INTO SHOPPING_CART (Shopping_Cart_ID, Book_ID, Price, Shopping_Cart_Date, Quantity) VALUES ('SC006','BN006','400','22-SEP-2005','7')
    INTO SHOPPING_CART (Shopping_Cart_ID, Book_ID, Price, Shopping_Cart_Date, Quantity) VALUES ('SC007','BN007','200','10-JUN-2007','5')
    INTO SHOPPING_CART (Shopping_Cart_ID, Book_ID, Price, Shopping_Cart_Date, Quantity) VALUES ('SC008','BN008','300','15-OCT-2008','2')
    INTO SHOPPING_CART (Shopping_Cart_ID, Book_ID, Price, Shopping_Cart_Date, Quantity) VALUES ('SC009','BN009','225','12-MAR-2010','8')
    INTO SHOPPING_CART (Shopping_Cart_ID, Book_ID, Price, Shopping_Cart_Date, Quantity) VALUES ('SC010','BN010','150','23-JUN-2009','5')
SELECT * FROM dual;

INSERT ALL
    INTO ORDER_DETAILS (Order_ID, Customer_ID, Shipping_Type, Date_of_Purchase, Shopping_Cart_ID) VALUES ('OD001','CN001','FedEx','11-JUN-2005','SC001')
    INTO ORDER_DETAILS (Order_ID, Customer_ID, Shipping_Type, Date_of_Purchase, Shopping_Cart_ID) VALUES ('OD002','CN002','DHL','16-JUN-2007','SC002')
    INTO ORDER_DETAILS (Order_ID, Customer_ID, Shipping_Type, Date_of_Purchase, Shopping_Cart_ID) VALUES ('OD003','CN003','MSC','24-MAY-2003','SC003')
    INTO ORDER_DETAILS (Order_ID, Customer_ID, Shipping_Type, Date_of_Purchase, Shopping_Cart_ID) VALUES ('OD004','CN004','Amazon','12-SEP-2004','SC004')
    INTO ORDER_DETAILS (Order_ID, Customer_ID, Shipping_Type, Date_of_Purchase, Shopping_Cart_ID) VALUES ('OD005','CN005','DHL','23-JUN-2006','SC005')
    INTO ORDER_DETAILS (Order_ID, Customer_ID, Shipping_Type, Date_of_Purchase, Shopping_Cart_ID) VALUES ('OD006','CN006','MSC','30-JUL-2006','SC006')
    INTO ORDER_DETAILS (Order_ID, Customer_ID, Shipping_Type, Date_of_Purchase, Shopping_Cart_ID) VALUES ('OD007','CN007','Amazon','1-JAN-2001','SC007')
    INTO ORDER_DETAILS (Order_ID, Customer_ID, Shipping_Type, Date_of_Purchase, Shopping_Cart_ID) VALUES ('OD008','CN008','FedEx','21-FEB-2004','SC008')
    INTO ORDER_DETAILS (Order_ID, Customer_ID, Shipping_Type, Date_of_Purchase, Shopping_Cart_ID) VALUES ('OD009','CN009','Amazon','5-APR-2002','SC009')
    INTO ORDER_DETAILS (Order_ID, Customer_ID, Shipping_Type, Date_of_Purchase, Shopping_Cart_ID) VALUES ('OD010','CN010','MSC','8-JUN-2006','SC010')
SELECT * FROM dual;

INSERT ALL
    INTO PURCHASE_HISTORY (Customer_ID, Order_ID) VALUES ('CN001','OD001')
    INTO PURCHASE_HISTORY (Customer_ID, Order_ID) VALUES ('CN002','OD002')
    INTO PURCHASE_HISTORY (Customer_ID, Order_ID) VALUES ('CN003','OD003')
    INTO PURCHASE_HISTORY (Customer_ID, Order_ID) VALUES ('CN004','OD004')
    INTO PURCHASE_HISTORY (Customer_ID, Order_ID) VALUES ('CN005','ODOO5')
    INTO PURCHASE_HISTORY (Customer_ID, Order_ID) VALUES ('CN006','OD006')
    INTO PURCHASE_HISTORY (Customer_ID, Order_ID) VALUES ('CN007','OD007')
    INTO PURCHASE_HISTORY (Customer_ID, Order_ID) VALUES ('CN008','OD008')
    INTO PURCHASE_HISTORY (Customer_ID, Order_ID) VALUES ('CN009','OD009')
    INTO PURCHASE_HISTORY (Customer_ID, Order_ID) VALUES ('CN010','OD010')
SELECT * FROM dual;
