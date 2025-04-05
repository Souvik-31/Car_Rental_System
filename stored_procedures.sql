use project;
-- Stored Procedure: Retrieve all available cars
DELIMITER $$
CREATE PROCEDURE GetAvailableCars()
BEGIN
    SELECT * FROM Cars WHERE AvailabilityStatus = 'Available';
END $$
DELIMITER ;

-- Stored Procedure: List rental history of a specific customer
DELIMITER $$
CREATE PROCEDURE CustomerRentalHistory(IN customer_id INT)
BEGIN
    SELECT Rentals.RentalID, Cars.Model, Cars.Brand, Rentals.RentalDate, Rentals.ReturnDate
    FROM Rentals
    JOIN Cars ON Rentals.CarID = Cars.CarID
    WHERE Rentals.CustomerID = customer_id;
END $$
DELIMITER ;

-- Stored Procedure: Find the most rented car model
DELIMITER $$
CREATE PROCEDURE MostRentedCarModel()
BEGIN
    SELECT Cars.Model, COUNT(Rentals.RentalID) AS RentalCount
    FROM Rentals
    JOIN Cars ON Rentals.CarID = Cars.CarID
    GROUP BY Cars.Model
    ORDER BY RentalCount DESC
    LIMIT 1;
END $$
DELIMITER ;

-- Stored Procedure: Calculate total earnings
DELIMITER $$
CREATE PROCEDURE TotalEarnings()
BEGIN
    SELECT SUM(DATEDIFF(ReturnDate, RentalDate) * 50) AS TotalEarnings FROM Rentals WHERE ReturnDate IS NOT NULL;
END $$
DELIMITER ;

-- Stored Procedure: Retrieve customers who rented more than 3 times
DELIMITER $$
CREATE PROCEDURE FrequentCustomers()
BEGIN
    SELECT Customers.Name, COUNT(Rentals.RentalID) AS RentalCount
    FROM Rentals
    JOIN Customers ON Rentals.CustomerID = Customers.CustomerID
    GROUP BY Customers.Name
    HAVING RentalCount > 3;
END $$
DELIMITER ;

-- Stored Procedure: Fetch the longest rental duration
DELIMITER $$
CREATE PROCEDURE LongestRental()
BEGIN
    SELECT *, DATEDIFF(ReturnDate, RentalDate) AS RentalDuration
    FROM Rentals
    WHERE ReturnDate IS NOT NULL
    ORDER BY RentalDuration DESC
    LIMIT 1;
END $$
DELIMITER ;

-- Stored Procedure: Identify the most frequently rented car brand
DELIMITER $$
CREATE PROCEDURE MostRentedBrand()
BEGIN
    SELECT Cars.Brand, COUNT(Rentals.RentalID) AS RentalCount
    FROM Rentals
    JOIN Cars ON Rentals.CarID = Cars.CarID
    GROUP BY Cars.Brand
    ORDER BY RentalCount DESC
    LIMIT 1;
END $$
DELIMITER ;

-- Stored Procedure: Generate a report on rentals by month
DELIMITER $$
DELIMITER $$
CREATE PROCEDURE RentalsByMonth()
BEGIN
    SELECT DATE_FORMAT(RentalDate, '%Y-%m') AS RentalMonth, 
           COUNT(*) AS RentalCount, 
           SUM(DATEDIFF(ReturnDate, RentalDate) * 50) AS TotalEarnings
    FROM Rentals
    WHERE ReturnDate IS NOT NULL
    GROUP BY RentalMonth
    ORDER BY RentalMonth;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS RentalsByMonth;


-- Stored Procedure: Retrieve customers with overdue rentals
DELIMITER $$
CREATE PROCEDURE OverdueRentals()
BEGIN
    SELECT Customers.Name, Rentals.RentalDate, Rentals.ReturnDate
    FROM Rentals
    JOIN Customers ON Rentals.CustomerID = Customers.CustomerID
    WHERE Rentals.ReturnDate IS NULL AND RentalDate < CURDATE() - INTERVAL 7 DAY;
END $$
DELIMITER ;