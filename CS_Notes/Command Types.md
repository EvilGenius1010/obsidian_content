- SQL Commands are divided into different categories based on functionalities.


### Data Query Language(DQL) Commands

- Used to retrieve data from DB.
- `SELECT`


#### `SELECT`
- `SELECT` COL1,COL2 `FROM` TABLENAME is used to pull certain columns.
- `SELECT * FROM` TABLENAME used to pull all data.

### Data Manipulation Language(DML) Commands

- Used to change data stored in DB.
- Commands: `INSERT,DELETE,UPDATE`

### Data Definition Language(DDL) Commands

- Used to define and/or change the structure/schema of DB.
- Commands: `CREATE,ALTER,DROP,TRUNCATE,RENAME`

#### `ALTER`
- `ALTER` is a command used to change the schema.

**`Examples`**
1. `ADD a column`
	1. `ALTER TABLE` TABLENAME
	   `ADD` COLNAME DATATYPE CONSTRAINT
	   ``` ```
1. `DROP A COLUMN`
	1.  `ALTER TABLE` TABLENAME
	   `ADD` COLNAME DATATYPE CONSTRAINT

### Data Control Language(DCL) Commands

- Used to change permissions for certain users accessing the DB.
- Commands: `GRANT,REVOKE`

### Transaction Control Language(TCL) Commands
- Used to manage transactions within a database.
- Commands: `COMMIT,ROLLBACK,SAVEPOINT`

