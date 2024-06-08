-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2024 at 02:23 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pdms`
--

-- --------------------------------------------------------

--
-- Table structure for table `allergies`
--

CREATE TABLE `allergies` (
  `allergy_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `allergen_name` varchar(255) NOT NULL,
  `reaction` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allergies`
--

INSERT INTO `allergies` (`allergy_id`, `patient_id`, `allergen_name`, `reaction`) VALUES
(1, 1, 'Pollen', 'Sneezing'),
(2, 2, 'Penicillin', 'Rash'),
(3, 3, 'Peanuts', 'Anaphylaxis'),
(4, 4, 'None', 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `appointment_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `patient_id`, `appointment_date`, `appointment_time`, `appointment_type`) VALUES
(1, 1, '2023-11-01', '10:30:00', 'General Check-up'),
(2, 2, '2023-11-02', '11:00:00', 'Follow-up'),
(3, 3, '2024-01-22', '12:00:00', 'Consultation'),
(4, 4, '2024-01-23', '13:00:00', 'Routine');

-- --------------------------------------------------------

--
-- Table structure for table `diagnoses`
--

CREATE TABLE `diagnoses` (
  `diagnosis_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `diagnosis_code` varchar(50) NOT NULL,
  `diagnosis_description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diagnoses`
--

INSERT INTO `diagnoses` (`diagnosis_id`, `patient_id`, `diagnosis_code`, `diagnosis_description`) VALUES
(1, 1, 'D01', 'Hypertension'),
(2, 2, 'D02', 'Diabetes'),
(3, 3, 'D03', 'Asthma'),
(4, 4, 'D04', 'No genetic disorders');

-- --------------------------------------------------------

--
-- Table structure for table `immunizations`
--

CREATE TABLE `immunizations` (
  `immunization_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `vaccine_name` varchar(255) NOT NULL,
  `date_given` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `immunizations`
--

INSERT INTO `immunizations` (`immunization_id`, `patient_id`, `vaccine_name`, `date_given`) VALUES
(1, 1, 'Flu Vaccine', '2023-10-01'),
(2, 2, 'COVID-19 Vaccine', '2023-10-02'),
(3, 3, 'MMR', '2023-11-30'),
(4, 4, 'Hepatitis B', '2023-11-15');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `reports_id` int(11) NOT NULL,
  `invoice_date` date NOT NULL,
  `amount_due` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `patient_id`, `reports_id`, `invoice_date`, `amount_due`, `status`) VALUES
(1, 1, 1, '2023-12-01', 100.00, 'Unpaid'),
(2, 2, 2, '2023-12-02', 150.00, 'Paid'),
(3, 3, 3, '2024-01-26', 200.00, 'Paid'),
(4, 4, 4, '2024-01-27', 250.00, 'Unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `medications`
--

CREATE TABLE `medications` (
  `medication_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `medication_name` varchar(50) NOT NULL,
  `dosage` varchar(50) NOT NULL,
  `frequency` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medications`
--

INSERT INTO `medications` (`medication_id`, `patient_id`, `medication_name`, `dosage`, `frequency`) VALUES
(1, 1, 'Paracetamol', '500mg', 'Twice a day'),
(2, 2, 'Amoxicillin', '250mg', 'Three times a day'),
(3, 3, 'Painkillers', '100mg', 'As needed'),
(4, 4, 'None', 'N/A', 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `contact` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `name`, `dob`, `gender`, `contact`) VALUES
(1, 'Rima', '2000-01-01', 'Female', '01793647'),
(2, 'Riad', '1996-05-10', 'Male', '013452226'),
(3, 'Sima', '1990-05-05', 'Female', '09876'),
(4, 'Karim', '1998-09-08', 'Male', '098765');

-- --------------------------------------------------------

--
-- Table structure for table `patients_diagnose`
--

CREATE TABLE `patients_diagnose` (
  `pd_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `diagnosis_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients_diagnose`
--

INSERT INTO `patients_diagnose` (`pd_id`, `patient_id`, `diagnosis_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `patients_medications`
--

CREATE TABLE `patients_medications` (
  `pm_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `medication_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients_medications`
--

INSERT INTO `patients_medications` (`pm_id`, `patient_id`, `medication_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `patients_treatments`
--

CREATE TABLE `patients_treatments` (
  `pt_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `treatment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients_treatments`
--

INSERT INTO `patients_treatments` (`pt_id`, `patient_id`, `treatment_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `invoice_id`, `payment_date`, `amount_paid`, `payment_method`) VALUES
(1, 1, '2023-12-03', 1000.00, 'Credit Card'),
(2, 2, '2023-12-04', 500.00, 'Debit Card'),
(3, 3, '2024-11-05', 1200.00, 'Cash'),
(4, 4, '2023-12-06', 800.00, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `report_date` date NOT NULL,
  `report_data` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`report_id`, `patient_id`, `test_id`, `report_date`, `report_data`) VALUES
(1, 1, 1, '2024-05-02', 'Complete Blood Count: Normal'),
(2, 2, 2, '2024-05-04', 'Urinalysis: No Infection'),
(3, 3, 3, '2024-05-06', 'Biopsy: Benign'),
(4, 4, 4, '2024-01-17', 'DNA test shows no abnormalities');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `result_id` int(11) NOT NULL,
  `specimen_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `result_data` varchar(50) NOT NULL,
  `result_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`result_id`, `specimen_id`, `test_id`, `result_data`, `result_date`) VALUES
(1, 1, 1, 'Normal', '2024-05-02'),
(2, 2, 2, 'No Infection', '2024-05-04'),
(3, 3, 3, 'Malignant cells detected', '2024-05-06'),
(4, 4, 4, 'No genetic abnormalities', '2024-01-13');

-- --------------------------------------------------------

--
-- Table structure for table `specimens`
--

CREATE TABLE `specimens` (
  `specimen_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `specimen_type` varchar(50) NOT NULL,
  `collection_date` date NOT NULL,
  `received_date` date NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specimens`
--

INSERT INTO `specimens` (`specimen_id`, `patient_id`, `specimen_type`, `collection_date`, `received_date`, `status`) VALUES
(1, 1, 'Blood', '2024-05-01', '2024-05-02', 'Received'),
(2, 2, 'Urine', '2024-05-03', '2024-05-04', 'In Process'),
(3, 3, 'Tissue', '2024-05-05', '2024-05-06', 'Analyzed'),
(4, 4, 'Saliva', '2024-01-07', '2024-01-08', 'Received');

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `test_id` int(11) NOT NULL,
  `test_name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `cost` decimal(9,2) NOT NULL,
  `test_category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`test_id`, `test_name`, `description`, `cost`, `test_category`) VALUES
(1, 'Complete Blood Count', 'Measures different components of blood', 300.00, 'Hematology'),
(2, 'Urinalysis', 'Analyzes urine for various diseases', 100.00, 'General'),
(3, 'Biopsy', 'Tissue analysis for cancer', 600.00, 'Pathology'),
(4, 'DNA Test', 'Genetic Testing', 700.00, 'Genetics');

-- --------------------------------------------------------

--
-- Table structure for table `treatments`
--

CREATE TABLE `treatments` (
  `treatment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `treatment_code` varchar(50) NOT NULL,
  `treatment_description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatments`
--

INSERT INTO `treatments` (`treatment_id`, `patient_id`, `treatment_code`, `treatment_description`) VALUES
(1, 1, 'T001', 'Rest and hydration'),
(2, 2, 'T002', 'Antibiotics'),
(3, 3, 'T003', 'Surgery'),
(4, 4, 'T004', 'No treatment necessary');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allergies`
--
ALTER TABLE `allergies`
  ADD PRIMARY KEY (`allergy_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `diagnoses`
--
ALTER TABLE `diagnoses`
  ADD PRIMARY KEY (`diagnosis_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `immunizations`
--
ALTER TABLE `immunizations`
  ADD PRIMARY KEY (`immunization_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `medications`
--
ALTER TABLE `medications`
  ADD PRIMARY KEY (`medication_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `patients_diagnose`
--
ALTER TABLE `patients_diagnose`
  ADD PRIMARY KEY (`pd_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `diagnosis_id` (`diagnosis_id`);

--
-- Indexes for table `patients_medications`
--
ALTER TABLE `patients_medications`
  ADD PRIMARY KEY (`pm_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `medication_id` (`medication_id`);

--
-- Indexes for table `patients_treatments`
--
ALTER TABLE `patients_treatments`
  ADD PRIMARY KEY (`pt_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `treatment_id` (`treatment_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `test_id` (`test_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `specimen_id` (`specimen_id`),
  ADD KEY `test_id` (`test_id`);

--
-- Indexes for table `specimens`
--
ALTER TABLE `specimens`
  ADD PRIMARY KEY (`specimen_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`test_id`);

--
-- Indexes for table `treatments`
--
ALTER TABLE `treatments`
  ADD PRIMARY KEY (`treatment_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allergies`
--
ALTER TABLE `allergies`
  MODIFY `allergy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `diagnoses`
--
ALTER TABLE `diagnoses`
  MODIFY `diagnosis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `immunizations`
--
ALTER TABLE `immunizations`
  MODIFY `immunization_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `medications`
--
ALTER TABLE `medications`
  MODIFY `medication_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patients_diagnose`
--
ALTER TABLE `patients_diagnose`
  MODIFY `pd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patients_medications`
--
ALTER TABLE `patients_medications`
  MODIFY `pm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patients_treatments`
--
ALTER TABLE `patients_treatments`
  MODIFY `pt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `specimens`
--
ALTER TABLE `specimens`
  MODIFY `specimen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `treatments`
--
ALTER TABLE `treatments`
  MODIFY `treatment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allergies`
--
ALTER TABLE `allergies`
  ADD CONSTRAINT `allergies_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`);

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`);

--
-- Constraints for table `diagnoses`
--
ALTER TABLE `diagnoses`
  ADD CONSTRAINT `diagnoses_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`);

--
-- Constraints for table `immunizations`
--
ALTER TABLE `immunizations`
  ADD CONSTRAINT `immunizations_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`);

--
-- Constraints for table `medications`
--
ALTER TABLE `medications`
  ADD CONSTRAINT `medications_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`);

--
-- Constraints for table `patients_diagnose`
--
ALTER TABLE `patients_diagnose`
  ADD CONSTRAINT `patients_diagnose_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `patients_diagnose_ibfk_2` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnoses` (`diagnosis_id`);

--
-- Constraints for table `patients_medications`
--
ALTER TABLE `patients_medications`
  ADD CONSTRAINT `patients_medications_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `patients_medications_ibfk_2` FOREIGN KEY (`medication_id`) REFERENCES `medications` (`medication_id`);

--
-- Constraints for table `patients_treatments`
--
ALTER TABLE `patients_treatments`
  ADD CONSTRAINT `patients_treatments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `patients_treatments_ibfk_2` FOREIGN KEY (`treatment_id`) REFERENCES `treatments` (`treatment_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`);

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`specimen_id`) REFERENCES `specimens` (`specimen_id`),
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`);

--
-- Constraints for table `specimens`
--
ALTER TABLE `specimens`
  ADD CONSTRAINT `specimens_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`);

--
-- Constraints for table `treatments`
--
ALTER TABLE `treatments`
  ADD CONSTRAINT `treatments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
