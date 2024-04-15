### Excersice:      
* Creating a `april` table in `customers` database with fields and datatypes.
  ```sql
  CREATE TABLE customers.april (customerId INT, customerName VARCHAR(255), phoneNumber INT, landmard VARCHAR(255), zipCode INT);
  ```
* Changing `landMard` field into `landMark` in `april` table.
  ```sql
  ALTER TABLE customers.april CHANGE landMard landMark VARCHAR (255);
  ```
* Modifying datatype of `phoneNumber` from `INT` to `BIGINT`.
  ```sql
  ALTER TABLE customers.april MODIFY phoneNumber BIGINT;
  ```
* Inserting data into fields
  ```sql
  INSERT INTO customers.april (customerId, customerName, phoneNumber, landMark, zipCode) VALUES (1, 'VENKATESH', 9999999999, 'KOPARKHIRANE', 520001);
  ```
* To see the data in the table
  ```sql
  SELECT * FROM customers.april;
  DESC TABLE customers.april;
  ```
* To rename a table
  ```sql
  ALTER TABLE customers.april RENAME TO customers.march;
  ```
* Adding newfield to table 
  ```sql
  ALTER TABLE customers.march ADD COLUMN location VARCHAR(30);
  ```
* Adding data into `location` field
  ```sql
  INSERT INTO customers.march (location) VALUES ('NAVI MUMBAI');
  ```
* But the querry created new row insted adding the data into first row, to add the data into first row.
  ```sql
  UPDATE customers.march SET location = 'NAVI MUMBAI' WHERE customerId = 1;
  ```
* To remove second record
  ```sql
  DELETE FROM customers.march WHERE customerId IS NULL;
  ```
