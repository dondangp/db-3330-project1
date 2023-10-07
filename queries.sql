/*Query #2*/
SELECT FirstName,LastName,t.TrainName FROM Passenger as p
    JOIN Booked b ON p.SSN = b.Passenger_SSN
    JOIN Train t ON b.TrainNumber = t.TrainNumber
    Where p.FirstName = 'Minna' AND p.LastName = 'Amigon' AND t.TrainNumber;

/*Query #3*/
SELECT p.FirstName, p.LastName
FROM Passenger p
JOIN Booked b ON p.SSN = b.Passenger_SSN
JOIN Train t ON b.TrainNumber = t.TrainNumber
JOIN TrainStatus ts ON TRIM(t.TrainName) = TRIM(ts.TrainName)
WHERE b.Status = 'Booked' AND TRIM(ts.TrainDate) = 'Saturday';

/*Query #4*/

SELECT t.TrainNumber, t.TrainName, t.SourceStation, t.DestinationStation, p.FirstName, p.LastName, p.Address, b.TicketType, b.Status
FROM Passenger as p, Booked as b, Train as t
WHERE p.SSN = b.Passenger_SSN AND b.TrainNumber = t.TrainNumber AND STRFTIME('%Y%m%d', p.Birthdate) BETWEEN STRFTIME('%Y%m%d', date('now','-60 year')) 
AND STRFTIME('%Y%m%d', date('now','-50 year'));

/*Query #5*/
SELECT t.TrainName, ts.TrainDate, COUNT(p.SSN) as NumberOfPassengers
FROM Passenger p
JOIN Booked b ON p.SSN = b.Passenger_SSN
JOIN Train t ON b.TrainNumber = t.TrainNumber
JOIN TrainStatus ts ON TRIM(t.TrainName) = TRIM(ts.TrainName)
TRIM(t.TrainName) = 'Golden Arrow'

/*Query #6*/
SELECT p.FirstName, p.LastName
FROM Passenger p
JOIN Booked b ON p.SSN = b.Passenger_SSN
JOIN Train t ON b.TrainNumber = t.TrainNumber
WHERE b.Status = 'Booked' AND TRIM(t.TrainName) = 'Golden Arrow';
/*Query #7*/
SELECT p.FirstName, p.LastName, b.Status, t.TrainName
FROM Passenger p
JOIN Booked b ON p.SSN = b.Passenger_SSN
JOIN Train t ON b.TrainNumber = t.TrainNumber
WHERE b.Status = 'WaitL';


/*Query #8*/
SELECT FirstName, LastName
FROM Passenger
WHERE Phone2 LIKE '605%'
ORDER BY FirstName DESC;

/*Query #9*/
SELECT DISTINCT p.FirstName, p.LastName
FROM Passenger p
JOIN Booked b ON p.SSN = b.Passenger_SSN
JOIN Train t ON b.TrainNumber = t.TrainNumber 
JOIN TrainStatus ts ON TRIM(t.TrainName) = TRIM(ts.TrainName)
WHERE b.Status = 'Booked' AND ts.TrainDate = 'Thursday'
ORDER BY p.FirstName ASC;
