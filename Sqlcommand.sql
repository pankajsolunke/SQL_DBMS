-- Find those hard disk sizes which occur in two or more PC's
-- select HD from pc group by HD having count(modelno) >= 2;

-- Find the manufacturers of color printers.
-- select p.maker, pr.modelno from product p 
-- join printer pr on P.Modelno = pr.Modelno where pr.Color='T';

-- Find the laptops whose speed is slower than that of any PC.
-- SELECT * FROM laptop WHERE Speed < ANY (SELECT Speed FROM PC);

-- Find the different types of printers produced by Epson.
-- select type from printer where modelno in (select Modelno from product where Maker= 'epson')
-- select Type from printer where Modelno in (select Modelno from product where Maker ='Epson');
-- select * from laptop where Speed < any (select Speed from PC)
-- create table product (
-- Maker varchar(50) not null,
-- Modelno varchar(50) primary key,
-- Type varchar(20) not null check (type in ('PC','laptop','printer'))
-- );

-- create table pc (
-- 	Modelno varchar(50) primary key,
--     speed int not null,
--     Ram int not null,
--     Hd int not null,
--     Cd int not null,
--     price decimal(10,2) not null,
--     foreign key (Modelno) references product(Modelno)
-- );
 
 -- create table laptop (
--  Modelno varchar(50) primary key,
--  speed int not null,
--  RAM int not null ,
--  HD int not null,
--  price decimal(10,2) not null,
--  foreign key (Modelno) references product(Modelno)
--  );

-- create table printer (
-- Modelno int primary key ,
-- color char(1) not null check (Color in ('T','F')),
-- Type varchar(20) not null check (Type in ('laser','ink-jet','dot-matrix','dry')),
-- price decimal(10,2) not null
-- );
-- querie --1
-- select Type from printer where modelno in (select modelno from product where maker='Epson');
-- querie 2
-- select HD from PC group by HD having count(modelno) >=2
-- querie 3
-- CREATE TRIGGER checkMinSpeed BEFORE INSERT ON LAPTOP FOR EACH ROW
-- IF NEW.Speed < 150 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Minimum speed for a laptop should be 150MH' ;

-- practical 16
-- querie 1
-- select p.maker from product p join printer pr on p.modelno = pr.modelno where pr.color = 'T';
-- querie 2
-- SELECT DISTINCT L.*
-- FROM LAPTOP L
-- WHERE L.Speed < ANY (SELECT P.Speed FROM PC P);

-- create table Patient (Pcode int primary key,
-- Pname varchar(30) not null,
-- Padd varchar(100) not null,
-- age int not null,
-- gender char(1) check (gender in ('M','F')) not null,
-- bloodgroup varchar(10),
-- Did int,
-- foreign key(Did) references doctor(Did)
-- );

-- create table admittedpatient (Pcode int primary key,
-- entry_date date not null,
-- Discharge_date date not null,
-- ward_no int check (ward_no < 5) not null,
-- disease varchar(50)
-- );

-- --PRACTICAL no 4
-- CREATE TABLE DOCTOR (
--     Did INT PRIMARY KEY,
--     Dname VARCHAR(50) NOT NULL,
--     Daddress VARCHAR(100) NOT NULL,
--     qualification VARCHAR(50) NOT NULL
-- );

-- -- Create PATIENTMASTER table
-- CREATE TABLE PATIENTMASTER (
--     Pcode INT PRIMARY KEY,
--     Pname VARCHAR(50) NOT NULL,
--     Padd VARCHAR(100) NOT NULL,
--     age INT NOT NULL,
--     gender CHAR(1) CHECK (gender IN ('M', 'F')) NOT NULL,
--     bloodgroup VARCHAR(10) NOT NULL,
--     Did INT,
--     FOREIGN KEY (Did) REFERENCES DOCTOR(Did)
-- );

-- -- Create ADMITTEDPATIENT table
-- CREATE TABLE ADMITTEDPATIENT (
--     Pcode INT PRIMARY KEY,
--     Entry_date DATE NOT NULL,
--     Discharge_date DATE,
--     ward_no INT CHECK (ward_no < 5) NOT NULL,
--     disease VARCHAR(100) NOT NULL,
--     Foreign key (Pcode) references PATIENTMASTER(Pcode)
-- );
-- -- Insert data into DOCTOR table
-- INSERT INTO DOCTOR (Did, Dname, Daddress, qualification)
-- VALUES
--     (1, 'Dr. Smith', '123 Main Street', 'MD'),
--     (2, 'Dr. Johnson', '456 Oak Avenue', 'MBBS'),
--     (3, 'Dr. Williams', '789 Pine Road', 'MS'),
--     (4, 'Dr. Davis', '234 Cedar Lane', 'MD'),
--     (5, 'Dr. Anderson', '567 Elm Street', 'PhD'),
--     (6, 'Dr. Martin', '890 Maple Avenue', 'MBBS'),
--     (7, 'Dr. Wilson', '345 Birch Road', 'MD'),
--     (8, 'Dr. Taylor', '678 Oak Lane', 'MS'),
--     (9, 'Dr. Lee', '901 Pine Street', 'MBBS'),
--     (10, 'Dr. Turner', '432 Elm Road', 'MD');
-- -- Insert data into PATIENTMASTER table
-- INSERT INTO PATIENTMASTER (Pcode, Pname, Padd, age, gender, bloodgroup, Did)
-- VALUES
--     (101, 'John Doe', '123 Main Street', 30, 'M', 'O+', 1),
--     (102, 'Jane Doe', '456 Oak Avenue', 25, 'F', 'AB-', 2),
--     (103, 'Bob Smith', '789 Pine Road', 40, 'M', 'B+', 3),
--     (104, 'Alice Johnson', '234 Cedar Lane', 35, 'F', 'A-', 4),
--     (105, 'Charlie Wilson', '567 Elm Street', 28, 'M', 'O-', 5),
--     (106, 'Emily Martin', '890 Maple Avenue', 32, 'F', 'AB+', 6),
--     (107, 'David Turner', '345 Birch Road', 45, 'M', 'B-', 7),
--     (108, 'Sophia Lee', '678 Oak Lane', 22, 'F', 'O+', 8),
--     (109, 'Oliver Taylor', '901 Pine Street', 38, 'M', 'AB-', 9),
--     (110, 'Eva Anderson', '432 Elm Road', 27, 'F', 'A+', 10);
-- -- Insert data into ADMITTEDPATIENT table
-- INSERT INTO ADMITTEDPATIENT (Pcode, Entry_date, Discharge_date, ward_no, disease)
-- VALUES
--     (101, '2022-01-05', '2022-01-15', 3, 'Fever'),
--     (102, '2022-02-10', '2022-02-20', 2, 'Infection'),
--     (103, '2022-03-15', '2022-03-25', 4, 'Fracture'),
--     (104, '2022-04-20', '2022-04-30', 1, 'Appendicitis'),
--     (105, '2022-05-25', '2022-06-05', 3, 'Pneumonia'),
--     (106, '2022-06-30', '2022-07-10', 2, 'Hypertension'),
--     (107, '2022-08-05', NULL, 4, 'Diabetes'),
--     (108, '2022-09-10', '2022-09-20', 1, 'Concussion'),
--     (109, '2022-10-15', NULL, 3, 'Bronchitis'),
--     (110, '2022-11-20', '2022-12-01', 2, 'Kidney Stones');

-- a) Find the details of doctors who are treating the patient of ward no 4.
-- SELECT *
-- FROM doctor D
-- JOIN patient P ON D.Did = P.Did 
-- JOIN admittedpatient AP ON P.Pcode = AP.Pcode
-- WHERE ward_no = 4;

-- b)>Find the details of patient who are discharged within the period 13/08/22 to 28/08/22.
-- select * from admittedpatient where Discharge_date between '2022-08-13' and '2022-08-28';

-- C)>Find the details of the doctors who are treating the patients of ward no 3 & display the 
-- result along with patient name & disease.
-- select D.Dname ,P.Pname, AP.disease , AP.ward_no from doctor D 
-- join patient P on D.Did = P.Did
-- join admittedpatient Ap on P.Pcode = AP.Pcode where AP.Ward_no = 3;

-- b) Find the name of the disease by w hich minimum patients are suffering.
-- SELECT AP.disease FROM admittedpatient AP
-- LEFT JOIN patient P ON AP.Pcode = P.Pcode
-- GROUP BY AP.disease
-- ORDER BY COUNT(P.Pcode) ASC
-- LIMIT 1;

-- a) Find details of the patients who are treated by M.S. doctors.
-- select D.Dname ,D.qualification, P.Pname from doctor D 
-- join patient P on D.Did = P.Did
-- where D.qualification = 'MS';

-- b) Find the details of patient who is suffered from blood cancer
--  having age less than 40 years & blood group is A
-- select P.Pcode, P.age, P.bloodgroup , AP.disease from patient P
--  join admittedpatient AP on P.Pcode = AP.Pcode 
-- where AP.disease = 'blood cancer' and P.age < 40 and P.bloodgroup = 'A';

-- a) Find details of the patients who are treated by M.S. doctors.
-- select D.Dname, D.qualification from doctor D
-- join patient P on D.Did = P.Did where D.qualification = 'MS';

-- b) Find the name of doctor who is treating maximum number of patients.
-- SELECT D.Did,D.Dname FROM doctor D
-- LEFT JOIN patient P ON D.Did = P.Did
-- GROUP BY D.Did, D.Dname
-- ORDER BY COUNT(P.Pcode) DESC
-- LIMIT 1;

-- querie 1
-- SELECT *
-- FROM DOCTOR D
-- JOIN PATIENTMASTER P ON D.Did = P.Did 
-- JOIN ADMITTEDPATIENT AP ON P.Pcode = AP.Pcode
-- WHERE AP.ward_no = 4;

-- querie 2
-- SELECT *
-- FROM ADMITTEDPATIENT
-- WHERE Discharge_date BETWEEN '2022-08-13' AND '2022-08-28';

-- practical no 5
-- queries 1
-- SELECT D.Did, D.Dname, P.Pname, AP.disease
-- FROM DOCTOR D
-- JOIN PATIENTMASTER P ON D.Did = P.Did
-- JOIN ADMITTEDPATIENT AP ON P.Pcode = AP.Pcode
-- WHERE AP.ward_no = 3;

-- find the name of the disease by which minimum patients are suffering -queries no 2
-- SELECT disease, COUNT(*) as patient_count
-- FROM ADMITTEDPATIENT group by disease
-- order by patient_count limit 1;

-- a) Find details of the patients who are treated by M.S. doctors.
-- SELECT P.Pcode, P.Pname, P.age, P.bloodgroup, AP.disease, D.qualification
-- FROM PATIENTMASTER P
-- JOIN ADMITTEDPATIENT AP ON P.Pcode = AP.Pcode
-- JOIN DOCTOR D ON P.Did = D.Did
-- WHERE D.qualification = 'MS';

-- b) Find the details of the patient who is suffering from blood cancer, having age less than 40 years, and blood group A.
-- SELECT P.Pcode, P.Pname, P.age, P.bloodgroup, AP.disease
-- FROM PATIENTMASTER P
-- JOIN ADMITTEDPATIENT AP ON P.Pcode = AP.Pcode
-- WHERE AP.disease = 'Blood Cancer' AND P.age < 40 AND P.bloodgroup = 'A+';

-- Pratical no 7
-- a) Find details of the patients who are treated by M.S. doctors.
-- SELECT P.Pcode, P.Pname, P.age, P.bloodgroup, AP.disease, D.Dname, D.qualification
-- FROM PATIENTMASTER P
-- JOIN ADMITTEDPATIENT AP ON P.Pcode = AP.Pcode
-- JOIN DOCTOR D ON P.Did = D.Did
-- WHERE D.qualification = 'MS';

-- b) Find the name of the doctor who is treating the maximum number of patients
-- select D.Did,D.Dname from doctor D
-- left join patient P on D.Did = P.Did
-- group by D.Did , D.Dname
-- order by count(P.Pcode) desc
-- limit 1


-- c) Create a view on DOCTOR & PATIENTMASTER tables. Update details of the patients who are treated by B.A.M.S. doctors to M.B.B.S doctors.
-- create view DoctorPatientView AS
-- select P.Pcode, P.Pname, D.Did, D.Dname, D.qualification from doctor D
-- join patient P on D.Did = P.Did 
 
 --   select * from student.doctorpatientview
 
-- UPDATE patient
-- SET Did = (SELECT Did FROM doctor WHERE qualification = 'M.B.B.S')
-- WHERE Did IN (SELECT Did FROM doctor WHERE qualification = 'B.A.M.S');

-- create table Account (Accno int primary key ,
-- open_date date not null ,
-- acctype char(1) not null check (acctype in ('P','J')),
-- balance decimal(15,2) not null check (balance > 0 and balance < 1000000)
--  );

-- create table Transaction(trans_id int primary key 
-- ,trans_date date not null,
-- Accno int not null,
-- trans_type char(1) check (trans_type in ('C','D'))not null,
-- amount decimal(10,2) not null,
-- foreign key(Accno) references account(Accno)
-- ) ;

-- create table Account (Accno int primary key,
-- open_date date not null,
-- acctype char(1) not null check (Acctype in ('P','J')),
-- balance decimal(10,2) not null check (balance > 0 and balance < 100000)
-- );

-- create table customer (cust_id int primary key ,
-- name varchar(20) not null,
-- address varchar(50) not null,
-- Accno int not null,
-- foreign key(Accno) references account(Accno));

-- a) Find the details of customers whose minimum balance is 1 lakhs.
-- select C.cust_id, C.name, A.balance from customer C
--  join account A on C.accno = A.accno where A.balance < 100000;

-- b) Find the details of amount credited within the period 25-6-2022 to 28-6- 2022
-- select T.trans_id,T.trans_date,T.trans_type ,T.amount from transaction T
-- join account A on T.Accno = A.Accno
-- where T.trans_type = 'C' and T.trans_date between '2022-06-25' and '2022-06-28'



-- Find the details of customers who have personal accounts & balance is less than 3 lakhs
-- select C.cust_id, C.name, A.Accno, A.acctype from customer C
-- join account A on C.Accno = A.Accno where A.acctype = 'P' and A.balance < 300000;

-- Find the details of customers who have joint accounts.
-- select C.cust_id, C.name from customer C join account A on C.accno = A.accno 
-- where A.acctype = 'J';

-- select T.trans_id,T.trans_date,T.trans_type from transaction T
-- where T.trans_type = 'C' and T.trans_date between '2022-03-15' and '2022-03-18'
-- select T.trans_id, T.accno,C.name,A.acctype from transaction T
-- join account A on T.Accno = A.Accno 
-- join customer C on A.accno = C.Accno where A.Accno = 103;

-- practical no 8
-- CREATE TABLE ACCOUNT (
--     accno INT PRIMARY KEY,
--     open_date DATE NOT NULL,
--     acctype CHAR(1) CHECK (acctype IN ('P', 'J')) NOT NULL,
--     balance DECIMAL(15, 2) NOT NULL CHECK (balance >= 0 AND balance < 1000000)
-- );
-- INSERT INTO ACCOUNT (accno, open_date, acctype, balance)
-- VALUES
--     (1001, '2022-01-01', 'P', 150000),
--     (1002, '2022-02-15', 'J', 200000),
--     (1003, '2022-03-10', 'P', 120000),
--     (1004, '2022-04-05', 'J', 180000),
--     (1005, '2022-05-20', 'P', 250000),
--     (1006, '2022-06-15', 'J', 300000),
--     (1007, '2022-07-01', 'P', 90000),
--     (1008, '2022-08-10', 'J', 150000),
--     (1009, '2022-09-05', 'P', 180000),
--     (1010, '2022-10-20', 'J', 220000);

-- CREATE TABLE TRANSACTION (
--     trans_id INT PRIMARY KEY,
--     trans_date DATE NOT NULL,
--     accno INT,
--     trans_type CHAR(1) CHECK (trans_type IN ('C', 'D')) NOT NULL,
--     amount DECIMAL(15, 2) NOT NULL,
--     FOREIGN KEY (accno) REFERENCES ACCOUNT(accno)
-- );

-- Insert data into TRANSACTION table
-- INSERT INTO TRANSACTION (trans_id, trans_date, accno, trans_type, amount)
-- VALUES
--     (1, '2022-06-26', 1001, 'C', 50000),
--     (2, '2022-06-27', 1002, 'D', 30000),
--     (3, '2022-07-02', 1003, 'C', 100000),
--     (4, '2022-07-05', 1004, 'D', 50000),
--     (5, '2022-08-21', 1005, 'C', 75000),
--     (6, '2022-09-16', 1006, 'D', 40000),
--     (7, '2022-10-03', 1007, 'C', 60000),
--     (8, '2022-11-12', 1008, 'D', 20000),
--     (9, '2022-12-08', 1009, 'C', 120000),
--     (10, '2022-12-25', 1010, 'D', 80000);
 
--  create table customer (
--  cust_id int primary key,
--  name varchar(50) not null,
--  address varchar(100) not null,
--  accno int ,
--  foreign key (accno) references ACCOUNT(accno));

-- Insert data into CUSTOMER table
-- INSERT INTO CUSTOMER (cust_id, name, address, accno)
-- VALUES
--     (2001, 'John Doe', '123 Main Street', 1001),
--     (2002, 'Jane Smith', '456 Oak Avenue', 1002),
--     (2003, 'Bob Johnson', '789 Pine Road', 1003),
--     (2004, 'Alice Williams', '234 Cedar Lane', 1004),
--     (2005, 'Charlie Wilson', '567 Elm Street', 1005),
--     (2006, 'Emily Martin', '890 Maple Avenue', 1006),
--     (2007, 'David Turner', '345 Birch Road', 1007),
--     (2008, 'Sophia Lee', '678 Oak Lane', 1008),
--     (2009, 'Oliver Taylor', '901 Pine Street', 1009),
--     (2010, 'Eva Anderson', '432 Elm Road', 1010);

-- a) Find the details of customers whose minimum balance is 1 lakh.
-- SELECT C.cust_id, C.name, C.address, A.accno, A.balance
-- FROM CUSTOMER C
-- JOIN ACCOUNT A ON C.accno = A.accno
-- WHERE A.balance >= 100000;

-- b) Find the details of amounts credited within the period 25-6-2022 to 28-6-2022.
-- SELECT T.trans_id, T.trans_date, T.accno, T.amount, A.balance
-- FROM TRANSACTION T
-- JOIN ACCOUNT A ON T.accno = A.accno
-- WHERE T.trans_type = 'C' AND T.trans_date BETWEEN '2022-06-25' AND '2022-06-28';

-- a) Find the details of customers who have personal accounts & balance is less than 3 lakhs.
-- SELECT C.cust_id, C.name, C.address, A.accno, A.balance ,A.acctype
-- FROM CUSTOMER C
-- JOIN ACCOUNT A ON C.accno = A.accno
-- WHERE A.acctype = 'P' AND A.balance < 300000;

-- b) Find the details of customers who have joint accounts.
-- SELECT C.cust_id, C.name, C.address, A.accno, A.balance, A.acctype
-- FROM CUSTOMER C
-- JOIN ACCOUNT A ON C.accno = A.accno
-- WHERE A.acctype = 'J';

-- practical 10

-- b) Find the details of the amount credited within the period 15-3-2022 to 18-3-2022.
-- SELECT T.trans_id, T.trans_date, T.accno, T.trans_type, T.amount, A.balance
-- FROM TRANSACTION T
-- JOIN ACCOUNT A ON T.accno = A.accno
-- WHERE T.trans_type = 'C' AND T.trans_date BETWEEN '2022-06-25' AND '2022-06-28';

--  A)Find the details of customers who have opened the accounts within the period 25-3-2022 to 28-3-2022.
-- SELECT C.cust_id, C.name, C.address, A.accno, A.open_date, A.acctype, A.balance
-- FROM CUSTOMER C
-- JOIN ACCOUNT A ON C.accno = A.accno
-- WHERE A.open_date BETWEEN '2022-03-25' AND '2022-03-28';

-- b) Find the details of customers who have joint accounts & balance is less than 3 lakh
-- SELECT C.cust_id, C.name, C.address, A.accno, A.acctype, A.balance
-- FROM CUSTOMER C
-- JOIN ACCOUNT A ON C.accno = A.accno
-- WHERE A.acctype = 'J' AND A.balance < 300000;

-- Find the details of customers who have joint accounts & balance is less
-- than 2 lakhs
-- SELECT C.cust_id, C.name, C.address, A.accno, A.acctype, A.balance
-- FROM CUSTOMER C
-- JOIN ACCOUNT A ON C.accno = A.accno
-- WHERE A.acctype = 'J' AND A.balance < 200000;

-- create table Book(Bid int primary key,
-- title varchar(50) not null,
-- author varchar(100) not null,
-- price decimal(10,2)
-- );

-- create table StudenMaster(stud_enrollno int primary key,
-- Sname varchar(20) not null,
-- class varchar(10) not null,
-- dept varchar(20) not null
-- );

-- create table AccessionTable(
-- Bid int,
-- accession_no int primary key,
-- avail char(1) not null check (avail in('T','F')),
-- foreign key(Bid) references book(Bid)
-- );

-- create table Issuetable(
-- issueid int primary key,
-- accession_no int,
-- stud_enrollno int,
-- issuedate date not null,
-- duedate date not null,
-- ret_date date not null,
-- Bid int,
-- foreign key(accession_no) references accessiontable(accession_no),
-- foreign key(stud_enrollno) references studenmaster(stud_enrollno),
-- foreign key(Bid) references book(Bid)
-- );


-- a) Find the name of books which is issued maximum times.
-- select B.title,A.avail, count(*) as num_book from issuetable I 
-- join accessiontable A on I.accession_no = A.accession_no 
-- join book B on A.Bid = B.Bid 
-- group by B.title ,A.avail
-- order by num_book desc 
-- limit 1


-- b) Find the detail information of books that are issued by computer department students.
-- select B.*,S.dept from issuetable I
--  join accessiontable A on I.accession_no = A.accession_no
-- join book B on I.Bid = B.Bid 
-- join studenmaster S on I.stud_enrollno = S.stud_enrollno
-- where S.dept = 'computer dept'


-- Find the detail information of the students who have issued books Between two given dates
-- select S.sname from studenmaster S
-- join issuetable I on S.stud_enrollno = I.stud_enrollno
-- where I.issuedate between 2023-08-15 and 2023-08-15


--  create view BookAccessionView as select * from accessiontable A where A.Bid = 101


--  b) Find the number of books issued by each student.
-- select S.stud_enrollno,S.sname, count(I.issueid) from studenmaster S
-- join issuetable I on S.stud_enrollno = I.stud_enrollno
-- group by S.stud_enrollno, S.Sname;


-- Find the number of books available in the library & written by “E.Navathe"
-- select B.title,B.author,B.price, count(*) as num_books from book B join accessiontable A on B.Bid = A.Bid 
-- where A.avail = 'T' and B.author = 'E.Navathe'
-- group by B.title,B.author,B.price;

-- create table Supplier (Sno varchar(10) primary key,
-- Sname varchar(20) not null,
-- Address varchar(50) not null,
-- City varchar(20) not null)

-- create table Parts(
-- Pno int primary key,
-- Pname varchar(20) not null,
-- color varchar(20) not null,
-- weight decimal(10,2) not null,
-- price decimal(10,2) not null
-- )

-- create table SPJ(
-- Sno varchar(20) primary key,
-- Pno int not null,
-- Jno int not null,
-- Qty int not null,
-- foreign key(Sno) references supplier(Sno),
-- foreign key(Pno) references parts(Pno),
-- foreign key(Jno) references project(Jno)
-- )

-- select * from project where City = 'paris'

-- SELECT J.Jno,J.Jname from project J 
-- join spj S on J.Jno = S.Jno 
-- group by J.Jno,J.Jname having  count(S.Pno) >=3
