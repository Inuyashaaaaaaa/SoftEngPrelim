DROP TABLE Customers;
DROP TABLE Orders;
DROP TABLE Shippings;


CREATE TABLE Program (
  program_id INTEGER PRIMARY KEY,
  program_name VARCHAR(255) NOT NULL,
  program_description VARCHAR(255),
  number_of_enrollees INT
);


CREATE TABLE Students (
  student_id INTEGER PRIMARY KEY,
  student_lastname VARCHAR(255) NOT NULL,
  student_firstname VARCHAR(255) NOT NULL,
  program_id INTEGER,
  date_of_birth DATE,
  email VARCHAR(255),
  is_fully_paid BOOLEAN,
  FOREIGN KEY (program_id) REFERENCES Program(program_id)
);

CREATE TABLE Faculty (
  faculty_id INTEGER PRIMARY KEY,
  faculty_fullname VARCHAR(255) NOT NULL,
  faculty_lastname VARCHAR(255),
  faculty_firstname VARCHAR(255),
  program_id INTEGER,
  FOREIGN KEY (program_id) REFERENCES Program(program_id)
);


CREATE TABLE Subjects (
  subject_id INTEGER PRIMARY KEY,
  program_id INTEGER,
  subject_name VARCHAR(255) NOT NULL,
  faculty_id INTEGER,
  is_majorsubj BOOLEAN,
  FOREIGN KEY (program_id) REFERENCES Program(program_id),
  FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
);

CREATE TABLE Grades (
  grade_id INTEGER PRIMARY KEY,
  student_id INTEGER,
  program_id INTEGER,
  subject_id INTEGER,
  faculty_id INTEGER,
  computed_grade FLOAT,
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (program_id) REFERENCES Program(program_id),
  FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id),
  FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
);


CREATE TABLE StudentTransaction (
  transaction_id INTEGER PRIMARY KEY,
  student_id INTEGER,
  transaction_purpose VARCHAR(255),
  transaction_amount FLOAT,
  FOREIGN KEY (student_id) REFERENCES Students(student_id)
);


CREATE TABLE RegistrarRecord (
  record_id INTEGER PRIMARY KEY,
  student_id INTEGER,
  record_type VARCHAR(255),
  is_record_cleared BOOLEAN,
  FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Program (program_id, program_name, program_description, number_of_enrollees) VALUES
(1, 'Computer Science', 'Study of computer systems and computing concepts', 200),
(2, 'Information Technology', 'Focus on the implementation and management of computer-based information systems', 150),
(3, 'Mechanical Engineering', 'Study of mechanics, dynamics, thermodynamics, materials science', 100),
(4, 'Business Administration', 'Principles of business management, operations, and strategy', 180);

INSERT INTO Students (student_id, student_lastname, student_firstname, program_id, date_of_birth, email, is_fully_paid) VALUES
(1, 'Smith', 'John', 3, '2000-06-15', 'john.smith@example.com', TRUE),
(2, 'Doe', 'Jane', 1, '1999-11-22', 'jane.doe@example.com', FALSE),
(3, 'Brown', 'Michael', 2, '2001-02-07', 'michael.brown@example.com', TRUE),
(4, 'Taylor', 'Emily', 4, '2000-08-19', 'emily.taylor@example.com', FALSE),
(5, 'Johnson', 'Chris', 3, '2002-03-30', 'chris.johnson@example.com', TRUE),
(6, 'Miller', 'Sarah', 2, '1998-07-14', 'sarah.miller@example.com', FALSE),
(7, 'Davis', 'David', 4, '2000-12-25', 'david.davis@example.com', TRUE),
(8, 'Garcia', 'Sophia', 1, '2001-04-18', 'sophia.garcia@example.com', TRUE),
(9, 'Martinez', 'James', 3, '1999-10-12', 'james.martinez@example.com', FALSE),
(10, 'Rodriguez', 'Olivia', 2, '1997-01-23', 'olivia.rodriguez@example.com', TRUE),
(11, 'Wilson', 'Daniel', 4, '2003-02-15', 'daniel.wilson@example.com', FALSE),
(12, 'Anderson', 'Ella', 1, '2000-05-10', 'ella.anderson@example.com', TRUE),
(13, 'Thomas', 'Alex', 3, '2001-09-09', 'alex.thomas@example.com', TRUE),
(14, 'Jackson', 'Mia', 2, '1998-11-03', 'mia.jackson@example.com', FALSE),
(15, 'White', 'Henry', 1, '2002-08-17', 'henry.white@example.com', TRUE),
(16, 'Harris', 'Grace', 4, '2000-07-27', 'grace.harris@example.com', FALSE),
(17, 'Clark', 'Liam', 1, '1999-02-19', 'liam.clark@example.com', TRUE),
(18, 'Lewis', 'Ava', 2, '2001-12-05', 'ava.lewis@example.com', TRUE),
(19, 'Robinson', 'Benjamin', 3, '2000-06-24', 'benjamin.robinson@example.com', FALSE),
(20, 'Walker', 'Charlotte', 4, '1998-03-13', 'charlotte.walker@example.com', TRUE);

INSERT INTO Faculty (faculty_id, faculty_fullname, faculty_lastname, faculty_firstname, program_id) VALUES
(1, 'Dr. Alice Johnson', 'Johnson', 'Alice', 2),
(2, 'Dr. Bob Brown', 'Brown', 'Bob', 1),
(3, 'Prof. Charlie Davis', 'Davis', 'Charlie', 3),
(4, 'Prof. Diane Evans', 'Evans', 'Diane', 4),
(5, 'Dr. Frank Green', 'Green', 'Frank', 2),
(6, 'Dr. Grace Hall', 'Hall', 'Grace', 1),
(7, 'Prof. Isaac King', 'King', 'Isaac', 4),
(8, 'Prof. Jenna Lee', 'Lee', 'Jenna', 3),
(9, 'Dr. Karen Moore', 'Moore', 'Karen', 1),
(10, 'Dr. Larry Nelson', 'Nelson', 'Larry', 3),
(11, 'Prof. Maria Ortiz', 'Ortiz', 'Maria', 2),
(12, 'Prof. Nancy Perez', 'Perez', 'Nancy', 4),
(13, 'Dr. Olivia Quinn', 'Quinn', 'Olivia', 2),
(14, 'Dr. Peter Reed', 'Reed', 'Peter', 1),
(15, 'Prof. Samuel Scott', 'Scott', 'Samuel', 3),
(16, 'Prof. Tina Turner', 'Turner', 'Tina', 4),
(17, 'Dr. Victor White', 'White', 'Victor', 1),
(18, 'Dr. Wendy Young', 'Young', 'Wendy', 3),
(19, 'Prof. Xavier Adams', 'Adams', 'Xavier', 2),
(20, 'Prof. Zoe Baker', 'Baker', 'Zoe', 4);

INSERT INTO Subjects (subject_id, program_id, subject_name, faculty_id, is_majorsubj) VALUES
(1, 1, 'Data Structures', 2, TRUE),
(2, 2, 'Networking', 5, TRUE),
(3, 3, 'Thermodynamics', 3, TRUE),
(4, 4, 'Marketing 101', 12, FALSE),
(5, 1, 'Algorithms', 9, TRUE),
(6, 2, 'Database Systems', 13, TRUE),
(7, 3, 'Dynamics', 8, FALSE),
(8, 4, 'Financial Accounting', 16, TRUE),
(9, 1, 'Operating Systems', 17, TRUE),
(10, 2, 'Computer Security', 1, FALSE),
(11, 3, 'Material Science', 10, TRUE),
(12, 4, 'Business Ethics', 4, FALSE),
(13, 1, 'Software Engineering', 6, TRUE),
(14, 2, 'Web Development', 19, TRUE),
(15, 3, 'Control Systems', 7, TRUE),
(16, 4, 'Organizational Behavior', 16, TRUE),
(17, 1, 'Machine Learning', 9, FALSE),
(18, 2, 'Cloud Computing', 14, FALSE),
(19, 3, 'Fluid Mechanics', 15, TRUE),
(20, 4, 'Operations Management', 20, TRUE);

INSERT INTO Grades (grade_id, student_id, program_id, subject_id, faculty_id, computed_grade) VALUES
(1, 8, 1, 1, 2, 89.5),
(2, 3, 2, 2, 5, 92.0),
(3, 9, 3, 3, 3, 85.0),
(4, 7, 4, 4, 12, 78.5),
(5, 11, 1, 5, 9, 88.0),
(6, 14, 2, 6, 13, 90.5),
(7, 1, 3, 7, 8, 75.0),
(8, 19, 3, 7, 7, 82.5),
(9, 5, 4, 8, 16, 84.0),
(10, 12, 2, 10, 1, 76.0),
(11, 18, 1, 11, 10, 93.5),
(12, 4, 4, 12, 4, 79.0),
(13, 16, 3, 13, 6, 91.0),
(14, 15, 2, 14, 19, 80.5),
(15, 2, 3, 15, 7, 83.0),
(16, 10, 1, 16, 16, 86.5),
(17, 20, 1, 17, 9, 87.0),
(18, 17, 2, 18, 14, 89.0),
(19, 6, 3, 19, 15, 88.5),
(20, 13, 4, 20, 20, 85.5);

INSERT INTO StudentTransaction (transaction_id, student_id, transaction_purpose, transaction_amount) VALUES
(1, 16, 'Tuition Fee', 1000.00),
(2, 7, 'Library Fee', 50.00),
(3, 13, 'Lab Fee', 150.00),
(4, 19, 'Sports Fee', 75.00),
(5, 2, 'Tuition Fee', 1200.00),
(6, 10, 'Exam Fee', 100.00),
(7, 5, 'Tuition Fee', 1100.00),
(8, 14, 'Cultural Fee', 60.00),
(9, 4, 'Tuition Fee', 1300.00),
(10, 8, 'Exam Fee', 90.00),
(11, 20, 'Lab Fee', 200.00),
(12, 1, 'Library Fee', 40.00),
(13, 11, 'Tuition Fee', 1400.00),
(14, 3, 'Sports Fee', 80.00),
(15, 17, 'Lab Fee', 160.00),
(16, 9, 'Cultural Fee', 70.00),
(17, 15, 'Exam Fee', 110.00),
(18, 6, 'Tuition Fee', 1250.00),
(19, 12, 'Library Fee', 55.00),
(20, 18, 'Lab Fee', 180.00);

INSERT INTO RegistrarRecord (record_id, student_id, record_type, is_record_cleared) VALUES
(1, 4, 'Birth Certificate', TRUE),
(2, 8, 'Birth Certificate', FALSE),
(3, 15, 'Birth Certificate', TRUE),
(4, 2, 'Birth Certificate', TRUE),
(5, 13, 'Birth Certificate', FALSE),
(6, 9, 'Birth Certificate', TRUE),
(7, 6, 'Birth Certificate', FALSE),
(8, 17, 'Birth Certificate', TRUE),
(9, 10, 'Birth Certificate', FALSE),
(10, 1, 'Birth Certificate', TRUE),
(11, 11, 'Birth Certificate', TRUE),
(12, 14, 'Birth Certificate', FALSE),
(13, 19, 'Birth Certificate', TRUE),
(14, 5, 'Birth Certificate', TRUE),
(15, 16, 'Birth Certificate', FALSE),
(16, 20, 'Birth Certificate', TRUE),
(17, 7, 'Birth Certificate', TRUE),
(18, 18, 'Birth Certificate', FALSE),
(19, 3, 'Birth Certificate', TRUE),
(20, 12, 'Birth Certificate', TRUE);


