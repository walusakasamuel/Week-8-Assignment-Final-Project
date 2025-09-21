--Final project_Clinic _booking_system
-- Create the database
CREATE DATABASE IF NOT EXISTS clinic_booking_system;
USE clinic_booking_system;

-- Table for storing clinic information
CREATE TABLE clinics (
    clinic_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    operating_hours VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table for storing doctor information
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    clinic_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL,
    license_number VARCHAR(50) UNIQUE NOT NULL,
    available BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id) ON DELETE CASCADE
);

-- Table for storing patient information
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(255),
    emergency_contact_name VARCHAR(100),
    emergency_contact_phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

--Table for Services (e.g., Consultation, Blood Test) - reused across clinics/doctors
CREATE TABLE services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description VARCHAR(400),
    base_price DECIMAL(10,2) DEFAULT 0.00,
    is_active TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (name)
);

-- Table for storing appointment information
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    clinic_id INT NOT NULL,
    service_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled', 'No-show') DEFAULT 'Scheduled',
    reason TEXT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id) ON DELETE CASCADE,
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES services(service_id) ON DELETE RESTRICT,
    UNIQUE KEY unique_doctor_timeslot (doctor_id, appointment_date, appointment_time)
);

-- Table for storing medical records
CREATE TABLE medical_records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_id INT,
    diagnosis TEXT,
    prescription TEXT,
    notes TEXT,
    record_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id) ON DELETE CASCADE,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id) ON DELETE SET NULL
);

-- Payments (one appointment can have multiple payments; optional)
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    method ENUM('Cash','Card','Mobile Money','Insurance') DEFAULT 'Cash',
    paid_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    reference VARCHAR(200),
    CONSTRAINT fk_payment_appt FOREIGN KEY (appointment_id)
        REFERENCES appointments(appointment_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table for storing clinic staff (receptionists, nurses, etc.)
CREATE TABLE staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    clinic_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id) ON DELETE CASCADE
);

-- Table for doctor availability (when they're available for appointments)
CREATE TABLE doctor_availability (
    availability_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT NOT NULL,
    day_of_week ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id) ON DELETE CASCADE,
    UNIQUE KEY unique_doctor_day (doctor_id, day_of_week)
);

-- Table for treatment rooms
CREATE TABLE treatment_rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    clinic_id INT NOT NULL,
    room_number VARCHAR(10) NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    available BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (clinic_id) REFERENCES clinics(clinic_id) ON DELETE CASCADE,
    UNIQUE KEY unique_clinic_room (clinic_id, room_number)
);

-- Junction table for appointments and treatment rooms
CREATE TABLE appointment_rooms (
    appointment_id INT NOT NULL,
    room_id INT NOT NULL,
    PRIMARY KEY (appointment_id, room_id),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES treatment_rooms(room_id) ON DELETE CASCADE
);

-- Insert sample data
INSERT INTO clinics (name, address, phone, email, operating_hours) VALUES
('I-Lit Clinic', '40, Nairobi', '0712870348077', 'ilit@clinic.com', 'Mon-Fri: 8am-6pm, Sat: 9am-1pm'),
('Vigo Medical Center', '510 Westlands, Nairobi', '0723436997', 'vigo@medical.com', 'Mon-Fri: 7am-7pm, Sat-Sun: 9am-4pm');

INSERT INTO doctors (clinic_id, first_name, last_name, specialization, phone, email, license_number) VALUES
(1, 'Samuel', 'Walusaka', 'Cardiology', '072343699', 'swalusakan@clinic.com', 'MD123456'),
(1, 'Michael', 'Ken', 'Pediatrics', '072343690', 'm.ken@clinic.com', 'MD654321'),
(2, 'Emily', 'Ngaira', 'Dermatology', '072343697', 'emilyn@medical.com', 'MD789012'),
(2, 'Edwin', 'Samita', 'Orthopedics', '072436997', 'esam@medical.com', 'MD210987');

INSERT INTO patients (first_name, last_name, date_of_birth, gender, phone, email, address, emergency_contact_name, emergency_contact_phone) VALUES
('Zipporah', 'Khisa', '2003-05-01', 'Female', '073436997', 'zippyk@gmail.com', '40, Nairobi', 'Felistus', '07452..1'),
('Alice', 'Duke', '1998-07-22', 'Female', '072036997', 'aliced@gmail.com', '325, Moisbridge', 'George Smith', '07123552'),
('Tom', 'Saidi', '1992-10-27', 'Male', '071287034', 'toms@gmail.com', '325 , Moisbridge', 'Mary June', '0777-2223');

-- Insert services
INSERT INTO services (name, description, base_price) VALUES
('General Consultation', 'Routine doctor consultation and examination', 50.00),
('Specialist Consultation', 'Consultation with a specialist doctor', 100.00),
('Blood Test', 'Complete blood count and basic metabolic panel', 35.00),
('X-Ray', 'Standard X-ray imaging', 85.00),
('Vaccination', 'Administration of vaccines', 25.00),
('Physical Therapy Session', '45-minute physical therapy session', 75.00);

INSERT INTO appointments (patient_id, doctor_id, clinic_id, service_id, appointment_date, appointment_time, status, reason) VALUES
(1, 1, 1, 2, '2025-09-15', '10:00:00', 'Scheduled', 'Annual cardiology checkup'),
(2, 2, 1, 5, '2025-09-15', '11:30:00', 'Scheduled', 'Flu vaccination'),
(3, 3, 2, 2, '2025-09-16', '14:00:00', 'Scheduled', 'Skin consultation');

INSERT INTO medical_records (patient_id, doctor_id, appointment_id, diagnosis, prescription, notes, record_date) VALUES
(1, 1, 1, 'Hypertension', 'Lisinopril 10mg daily', 'Patient advised to reduce sodium intake', '2025-09-15'),
(2, 2, 2, 'Routine vaccination', 'Influenza vaccine', 'No adverse reactions observed', '2025-09-15');

-- Insert payments
INSERT INTO payments (appointment_id, amount, method, reference) VALUES
(1, 100.00, 'Card', 'CHG-12345'),
(2, 25.00, 'Cash', 'REC-67890');

INSERT INTO staff (clinic_id, first_name, last_name, role, phone, email) VALUES
(1, 'Sarah', 'Walusaka', 'Receptionist', '070573737', 'sarah.w@clinic.com'),
(1, 'James', 'Juma', 'Nurse', '07236667', 'j.juma@clinic.com'),
(2, 'Joy', 'Jayson', 'Receptionist', '07222333', 'joy.jayson@medical.com'),
(2, 'Tom', 'Majuma', 'Nurse', '07888999', 't.martinez@medical.com');

INSERT INTO doctor_availability (doctor_id, day_of_week, start_time, end_time) VALUES
(1, 'Monday', '08:00:00', '16:00:00'),
(1, 'Wednesday', '08:00:00', '16:00:00'),
(1, 'Friday', '08:00:00', '16:00:00'),
(2, 'Tuesday', '07:00:00', '15:00:00'),
(2, 'Thursday', '07:00:00', '15:00:00'),
(2, 'Saturday', '07:00:00', '15:00:00');

INSERT INTO treatment_rooms (clinic_id, room_number, room_type, available) VALUES
(1, '101', 'Examination', TRUE),
(1, '102', 'Examination', TRUE),
(1, '103', 'Procedure', FALSE),
(2, '201', 'Examination', TRUE),
(2, '202', 'Examination', TRUE),
(2, '203', 'Procedure', TRUE);

INSERT INTO appointment_rooms (appointment_id, room_id) VALUES
(1, 1),
(2, 2),
(3, 5);