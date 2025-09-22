# Week-8-Assignment-Final-Project
# Clinic Booking System – Final Project

![MySQL](https://img.shields.io/badge/Database-MySQL-blue)
![Project](https://img.shields.io/badge/Project-Clinic%20Booking%20System-green)

A comprehensive **Clinic Booking System** designed to manage clinics, doctors, patients, appointments, medical records, payments, staff, and treatment rooms.

---

## Table of Contents

- [Features](#features)
- [Database Structure](#database-structure)
- [Setup Instructions](#setup-instructions)
- [Sample Data](#sample-data-included)
- [Technologies](#technologies)
- [Notes](#notes)
- [Author](#author)

---

## Features

- **Clinic Management:** Store clinic details such as name, address, contact info, and operating hours.  
- **Doctor Management:** Track doctor profiles, specialization, availability, and license information.  
- **Patient Management:** Manage patient information, emergency contacts, and medical history.  
- **Services:** Define services like consultations, blood tests, X-rays, vaccinations, and physical therapy.  
- **Appointment Scheduling:** Schedule, update, and track appointments with conflict checks to prevent double bookings.  
- **Medical Records:** Record diagnoses, prescriptions, and notes linked to appointments and patients.  
- **Payments:** Manage payments for appointments via cash, card, mobile money, or insurance.  
- **Staff Management:** Manage clinic staff including receptionists, nurses, and their roles.  
- **Doctor Availability & Treatment Rooms:** Track doctor schedules and assign treatment rooms to appointments.

---

## Database Structure

The project uses a **MySQL database** `clinic_booking_system` with the following key tables:

1. `clinics` – Stores clinic details.  
2. `doctors` – Stores doctor profiles and links them to clinics.  
3. `patients` – Stores patient personal and contact information.  
4. `services` – Lists services provided across clinics.  
5. `appointments` – Tracks patient appointments with doctors, clinics, and services.  
6. `medical_records` – Stores patient medical history and diagnoses.  
7. `payments` – Tracks payments associated with appointments.  
8. `staff` – Stores clinic staff details.  
9. `doctor_availability` – Tracks doctor availability by day and time.  
10. `treatment_rooms` – Lists rooms in each clinic.  
11. `appointment_rooms` – Links appointments to treatment rooms.

---

## Setup Instructions

1. **Create the database:**
```sql
CREATE DATABASE IF NOT EXISTS clinic_booking_system;
USE clinic_booking_system;

2. ** Run the provided SQL script to create tables, define relationships, and insert sample data.

3. Verify data by checking tables for clinics, doctors, patients, and appointments:
sql code to use

SELECT * FROM clinics;
SELECT * FROM doctors;
SELECT * FROM patients;

4. Sample Data Included
Clinics: I-Lit Clinic, Vigo Medical Center
Doctors: Cardiology, Pediatrics, Dermatology, Orthopedics specialists
Patients: Sample patients with contact info and DOB
Services: General consultation, specialist consultation, blood tests, X-Ray, vaccination, physical therapy
Appointments, Medical Records, Payments, Staff, Doctor Availability, Treatment Rooms: Pre-filled sample entries

5. Technologies
Database: MySQL
SQL Scripts: Create tables, insert sample data, define foreign key relationships, and set constraints.

6. Notes
Unique constraints prevent double-booking for doctors and rooms.
Cascading deletes maintain database integrity.
Designed for easy expansion to add more clinics, doctors, or services.
Doctor availability and treatment room assignments ensure efficient scheduling.
Payment methods support multiple options including Cash, Card, Mobile Money, and Insurance.

7. Author
Samuel Walusaka
Email: walusakasamuel@gmail.com
