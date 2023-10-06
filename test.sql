/*Query #2*/
SELECT FirstName,LastName,t.TrainNumber, t.TrainName FROM Passenger as p
    JOIN Booked b ON p.SSN = b.Passenger_SSN
    JOIN Train t ON b.TrainNumber = t.TrainNumber
    Where p.FirstName = 'James' AND p.LastName = 'Butt' AND t.TrainNumber;

/*Query #3*/
SELECT p.FirstName, p.LastName, ts.TrainDate
FROM Passenger p
JOIN Booked b ON p.SSN = b.Passenger_SSN
JOIN Train t ON b.TrainNumber = t.TrainNumber
JOIN TrainStatus ts ON TRIM(t.TrainName) = TRIM(ts.TrainName)
WHERE b.Status = 'Booked' AND TRIM(ts.TrainDate) = 'Tuesday';

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
WHERE b.Status = 'Booked' 
GROUP BY t.TrainName, ts.TrainDate
ORDER BY t.TrainName, ts.TrainDate;

/*Query #6*/
SELECT p.FirstName, p.LastName
FROM Passenger p
JOIN Booked b ON p.SSN = b.Passenger_SSN
JOIN Train t ON b.TrainNumber = t.TrainNumber
WHERE b.Status = 'Booked' AND TRIM(t.TrainName) = 'Golden Arrow';
/*Query #7*/
SELECT DISTINCT p.FirstName, p.LastName
FROM Passenger p
JOIN Booked b ON p.SSN = b.Passenger_SSN
JOIN Train t ON b.TrainNumber = t.TrainNumber 
JOIN TrainStatus ts ON TRIM(t.TrainName) = TRIM(ts.TrainName)
WHERE b.Status = 'Booked' AND strftime('%w', ts.TrainDate) = '4'
ORDER BY p.LastName ASC, p.FirstName ASC;

/*Query #8*/
SELECT FirstName, LastName
FROM Passenger
WHERE Phone2 LIKE '605%'
ORDER BY LastName DESC, FirstName DESC;

/*Query #9*/
SELECT DISTINCT p.FirstName, p.LastName
FROM Passenger p
JOIN Booked b ON p.Passenger_SSN = b.Passenger_SSN
JOIN Train t ON b.Train_Number = t.TrainNumber 
JOIN TrainStatus ts ON TRIM(t.TrainName) = TRIM(ts.TrainName)
WHERE b.Status = 'Booked' AND strftime('%w', ts.TrainDate) = '4'
ORDER BY p.LastName ASC, p.FirstName ASC;
