show databases;
USE mydb;

show tables;

SELECT * FROM Address;

INSERT INTO Address (AddressLine1,AddressLine2,City,State,Country,ZipCode) VALUES ('60 Saint Germain Street','Apt 6','Boston','Massachusetts','USA','02115');
INSERT INTO Address (AddressLine1,AddressLine2,City,State,Country,ZipCode) VALUES ('70 Saint Germain Street','Apt 7','Boston','Massachusetts','USA','02116');
INSERT INTO Address (AddressLine1,AddressLine2,City,State,Country,ZipCode) VALUES ('80 Saint Germain Street','Apt 8','Boston','Massachusetts','USA','02117');
INSERT INTO Address (AddressLine1,AddressLine2,City,State,Country,ZipCode) VALUES ('90 Saint Germain Street','Apt 9','Boston','Massachusetts','USA','02118');
INSERT INTO Address (AddressLine1,AddressLine2,City,State,Country,ZipCode) VALUES ('50 Saint Germain Street','Apt 5','Boston','Massachusetts','USA','02119');

SELECT * FROM Contact;
INSERT INTO Contact (PhoneNumber,PhoneNumberType,Status) VALUES ('8578691032','Home','Active');
INSERT INTO Contact (PhoneNumber,PhoneNumberType,Status) VALUES ('8578691033','Office','Active');
INSERT INTO Contact (PhoneNumber,PhoneNumberType,Status) VALUES ('8578691678','Mobile','Active');
INSERT INTO Contact (PhoneNumber,PhoneNumberType,Status) VALUES ('8578691600','Home','Inactive');
INSERT INTO Contact (PhoneNumber,PhoneNumberType,Status) VALUES ('8578691000','Mobile','Active');

SELECT * FROM Person;
INSERT INTO Person (FirstName,MiddleName,LastName,DateOfBirth,Gender,Age,Addressid,Contactid) VALUES ('Ria','Singh','Rajput','1994-08-27','ABC','24','1','1');
INSERT INTO Person (FirstName,MiddleName,LastName,DateOfBirth,Gender,Age,Addressid,Contactid) VALUES ('Ashmita','Mukesh','Nigam','1989-09-27','Female','28','2','2');
INSERT INTO Person (FirstName,MiddleName,LastName,DateOfBirth,Gender,Age,Addressid,Contactid) VALUES ('Ryan','J','Reynolds','1987-10-08','Male','30','3','3');
INSERT INTO Person (FirstName,MiddleName,LastName,DateOfBirth,Gender,Age,Addressid,Contactid) VALUES ('Amanpreet','Sethi','Chawla','1991-10-21','Male','27','4','4');
INSERT INTO Person (FirstName,MiddleName,LastName,DateOfBirth,Gender,Age,Addressid,Contactid) VALUES ('Drishti','Sanghvi','Sisodiya','1996-04-29','Female','22','5','5');

SELECT*FROM Department;
INSERT INTO Department (DepartmentName) VALUES ('Opthalmic');
INSERT INTO Department (DepartmentName) VALUES ('Orthopaedic');
INSERT INTO Department (DepartmentName) VALUES ('Radiology');
INSERT INTO Department (DepartmentName) VALUES ('EngineeringorInfra');
INSERT INTO Department (DepartmentName) VALUES ('Equipment Maintenance');

SELECT * FROM Patient;

INSERT INTO Patient (PatientType,Height,Weight,Blood_Group,Disease,Personid,idaddress,idcontact) VALUES ('Inpatient','5 feet 9 inch','62 kgs','A+ve','Cough',1,1,1);
INSERT INTO Patient (PatientType,Height,Weight,Blood_Group,Disease,Personid,idaddress,idcontact) VALUES ('Outpatient','5 feet 2 inch','52 kgs','O+ve','Cough',2,2,2);

SELECT * FROM Role_Table;
INSERT INTO Role_Table (Role_Type) VALUES ('Doctor');
INSERT INTO Role_Table (Role_Type) VALUES ('Nurse');
INSERT INTO Role_Table (Role_Type) VALUES ('Lab Technician');
INSERT INTO Role_Table (Role_Type) VALUES ('Medical Equipment Engineer');
INSERT INTO Role_Table (Role_Type) VALUES ('Engineer');

SELECT * FROM Employee;
INSERT INTO Employee (Person_id,Address_id,Contact_id,Department_id,Role_id) VALUES ('3','3','3','1','1');
INSERT INTO Employee (Person_id,Address_id,Contact_id,Department_id,Role_id) VALUES ('4','4','4','4','5');
INSERT INTO Employee (Person_id,Address_id,Contact_id,Department_id,Role_id) VALUES ('5','5','5','5','4');

SELECT * FROM Category;
INSERT INTO Category (Category) VALUES ('Blood Test');
INSERT INTO Category (Category) VALUES ('Sputum Test');
INSERT INTO Category (Category) VALUES ('Stool Test');
INSERT INTO Category (Category) VALUES ('Urine Test');
INSERT INTO Category (Category) VALUES ('Liver Function Test');

SELECT*FROM Lab;
INSERT INTO Lab (Patient_id,Employee_id,Date,Category_id,Amount) VALUES ('1','1','2018-12-12','1','400');

SELECT*FROM Room_Table;
INSERT INTO Room_Table(Room_Type,Status) VALUES ('Single Deluxe Room','Vacant');
INSERT INTO Room_Table(Room_Type,Status) VALUES ('2-Bedded Room','Vacant');
INSERT INTO Room_Table(Room_Type,Status) VALUES ('4-Bedded Room','Vacant');
INSERT INTO Room_Table(Room_Type,Status) VALUES ('ICU','Occupied');

INSERT INTO Inpatient (patient,RoomNo,dateofAdmission,Dateofdischarge,Advance,Lab_Number) VALUES ('1','1','2018-08-27','2018-10-27','1000','1');

INSERT INTO Outpatient (Patientid,Date,Lab_No) VALUES ('2','2018-09-19','1');

INSERT INTO Bill_Table (idpatient,DoctorCharges,MedicineCharges,RoomCharges,OperationCharges,NumberOfDays,LabTestCharges,NursingCharges,Advance,Bill) VALUES ('1','200','300','600','300','4','300','100','400','2200');

select * from Bill_Table;

INSERT INTO Equipment_Maintenance_Table (Medical_Equipment,Availability,Status,iddepartment) VALUES ('Eye testing lens','Yes','Working','1');
INSERT INTO Equipment_Maintenance_Table (Medical_Equipment,Availability,Status,iddepartment) VALUES ('Retractor','Yes','Working','2');
INSERT INTO Equipment_Maintenance_Table (Medical_Equipment,Availability,Status,iddepartment) VALUES ('Ultra Sonography Machine','Yes','Working','3');

select * from Equipment_maintenance_Table;

INSERT INTO EngineeringorInfra_Equipment_Table (Engineering_Equipment,Availability,Status,departmentid) VALUES ('Fan','Yes','Working','4');
INSERT INTO EngineeringorInfra_Equipment_Table (Engineering_Equipment,Availability,Status,departmentid) VALUES ('Light','Yes','Not Working','5');

select * from EngineeringorInfra_Equipment_Table;

desc CONTACT;

select * from address;

select * from PERSON;

SELECT FIRSTNAME,LASTNAME,AddressLine1,AddressLine2,CITY,STATE,COUNTRY,ZIPCODE,PHONENUMBER
FROM PERSON P
INNER JOIN ADDRESS A
ON P.Addressid=A.idAddress
INNER JOIN CONTACT C
ON C.IDCONTACT=P.CONTACTID;

call insert_address ('37 saint germain','apt 5','boston','massachusetts','USA',02115);

show procedure status;
show create procedure insert_address;

select * from Address;

/*Call for the function FinalBill*/

select *, FinalBill(DoctorCharges,MedicineCharges,RoomCharges,OperationCharges,LabTestCharges,NursingCharges,Advance)
from Bill_Table
ORDER BY
idpatient;






