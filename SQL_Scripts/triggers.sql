use project;
DELIMITER $$
CREATE TRIGGER PreventDoubleBooking
BEFORE INSERT ON Rentals
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM Rentals 
        WHERE CarID = NEW.CarID 
        AND (ReturnDate IS NULL OR NEW.RentalDate < ReturnDate)
    ) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Car is already rented or has an overlapping rental period';
    END IF;
END $$
DELIMITER ;
-- Trigger: Update car availability when a rental is created
DELIMITER $$
CREATE TRIGGER BeforeRentalInsert
BEFORE INSERT ON Rentals
FOR EACH ROW
BEGIN
    UPDATE Cars SET AvailabilityStatus = 'Rented' WHERE CarID = NEW.CarID;
END $$
DELIMITER ;

-- Trigger: Update car availability when a rental is returned
DELIMITER $$
CREATE TRIGGER AfterRentalInsertOrUpdate
AFTER INSERT ON Rentals
FOR EACH ROW
BEGIN
    IF NEW.ReturnDate IS NOT NULL THEN
        UPDATE Cars SET AvailabilityStatus = 'Available' WHERE CarID = NEW.CarID;
    END IF;
END $$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER AfterRentalUpdate
AFTER UPDATE ON Rentals
FOR EACH ROW
BEGIN
    IF NEW.ReturnDate IS NOT NULL THEN
        UPDATE Cars SET AvailabilityStatus = 'Available' WHERE CarID = NEW.CarID;
    END IF;
END $$
DELIMITER ;
