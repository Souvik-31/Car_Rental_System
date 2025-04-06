use project;
INSERT INTO Cars (Model, Brand, AvailabilityStatus, DailyRent) VALUES
('Civic', 'Honda', 'Available', 2500),
('Corolla', 'Toyota', 'Available', 2400),
('Verna', 'Hyundai', 'Available', 1500),
('Accord', 'Honda', 'Available', 2800),
('Camry', 'Toyota', 'Available', 2600),
('XUV700', 'Mahindra', 'Available', 3000),
('Scorpio-N', 'Mahindra', 'Available', 2800),
('Tiago EV', 'Tata', 'Available', 3200),
('Altroz', 'Tata', 'Available', 2200),
('Magnite', 'Nissan', 'Available', 2300),
('Elantra', 'Hyundai', 'Available', 2100),
('Sonata', 'Hyundai', 'Available', 2400),
('BMW 3 Series', 'BMW', 'Available', 7000),
('X5', 'BMW', 'Available', 8500),
('A4', 'Audi', 'Available', 6800),
('Q5', 'Audi', 'Available', 8200),
('C-Class', 'Mercedes-Benz', 'Available', 8000),
('GLC', 'Mercedes-Benz', 'Available', 9000),
('Seltos', 'Kia', 'Available', 2000),
('Tucson', 'Hyundai', 'Available', 2500);


select * from cars;

INSERT INTO Customers (Name, LicenseNumber, Contact) VALUES
('Bittyam Paul', 'A9876543', '9876543210'),
('Sai Sriram', 'B1234567', '9887654321'),
('Sraddha Upadhyay', 'C2345678', '9898765432'),
('Souvik Sarkar', 'D3456789', '9909876543'),
('Aarabhi Manoj', 'E4567890', '9912345678'),
('Sangeeta Verma', 'F5678901', '9923456789'),
('Ravi Gupta', 'G6789012', '9934567890'),
('Anjali Joshi', 'H7890123', '9945678901'),
('Vikram Mehta', 'I8901234', '9956789012'),
('Pooja Desai', 'J9012345', '9967890123'),
('Rajesh Choudhary', 'K0123456', '9978901234'),
('Deepa Nair', 'L1234567', '9989012345'),
('Siddharth Yadav', 'M2345678', '9990123456'),
('Sneha Iyer', 'N3456789', '9812345670'),
('Karan Kapoor', 'O4567890', '9823456781'),
('Madhavi Rao', 'P5678901', '9834567892'),
('Gaurav Agarwal', 'Q6789012', '9845678903'),
('Shweta Jain', 'R7890123', '9856789014'),
('Akhil Nair', 'S8901234', '9867890125'),
('Ritu Bansal', 'T9012345', '9878901236'),
('Manoj Sharma', 'U0123456', '9889012347'),
('Neeraj Khanna', 'V1234567', '9890123458'),
('Geeta Gupta', 'W2345678', '9901234569'),
('Vishal Soni', 'X3456789', '9912345670'),
('Sonia Thakur', 'Y4567890', '9923456781'),
('Kiran Verma', 'Z5678901', '9934567892'),
('Aarti Pandey', 'AA6789012', '9945678903'),
('Nitin Mishra', 'BB7890123', '9956789014'),
('Manju Yadav', 'CC8901234', '9967890125'),
('Rajeev Kumar', 'DD9012345', '9978901236');


select * from customers;

INSERT INTO Rentals (CarID, CustomerID, RentalDate, ReturnDate) VALUES
(1, 10, '2025-01-01', '2025-01-05'),
(2, 3, '2025-01-03', '2025-01-07'),
(3, 5, '2025-01-05', '2025-01-09'),
(15, 7, '2025-01-07', '2025-01-11'),
(5, 6, '2025-01-09', '2025-01-13'),
(18, 9, '2025-01-11', '2025-01-15'),
(7, 12, '2025-01-13', '2025-01-17'),
(20, 15, '2025-01-15', '2025-01-25'),
(9, 14, '2025-01-17', '2025-01-21'),
(10, 11, '2025-01-19', '2025-01-23'),
(11, 13, '2025-01-21', '2025-01-25'),
(12, 20, '2025-01-23', '2025-01-27'),
(13, 8, '2025-01-25', '2025-01-29'),
(14, 1, '2025-01-27', '2025-01-31'),
(5, 17, '2025-01-29', '2025-02-02'),
(1, 18, '2025-02-01', '2025-02-05'),
(17, 4, '2025-02-03', '2025-02-07'),
(18, 2, '2025-02-05', '2025-02-09'),
(19, 22, '2025-02-07', '2025-02-11'),
(20, 16, '2025-02-09', '2025-02-13'),
(1, 19, '2025-02-11', '2025-02-15'),
(7, 21, '2025-02-13', '2025-02-17'),
(2, 24, '2025-02-15', '2025-02-19'),
(9, 25, '2025-02-17', '2025-02-21'),
(5, 28, '2025-02-19', '2025-02-23'),
(12, 29, '2025-02-21', '2025-02-25'),
(8, 30, '2025-02-23', '2025-02-27'),
(6, 13, '2025-03-01', '2025-03-05'),
(18, 18, '2025-03-02', '2025-03-06'),
(3, 4, '2025-03-03', '2025-03-07'),
(17, 27, '2025-03-04', '2025-03-08'),
(10, 26, '2025-03-05', '2025-03-09'),
(20, 5, '2025-03-06', '2025-03-10'),
(3, 6, '2025-03-07', '2025-03-11'),
(5, 11, '2025-03-08', '2025-03-12'),
(6, 16, '2025-03-09', '2025-03-13'),
(7, 8, '2025-03-10', '2025-03-14'),
(6, 9, '2025-03-15', '2025-03-20'),
(1, 20, '2025-03-12', '2025-03-16'),
(5, 12, '2025-03-13', '2025-03-17'),
(4, 22, '2025-03-14', '2025-03-18'),
(20, 11, '2025-03-15', '2025-03-19'),
(19, 15, '2025-03-16', '2025-03-20'),
(12, 1, '2025-03-17', '2025-03-21'),
(20, 11, '2025-03-20', '2025-03-22'),
(19, 30, '2025-03-22', '2025-03-23'),
(7, 17, '2025-03-20', '2025-03-24'),
(9, 21, '2025-03-27', NULL),
(4, 10, '2025-03-30', '2025-04-01'),
(11, 14, '2025-04-04', NULL);


select * from rentals;