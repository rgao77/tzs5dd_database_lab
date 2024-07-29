## Design Questions

### 1. What tables should you build?
- Courses: To store information about each course.
- LearningOutcomes: To store the learning outcomes for each course.
- Instructors: To store information about instructors.
- Terms: To store information about the academic terms.
- InstructorAssignments: To store the assignments of instructors to courses for specific terms and years.

### 2. For each table, what field(s) will you use for primary key?
- Courses: `course_id`
- LearningOutcomes: `lo_id`
- Instructors: `instructor_id`
- Terms: `term_id`
- InstructorAssignments: `assignment_id`

### 3. For each table, what foreign keys will you use?
- Courses: No foreign keys are needed for this table.
- LearningOutcomes: `course_id` (foreign key referencing `Courses.course_id`)
- Instructors: No foreign keys are needed for this table.
- Terms: No foreign keys are needed for this table.
- InstructorAssignments: `course_id` (foreign key referencing `Courses.course_id`),
                         `instructor_id` (foreign key referencing `Instructors.instructor_id`),
                         `term_id` (foreign key referencing `Terms.term_id`)

### 4. Learning outcomes, courses, and instructors need a flag to indicate if they are currently active or not. How will your database support this feature? 

- To support the feature of flagging learning outcomes, courses, and instructors as active or inactive, we can include a boolean field called active in the relevant tables. 

- The active field in the Courses, LearningOutcomes, and Instructors tables ensures that each record can be flagged as active or inactive.
This approach allows easy tracking of the current status of courses, learning outcomes, and instructors.

### 5. Is there anything to normalize in the database, and if so, how will you normalize it?

- Each table has a primary key, and all attributes contain atomic values.
- All non-key attributes are fully functional dependent on the primary key.
- There are no transitive dependencies among the non-key attributes.

### 6. Are there indexes that you should build? Explain your reasoning.
- Indexes should be built on the primary keys and any foreign keys to improve query performance. Specifically:
  - Primary Keys: Indexes on `course_id`, `lo_id`, `instructor_id`, `term_id`, and `assignment_id`.
  - Foreign Keys: Indexes on `LearningOutcomes.course_id`, `InstructorAssignments.course_id`, `InstructorAssignments.instructor_id`, and `InstructorAssignments.term_id`.

### 7. Are there constraints to enforce? Explain your answer and strategy.
- Foreign key constraints to ensure referential integrity.
- Check constraints on the `active` fields to ensure they can only contain boolean values.
- Unique constraints on fields like `course_id` and `instructor_id` to prevent duplicate entries.
- Ensuring learning outcomes are only added for valid courses and instructors assigned to valid courses.

### 8. Relational Model
# Database Diagram

```mermaid
erDiagram
    Courses {
        INT course_id PK
        VARCHAR mnemonic
        VARCHAR course_name
        TEXT description_short
        BOOLEAN active
    }
    LearningOutcomes {
        INT lo_id PK
        INT course_id FK
        TEXT description
        BOOLEAN active
    }
    Instructors {
        INT instructor_id PK
        VARCHAR name
        VARCHAR email
        BOOLEAN active
    }
    Terms {
        INT term_id PK
        VARCHAR term_name
    }
    InstructorAssignments {
        INT assignment_id PK
        INT course_id FK
        INT instructor_id FK
        INT term_id FK
        INT year
    }

    Courses ||--o{ LearningOutcomes : "has"
    Courses ||--o{ InstructorAssignments : "is assigned"
    Instructors ||--o{ InstructorAssignments : "is assigned"
    Terms ||--o{ InstructorAssignments : "is part of"



### 9. Support for UVA SDS Residential MSDS Program
- To support the UVA SDS Residential MSDS Program, we might need to add fields to indicate the program type (Online or Residential) in the `Courses` table. Additionally, data specific to residential programs might be needed, such as physical classroom locations or residential program-specific learning outcomes.

