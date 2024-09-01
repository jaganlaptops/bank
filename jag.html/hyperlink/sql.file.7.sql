#1. CREATE TABLE STUDENTS
CREATE TABLE Students(
student_id INT NOT NULL,
first_name VARCHAR(50),
last_name VARCHAR(100),
age INT CHECK(age<=18),
PRIMARY KEY(student_id)
);

#2. CREATE TABLE COURSES
CREATE TABLE Courses(
course_id INT NOT NULL,
course_name VARCHAR(100),
student_id INT,
PRIMARY KEY(course_id),
FOREIGN KEY(student_id) REFERENCES students(student_id)
);

#3. ADD UNIQUE CONSTRAINTS
ALTER TABLE STUDENTS
ADD CONSTRAINT STUDENT_NAME UNIQUE(first_name,last_name);

ALTER TABLE STUDENTS auto_increment=10000;

#4. ADD A COLUMN AND CONSTRAINT IN COURSES TABLE
ALTER TABLE courses
ADD COLUMN course_duration int check(course_duration between 1 and 12);

#5. REMOVE UNQUE CONSTRAINT
ALTER TABLE STUDENTS
DROP CONSTRAINT student_name;

#6. DISABLE AND ENABLE FOREIGN KEY
ALTER TABLE COURSES
DROP FOREIGN KEY courses_ibfk_1;

ALTER TABLE COURSES
ADD FOREIGN KEY(student_id) REFERENCES STUDENTS(student_id);
