CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255) NOT NULL
);
-- Create Doctor Table
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(20) NOT NULL UNIQUE,
    Specialization VARCHAR(255) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
-- Create Nurse Table
CREATE TABLE Nurse (
    NurseID INT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(20) NOT NULL UNIQUE,
    Department VARCHAR(255) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    Address VARCHAR(255),
    ContactNumber VARCHAR(20) UNIQUE,
    DateOfBirth DATE
);
-- Create Appointment Table
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    AppointmentDate DATE,
    DoctorID INT,
    PatientID INT,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);
-- Create Test Table
CREATE TABLE Test (
    TestID INT PRIMARY KEY,
    Result VARCHAR(255),
    TestType VARCHAR(255),
    TestDate DATE,
    DoctorID INT,
    PatientID INT,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);
-- Create Prescription Table
CREATE TABLE Prescription (
    PrescriptionID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);
 INSERT ALL
INTO Department (DepartmentID, DepartmentName) VALUES (100, 'Outpatient department')
INTO Department (DepartmentID, DepartmentName) VALUES (101, 'Nursing Department')
INTO Department (DepartmentID, DepartmentName) VALUES (102, 'Pharmacy Department')
INTO Department (DepartmentID, DepartmentName) VALUES (103, 'Dietary Department')
INTO Department (DepartmentID, DepartmentName) VALUES (104, 'Medical Record Department')
INTO Department (DepartmentID, DepartmentName) VALUES (105, 'Personnel Department')

SELECT * FROM dual;
INSERT ALL
INTO Doctor (DoctorID, FirstName, LastName, ContactNumber, Specialization, DepartmentID) VALUES (1, 'John', 'Doe', '123-456-7890', 'Cardiology', 101)
INTO Doctor (DoctorID, FirstName, LastName, ContactNumber, Specialization, DepartmentID) VALUES (2, 'Jane', 'Smith', '987-654-3210', 'Orthopedics', 102)
INTO Doctor (DoctorID, FirstName, LastName, ContactNumber, Specialization, DepartmentID) VALUES (3, 'David', 'Johnson', '555-123-4567', 'Pediatrics', 103)
INTO Doctor (DoctorID, FirstName, LastName, ContactNumber, Specialization, DepartmentID) VALUES (4, 'Emily', 'Williams', '111-222-3333', 'Dermatology', 101)
INTO Doctor (DoctorID, FirstName, LastName, ContactNumber, Specialization, DepartmentID) VALUES (5, 'Michael', 'Brown', '444-555-6666', 'Ophthalmology', 102)
INTO Doctor (DoctorID, FirstName, LastName, ContactNumber, Specialization, DepartmentID) VALUES (6, 'Sara', 'Jones', '777-888-9999', 'Psychiatry', 103)
SELECT * FROM dual;
INSERT ALL
INTO Nurse (NurseID, FirstName, LastName, ContactNumber, Department, DepartmentID) VALUES (1, 'Alice', 'Johnson', '111-222-3333', 'Emergency Room', 101)
INTO Nurse (NurseID, FirstName, LastName, ContactNumber, Department, DepartmentID) VALUES (2, 'Bob', 'Smith', '444-555-6666', 'Pediatrics', 102)
INTO Nurse (NurseID, FirstName, LastName, ContactNumber, Department, DepartmentID) VALUES (3, 'Catherine', 'Davis', '777-888-9999', 'Surgery', 103)
INTO Nurse (NurseID, FirstName, LastName, ContactNumber, Department, DepartmentID) VALUES (4, 'David', 'Brown', '123-456-7890', 'Orthopedics', 101)
INTO Nurse (NurseID, FirstName, LastName, ContactNumber, Department, DepartmentID) VALUES (5, 'Eva', 'Taylor', '987-654-3210', 'Cardiology', 102)
INTO Nurse (NurseID, FirstName, LastName, ContactNumber, Department, DepartmentID) VALUES (6, 'Frank', 'Miller', '555-123-4567', 'Radiology', 103)
SELECT * FROM dual;

-- Inserting data into the Patient table using INSERT ALL
INSERT ALL
  INTO Patient (PatientID, FirstName, LastName, Gender, DepartmentID, Address, ContactNumber, DateOfBirth)
    VALUES (1, 'John', 'Doe', 'Male', 101, '123 Main St', '555-1234', DATE '1990-05-15')
  INTO Patient (PatientID, FirstName, LastName, Gender, DepartmentID, Address, ContactNumber, DateOfBirth)
    VALUES (2, 'Jane', 'Smith', 'Female', 102, '456 Oak St', '555-5678', DATE '1985-08-22')
  INTO Patient (PatientID, FirstName, LastName, Gender, DepartmentID, Address, ContactNumber, DateOfBirth)
    VALUES (3, 'David', 'Johnson', 'Male', 103, '789 Pine St', '555-9012', DATE '1992-11-10')
  INTO Patient (PatientID, FirstName, LastName, Gender, DepartmentID, Address, ContactNumber, DateOfBirth)
    VALUES (4, 'Emily', 'Williams', 'Female', 101, '101 Elm St', '555-3456', DATE '1988-04-03')
  INTO Patient (PatientID, FirstName, LastName, Gender, DepartmentID, Address, ContactNumber, DateOfBirth)
    VALUES (5, 'Michael', 'Brown', 'Male', 102, '202 Birch St', '555-7890', DATE '1995-07-18')
  INTO Patient (PatientID, FirstName, LastName, Gender, DepartmentID, Address, ContactNumber, DateOfBirth)
    VALUES (6, 'Sara', 'Jones', 'Female', 103, '303 Cedar St', '555-2345', DATE '1983-09-25')
SELECT * FROM dual;
-- Inserting data into the Appointment table using INSERT ALL
INSERT ALL
  INTO Appointment (AppointmentID, AppointmentDate, DoctorID, PatientID)
    VALUES (1, TO_DATE('2023-12-15', 'YYYY-MM-DD'), 1, 1)
  INTO Appointment (AppointmentID, AppointmentDate, DoctorID, PatientID)
    VALUES (2, TO_DATE('2023-12-16', 'YYYY-MM-DD'), 2, 2)
  INTO Appointment (AppointmentID, AppointmentDate, DoctorID, PatientID)
    VALUES (3, TO_DATE('2023-12-17', 'YYYY-MM-DD'), 3, 3)
  INTO Appointment (AppointmentID, AppointmentDate, DoctorID, PatientID)
    VALUES (4, TO_DATE('2023-12-18', 'YYYY-MM-DD'), 4, 4)
  INTO Appointment (AppointmentID, AppointmentDate, DoctorID, PatientID)
    VALUES (5, TO_DATE('2023-12-19', 'YYYY-MM-DD'), 5, 5)
  INTO Appointment (AppointmentID, AppointmentDate, DoctorID, PatientID)
    VALUES (6, TO_DATE('2023-12-20', 'YYYY-MM-DD'), 6, 6)
SELECT * FROM dual;

-- Inserting data into the Test table using INSERT ALL
INSERT ALL
  INTO Test (TestID, Result, TestType, TestDate, DoctorID, PatientID) VALUES (1, 'Positive', 'Blood Test', TO_DATE('2023-12-15', 'YYYY-MM-DD'), 1, 1)
  INTO Test (TestID, Result, TestType, TestDate, DoctorID, PatientID) VALUES (2, 'Negative', 'X-Ray', TO_DATE('2023-12-16', 'YYYY-MM-DD'), 2, 2)
  INTO Test (TestID, Result, TestType, TestDate, DoctorID, PatientID) VALUES (3, 'Positive', 'MRI', TO_DATE('2023-12-17', 'YYYY-MM-DD'), 3, 3)
  INTO Test (TestID, Result, TestType, TestDate, DoctorID, PatientID) VALUES (4, 'Negative', 'Ultrasound', TO_DATE('2023-12-18', 'YYYY-MM-DD'), 4, 4)
  INTO Test (TestID, Result, TestType, TestDate, DoctorID, PatientID) VALUES (5, 'Positive', 'CT Scan', TO_DATE('2023-12-19', 'YYYY-MM-DD'), 5, 5)
  INTO Test (TestID, Result, TestType, TestDate, DoctorID, PatientID) VALUES (6, 'Negative', 'EKG', TO_DATE('2023-12-20', 'YYYY-MM-DD'), 6, 6)
SELECT * FROM dual;
-- Inserting data into the Prescription table using INSERT ALL
INSERT ALL
  INTO Prescription (PrescriptionID, PatientID, DoctorID) VALUES (1, 1, 1)
  INTO Prescription (PrescriptionID, PatientID, DoctorID) VALUES (2, 2, 2)
  INTO Prescription (PrescriptionID, PatientID, DoctorID) VALUES (3, 3, 3)
  INTO Prescription (PrescriptionID, PatientID, DoctorID) VALUES (4, 4, 4)
  INTO Prescription (PrescriptionID, PatientID, DoctorID) VALUES (5, 5, 5)
  INTO Prescription (PrescriptionID, PatientID, DoctorID) VALUES (6, 6, 6)
SELECT * FROM dual;
 -- view 1
 -- Create a view to show PrescriptionID and PatientID columns from the Prescription table
CREATE VIEW persciption_patient AS
SELECT PrescriptionID, PatientID
FROM Prescription;

-- Create a view to show Appointment_date and PatientID columns from the Appointment table
CREATE VIEW patient_Appointment AS
SELECT AppointmentDate, PatientID
FROM Appointment;
-- Create a view to show FirstName, LastName, ContactNumber, and Specialization columns from the Doctor table
CREATE VIEW nurse_doctor AS
SELECT FirstName, LastName, ContactNumber, Specialization
FROM Doctor;




select * from Department;
select * from Doctor;
select * from Nurse;
select * from patient;
select * from APPOINTMENT;
select * from prescription;
select * from test;
select * FROM persciption_patient;

