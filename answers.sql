-- Create LibraryDB Database
CREATE DATABASE LibraryDB;

-- Use the created database
USE LibraryDB;

-- Table: Authors
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,     -- Primary Key
    FirstName VARCHAR(50) NOT NULL,              -- Not Null constraint
    LastName VARCHAR(50) NOT NULL,               -- Not Null constraint
    BirthDate DATE,
    UNIQUE (FirstName, LastName)                 -- Unique constraint on combination of FirstName and LastName
);

-- Table: Categories
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,   -- Primary Key
    CategoryName VARCHAR(100) NOT NULL,          -- Not Null constraint
    UNIQUE (CategoryName)                        -- Unique constraint for CategoryName
);

-- Table: Books
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,       -- Primary Key
    Title VARCHAR(255) NOT NULL,                 -- Not Null constraint
    AuthorID INT,                                -- Foreign Key referencing Authors
    CategoryID INT,                              -- Foreign Key referencing Categories
    ISBN VARCHAR(20) NOT NULL,                   -- Not Null constraint
    PublishedDate DATE NOT NULL,                 -- Not Null constraint
    AvailableCopies INT DEFAULT 0,               -- Default value for AvailableCopies
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE SET NULL,  -- Foreign Key Constraint
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) ON DELETE SET NULL -- Foreign Key Constraint
);

-- Table: Members
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,     -- Primary Key
    FirstName VARCHAR(50) NOT NULL,              -- Not Null constraint
    LastName VARCHAR(50) NOT NULL,               -- Not Null constraint
    Email VARCHAR(100) UNIQUE,                   -- Unique constraint on Email
    Phone VARCHAR(15),
    JoinDate DATE NOT NULL,                      -- Not Null constraint
    Status ENUM('Active', 'Inactive') NOT NULL   -- Status field with Enum values
);

-- Table: Loans (M-M Relationship between Books and Members)
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,       -- Primary Key
    BookID INT,                                  -- Foreign Key referencing Books
    MemberID INT,                                -- Foreign Key referencing Members
    LoanDate DATE NOT NULL,                      -- Not Null constraint
    DueDate DATE NOT NULL,                       -- Not Null constraint
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,  -- Foreign Key Constraint
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE -- Foreign Key Constraint
);

-- Example Data Insert for Authors
INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES 
('George', 'Orwell', '1903-06-25'),
('J.K.', 'Rowling', '1965-07-31');

-- Example Data Insert for Categories
INSERT INTO Categories (CategoryName) VALUES 
('Fiction'),
('Science Fiction'),
('Fantasy');

-- Example Data Insert for Books
INSERT INTO Books (Title, AuthorID, CategoryID, ISBN, PublishedDate, AvailableCopies) VALUES 
('1984', 1, 1, '978-0451524935', '1949-06-08', 5),
('Harry Potter and the Philosopher\'s Stone', 2, 3, '978-0747532699', '1997-06-26', 3);

-- Example Data Insert for Members
INSERT INTO Members (FirstName, LastName, Email, Phone, JoinDate, Status) VALUES 
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '2025-01-01', 'Active'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '2025-02-01', 'Active');

-- Example Data Insert for Loans
INSERT INTO Loans (BookID, MemberID, LoanDate, DueDate) VALUES 
(1, 1, '2025-03-01', '2025-03-15'),
(2, 2, '2025-03-05', '2025-03-19');
