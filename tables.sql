CREATE TABLE Passenger(
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
    TrainName VARCHAR(50),
    PremiumFair DECIMAL(10, 2),
    GeneralFair DECIMAL(10, 2),
    SourceStation VARCHAR(50),
    DestinationStation VARCHAR(50),
    AvailableOnWeekdays VARCHAR(255), 
    X VARCHAR(50),
    Y VARCHAR(50),
    Z VARCHAR(50),
    G VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Booked (
    Passenger_SSN INT,
    TrainNumber INT,
    TicketType VARCHAR(15),
    Status VARCHAR(15),
    FOREIGN KEY (Passenger_SSN) REFERENCES Passenger(SSN),
    FOREIGN KEY (TrainNumber) REFERENCES Train(TrainNumber)
);

CREATE TABLE IF NOT EXISTS TrainStatus (
    TrainDate VARCHAR(15),
    TrainName VARCHAR(50),
    PremiumSeatsAvailable INT,
    GeneralSeatsAvailable INT,
    PremiumSeatsOccupied INT,
    GeneralSeatsOccupied INT,
    FOREIGN KEY (TrainName) REFERENCES Train(TrainName) 
);