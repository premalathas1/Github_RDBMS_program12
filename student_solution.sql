-- ============================================
-- RDBMS PROGRAM 12
-- COLLEGE MANAGEMENT SYSTEM - ER RELATIONSHIPS
-- ============================================

-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS CollegeDB;

-- Step 2: Select Database
USE CollegeDB;


-- Step 3: Create Department Table

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);


-- Step 4: Insert Department Records

INSERT INTO Department VALUES
(10, 'Computer Science'),
(20, 'Mathematics'),
(30, 'Commerce');


-- Step 5: Create Student Table

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);


-- Step 6: Insert Student Records

INSERT INTO Student VALUES
(1001, 'Arun', 10),
(1002, 'Priya', 20),
(1003, 'Kumar', 10),
(1004, 'Divya', 30);


-- Step 7: Create Faculty Table

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50)
);


-- Step 8: Insert Faculty Records

INSERT INTO Faculty VALUES
(501, 'Dr. Ravi'),
(502, 'Dr. Meena'),
(503, 'Dr. Kumar');


-- Step 9: Create Course Table

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    FacultyID INT,
    FOREIGN KEY (FacultyID)
        REFERENCES Faculty(FacultyID)
);


-- Step 10: Insert Course Records

INSERT INTO Course VALUES
(201, 'Database Systems', 501),
(202, 'Data Structures', 501),
(203, 'Mathematics', 502),
(204, 'Computer Networks', 503);


-- Step 11: Create Enrollment Table
-- This represents the M:N relationship
-- between Student and Course.

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);


-- Step 12: Insert Enrollment Records

INSERT INTO Enrollment VALUES
(1, 1001, 201),
(2, 1001, 202),
(3, 1002, 203),
(4, 1003, 201),
(5, 1004, 204);


-- ER RELATIONSHIPS
--
-- Department 1 : N Student
-- One Department has many Students.
--
-- Faculty 1 : N Course
-- One Faculty handles many Courses.
--
-- Student M : N Course
-- Many Students can enroll in many Courses.
--
-- Enrollment acts as the bridge table
-- between Student and Course.
