
[[Data Models]]

[[SQL]]



### Links

1. https://www.youtube.com/watch?v=_bm72LXd6lE&list=PLrL_PSQ6q063x8ssXJKYNNQ68k8jxbqF0&index=3
2. https://www.geeksforgeeks.org/basic-object-oriented-data-model/
3. https://www.geeksforgeeks.org/sql-ddl-dql-dml-dcl-tcl-commands/#tcl-transaction-control-language

# Essential Components of a Table

- **Rows** -> Also called as records or tuples.
	Number of Rows in a table is called as **cardinality**.
- **Columns** -> They represent the attributes of data being stored. For example, "ID" or "Age" etc.
	Number of Columns in a table is called as Degree.

## Constraints

- Specify the common rules which need to be followed by the records of the table. Some include
	1. **UNIQUE** - Values have to be unique across a single column ie all values in a column must be different.
	2. **NOT NULL** - Values cannot be empty for a column.
	3. **DEFAULT** - Specifies default value for a column if not specified.
	4. **CHECK** - Checks if a specific constraint is enforced on each row.

#### Keys
- **PRIMARY KEY** - Unique identifier for all records of a table.
- **FOREIGN KEY** - Reference to the primary key of another table.



## Intensions and Extensions of Tables

**Intensions**
- Defines what kind of data can be stored in a database and the relationships which are between them. It includes -
	1. Table Definitions
	2. Constraints
	3. Relationships between tables.

**Extensions**
- The actual data stored in the database at a particular instance of time.

>[!NOTE]  Extensions can keep changing for a database while intensions more or less remain same.



[[Normalisation and Denormalisation]]

[[Keys ]]