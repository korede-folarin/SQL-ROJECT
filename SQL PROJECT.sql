SHOW databases;
USE DATA_ANALYTICS_BATCHB;
SHOW TABLES;
SELECT * FROM OWNER;

			

/*Show all owner information.*/
SELECT * FROM OWNER; 

/*Show all OwnerName and OwnerEmail.*/
SELECT OWNERNAME, OWNEREMAIL FROM OWNER;
 




/*Show all OwnerName and OwnerEmail which OwnerType is ‘Corporation’*/
SELECT OWNERNAME, OWNEREMAIL FROM OWNER
WHERE OWNERTYPE ='CORPORATION';

	OwnerName	OwnerID	OwnerEmail	                  OwnerType
	UNY Enterprises	4	UNYE@unye.com	             Corporation
	DT Enterprises	2	DTE@dte.com	                 Corporation
	Mary Jones	1	Mary.Jones@somewhere.com         Individual
	Doug Samuels	5	Doug.Samuels@somewhere.com	 Individual
	Sam Douglas	3		Individual
				
/*Show PropertyID and ServiceDate for all services have HoursWorked more than 4.*/
SELECT * FROM SERVICE;
SELECT PROPERTYID, SERVICEDATE FROM SERVICE
WHERE HOURSWORKED >4;
PROPERTY ID                 SERVICEDATE
5	                        2012-05-12 00:00:00
3	                        2012-05-08 00:00:00
1	                        2012-05-05 00:00:00

/*Show PropertyID and ServiceDate for all services have HoursWorked between 4 and 6*/
SELECT PROPERTYID, SERVICEDATE FROM SERVICE
WHERE HOURSWORKED BETWEEN 4 AND 6;
PROPERTY ID                 SERVICEDATE

1	        			2012-05-05 00:00:00
3						2012-05-08 00:00:00

/*Count how many services have HoursWorked more than 4*/
SELECT COUNT(*) AS SERVICE_COUNT FROM SERVICE
WHERE HOURSWORKED > 4;
SERVICECOUNT
3

/*Count how many distinct ExperienceLevel in EMPLOYEE table*/
SELECT DISTINCT COUNT(EXPERIENCELEVEL) FROM GG_EMPLOYEE;

COUNT(EXPERIENCELEVEL)
5

/*Show all employees with CellPhone containing ‘254’ and the ExperienceLevel is Senior.*/
SELECT * FROM GG_EMPLOYEE
WHERE EXPERIENCELEVEL ='SENIOR' AND CELLPHONE;

EMPLOYEEID LASTNAME FIRSTNAME 	CELLPHONE         EXPERIENCELEVEL
2	   Evanston	    John	       206-254-2345				Senior
5	   Fontaine	    Joan	       206-254-4567				Senior
				
/*Show all properties not in city ‘Seattle’ or ‘Bellevue’.*/
SELECT * FROM PROPERTY
WHERE CITY NOT IN ('SEATTLE' , 'BELLEVUE');
	PropertyID   PropertyName	  Street	         City	     State	ZIP	  OwnerID
	2	         Elm St Apts	  4 East Elm	      Lynwood	   WA	98223	1
	4	         Lake View Apts	   1265 32nd Avenue	   Redmond	    WA	98052	3
	5	         Kodak Heights Apts	65 32nd Avenue	    Rochester	NY	14604	4
	8	         Private Residence	567 151st St	     Rochester	NY	14604	5
							
/*Show all properties with PropertyName begins with ‘P’, but the location is not in NY State.*/
SELECT * FROM PROPERTY
WHERE PROPERTYNAME LIKE 'P%';
POPERTYID   PROPERTYNAME  STREET         CITY       STATE ZIP   OWNERID
6	Private Residence	1456 48th St	Bellevue	WA	98007	1
7	Private Residence	1567 51st St	Bellevue	WA	98007	3
8	Private Residence	567 151st St	Rochester	NY	14604	5
						

/*Show all the services in descending order of their HoursWorked.*/
SELECT * FROM SERVICE
ORDER BY HOURSWORKED DESC;
PropertyID,  EmployeeID, ServiceDate, HoursWorked
5	4	2012-05-12 00:00:00	7.50
1	1	2012-05-05 00:00:00	4.50
3	3	2012-05-08 00:00:00	4.50
4	1	2012-05-19 00:00:00	3.00
2	2	2012-05-08 00:00:00	2.75
8	4	2012-05-15 00:00:00	2.75
6	5	2012-05-10 00:00:00	2.50
7	2	2012-05-19 00:00:00	2.50
			
/*Show all the services which HoursWorked is greater than 3 in ascending order of their ServiceDate*/
SELECT * FROM SERVICE
WHERE HOURSWORKED >3 
ORDER BY SERVICEDATE;

	PropertyID	EmployeeID	ServiceDate	HoursWorked
	5	4	2012-05-12 00:00:00	7.50
	3	3	2012-05-08 00:00:00	4.50
	1	1	2012-05-05 00:00:00	4.50
				

/*Show all owners with Email as NULL.*/
SELECT * FROM OWNER
WHERE OWNEREMAIL IS NULL;
OwnerID, OwnerName, OwnerEmail, OwnerType
3	Sam Douglas		Individual
			

/*Count how many Owners whose Email is not NULL.*/
SELECT DISTINCT COUNT(*) FROM OWNER
WHERE OWNEREMAIL IS NULL;
COUNT(*)
1

/*Show the sum of Hours Worked in SERVICE*/
SELECT SUM(HOURSWORKED) FROM SERVICE;
SUM(HOURSWORKED)
30.00

/*Show Only show the employee with sum of Hours Worked more than 7*/
SELECT * FROM GG_EMPLOYEE;
SELECT * FROM OWNER;
SELECT * FROM PROPERTY;
SELECT * FROM SERVICE;

SELECT E.FIRSTNAME, E.LASTNAME, S.HOURSWORKED
FROM GG_EMPLOYEE E, SERVICE S
WHERE E.EMPLOYEEID = S.EMPLOYEEID
AND HOURSWORKED >7;
FIRSTNAME, LASTNAME, HOURSWORKED
Jerry	Murphy	7.50

/*Show the names of employees who have worked on a property owned by a corporation.*/
SELECT E.LASTNAME, E.FIRSTNAME, P.PROPERTYNAME, O.OWNERTYPE
FROM GG_EMPLOYEE E, OWNER O, PROPERTY P, SERVICE S
WHERE E.EMPLOYEEID = S.EMPLOYEEID
AND P.PROPERTYID = S.PROPERTYID
AND O.OWNERID = P.OWNERID 
AND OWNERTYPE ='CORPORATION';
LASTNAME, FIRSTNAME, PROPERTYNAME, OWNERTYPE
Smith	Sam	Eastlake Building	Corporation
Murray	Dale	Jefferson Hill	Corporation
Murphy	Jerry	Kodak Heights Apts	CorporationV

/*Show the names of employees who have worked on a property in New York.*/
SELECT E.FIRSTNAME, E.LASTNAME, P.PROPERTYNAME, P.STATE
FROM GG_EMPLOYEE E, PROPERTY P, SERVICE S 
WHERE E.EMPLOYEEID = E.EMPLOYEEID
AND P.PROPERTYID = P.PROPERTYID
AND P.STATE = 'NY';

FIRSTNAME, LASTNAME, PROPERTYNAME, STATE
Joan	Fontaine	Kodak Heights Apts	NY
Joan	Fontaine	Private Residence	NY
Jerry	Murphy	Kodak Heights Apts	NY
Jerry	Murphy	Private Residence	NY
Dale	Murray	Kodak Heights Apts	NY
Dale	Murray	Private Residence	NY
John	Evanston	Kodak Heights Apts	NY
John	Evanston	Private Residence	NY
Sam	Smith	Kodak Heights Apts	NY
Sam	Smith	Private Residence	NY
Joan	Fontaine	Kodak Heights Apts	NY
Joan	Fontaine	Private Residence	NY
Jerry	Murphy	Kodak Heights Apts	NY
Jerry	Murphy	Private Residence	NY
Dale	Murray	Kodak Heights Apts	NY
Dale	Murray	Private Residence	NY
John	Evanston	Kodak Heights Apts	NY
John	Evanston	Private Residence	NY
Sam	Smith	Kodak Heights Apts	NY
Sam	Smith	Private Residence	NY
Joan	Fontaine	Kodak Heights Apts	NY
Joan	Fontaine	Private Residence	NY
Jerry	Murphy	Kodak Heights Apts	NY
Jerry	Murphy	Private Residence	NY
Dale	Murray	Kodak Heights Apts	NY
Dale	Murray	Private Residence	NY
John	Evanston	Kodak Heights Apts	NY
John	Evanston	Private Residence	NY
Sam	Smith	Kodak Heights Apts	NY
Sam	Smith	Private Residence	NY
Joan	Fontaine	Kodak Heights Apts	NY
Joan	Fontaine	Private Residence	NY
Jerry	Murphy	Kodak Heights Apts	NY
Jerry	Murphy	Private Residence	NY
Dale	Murray	Kodak Heights Apts	NY
Dale	Murray	Private Residence	NY
John	Evanston	Kodak Heights Apts	NY
John	Evanston	Private Residence	NY
Sam	Smith	Kodak Heights Apts	NY
Sam	Smith	Private Residence	NY
Joan	Fontaine	Kodak Heights Apts	NY
Joan	Fontaine	Private Residence	NY
Jerry	Murphy	Kodak Heights Apts	NY
Jerry	Murphy	Private Residence	NY
Dale	Murray	Kodak Heights Apts	NY
Dale	Murray	Private Residence	NY
John	Evanston	Kodak Heights Apts	NY
John	Evanston	Private Residence	NY
Sam	Smith	Kodak Heights Apts	NY
Sam	Smith	Private Residence	NY
Joan	Fontaine	Kodak Heights Apts	NY
Joan	Fontaine	Private Residence	NY
Jerry	Murphy	Kodak Heights Apts	NY
Jerry	Murphy	Private Residence	NY
Dale	Murray	Kodak Heights Apts	NY
Dale	Murray	Private Residence	NY
John	Evanston	Kodak Heights Apts	NY
John	Evanston	Private Residence	NY
Sam	Smith	Kodak Heights Apts	NY
Sam	Smith	Private Residence	NY
Joan	Fontaine	Kodak Heights Apts	NY
Joan	Fontaine	Private Residence	NY
Jerry	Murphy	Kodak Heights Apts	NY
Jerry	Murphy	Private Residence	NY
Dale	Murray	Kodak Heights Apts	NY
Dale	Murray	Private Residence	NY
John	Evanston	Kodak Heights Apts	NY
John	Evanston	Private Residence	NY
Sam	Smith	Kodak Heights Apts	NY
Sam	Smith	Private Residence	NY
Joan	Fontaine	Kodak Heights Apts	NY
Joan	Fontaine	Private Residence	NY
Jerry	Murphy	Kodak Heights Apts	NY
Jerry	Murphy	Private Residence	NY
Dale	Murray	Kodak Heights Apts	NY
Dale	Murray	Private Residence	NY
John	Evanston	Kodak Heights Apts	NY
John	Evanston	Private Residence	NY
Sam	Smith	Kodak Heights Apts	NY
Sam	Smith	Private Residence	NY

/*Sort the employees’ information in ascending order by the total hours of their service*/
SELECT E.LASTNAME, E.FIRSTNAME, HOURSWORKED
FROM GG_EMPLOYEE E, SERVICE S
WHERE E.EMPLOYEEID = S.EMPLOYEEID 
ORDER BY HOURSWORKED;
LASTNAME, FIRSTNAME, HOURSWORKED
Evanston	John	2.50
Fontaine	Joan	2.50
Evanston	John	2.75
Murphy	Jerry	2.75
Smith	Sam	3.00
Smith	Sam	4.50
Murray	Dale	4.50
Murphy	Jerry	7.50

/*Show names and Email of owners who have the property named 'Private Residence'*/
SELECT O.OWNERNAME, O.OWNEREMAIL, P.PROPERTYNAME
FROM OWNER O, PROPERTY P
WHERE O.OWNERID = P.OWNERID
AND P.PROPERTYNAME ='PRIVATE RESIDENCE';

OWNERNAME, OWNEREMAIL, PROPERTYNAME
Sam Douglas		Private Residence
Mary Jones	Mary.Jones@somewhere.com	Private Residence
Doug Samuels	Doug.Samuels@somewhere.com	Private Residence

/*Show the number of services on properties with owner’s type as ‘Corporation’*/
SELECT PP.ROPERTYNAME, O.OWNERTYPE
FROM SERVICE S, PROPERTY P, OWNER O
WHERE PROPERTYID=PROPERTYID;

/*Show the total hours of service on properties with owner type as ‘Corporation’*/
SELECT S.HOURSWORKED, P.PROPERTYNAME, O.OWNERTYPE
FROM SERVICE S, PROPERTY P, OWNER O
WHERE  P.PROPERTYID = S.PROPERTYID
AND O.OWNERID = P.OWNERID
AND OWNERTYPE= 'CORPORATION';


HOURSWORKED, PROPERTYNAME, OWNERTYPE
4.50	Eastlake Building	Corporation
4.50	Jefferson Hill	Corporation
7.50	Kodak Heights Apts	Corporation


/*Show the names of the employee who has worked most hours*/
SELECT FIRSTNAME, LASTNAME, HOURSWORKED 
FROM GG_EMPLOYEE E,  SERVICE S
WHERE E.EMPLOYEEID = S.EMPLOYEEID
ORDER BY S.HOURSWORKED DESC;







