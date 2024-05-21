CREATE DATABASE AMBULANCE
GO
USE AMBULANCE
GO

CREATE TABLE Hospitals (
    HospitalID INT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    Phone VARCHAR(20),
    NumberOfAmbulances INT,
    Capacity INT,
    MedicalStaffCount INT
);

CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    Name VARCHAR(255),
    License VARCHAR(50),
    Phone VARCHAR(20),
    Address VARCHAR(255),
    Salary DECIMAL(10, 2),
    DayOff VARCHAR(50)
);

CREATE TABLE Ambulances (
    AmbulanceID INT PRIMARY KEY,
    HospitalID INT,
    DriverID INT,
    Capacity INT,
    Model VARCHAR(255),
    LicensePlate VARCHAR(20),
    Status VARCHAR(50),
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

CREATE TABLE Equipments (
    EquipmentID INT PRIMARY KEY,
    AmbulanceID INT,
    Name VARCHAR(255),
    Description TEXT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (AmbulanceID) REFERENCES Ambulances(AmbulanceID)
);

CREATE TABLE PatientTransfers (
    TransferID INT,
    CallID INT,
    PatientName VARCHAR(255),
    TransferTime DATETIME,
    HospitalID INT,
    AmbulanceID INT,
    Location VARCHAR(255) PRIMARY KEY,
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID),
    FOREIGN KEY (AmbulanceID) REFERENCES Ambulances(AmbulanceID)
);

CREATE TABLE EmergencyCalls (
    CallID INT,
    CallTime DATETIME,
    EmergencyType VARCHAR(255),
    Phone VARCHAR(20),
    CallerName VARCHAR(255),
    Location VARCHAR(255),
    HospitalID INT,
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID),
	FOREIGN KEY (Location) REFERENCES PatientTransfers(Location)
);

CREATE TABLE Services (
    ServiceID INT PRIMARY KEY,
    HospitalID INT,
    ServiceName VARCHAR(255),
    Description TEXT,
    Price DECIMAL(10, 2),
	EquipmentID INT,
	Feedback VARCHAR(255),
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID),
	FOREIGN KEY (EquipmentID) REFERENCES Equipments(EquipmentID)
);