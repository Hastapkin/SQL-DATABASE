USE AMBULANCE

--Check the customer information
SELECT * FROM Hospitals;
SELECT * FROM Drivers;
SELECT * FROM Ambulances;
SELECT * FROM Equipments;
SELECT * FROM PatientTransfers;
SELECT * FROM EmergencyCalls;
SELECT * FROM Services;

-- Customers who provided feedback and their satisfaction level
SELECT * FROM Services WHERE Feedback IS NOT NULL;

-- Customers who did not provide feedback
SELECT * FROM Services WHERE Feedback IS NULL;

-- List services with prices in ascending order
SELECT * FROM Services ORDER BY Price;

-- List services with prices in descending order
SELECT * FROM Services ORDER BY Price DESC;

-- Filter services with prices below a certain threshold (for example, $200)
SELECT * FROM Services WHERE Price < 200.00;

-- Calculate total income from customers
SELECT SUM(Price) AS TotalIncome FROM Services;

-- Calculate total outcome from equipment and staff salaries
SELECT 
    SUM(Price) AS TotalEquipmentCost,
    SUM(Salary) AS TotalStaffSalaries,
    SUM(Price) + SUM(Salary) AS TotalOutcome 
FROM Equipments
JOIN Ambulances ON Equipments.AmbulanceID = Ambulances.AmbulanceID
JOIN Drivers ON Ambulances.DriverID = Drivers.DriverID;

-- Show drivers who are absent
SELECT * FROM Drivers WHERE IsAbsent = TRUE;

--------------------Show patients who left the hospital or are still in the hospital------------------------------
-- Patients still in the hospital
SELECT * FROM PatientTransfers WHERE Status = 'In Hospital';

-- Patients who left the hospital
SELECT * FROM PatientTransfers WHERE Status = 'Left Hospital';

--Show VIP customers who spent over $1000
SELECT * FROM CustomerSpending WHERE TotalSpent > 1000.00;

--Show customers who need to take care of longer
SELECT * FROM Services WHERE CareDuration > 0 ORDER BY CareDuration DESC;

-- 
