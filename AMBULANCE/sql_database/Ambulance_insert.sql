USE AMBULANCE

--I. Customers coming to the hospital for the first time ( Using table Hospitals, Drivers, Ambulances, Equipments, PatientTransfers, EmergencyCalls, Services )

INSERT INTO Hospitals (HospitalID, Name, Address, Phone, NumberOfAmbulances, Capacity, MedicalStaffCount)
VALUES (5, 'Northside Hospital', '321 Hill St', '555-6543', 7, 120, 60),
       (6, 'West End Hospital', '654 Park Ave', '555-8764', 9, 220, 110);

INSERT INTO Drivers (DriverID, Name, License, Phone, Address, Salary, DayOff)
VALUES (3, 'Emily Clark', 'D8765432', '555-3210', '789 Walnut St', 3100.00, 'Friday'),
       (4, 'Michael Johnson', 'D6543210', '555-4320', '101 Pine St', 2900.00, 'Sunday');

INSERT INTO Ambulances (AmbulanceID, HospitalID, DriverID, Capacity, Model, LicensePlate, Status)
VALUES (3, 5, 3, 5, 'Chevy', 'LMN456', 'Available'),
       (4, 6, 4, 7, 'Toyota', 'PQR789', 'Available');

INSERT INTO Equipments (EquipmentID, AmbulanceID, Name, Description, Quantity, Price)
VALUES (5, 3, 'First Aid Kit', 'Basic first aid supplies', 20, 50.00),
       (6, 4, 'Stretcher', 'Patient transport stretcher', 2, 300.00);

INSERT INTO PatientTransfers (TransferID, CallID, PatientName, TransferTime, HospitalID, AmbulanceID, Location)
VALUES (3, 3, 'Sophia Martinez', '2024-05-21 08:30:00', 5, 3, '321 Maple St'),
       (4, 4, 'Daniel Lee', '2024-05-21 09:00:00', 6, 4, '654 Pine St');

INSERT INTO EmergencyCalls (CallID, CallTime, EmergencyType, Phone, CallerName, Location, HospitalID)
VALUES (3, '2024-05-21 08:20:00', 'Broken Leg', '555-5670', 'Carlos Martinez', '321 Maple St', 5),
       (4, '2024-05-21 08:50:00', 'Stroke', '555-6781', 'Anna Lee', '654 Pine St', 6);

INSERT INTO Services (ServiceID, HospitalID, ServiceName, Description, Price, EquipmentID, Feedback)
VALUES (5, 5, 'Initial Consultation', 'Consultation with a doctor', 75.00, 5, NULL),
       (6, 6, 'Emergency Surgery', 'Urgent surgical procedure', 4500.00, 6, NULL);

--II. Customers already in the hospital and using services ( Using table Hospitals, Equipments, Services )

INSERT INTO Hospitals (HospitalID, Name, Address, Phone, NumberOfAmbulances, Capacity, MedicalStaffCount)
VALUES (7, 'Southside Hospital', '987 Valley Rd', '555-2109', 10, 300, 150),
       (8, 'Eastside Clinic', '321 River St', '555-0987', 3, 80, 40);

INSERT INTO Equipments (EquipmentID, AmbulanceID, Name, Description, Quantity, Price)
VALUES (7, NULL, 'Ultrasound Machine', 'Machine for ultrasound imaging', 1, 8000.00),
       (8, NULL, 'CT Scanner', 'Machine for CT scans', 1, 12000.00);

INSERT INTO Services (ServiceID, HospitalID, ServiceName, Description, Price, EquipmentID, Feedback)
VALUES (7, 7, 'Ultrasound', 'Ultrasound imaging service', 150.00, 7, NULL),
       (8, 8, 'CT Scan', 'CT scanning service', 250.00, 8, NULL);

--III. Customers have left the hospital and provided feedback reports ( Using table Hospitals, Services )

INSERT INTO Hospitals (HospitalID, Name, Address, Phone, NumberOfAmbulances, Capacity, MedicalStaffCount)
VALUES (9, 'Riverside Hospital', '456 Lake Dr', '555-3344', 5, 130, 65),
       (10, 'Lakeside Clinic', '789 Bay St', '555-2233', 4, 90, 45);

INSERT INTO Services (ServiceID, HospitalID, ServiceName, Description, Price, EquipmentID, Feedback)
VALUES (9, 9, 'Physical Therapy', 'Rehabilitation therapy', 300.00, NULL, 'Very effective and supportive staff'),
       (10, 10, 'Cardiology Consultation', 'Heart health checkup', 200.00, NULL, 'Thorough and informative'),
       (11, 9, 'Dental Checkup', 'Routine dental examination', 100.00, NULL, 'Professional and friendly service'),
       (12, 10, 'Orthopedic Consultation', 'Bone and joint checkup', 250.00, NULL, 'Excellent care and advice');

--IV. Check the customer information is saved or not ( Using table Hospitals, Drivers, Ambulances, Equipments, PatientTransfers, EmergencyCalls, Services )
SELECT * FROM Hospitals;
SELECT * FROM Drivers;
SELECT * FROM Ambulances;
SELECT * FROM Equipments;
SELECT * FROM PatientTransfers;
SELECT * FROM EmergencyCalls;
SELECT * FROM Services;

-- Insert data into the CustomerSpending table
INSERT INTO CustomerSpending (CustomerID, PatientName, TotalSpent)
VALUES (1, 'Sophia Martinez', 4500.00),
       (2, 'Daniel Lee', 5000.00);
SELECT * FROM CustomerSpending;
