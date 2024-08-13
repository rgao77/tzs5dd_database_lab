### (1 PT) Which courses are currently included (active) in the program? Include the course mnemonic and course name for each.

MNEMONIC,NAME
ds_biz_anaytics,Business Analytics for Data Scientists
ds_tech_bootcamp,Technical Bootcamp
ds5001,Exploratory Text Analytics
ds5012,Foundations of Computer Science
ds5100,Programming for Data Science
ds5110,Big Data Systems
ds6001,Practice and Application of Data Science
ds6002,Big Data Ethics
ds6011,Data Science Capstone Project Work I
ds6013,Data Science Capstone Project Work II
ds6030,Statistical Learning
ds6040,Bayesian Machine Learning
ds6050,Deep Learning
sarc5400,Data Visualization
stat6021,Linear Models for Data Science

### 2) (1 PT) Which courses were included in the program, but are no longer active? Include the course mnemonic and course name for each.

MNEMONIC,NAME
ds6003,Practice and Application of Data Science Part 2
ds6012,Big Data Ethics Part 2

### 3) (1 PT) Which instructors are not current employees?
INSTRUCTOR
Jeremy Bolton
Luis Felipe Rosado Murillo

### 4) (1 PT) For each course (active and inactive), how many learning outcomes are there?

MNEMONIC,NAME,LEARNING_OUTCOME_COUNT
ds5001,Exploratory Text Analytics,8
ds5012,Foundations of Computer Science,0
ds5100,Programming for Data Science,34
ds5110,Big Data Systems,37
ds6001,Practice and Application of Data Science,10
ds6002,Big Data Ethics,2
ds6003,Practice and Application of Data Science Part 2,3
ds6011,Data Science Capstone Project Work I,4
ds6012,Big Data Ethics Part 2,2
ds6013,Data Science Capstone Project Work II,4
ds6030,Statistical Learning,19
ds6040,Bayesian Machine Learning,37
ds6050,Deep Learning,24
ds_biz_anaytics,Business Analytics for Data Scientists,0
ds_tech_bootcamp,Technical Bootcamp,15
sarc5400,Data Visualization,0
stat6021,Linear Models for Data Science,13


### 5) (2 PTS) Are there any courses with no learning outcomes? If so, provide their mnemonics and names.

MNEMONIC,NAME,LEARNING_OUTCOME_COUNT
ds5012,Foundations of Computer Science,0
ds_biz_anaytics,Business Analytics for Data Scientists,0
sarc5400,Data Visualization,0


### 6) (2 PTS) Which courses include SQL as a learning outcome? Include the learning outcome descriptions, course mnemonics, and course names in your solution.

MNEMONIC,NAME,LEARNING_OUTCOME
ds5110,Big Data Systems,Apply Spark SQL to data analysis tasks
ds6001,Practice and Application of Data Science,Understand the purpose, typology, and language of NoSQL databases
ds6001,Practice and Application of Data Science,Understand how to implement databases Python: SQLite, PostgreSQL, MySQL, MongoDB
ds6001,Practice and Application of Data Science,Understand how to query databases with SQL


### 7) (1 PT) Who taught course ds5100 in Summer 2021?
INSTRUCTOR
Nada Basit

### 8) (1 PT) Which instructors taught in Fall 2021? Order their names alphabetically, making sure the names are unique.

INSTRUCTOR_NAME
Abbas Kazemipour
Adam Tashman
Bill Basener
Cait Dreisbach
Eric Tassone
Jeffrey Woo
Jeremy Bolton
Judy Fox
Lei Xie
Marc Ruggiano
Pete Alonzi
Peter Gedeck
Raf Alvarado
Renee Cummings
Sree Mallikarjun
Stephen Baek
Teague Henry

### 9) (1 PT) How many courses did each instructor teach in each term? Order your results by term and then instructor.

SEMESTER,INSTRUCTOR,COURSE_COUNT
FALL2021,Adam Tashman,1
FALL2021,Bill Basener,2
FALL2021,Eric Tassone,1
FALL2021,Jeffrey Woo,1
FALL2021,Jeremy Bolton,1
FALL2021,Jeremy Bolton, Peter Gedeck, Eric Tassone, Abbas Kazemipour, Cait Dreisbach, Lei Xie,1
FALL2021,Judy Fox,1
FALL2021,Marc Ruggiano,1
FALL2021,Pete Alonzi,1
FALL2021,Raf Alvarado & Teague Henry,1
FALL2021,Renee Cummings,1
FALL2021,Sree Mallikarjun,1
FALL2021,Stephen Baek,1
SPRING2021,Adam Tashman,1
SPRING2021,Bill Basener,1
SPRING2021,Eric Field,1
SPRING2021,Jason Williamson,1
SPRING2021,Jeffrey Woo,1
SPRING2021,Jon Kropko,2
SPRING2021,Judy Fox,1
SPRING2021,Luis Felipe Rosado Murillo,2
SPRING2021,Mike Porter,1
SPRING2021,Panagiotis Apostolellis,1
SPRING2021,Pete Alonzi,1
SPRING2021,Raf Alvarado,1
SPRING2021,Rich Nguyen,1
SPRING2021,Sree Mallikarjun,1
SUMMER2021,Adam Tashman,1
SUMMER2021,Jason Williamson,1
SUMMER2021,Jeffrey Woo,1
SUMMER2021,Jeremy Bolton,1
SUMMER2021,Jon Kropko,1
SUMMER2021,Nada Basit,1
SUMMER2021,Pete Alonzi,1
SUMMER2021,Peter Gedeck,1
SUMMER2021,Raf Alvarado,1
SUMMER2021,Raf Alvarado & Teague Henry,1
SUMMER2021,Renee Cummings,2
SUMMER2021,Rich Nguyen,1
SUMMER2021,Sree Mallikarjun,1
SUMMER2021,Teague Henry,1

### 10a) (2 PTS) Which courses had more than one instructor for the same term? Provide the mnemonic and term for each. Note this occurs in courses with multiple sections.

MNEMONIC,SEMESTER
ds6011,FALL2021
ds6013,FALL2021
ds6011,SUMMER2021

### 10b) (1 PT) For courses with multiple sections, provide the term, course mnemonic, and instructor name for each. Hint: You can use your result from 10a in a subquery or WITH clause.

SEMESTER,MNEMONIC,INSTRUCTOR
FALL2021,ds6011,Jeremy Bolton, Peter Gedeck, Eric Tassone, Abbas Kazemipour, Cait Dreisbach, Lei Xie
FALL2021,ds6013,Raf Alvarado & Teague Henry
SUMMER2021,ds6011,Raf Alvarado & Teague Henry

