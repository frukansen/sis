-- Create the database
CREATE DATABASE student_information_system;
USE student_information_system;

-- Faculty Table
CREATE TABLE Faculty (
    faculty_id VARCHAR(3) PRIMARY KEY,
    faculty_name VARCHAR(50) NOT NULL,
    faculty_address TEXT DEFAULT 'CAMPUS',
    faculty_phone VARCHAR(11),
    dean_id VARCHAR(6) -- Link to staff member acting as dean
);

-- Department Table
CREATE TABLE Department (
    department_id VARCHAR(2) PRIMARY KEY,
    department_name VARCHAR(50),
    faculty_id VARCHAR(3),
    department_head_id VARCHAR(6), -- Link to the head of the department
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
);

-- Course Table
CREATE TABLE Course (
    course_code VARCHAR(6) PRIMARY KEY,
    course_name VARCHAR(50),
    theory_hours INT,
    practical_hours INT,
    credits INT,
    department_id VARCHAR(2),
    semester VARCHAR(1),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Position Table (for different academic titles)
CREATE TABLE Position (
    position_id INT IDENTITY(1,1) PRIMARY KEY,
    position_name VARCHAR(50)
);

-- Faculty Member Table
CREATE TABLE FacultyMember (
    member_id VARCHAR(6) PRIMARY KEY,
    department_id VARCHAR(2),
    position_id INT,
    expertise_area VARCHAR(50),
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (position_id) REFERENCES Position(position_id)
);

-- Student Table
CREATE TABLE Student (
    student_id VARCHAR(11) PRIMARY KEY,
    enrollment_date DATE,
    status VARCHAR(20)
);

-- Enrollment Table
CREATE TABLE Enrollment (
    enrollment_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id VARCHAR(11),
    course_code VARCHAR(6),
    semester VARCHAR(3),
    grade FLOAT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_code) REFERENCES Course(course_code)
);
-- Semester Table
CREATE TABLE Semester (
    semester_id VARCHAR(3) PRIMARY KEY,
    semester_name VARCHAR(50)
);

-- Registration Type Table
CREATE TABLE RegistrationType (
    registration_type_id INT IDENTITY(1,1) PRIMARY KEY,
    registration_type_name VARCHAR(50)
);

-- Student Status Table
CREATE TABLE StudentStatus (
    status_id INT IDENTITY(1,1) PRIMARY KEY,
    status_name VARCHAR(50)
);

-- Example Data Insertion

-- Faculty Data
INSERT INTO Faculty (faculty_id, faculty_name, faculty_address, faculty_phone, dean_id) VALUES
('F01', 'Engineering Faculty', 'North Campus', '1234567890', 'D001'),
('F02', 'Science Faculty', 'West Campus', '0987654321', 'D002');

-- Department Data
INSERT INTO Department (department_id, department_name, faculty_id, department_head_id) VALUES
('D01', 'Computer Science', 'F01', 'D003'),
('D02', 'Electrical Engineering', 'F01', 'D004'),
('D03', 'Biology', 'F02', 'D005');

-- Position Data
INSERT INTO Position (position_name) VALUES 
('Professor'),
('Associate Professor'),
('Assistant Professor'),
('Lecturer');

-- Faculty Member Data
INSERT INTO FacultyMember (member_id, department_id, position_id, expertise_area) VALUES
('D001', 'D01', 1, 'Artificial Intelligence'),
('D002', 'D02', 2, 'Signal Processing'),
('D003', 'D01', 3, 'Data Science'),
('D004', 'D02', 4, 'Electronics'),
('D005', 'D03', 2, 'Genetics');

-- Course Data
INSERT INTO Course (course_code, course_name, theory_hours, practical_hours, credits, department_id, semester) VALUES
('CSE101', 'Introduction to Programming', 3, 1, 4, 'D01', '1'),
('CSE102', 'Data Structures', 3, 1, 4, 'D01', '2'),
('EEE201', 'Circuit Analysis', 3, 1, 4, 'D02', '1'),
('BIO101', 'General Biology', 3, 1, 4, 'D03', '1');

-- Student Data
INSERT INTO Student (student_id, enrollment_date, status) VALUES
('S123456789', '2023-09-01', 'Active'),
('S987654321', '2022-09-01', 'Graduated'),
('S456789123', '2023-09-01', 'Active');

-- Semester Data
INSERT INTO Semester (semester_id, semester_name) VALUES
('1', 'Fall 2023'),
('2', 'Spring 2024');

-- Registration Type Data
INSERT INTO RegistrationType (registration_type_name) VALUES
('New Enrollment'),
('Returning Student'),
('Transfer Student');

-- Student Status Data
INSERT INTO StudentStatus (status_name) VALUES
('Active'),
('Inactive'),
('Graduated'),
('Suspended');

-- Enrollment Data
INSERT INTO Enrollment (student_id, course_code, semester, grade) VALUES
('S123456789', 'CSE101', '1', 3.5),
('S123456789', 'CSE102', '2', 3.7),
('S987654321', 'EEE201', '1', 3.2),
('S456789123', 'BIO101', '1', 3.9);


-- Faculty Data
INSERT INTO Faculty (faculty_id, faculty_name, faculty_address, faculty_phone, dean_id) VALUES
('F03', 'Business Faculty', 'East Campus', '1122334455', 'D006'),
('F04', 'Arts Faculty', 'South Campus', '5566778899', 'D007');

-- Department Data
INSERT INTO Department (department_id, department_name, faculty_id, department_head_id) VALUES
('D04', 'Economics', 'F03', 'D008'),
('D05', 'Marketing', 'F03', 'D009'),
('D06', 'Fine Arts', 'F04', 'D010');

-- Position Data
INSERT INTO Position (position_name) VALUES 
('Research Assistant'),
('Assistant Dean');

-- Faculty Member Data
INSERT INTO FacultyMember (member_id, department_id, position_id, expertise_area) VALUES
('D006', 'D04', 5, 'Macroeconomics'),
('D007', 'D06', 6, 'Modern Art'),
('D008', 'D04', 1, 'International Trade'),
('D009', 'D05', 4, 'Digital Marketing'),
('D010', 'D06', 2, 'Art History');

-- Additional Course Data
INSERT INTO Course (course_code, course_name, theory_hours, practical_hours, credits, department_id, semester) VALUES
('ECO101', 'Principles of Economics', 3, 1, 4, 'D04', '1'),
('MKT201', 'Introduction to Marketing', 3, 0, 3, 'D05', '1'),
('ART301', 'Art Criticism', 3, 0, 3, 'D06', '2'),
('ART302', 'Sculpture Workshop', 2, 2, 4, 'D06', '2');

-- Additional Student Data
INSERT INTO Student (student_id, enrollment_date, status) VALUES
('S234567890', '2023-09-01', 'Active'),
('S345678901', '2022-09-01', 'Inactive'),
('S456789012', '2021-09-01', 'Graduated'),
('S567890123', '2022-09-01', 'Active');

-- Additional Semester Data
INSERT INTO Semester (semester_id, semester_name) VALUES
('3', 'Summer 2024'),
('4', 'Fall 2024');

-- Additional Registration Type Data
INSERT INTO RegistrationType (registration_type_name) VALUES
('Re-Enrolling Student');


-- Additional Enrollment Data
INSERT INTO Enrollment (student_id, course_code, semester, grade) VALUES
('S123456789', 'ECO101', '1', 3.8),
('S123456789', 'MKT201', '1', 3.5),
('S987654321', 'ART301', '2', 3.1),
('S456789123', 'ART302', '2', 4.0),
('S234567890', 'CSE101', '1', 2.9),
('S345678901', 'BIO101', '1', 3.6),
('S567890123', 'EEE201', '1', 3.4);
