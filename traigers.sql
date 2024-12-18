CREATE OR REPLACE TRIGGER my_trigger
BEFORE CREATE ON SCHEMA
DECLARE
BEGIN
  IF ora_dict_obj_type = 'TABLE' THEN
    EXECUTE IMMEDIATE 'CREATE TABLE Department (DepartmentID datatype, DepartmentName datatype)';
    DBMS_OUTPUT.PUT_LINE('it's created);
  END IF;
END my_trigger;
/
CREATE OR REPLACE TRIGGER doctor_columns_trigger
BEFORE CREATE ON SCHEMA
DECLARE
BEGIN
  IF ora_dict_obj_type = 'TABLE' THEN
    IF ora_dict_obj_name = 'DOCTOR' THEN
      EXECUTE IMMEDIATE 'CREATE TABLE Doctor (
                           DoctorID PRIMARY KEY,
                           FirstName VARCHAR2(255),
                           LastName VARCHAR2(255),
                           ContactNumber VARCHAR2(20 CHAR),
                           Specialization VARCHAR2(255),
                           DepartmentID FOREIGN KEY REFERENCES Departments(DepartmentID)
                         )';
      DBMS_OUTPUT.PUT_LINE('Table created successfully.');
    END IF;
  END IF;
END doctor_columns_trigger;
/
CREATE OR REPLACE TRIGGER neares_columns_trigger
BEFORE CREATE ON SCHEMA
DECLARE
BEGIN
  IF ora_dict_obj_type = 'TABLE' THEN
    IF ora_dict_obj_name = 'NEARES' THEN
      EXECUTE IMMEDIATE 'CREATE TABLE Neares (
                           NearesID PRIMARY KEY,
                           FirstName VARCHAR2(255),
                           LastName VARCHAR2(255),
                           ContactNumber VARCHAR2(20 CHAR),
                           Department VARCHAR2(255),
                           DepartmentID FOREIGN KEY REFERENCES Departments(DepartmentID)
                         )';
      DBMS_OUTPUT.PUT_LINE('Table created successfully.');
    END IF;
  END IF;
END neares_columns_trigger;
/
CREATE OR REPLACE TRIGGER patient_columns_trigger
BEFORE CREATE ON SCHEMA
DECLARE
BEGIN
  IF ora_dict_obj_type = 'TABLE' THEN
    IF ora_dict_obj_name = 'PATIENT' THEN
      EXECUTE IMMEDIATE 'CREATE TABLE Patients (
                           PatientID PRIMARY KEY,
                           FirstName VARCHAR2(255),
                           LastName VARCHAR2(255),
                           Gender VARCHAR2(10) CHECK (Gender IN (''Male'', ''Female'')),
                           DepartmentID FOREIGN KEY REFERENCES Departments(DepartmentID),
                           Department VARCHAR2(255),
                           Address VARCHAR2(255),
                           ContactNumber VARCHAR2(20 CHAR),
                           DateOfBirth DATE
                         )';
      DBMS_OUTPUT.PUT_LINE('Table created successfully.');
    END IF;
  END IF;
END patient_columns_trigger;
/
CREATE OR REPLACE TRIGGER appointments_columns_trigger
BEFORE CREATE ON SCHEMA
DECLARE
BEGIN
  IF ora_dict_obj_type = 'TABLE' THEN
    IF ora_dict_obj_name = 'APPOINTMENTS' THEN
      EXECUTE IMMEDIATE 'CREATE TABLE Appointments (
                           AppointmentID PRIMARY KEY,
                           AppointmentDate DATE,
                           DoctorID FOREIGN KEY REFERENCES Doctors(DoctorID),
                           PatientID FOREIGN KEY REFERENCES Patients(PatientID)
                         )';
      DBMS_OUTPUT.PUT_LINE('Table created successfully.');
    END IF;
  END IF;
END appointments_trigger;
/
CREATE OR REPLACE TRIGGER test_columns_trigger
BEFORE CREATE ON SCHEMA
DECLARE
BEGIN
  IF ora_dict_obj_type = 'TABLE' THEN
    IF ora_dict_obj_name = 'TEST' THEN
      EXECUTE IMMEDIATE 'CREATE TABLE TEST (
                           TestID PRIMARY KEY,
                           TestDate DATE,
                           DoctorID FOREIGN KEY REFERENCES Doctors(DoctorID),
                           PatientID FOREIGN KEY REFERENCES Patients(PatientID)
                         )';
      DBMS_OUTPUT.PUT_LINE('Table created successfully.');
    END IF;
  END IF;
END test_trigger;
/
CREATE OR REPLACE TRIGGER prescription_columns_trigger
BEFORE CREATE ON SCHEMA
DECLARE
BEGIN
  IF ora_dict_obj_type = 'TABLE' THEN
    IF ora_dict_obj_name = 'PRESCRIPTION' THEN
      EXECUTE IMMEDIATE 'CREATE TABLE PRESCRIPTION (
                           PrescriptionID PRIMARY KEY,
                           DoctorID FOREIGN KEY REFERENCES Doctors(DoctorID),
                           PatientID FOREIGN KEY REFERENCES Patients(PatientID)
                         )';
      DBMS_OUTPUT.PUT_LINE('Table created successfully.');
    END IF;
  END IF;
END prescription_trigger;
/