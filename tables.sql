CREATE TABLE IF NOT EXISTS Passenger(
    FirstName VARCHAR(50) NOT NULL ,
    LastName VARCHAR(50) NOT NULL ,
    Address VARCHAR(255) NOT NULL ,
    City VARCHAR(50) NOT NULL ,
    County VARCHAR(50) NOT NULL ,
    Phone2 VARCHAR(15) NOT NULL ,
    SSN INTEGER PRIMARY KEY,
    Birthdate DATE NOT NULL 
);

CREATE TABLE IF NOT EXISTS Train (
    TrainNumber INT PRIMARY KEY,
    TrainName VARCHAR(50) NOT NULL,
    PremiumFair DECIMAL(10, 2) NOT NULL,
    GeneralFair DECIMAL(10, 2) NOT NULL,
    SourceStation VARCHAR(50) NOT NULL,
    DestinationStation VARCHAR(50) NOT NULL,
    AvailableOnWeekdays VARCHAR(255) NOT NULL, 
    X VARCHAR(50),
    Y VARCHAR(50),
    Z VARCHAR(50),
    G VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Booked (
    Passenger_SSN INT NOT NULL,
    TrainNumber INT NOT NULL,
    TicketType VARCHAR(15) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (Passenger_SSN) REFERENCES Passenger(SSN),
    FOREIGN KEY (TrainNumber) REFERENCES Train(TrainNumber)
);

CREATE TABLE IF NOT EXISTS TrainStatus (
    TrainDate VARCHAR(15) NOT NULL,
    TrainName VARCHAR(50) NOT NULL,
    PremiumSeatsAvailable INT NOT NULL,
    GeneralSeatsAvailable INT NOT NULL,
    PremiumSeatsOccupied INT NOT NULL,
    GeneralSeatsOccupied INT NOT NULL,
    FOREIGN KEY (TrainName) REFERENCES Train(TrainName) 
);
