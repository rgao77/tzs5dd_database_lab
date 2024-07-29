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

