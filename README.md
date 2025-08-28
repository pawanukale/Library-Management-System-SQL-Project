# 📚 Library Management System (SQL Project)

## ✅ Project Overview
The **Library Management System** is a database project built using **MySQL** that demonstrates **database schema design**, **CRUD operations**, **Joins**, **Views**, **Triggers**, and **Stored Procedures**.  
It simulates real-world library operations like book borrowing, returning, and fine calculation.

---

## 🔍 Features
✔ **Books Management** – Add, update, delete, and view books  
✔ **Members Management** – Manage library members  
✔ **Borrow & Return System** – Track book loans and returns  
✔ **Fine Calculation** – Automatically calculate fines for late returns  
✔ **Triggers** – Auto-update book stock when borrowed or returned  
✔ **Views** – Show overdue books easily  
✔ **Stored Procedures** – For borrowing and returning books  
✔ **Reports** – Most borrowed books, total unpaid fines  

---

## 🏗 Database Schema
### **Entities**
- **Books** – Book details and stock info  
- **Members** – Library members  
- **Borrow** – Records of borrowed books  
- **Fine** – Fine details for overdue books  

### **Relationships**
- One **Book** → Many **Borrow** records  
- One **Member** → Many **Borrow** records  
- One **Borrow** → One **Fine** (optional)  

---

## 🖼 ER Diagram
![ER Diagram](ER%20Diagram.png)  

---

## 📂 Project Structure


📦 library-management-system
┣ 📜 library_management.sql # Full SQL script (tables, data, queries, triggers, views)
┣ 🖼 er-diagram.png # ER Diagram
┣ 📜 README.md # Documentation


---

## ⚙ Setup Instructions
1. **Clone the Repository**
   ```bash
   git clone https://github.com/pawanukale/library-management-system.git
   cd Library-Management-System-SQL-Project


Open MySQL and Run the SQL Script

SOURCE library_management.sql;


Verify Tables

SHOW TABLES;

## 🛠 CRUD Operations Examples
Create
INSERT INTO Books (title, author, genre, total_copies, available_copies)
VALUES ('The Alchemist', 'Paulo Coelho', 'Fiction', 5, 5);

Read
SELECT * FROM Books;

Update
UPDATE Books
SET available_copies = 4
WHERE book_id = 1;

Delete
DELETE FROM Books WHERE book_id = 10;

## 🔥 Advanced Features

Trigger: Automatically updates available_copies when a book is borrowed or returned.

View: overdue_books – Lists all overdue borrowed books.

Stored Procedures:

BorrowBook(book_id, member_id) – For borrowing a book.

ReturnBook(borrow_id) – For returning a book and handling fines.

## 📊 Reports
Most Borrowed Books
SELECT b.title, COUNT(*) AS borrow_count
FROM Borrow br
JOIN Books b ON br.book_id = b.book_id
GROUP BY b.title
ORDER BY borrow_count DESC
LIMIT 5;

Total Unpaid Fines
SELECT SUM(amount) AS total_unpaid FROM Fine WHERE paid_status = 'Unpaid';

## ✅ Technologies Used

Database: MySQL

SQL Concepts: CRUD, Joins, Views, Triggers, Stored Procedures

## 👨‍💻 Author

**Pawan Ukale**
