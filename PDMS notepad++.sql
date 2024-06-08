---Pathological Database Management System(PDMS)


 create database pdms;
--1.Patients (Patient_id(pk), Name, DOB, Gender, Contact)

CREATE TABLE patients(
patient_id INT primary key auto_increment, 
name VARCHAR(50) NOT NULL ,
dob DATE NOT NULL ,
gender ENUM('Male','Female') NOT NULL , 
contact VARCHAR(20) NOT NULL );


insert into patients(patient_id,name,dob,gender,contact)
values(null,'Rima','2000-01-01','female','01793647'),
(null,'Riad','1996-05-10','male','013452226'),
(null,'Sima','1990-05-05','female','09876'),
(null,'Karim','1998-09-08','male','098765');


---2.	Specimens (Specimen_id (pk), Patient_id(fk), Specimen_type, Collection_date, Received-date, Status)

CREATE TABLE specimens(
  specimen_id INT primary key auto_increment, 
  patient_id INT NOT NULL,
  specimen_type VARCHAR(50) NOT NULL,
  collection_date DATE NOT NULL,
  received_date DATE NOT NULL,
  status VARCHAR(50) NOT NULL,
 FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
);
insert into specimens (specimen_id,patient_id,specimen_type,collection_date,received_date,status)
values(null, 1,'Blood', '2024-05-01', '2024-05-02', 'Received'),
(null,2, 'Urine', '2024-05-03', '2024-05-04', 'In Process'),
(null, 3,'Tissue', '2024-05-05', '2024-05-06', 'Analyzed'),
(null,4, 'Saliva', '2024-01-07', '2024-01-08', 'Received');

---3.	Tests (Test_id (pk), Test_name, Description, Cost, Test_category)

CREATE TABLE tests (
  test_id INT primary key auto_increment, 
  test_name VARCHAR(50) NOT NULL,
  description VARCHAR(50) NOT NULL,
  cost DECIMAL(9, 2) NOT NULL,
  test_category VARCHAR(255) NOT NULL
);
insert into tests(test_id,test_name,description,cost,test_category)
 VALUES(null,'Complete Blood Count', 'Measures different components of blood', 300, 'Hematology'),
(null,'Urinalysis', 'Analyzes urine for various diseases', 100, 'General'),
(null,'Biopsy', 'Tissue analysis for cancer', 600, 'Pathology'),
(null,'DNA Test', 'Genetic Testing', 700, 'Genetics');


---4.	Results (Result_id (pk), Specimen_id (fk), TestId (fk) Result_data, Result_date)
CREATE TABLE results (
  result_id INT primary key auto_increment, 
  specimen_id INT NOT NULL,
  test_id INT NOT NULL,
  result_data VARCHAR(50) NOT NULL,
  result_date DATE NOT NULL,
  FOREIGN KEY (specimen_id) REFERENCES specimens (specimen_id),
  FOREIGN KEY (test_id) REFERENCES tests (test_id)
);

insert into results(result_id,specimen_id,test_id,result_data,result_date)
 VALUES
(null,1, 1, 'Normal', '2024-05-02'),
(null,2, 2, 'No Infection', '2024-05-04'),
(null,3, 3, 'Malignant cells detected', '2024-05-06'),
(null,4,4,'No genetic abnormalities', '2024-01-13');


--5.	Reports (Report_id (pk), Patient_id (fk), Test_id (fk), Report_date, Report_data
CREATE TABLE reports (
  report_id INT primary key auto_increment, 
  patient_id INT NOT NULL,
  test_id INT NOT NULL,
  report_date DATE NOT NULL,
  report_data VARCHAR(50) NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id),
  FOREIGN KEY (test_id) REFERENCES tests (test_id)
);

insert into reports(report_id,patient_id,test_id,report_date,report_data)
VALUES
(null,1, 1, '2024-05-02', 'Complete Blood Count: Normal'),
(null,2, 2, '2024-05-04', 'Urinalysis: No Infection'),
(null,3, 3, '2024-05-06', 'Biopsy: Benign'),
(null,4, 4, '2024-01-17', 'DNA test shows no abnormalities');


---6.	Diagnosis (Diagnosis_id (pk), Patient_id (fk), Diagnosis_code, Diagnosis_description)
CREATE TABLE diagnoses (
  diagnosis_id INT primary key auto_increment, 
  patient_id INT NOT NULL,
  diagnosis_code VARCHAR(50) NOT NULL,
  diagnosis_description VARCHAR(50) NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES Patients (patient_id)
);
insert into diagnoses (diagnosis_id,patient_id,diagnosis_code,diagnosis_description)
values (null,1, 'D01', 'Hypertension'),
(null,2, 'D02', 'Diabetes'),
(null,3, 'D03', 'Asthma'),
(null,4,'D04','No genetic disorders');


--7.	Pateints_diagnoses ( pd_id,patient_id(fk),diagnosis_id (fk))

CREATE TABLE patients_diagnose(
pd_id INT primary key AUTO_INCREMENT , 
patient_id INT NOT NULL , 
diagnosis_id INT NOT NULL );


INSERT INTO patients_diagnose (pd_id,patient_id, diagnosis_id) 
VALUES
(null,1, 1),
(null,2, 2),
(null,3,3),
(null,4,4);

---8.	Treatments (Treatment_id (pk), Patient_id (fk),Treatment_code, Treatment_description)

CREATE TABLE treatments (
  treatment_id INT primary key auto_increment, 
  patient_id INT NOT NULL,
  treatment_code VARCHAR(50) NOT NULL,
  treatment_description VARCHAR(50) NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES Patients (Patient_id)
);
INSERT INTO treatments (treatment_id,patient_id, treatment_code, treatment_description) 
VALUES
(null,1, 'T001', 'Rest and hydration'),
(null,2, 'T002', 'Antibiotics'),
(null,3, 'T003', 'Surgery'),
(null,4, 'T004', 'No treatment necessary');
----9.	Patients_treatments(pt_id,patients_id,treatment_id)

CREATE TABLE patients_treatments (
  pt_id INT primary key AUTO_INCREMENT,
  patient_id INT NOT NULL,
  treatment_id INT NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id)
);

INSERT INTO patients_treatments (pt_id,patient_id, treatment_id) VALUES
(null,1, 1),
(null,2, 2),
(null,3,3),
(null,4,4);

---10.	Medications (Medication_id (pk), Patient_id (fk), Medication_name, Dosage, Frequency

CREATE TABLE medications (
  medication_id INT primary key auto_increment, 
  patient_id INT NOT NULL,
  medication_name VARCHAR(50) NOT NULL,
  dosage VARCHAR(50) NOT NULL,
  frequency VARCHAR(50) NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
);

INSERT INTO medications (medication_id,patient_id, medication_name, dosage, frequency) 
VALUES
(null,1, 'Paracetamol', '500mg', 'Twice a day'),
(null,2, 'Amoxicillin', '250mg', 'Three times a day'),
(null,3, 'Painkillers', '100mg', 'As needed'),
(null,4, 'None', 'N/A', 'N/A');

---11.	Pateints_medications(pm_id,patients_id)

CREATE TABLE patients_medications (
  pm_id INT primary key AUTO_INCREMENT,
  patient_id INT NOT NULL,
  medication_id INT NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (medication_id) REFERENCES medications(medication_id)
);

INSERT INTO patients_medications (pm_id,patient_id, medication_id) VALUES
(null,1, 1),
(null,2, 2),
(null,3,3),
(null,4,4);

---12.	Allergies (Allergy_id (pk), Patient_id (fk), Allergen_name, Reaction
CREATE TABLE allergies (
  allergy_id INT primary key auto_increment, 
  patient_id INT NOT NULL,
  allergen_name VARCHAR(255) NOT NULL,
  reaction VARCHAR(255) NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
);

INSERT INTO allergies (allergy_id,patient_id, allergen_name, reaction) VALUES
(null,1, 'Pollen', 'Sneezing'),
(null,2, 'Penicillin', 'Rash'),
(null,3, 'Peanuts', 'Anaphylaxis'),
(null,4, 'None', 'N/A');


-- 13.	Immunizations (Immunization_id (pk), Patient_id(fk), Vaccine_name, Date_given)
CREATE TABLE immunizations (
  immunization_id INT primary key AUTO_INCREMENT,
  patient_id INT NOT NULL,
  vaccine_name VARCHAR(255) NOT NULL,
  date_given DATE NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

INSERT INTO immunizations (immunization_id,patient_id, vaccine_name, date_given) VALUES
(null,1, 'Flu Vaccine', '2023-10-01'),
(null,2, 'COVID-19 Vaccine', '2023-10-02'),
(null,3,'MMR', '2023-11-30'),
(null,4,'Hepatitis B', '2023-11-15');



-- 14.	Appointments (Appointment_id (pk), Patient_id (fk), Appointment_date, Appointment_type)
CREATE TABLE appointments (
  appointment_id INT primary key AUTO_INCREMENT,
  patient_id INT NOT NULL,
  appointment_date date not null,
  appointment_time time NOT NULL,
  appointment_type VARCHAR(255) NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

INSERT INTO appointments (appointment_id,patient_id,appointment_date, appointment_time, appointment_type) VALUES
(null,1, '2023-11-01', '10:30:00','General Check-up'),
(null,2, '2023-11-02', '11:00:00','Follow-up'),
(null,3, '2024-01-22', '12:00:00', 'Consultation'),
(null,4, '2024-01-23', '13:00:00', 'Routine');


-- 15.	Invoices (Invoice_id (pk), Patient_id (fk), Invoice_date, Amount_due, Status
CREATE TABLE invoices (
  invoice_id INT primary key AUTO_INCREMENT,
  patient_id INT NOT NULL,
  invoice_date DATE NOT NULL,
  amount_due DECIMAL(10, 2) NOT NULL,
  status VARCHAR(255) NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

INSERT INTO invoices (invoice_id,patient_id, invoice_date, amount_due, status) VALUES
(null,1, '2023-12-01', 100, 'Unpaid'),
(null,2, '2023-12-02', 150, 'Paid'),
(null,3, '2024-01-26', 200, 'Paid'),
(null,4, '2024-01-27', 250, 'Unpaid');

--16.	Payments (Payment_id (pk), Invoice_id (fk),Payment_date, Amount_paid, Payment_method
CREATE TABLE payments (
  payment_id INT primary key AUTO_INCREMENT,
  invoice_id INT NOT NULL,
  payment_date DATE NOT NULL,
  amount_paid DECIMAL(10, 2) NOT NULL,
  payment_method VARCHAR(255) NOT NULL,
  FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);

INSERT INTO payments (payment_id,invoice_id, payment_date, amount_paid, payment_method) 
VALUES
(null,1, '2023-12-03', 1000, 'Credit Card'),
(null,2, '2023-12-04', 500, 'Debit Card'),
(null,3,'2024-11-05',1200,'Cash'),
(null,4,'2023-12-06',800,'Cash');