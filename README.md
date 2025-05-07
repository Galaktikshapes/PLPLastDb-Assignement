# PLPLastDb-Assignement
PLP Last DB assignment 


# Library Management System

## Description
This project is a simple **Library Management System** built using MySQL. It helps to manage books, members, authors, categories, and book loans in a library.

## Features
- Add and manage books, authors, and categories.
- Keep track of library members.
- Manage book loans and returns.
- Supports basic operations like adding books, borrowing, and returning books.

## How to Run/Setup the Project

1. **Set up MySQL Database:**
   - Make sure you have MySQL installed on your local machine.
   - Create a new database in MySQL:

     ```sql
     CREATE DATABASE LibraryDB;
     ```

2. **Import SQL file:**
   - Open MySQL Workbench or your preferred SQL client.
   - Use the `create_tables.sql` file in the `sql/` directory to set up the database schema:

     ```sql
     SOURCE path_to_your_repo/sql/create_tables.sql;
     ```

   This will create the necessary tables (`Books`, `Members`, `Authors`, `Categories`, and `Loans`) in the `LibraryDB` database.

3. **Inserting Sample Data (Optional):**
   - You can use the following SQL commands to insert some sample data into the tables:
   
     ```sql
     INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES 
     ('George', 'Orwell', '1903-06-25'),
     ('J.K.', 'Rowling', '1965-07-31');
     
     INSERT INTO Categories (CategoryName) VALUES 
     ('Fiction'),
     ('Science Fiction'),
     ('Fantasy');
     
     INSERT INTO Books (Title, AuthorID, CategoryID, ISBN, PublishedDate, AvailableCopies) VALUES 
     ('1984', 1, 1, '978-0451524935', '1949-06-08', 5),
     ('Harry Potter and the Philosopher\'s Stone', 2, 3, '978-0747532699', '1997-06-26', 3);
     
     INSERT INTO Members (FirstName, LastName, Email, Phone, JoinDate, Status) VALUES 
     ('John', 'Doe', 'john.doe@example.com', '123-456-7890', '2025-01-01', 'Active'),
     ('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '2025-02-01', 'Active');
     
     INSERT INTO Loans (BookID, MemberID, LoanDate, DueDate) VALUES 
     (1, 1, '2025-03-01', '2025-03-15'),
     (2, 2, '2025-03-05', '2025-03-19');
     ```

## ERD (Entity-Relationship Diagram)

Below is a screenshot or link to the ERD that visually represents the relationships between the tables:

![ERD](link_to_your_erd_image_or_file)

## Notes
- You can customize the data and extend the schema to include additional features like overdue book management, fines, etc.
- Ensure you have proper MySQL server access and privileges to create databases and tables.

