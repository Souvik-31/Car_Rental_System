create database project;
use project;

CREATE TABLE Cars (
    CarID INT AUTO_INCREMENT PRIMARY KEY,
    Model VARCHAR(50),
    Brand VARCHAR(50),
    AvailabilityStatus ENUM('Available', 'Rented') DEFAULT 'Available',
    DailyRent INT
);

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    LicenseNumber VARCHAR(20) UNIQUE,
    Contact VARCHAR(20)
);

CREATE TABLE Rentals (
    RentalID INT AUTO_INCREMENT PRIMARY KEY,
    CarID INT,
    CustomerID INT,
    RentalDate DATE,
    ReturnDate DATE DEFAULT NULL,
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
