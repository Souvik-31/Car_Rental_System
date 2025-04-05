use project;
-- Retrieve all available cars
SELECT * FROM Cars WHERE AvailabilityStatus = 'Available';

-- List rental history of a specific customer
SELECT Rentals.RentalID, Cars.Model, Cars.Brand, Rentals.RentalDate, Rentals.ReturnDate
FROM Rentals
JOIN Cars ON Rentals.CarID = Cars.CarID
WHERE Rentals.CustomerID = 1;

-- Find the most rented car model
SELECT Cars.Model, COUNT(Rentals.RentalID) AS RentalCount
FROM Rentals
JOIN Cars ON Rentals.CarID = Cars.CarID
GROUP BY Cars.Model
ORDER BY RentalCount DESC
LIMIT 1;

-- Calculate total earnings from car rentals
SELECT SUM(DATEDIFF(r.ReturnDate, r.RentalDate) * c.DailyRent) AS TotalEarnings
    FROM Rentals r
    JOIN Cars c ON r.CarID = c.CarID
    WHERE r.ReturnDate IS NOT NULL;

-- Retrieve customers who rented more than 3 times
SELECT Customers.Name, COUNT(Rentals.RentalID) AS RentalCount
FROM Rentals
JOIN Customers ON Rentals.CustomerID = Customers.CustomerID
GROUP BY Customers.Name
HAVING RentalCount > 3;

-- Fetch the longest rental duration
SELECT *, DATEDIFF(ReturnDate, RentalDate) AS RentalDuration
FROM Rentals
WHERE ReturnDate IS NOT NULL
ORDER BY RentalDuration DESC
LIMIT 1;

-- Identify the most frequently rented car brand
SELECT Cars.Brand, COUNT(Rentals.RentalID) AS RentalCount
FROM Rentals
JOIN Cars ON Rentals.CarID = Cars.CarID
GROUP BY Cars.Brand
ORDER BY RentalCount DESC
LIMIT 1;

-- Generate a report on rentals by month
SELECT DATE_FORMAT(r.RentalDate, '%Y-%m') AS RentalMonth, 
	   COUNT(*) AS RentalCount, 
	   SUM(DATEDIFF(r.ReturnDate, r.RentalDate) * c.DailyRent) AS TotalEarnings
FROM Rentals r
JOIN Cars c ON r.CarID = c.CarID
WHERE r.ReturnDate IS NOT NULL
GROUP BY RentalMonth
ORDER BY RentalMonth;

-- Retrieve customers with overdue rentals
SELECT Customers.Name, Rentals.RentalDate, Rentals.ReturnDate
FROM Rentals
JOIN Customers ON Rentals.CustomerID = Customers.CustomerID
WHERE Rentals.ReturnDate IS NULL AND RentalDate < CURDATE() - INTERVAL 7 DAY;


-- Retrieve all available cars
CALL GetAvailableCars();

-- List rental history of a specific customer
CALL CustomerRentalHistory(1);

-- Find the most rented car model
CALL MostRentedCarModel();

-- Calculate total earnings from car rentals
CALL TotalEarnings();

-- Retrieve customers who rented more than 3 times
CALL FrequentCustomers();

-- Fetch the longest rental duration
CALL LongestRental();

-- Identify the most frequently rented car brand
CALL MostRentedBrand();

-- Generate a report on rentals by month
CALL RentalsByMonth();

-- Retrieve customers with overdue rentals
CALL OverdueRentals();