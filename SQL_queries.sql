### 1) Active Courses
SELECT mnemonic, course_name 
FROM Courses 
WHERE active = TRUE;

### 2) Inactive Courses
SELECT mnemonic, course_name 
FROM Courses 
WHERE active = FALSE;

### 3) Inactive Instructors
SELECT name 
FROM Instructors 
WHERE active = FALSE;

### 4) Learning Outcomes Per Course
SELECT c.course_name, COUNT(lo.lo_id) AS num_learning_outcomes
FROM Courses c
JOIN LearningOutcomes lo ON c.course_id = lo.course_id
GROUP BY c.course_name;

### 5) Courses Without Learning Outcomes
SELECT c.mnemonic, c.course_name
FROM Courses c
LEFT JOIN LearningOutcomes lo ON c.course_id = lo.course_id
GROUP BY c.mnemonic, c.course_name
HAVING COUNT(lo.lo_id) = 0;

### 6) Courses with SQL in Learning Outcomes
SELECT c.mnemonic, c.course_name, lo.description
FROM Courses c
JOIN LearningOutcomes lo ON c.course_id = lo.course_id
WHERE lo.description LIKE '%SQL%';

### 7) Instructor for ds5100 in Summer 2021
SELECT i.name
FROM Instructors i
JOIN InstructorAssignments ia ON i.instructor_id = ia.instructor_id
JOIN Terms t ON ia.term_id = t.term_id
WHERE ia.course_id = (SELECT course_id FROM Courses WHERE mnemonic = 'ds5100')
  AND t.term_name = 'Summer2021';

### 8) Instructors in Fall 2021
SELECT DISTINCT i.name
FROM Instructors i
JOIN InstructorAssignments ia ON i.instructor_id = ia.instructor_id
JOIN Terms t ON ia.term_id = t.term_id
WHERE t.term_name = 'Fall2021'
ORDER BY i.name ASC;

### 9) Course Teaching Load by Instructor and Term
SELECT i.name, t.term_name, COUNT(ia.course_id) AS num_courses
FROM Instructors i
JOIN InstructorAssignments ia ON i.instructor_id = ia.instructor_id
JOIN Terms t ON ia.term_id = t.term_id
GROUP BY i.name, t.term_name
ORDER BY t.term_name, i.name;

### 10a) Courses with Multiple Instructors in Same Term
SELECT c.mnemonic, t.term_name
FROM Courses c
JOIN InstructorAssignments ia ON c.course_id = ia.course_id
JOIN Terms t ON ia.term_id = t.term_id
GROUP BY c.mnemonic, t.term_name
HAVING COUNT(DISTINCT ia.instructor_id) > 1;

### 10b) Detail for Multiple Sections
WITH MultipleInstructors AS (
  SELECT c.course_id, t.term_id
  FROM Courses c
  JOIN InstructorAssignments ia ON c.course_id = ia.course_id
  JOIN Terms t ON ia.term_id = t.term_id
  GROUP BY c.course_id, t.term_id
  HAVING COUNT(DISTINCT ia.instructor_id) > 1
)
SELECT t.term_name, c.mnemonic, i.name
FROM MultipleInstructors mi
JOIN InstructorAssignments ia ON mi.course_id = ia.course_id AND mi.term_id = ia.term_id
JOIN Courses c ON ia.course_id = c.course_id
JOIN Terms t ON ia.term_id = t.term_id
JOIN Instructors i ON ia.instructor_id = i.instructor_id;











