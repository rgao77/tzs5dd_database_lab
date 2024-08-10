-- SQL Queries

-- 1) Which courses are currently included (active) in the program? Include the course mnemonic and course name for each.
SELECT mnemonic, course_name
FROM Courses
WHERE active = TRUE;

-- 2) Which courses were included in the program, but are no longer active? Include the course mnemonic and course name for each.
SELECT mnemonic, course_name
FROM Courses
WHERE active = FALSE;

-- 3) Which instructors are not current employees?
SELECT name
FROM Instructors
WHERE active = FALSE;

-- 4) For each course (active and inactive), how many learning outcomes are there?
SELECT c.mnemonic, c.course_name, COUNT(lo.lo_id) AS num_learning_outcomes
FROM Courses c
LEFT JOIN LearningOutcomes lo ON c.course_id = lo.course_id
GROUP BY c.mnemonic, c.course_name;

-- 5) Are there any courses with no learning outcomes? If so, provide their mnemonics and names.
SELECT c.mnemonic, c.course_name
FROM Courses c
LEFT JOIN LearningOutcomes lo ON c.course_id = lo.course_id
WHERE lo.lo_id IS NULL;

-- 6) Which courses include SQL as a learning outcome? Include the learning outcome descriptions, course mnemonics, and course names in your solution.
SELECT lo.description, c.mnemonic, c.course_name
FROM LearningOutcomes lo
JOIN Courses c ON lo.course_id = c.course_id
WHERE lo.description ILIKE '%SQL%';

-- 7) Who taught course ds5100 in Summer 2021?
SELECT i.name
FROM InstructorAssignments ia
JOIN Instructors i ON ia.instructor_id = i.instructor_id
JOIN Courses c ON ia.course_id = c.course_id
JOIN Terms t ON ia.term_id = t.term_id
WHERE c.mnemonic = 'ds5100' AND t.term_name = 'Summer2021';

-- 8) Which instructors taught in Fall 2021? Order their names alphabetically, making sure the names are unique.
SELECT DISTINCT i.name
FROM InstructorAssignments ia
JOIN Instructors i ON ia.instructor_id = i.instructor_id
JOIN Terms t ON ia.term_id = t.term_id
WHERE t.term_name = 'Fall2021'
ORDER BY i.name;

-- 9) How many courses did each instructor teach in each term? Order your results by term and then instructor.
SELECT t.term_name, i.name, COUNT(ia.course_id) AS num_courses
FROM InstructorAssignments ia
JOIN Instructors i ON ia.instructor_id = i.instructor_id
JOIN Terms t ON ia.term_id = t.term_id
GROUP BY t.term_name, i.name
ORDER BY t.term_name, i.name;

-- 10a) Which courses had more than one instructor for the same term? Provide the mnemonic and term for each.
SELECT c.mnemonic, t.term_name
FROM InstructorAssignments ia
JOIN Courses c ON ia.course_id = c.course_id
JOIN Terms t ON ia.term_id = t.term_id
GROUP BY c.mnemonic, t.term_name
HAVING COUNT(ia.instructor_id) > 1;

-- 10b) For courses with multiple sections, provide the term, course mnemonic, and instructor name for each. Hint: You can use your result from 10a in a subquery or WITH clause.
WITH MultiInstructorCourses AS (
    SELECT c.course_id, c.mnemonic, t.term_name
    FROM InstructorAssignments ia
    JOIN Courses c ON ia.course_id = c.course_id
    JOIN Terms t ON ia.term_id = t.term_id
    GROUP BY c.course_id, c.mnemonic, t.term_name
    HAVING COUNT(ia.instructor_id) > 1
)
SELECT t.term_name, c.mnemonic, i.name
FROM InstructorAssignments ia
JOIN Instructors i ON ia.instructor_id = i.instructor_id
JOIN Courses c ON ia.course_id = c.course_id
JOIN Terms t ON ia.term_id = t.term_id
JOIN MultiInstructorCourses mic ON mic.course_id = c.course_id AND mic.term_name = t.term_name
ORDER BY t.term_name, c.mnemonic, i.name;
