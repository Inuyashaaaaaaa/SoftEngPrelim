-- query # 1
SELECT 
    Students.student_firstname, 
    Students.student_lastname, 
    Program.program_name
FROM 
    Students
JOIN 
    Program ON Students.program_id = Program.program_id;


-- query # 2
SELECT 
    Students.student_firstname, 
    Students.student_lastname, 
    SUM(StudentTransaction.transaction_amount) AS total_amount
FROM 
    Students
JOIN 
    StudentTransaction ON Students.student_id = StudentTransaction.student_id
GROUP BY 
    Students.student_id, 
    Students.student_firstname, 
    Students.student_lastname;

-- query # 3
SELECT 
    Students.student_firstname, 
    Students.student_lastname
FROM 
    Students
JOIN 
    Program ON Students.program_id = Program.program_id
WHERE 
    Program.program_name = 'Engineering'

UNION SELECT 
    Students.student_firstname, 
    Students.student_lastname
FROM 
    Students
JOIN 
    Grades ON Students.student_id = Grades.student_id
WHERE 
    Grades.computed_grade >= 90;
