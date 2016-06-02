CREATE TABLE LOGIN
(
   LOGIN_ID VARCHAR2(25) CONSTRAINT login_pk PRIMARY KEY,
   PASSWORD VARCHAR2(25),
   TYPE VARCHAR2(25),
   CONSTRAINT check_type CHECK (type in('doctor','patient','pharmacist'))
);

CREATE TABLE DOCTOR 
   (ID VARCHAR2(25) CONSTRAINT doctor_pk PRIMARY KEY, 
	NAME VARCHAR2(30) CONSTRAINT DOCTOR_NN_NAME NOT NULL, 
	PTYPE VARCHAR2(10 BYTE), 
	PHONE VARCHAR2(15 BYTE) CONSTRAINT DOCTOR_NN_PHONE NOT NULL , 
	EMAIL VARCHAR2(30 BYTE) CONSTRAINT DOCTOR_NN_EMAIL UNIQUE,
	CONSTRAINT doctor_pk PRIMARY KEY(ID,PTYPE)
	);
  
CREATE TABLE PATIENT 
   (ID VARCHAR2(25) CONSTRAINT patient_pk PRIMARY KEY, 
	NAME VARCHAR2(30) CONSTRAINT PATIENT_NN_NAME NOT NULL, 
	DOB DATE CONSTRAINT PATIENT_NN_DATE NOT NULL, 
	PHONE VARCHAR2(15 BYTE) CONSTRAINT PATIENT_NN_PHONE NOT NULL, 
	EMAIL VARCHAR2(30 BYTE) CONSTRAINT PATIENT_NN_EMAIL UNIQUE
	);
	
CREATE TABLE PHARMACY 
   (ID VARCHAR2(25) CONSTRAINT pharmacy_pk PRIMARY KEY, 
	NAME VARCHAR2(30) CONSTRAINT PHARMACY_NN_NAME NOT NULL, 
	LOC VARCHAR2(30) CONSTRAINT PHARMACY_NN_LOC NOT NULL, 
	PHONE VARCHAR2(15 BYTE) CONSTRAINT PHARMACY_NN_PHONE NOT NULL, 
	EMAIL VARCHAR2(30 BYTE) CONSTRAINT PHARMACY_NN_EMAIL UNIQUE
	);
  
CREATE TABLE PATIENT_REQUEST 
   (DOC_ID VARCHAR2(25), 
	PATIENT_ID VARCHAR2(30), 
	FLAG CHAR(1),
  PROBLEM VARCHAR2(10),
    CONSTRAINT patient_request_pk PRIMARY KEY(DOC_ID,PATIENT_ID));
	
CREATE TABLE PRESCRIPTION 
   (PRESCRIPTION_NUMBER number(10) CONSTRAINT precription_pk PRIMARY KEY,
	DOC_ID VARCHAR2(25), 
	PATIENT_ID VARCHAR2(25),
	FLAG CHAR(1),
    DRUG_LIST VARCHAR2(50));

CREATE TABLE DOCTOR_RESPONSE_PHARMACY 
   (PRESCRIPTION_NUMBER number(10) ,
	PHARMACY_ID VARCHAR2(25),
	FLAG CHAR(1),
	CONSTRAINT doctor_pk PRIMARY KEY(PRESCRIPTION_NUMBER,PHARMACY_ID));
	
	
  