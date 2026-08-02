Create database student;
use student;
create table Student(
Stud_id int,
Stud_Firstname Varchar(20),
Stud_lastname varchar(20),
DOB Date,
Gender varchar(30),
Stud_class Varchar(50),
Stud_Email Varchar(50));
insert into student (Stud_id,Stud_firstname,Stud_lastname,DOB,Gender,stud_class,stud_email) values 
(1, 'Arun', 'Kumar', '2005-03-12', 'Male', 'BSc-CS-I', 'arun.k@example.com'),
(2, 'Divya', 'Raj', '2005-07-21', 'Female', 'BSc-CS-I', 'divya.r@example.com'),
(3, 'Karthik', 'Suresh', '2004-11-05', 'Male', 'BSc-CS-II', 'karthik.s@example.com'),
(4, 'Priya', 'Menon', '2005-01-30', 'Female', 'BSc-CS-I', 'priya.m@example.com'),
(5, 'Vishal', 'Nair', '2004-09-17', 'Male', 'BSc-CS-II', 'vishal.n@example.com');
show tables from student;
select * from student;
create database patient;
use patient;
create table hos_patient(
Patient_id Int primary key,
Patient_Name Varchar(20) NOT Null,
Age Int,
Gender Varchar(15),
Admission_date DATE);
select * from hos_patient;
create database online_shopping;
use online_shopping;
create table customer(
Customerid int primary key,
Customer_name Varchar(30),
Email varchar(30),
Phno Int);
create table orders(
Orderid int primary key,
Orderdate date,
Amount decimal(10,0),
customerid int,
Foreign key (customerid) references customer(customerid));
select * from customer;
select * from orders;
show tables from online_shopping;
-- 7 2NF
CREATE TABLE Students (
    StudentID    INT PRIMARY KEY,
    StudentName  VARCHAR(100)
);
 
CREATE TABLE Course (
    CourseID     INT PRIMARY KEY,
    CourseName   VARCHAR(100)
);
 
CREATE TABLE Enrollment (
    StudentID    INT,
    CourseID     INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
Select * from enrollment;
-- 9 to 24
use db;
create table Employee1(
EmployeeID Int Primary key, 
EmployeeName varchar(30),
Salary Int,
DepartmentName Varchar(30),
City varchar(30),
Designation varchar(30),
Email varchar(30),
Mobile int);
select * from employee1;
INSERT INTO Employee1
(EmployeeID, EmployeeName, Salary, DepartmentName, City, Designation, Email, Mobile)
VALUES
(101, 'John Smith', 65000, 'HR', 'Chennai', 'HR Executive', 'john.smith@example.com', '9876543210'),
(102, 'Alice Johnson', 72000, 'Finance', 'Bengaluru', 'Accountant', 'alice.johnson@example.com', '9876543211'),
(103, 'Michael Brown', 85000, 'IT', 'Hyderabad', 'Software Engineer', 'michael.brown@example.com', '9876543212'),
(104, 'Sophia Davis', 95000, 'IT', 'Pune', 'Senior Software Engineer', 'sophia.davis@example.com', '9876543213'),
(105, 'David Wilson', 70000, 'Marketing', 'Mumbai', 'Marketing Executive', 'david.wilson@example.com', '9876543214'),
(106, 'Emma Taylor', 60000, 'Sales', 'Delhi', 'Sales Executive', 'emma.taylor@example.com', '9876543215'),
(107, 'Daniel Thomas', 110000, 'Finance', 'Chennai', 'Finance Manager', 'daniel.thomas@example.com', '9876543216');
Alter table employee1 modify mobile varchar(15);
Create table Student1
(StudentID Int primary key,
Name Varchar(30),
Marks Int,
City Varchar(30),
Grade varchar(30),
Fees varchar(30));
INSERT INTO Student1
(StudentID, Name, Marks, City, Grade, Fees)
VALUES
(101, 'Aarav', 92, 'Chennai', 'A', '50000'),
(102, 'Diya', 85, 'Bengaluru', 'B', '48000'),
(103, 'Rohan', 76, 'Hyderabad', 'C', '45000'),
(104, 'Meera', 95, 'Mumbai', 'A', '52000'),
(105, 'Karthik', 68, 'Coimbatore', 'D', '40000'),
(106, 'Sneha', 81, 'Pune', 'B', '47000'),
(107, 'Rahul', 89, 'Delhi', 'A', '50000');
select * from employee1;
select Employeename,salary from employee1 where employeename='John smith';
select distinct departmentname from employee1;
select * from student1;
select name from student1 where marks>80;
select name from student1 where city='chennai';
alter table student1 add column class int;
update student1 
set class=case studentid
when 101 then '8'
when 102 then '9'
when 103 then '10'
when 104 then '9'
when 105 then '10'
when 106 then '8'
when 107 then '10'
end
where studentid in (101,102,103,104,105,106,107);
select * from student1;
select name from student1 where class=10;
select employeename, salary from employee1 order by salary desc;
select employeename from employee1 order by employeename asc;
select name, marks from student1 order by marks asc;
select distinct departmentname from employee1;
select distinct city from employee1;
select distinct designation from employee1;
SELECT * FROM Employee1
WHERE DepartmentName = 'IT' AND Salary > 50000;
select employeename, departmentname from employee1 where departmentname = 'IT' or 'Finance';
select employeename,departmentname from employee1 where not departmentname = 'sales';
select name, marks from student1 where marks between 60 and 80;
select employeename from employee1 where city in ('Chennai','Bangalore','Hyderabad');
select * from customer;
SELECT * FROM employee1 WHERE employeeName LIKE 'A%';
select * from employee1 where employeename like '%n';
SELECT * FROM employee1 WHERE employeeName LIKE '%ar%';
select * from employee1 where employeename like 'Ali_e';
SELECT * FROM Employee1
WHERE Email IS NULL;
SELECT * FROM Employee1
WHERE Email IS not NULL;
show tables from db;
SELECT EmployeeName AS 'Employee Name', Salary AS 'Monthly Salary', DepartmentName AS 'Department Name'
FROM Employee1;
select employeeid , employeename from employee1 where salary > (Select avg(salary) from employee1);
create database project1;
use project1;
CREATE TABLE Trainer (
    TrainerID       INT PRIMARY KEY,
    TrainerName     VARCHAR(100) NOT NULL,
    Specialization  VARCHAR(100)
);
 
CREATE TABLE Course (
    CourseID     INT PRIMARY KEY,
    CourseName   VARCHAR(100) NOT NULL,
    Fees         DECIMAL(10,2),
    TrainerID    INT,
    FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID)
);
 
CREATE TABLE Student (
    StudentID    INT PRIMARY KEY,
    StudentName  VARCHAR(100) NOT NULL,
    Email        VARCHAR(100),
    Fees         DECIMAL(10,2)
);
 
CREATE TABLE Enrollment (
    EnrollmentID   INT PRIMARY KEY,
    StudentID      INT,
    CourseID       INT,
    EnrollDate     DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
show tables from project1;
INSERT INTO Trainer (TrainerID, TrainerName, Specialization) VALUES
(1,'Ravi Shankar','Java'),(2,'Meena Iyer','Python'),(3,'Suresh Babu','Web Development'),
(4,'Anitha Rao','Data Science'),(5,'Kiran Kumar','MySQL'),(6,'Lakshmi Priya','Java'),
(7,'Ganesh Prasad','Cloud Computing'),(8,'Deepa Nair','Python'),(9,'Manoj Verma','Networking'),
(10,'Swathi Reddy','Web Development');
 
INSERT INTO Course (CourseID, CourseName, Fees, TrainerID) VALUES
(1,'Java',30000,1),(2,'Python',28000,2),(3,'Web Development',25000,3),
(4,'Data Science',40000,4),(5,'MySQL',20000,5),(6,'Advanced Java',35000,6),
(7,'Cloud Computing',32000,7),(8,'Django',27000,8),(9,'Networking',22000,9),
(10,'Full Stack Development',45000,10);
 
INSERT INTO Student (StudentID, StudentName, Email, Fees) VALUES
(1,'Sathish Kumar','sathish.k@example.com',30000),
(2,'Divya Bharathi',NULL,28000),
(3,'Naveen Raj','naveen.r@example.com',25000),
(4,'Sowmya Lakshmi','sowmya.l@example.com',40000),
(5,'Ashwin Prasad','ashwin.p@example.com',20000),
(6,'Sneha Reddy',NULL,35000),
(7,'Vignesh Kumar','vignesh.k@example.com',32000),
(8,'Shalini Menon','shalini.m@example.com',27000),
(9,'Praveen Anand','praveen.a@example.com',22000),
(10,'Sandhya Rani','sandhya.r@example.com',45000);
 
INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID, EnrollDate) VALUES
(1,1,1,'2026-01-05'),(2,2,2,'2026-01-06'),(3,3,3,'2026-01-07'),(4,4,4,'2026-01-08'),
(5,5,5,'2026-01-09'),(6,6,6,'2026-01-10'),(7,7,7,'2026-01-11'),(8,8,8,'2026-01-12'),
(9,9,9,'2026-01-13'),(10,10,10,'2026-01-14');
-- a) Display all students
select * from student;
-- b) Display students enrolled in the Java course
SELECT s.StudentID, s.StudentName
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Java';
-- c) Display unique course names
select distinct coursename from course;
-- d) Sort students by name
select * from student order by studentname asc;
-- e) Students whose fees are between 20,000 and 50,000
select studentname, fees from student where fees between 20000 and 50000;
-- f) Students whose names start with 'S'
select studentname from student where studentname like 'S%';
-- g) Students with no email address
select studentname, Email from student where email is NULL;
-- h) Rename StudentName as 'Student Name' using AS
select studentname as 'Student Name' from student;

