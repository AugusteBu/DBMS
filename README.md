# DBMS
A 2nd-year software engineering DBMS course. cafe management system built with C and PostgreSQL.

# Features 
- Authentication
- Full CRUD Functionality
- Transactional Integrity
- Database Architecture

# Files
- **"src/cafe_db.pgc"** - it has main functionality of the database in C language with PostgreSQL.
- **"/database/*.sql"** - contains database files to create tables, virtual tables, insert data, triggers, cleanup.
- **"/database/diagrams/"** - PNG format made with DIA Editor. Main structure where database idea was created


# Database scehma design
The database was made to mimck cafe business logic
- Tables: "Kavine" (Cafe), "Darbuotojas" (Employee), "Stalas" (Table), "Klientas" (Client), "Uzsakymas" (Order), "Daro" (Fulfills).
- Data Integrity Constraints: * "ON DELETE CASCADE" on foreign keys to automatically clean up orphaned records.
- "CHECK" constraints to validate financial boundaries ("Kaina > 2.00") and ensure dates cannot be set in the future.

# Changes
Some changes have been made to cafe_db.pgc and in database/ folder files to not expose any databases or passwords. Database name was change to "db_host" and username was changed to "username".