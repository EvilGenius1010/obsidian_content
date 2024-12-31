- Represents attributes of a database.


## Candidate Key

- Refers to a group of attributes which can be used to uniquely identify all records in a table.
- Any one of these is selected to be the primary key of the table.

| ID    | Name | Aadhar No    | Roll Number |
| ----- | ---- | ------------ | ----------- |
| 12389 | HK   | 920384761537 | 31          |
- Here, any one of ID, Aadhar No and Roll Number can be used to uniquely identify data in the 


## Primary Key

- Uniquely identifies records in a table.
- Is always **UNIQUE AND NOT NULL**..



## Foreign Key

- Field which acts as a primary key in another table.
	Used to establish links between two tables.


## Super Key

- It is a set of attributes that uniquely identifies a tuple (row) in a relation (table).



### Difference between Super and Candidate Keys

Consider a table `Students` with attributes `StudentID`, `Name`, `Email`, and `Phone`.

- **Super Keys:**
    - `{StudentID}`
    - `{Email}`
    - `{StudentID, Name}`
    - `{StudentID, Email, Phone}`
- **Candidate Keys:**
    - `{StudentID}`
    - `{Email}`


