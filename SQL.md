DATABASE
--------
### Data: 
    * Is anything that can be represented as text, number or multimedia(Pictures, sounds and videos, etc .....)
### DataSet: 
    * Is a structured collection of data that contains information of an entity.
### DataBase:
    * Is a system that allows users to store, organise and analyse data. It is an organized collection of data stored in multiple related datasets.
### Table:
    * Is a database object that has a collection of related data entries, where data is organized in rows and columns.
    * Rows are known as records.
    * Columns are known as fields/entity.
### MetaData:
    * Is data about data, it gives the information that what data is stored in a table.
### DataTypes:
    * Data types specify the type of data we are storing or querying.
| Data Type  | Description |
| ---------  | ----------- |
| CHAR(size)      | Fixed length string, it can contain letters, numbers, and special characters. The size parameter specifies the column length of a charector.|
| VARCHAR(size)   | Variable length string, it can contain letters, numbers, and special characters. The size parameter specifies the column length of a charector, takes less space than CHAR. |
| INT       | It used for the integer value. Its range is from -2147483648 to 2147483648 |
| INTEGER   | Same as INT |
| BIGINT    | A large integer. Its range is from -9223372036854775808 to 9223372036854775808 |
| FLOAT(size,d)     | A floating point number. THe total number of digits is specified in size. The number of digits after the decimal point is specified in the d parameter. |
| Double(size,d) | A normal-size floating point number. The total number of digits is specified in size. The number of digits after the decimal point is specified in the d paramater. |
| NUMBER(size,d) | Number can be used instead of integers and decimals |
| DECIMAL(size,d) | Same as NUMBER (,d means number of digits after .) |
| DATE  | It is used to specify data format YYYY-MM-DD |
| TIME  | It is used to specify the time format. Its format is HH:MI:SS or HH24:MI:SS  |
| DATETIME  | It is used to specify data and time combination. Its format is YYYY-MM-DD HH-MI-SS Supported range for DATETIME is '1000-01-01 00:00:00' to '9999-12-31 23:59:59' |
| TIMESTAMP | It is used to specify the timestamp. Supported range is from '1970-01-01 00:00:01' UTC to '2038-01-09 03:14:07' UTC. | 
| BOOLEAN   | Just to indicate True or False, 0 is False, any non-zero is True. |
| Others    | BLOB, CLOB, BINARY, VARBINARY to store multimedia information like Images, Audio and Videos. |

### Operators in SQL
#### SQL Arthimatic Operatos

| Operator  | Description    |
| --------- | -------------- |
| +         | Additon        |
| -         | Subtraction    |
| *         | Multiplication |
| /         | Division       |
| %         | Modulo         |

#### SQL Comparison Operators

| Operator  | Description              |
| --------- | ------------------------ |
| =         | Equal to                 |
| >         | Grater than              |
| <         | Less than                |
| >=        | Greater than or equal to |
| <=        | Less than or equal to    |
| <> or !=  | Not equal to             |

#### SQL Logical Operators

| Operator  | Description              |
| --------- | ------------------------ |
| AND       | TRUE if all the conditions separated by AND is TRUE |
| OR        | TRUE if any of the conditions separated by OR is TRUE |
| NOT       | Displays a record if the conditions(s) is NOT TRUE |
| ALL       | TRUE if all of the subquery values meet the conditions |
| ANY       | TRUE if any of the subquery values meet the conditions |
| IN        | TRUE if the operand is equal to one of a list of expressions |
| LIKE      | TRUE if the operand mathces a pattren | 
| BETWEEN   | TRUE if the operand is witnin the range of comparisons |
| EXISTS    | TRUE if the subquery returns one or more records |

#### SQL Bit-wise Operators

| Operator   | Description              |
| ---------- | ------------------------ |
| &          | Bit-wise AND             |
| \|         | Bit-wise OR              |
| ^          | Bit-wise Exclusive OR    |
| ~          | Bit-wise NOT             |

#### SQL set Operators

| Operator   |
| ---------- |
| UNION      |
| UNION ALL  |
| INTERSECT  |
| MINUS      |

### Types of SQL Statements
* There are 5 types of SQL statements
    1. DDL - Data Definition Language
    2. DML - Data Manupulation Language
    3. DCL - Data Contorl Language
    4. TCL - Transition Control Language
    5. DQL - Data Querry Language

    #### DDL
    * Deals with the definition of database objects, these commands used to create, modify and remove the structure of the database objects like tables, views, functions etc.

        * CREATE, ALTER, DROP & TRUNCATE

    ##### CREATE
    * To create objects in the database like tables, indexes, functions, views, procedures and triggers etc.

        ###### Syntax: 
        * CREATE TABLE table_name (Column1 datatype, column2 datatype ......);
        * CREATE VIEW view_name as SELECT ... FROM tab_name;

    ##### ALTER
    * Used to alter the structure of table like adding new columns, dropping existing column, changing the length or datatype of a column and to rename the table.

        ###### Syntax:
        * ALTER TABLE table_a RENAME TO table_b;
        * ALTER TABLE table_name ADD new_column datatype;
        * ALTER TABLE table_name MODIFY COLUMN column_name;
        * ALTER TABLE tavle_name DROP COLUMN column_name;

    ##### DROP
    * Used to drop database objects like tables, views, functions, procedures, indexes etc.

        ###### Syntax:
        * DROP TABLE table_name; or DROP table_name;
        * DROP VIEW view_name;
        * DROP FUNCTION fun_name;
        * DROP INDEX index_name;

    ##### TRUNCATE
    * It deletes all rows from the taables and we can't rollback the deleted records.

        ###### Syntax:
        * TRUNCATE TABLE table_name;

    > Practise:
    * For practise I used docker container

        ```
        docker run -d -e MYSQL_ROOT_PASSWORD=admin@123 -v mydata:/var/lib/mysql -e MYSQL_DATABASE=customers -e MYSQL_USER=sample_user -e MYSQL_PASSWORD=admin@123 --name mysql mysql:8.0
        docker exec -it mysql mysql -u sample_user -p
        ``` 
