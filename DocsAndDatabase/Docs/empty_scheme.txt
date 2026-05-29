-- ========================================================
-- 1. INDEPENDENT TABLES (No Foreign Keys)
-- ========================================================

CREATE TABLE Job (
    job_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    date DATE NOT NULL
);

-- ========================================================
-- 2. CORE ENTITIES (Referencing Independent Tables)
-- ========================================================

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    department VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL, -- Ensure this is long enough for hashing
    age INT,
    gender CHAR(1),
    role VARCHAR(50),
    payroll_id INT -- Kept per diagram, nullable to avoid circular insert deadlocks
);

CREATE TABLE Candidate (
    candidate_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    status VARCHAR(50) NOT NULL,
    job_id INT NOT NULL,
    FOREIGN KEY (job_id) REFERENCES Job(job_id) ON DELETE CASCADE
);

-- ========================================================
-- 3. EMPLOYEE DEPENDENT TABLES
-- ========================================================

CREATE TABLE Leaves (
    request_id INT PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    reason TEXT,
    type BOOLEAN NOT NULL,   -- 1 = Paid, 0 = Unpaid
    status BOOLEAN,          -- 0 = Declined, 1 = Accepted, NULL = Pending
    emp_id INT NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE
);

CREATE TABLE Document (
    document_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    nature VARCHAR(100),
    location VARCHAR(512),   -- Path or URL to file storage
    owner INT NOT NULL,      -- #emp_id mapping
    FOREIGN KEY (owner) REFERENCES Employee(emp_id) ON DELETE CASCADE
);

CREATE TABLE Attendance (
    clock_time TIMESTAMP,    -- Maps to your 'DateTime' type
    emp_id INT,
    type BOOLEAN NOT NULL,   -- 0 = Out, 1 = In
    PRIMARY KEY (clock_time, emp_id), -- Composite Primary Key
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE
);

-- ========================================================
-- 4. PAYROLL & FINANCIAL ENTITIES
-- ========================================================

CREATE TABLE Payroll (
    payroll_id INT PRIMARY KEY,
    current_salary DOUBLE PRECISION NOT NULL,
    allocation DOUBLE PRECISION DEFAULT 0.0,
    current_deduction DOUBLE PRECISION DEFAULT 0.0,
    current_bonus DOUBLE PRECISION DEFAULT 0.0,
    emp_id INT NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE
);

CREATE TABLE Payslip (
    payslip_number INT PRIMARY KEY,
    date DATE NOT NULL,
    period_start DATE NOT NULL,
    period_end DATE NOT NULL,
    valid_hours INT NOT NULL,
    net_salary DOUBLE PRECISION NOT NULL,
    payroll_id INT NOT NULL,
    emp_id INT NOT NULL,
    FOREIGN KEY (payroll_id) REFERENCES Payroll(payroll_id) ON DELETE CASCADE,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE
);

-- ========================================================
-- 5. RESOLVING THE CIRCULAR RELATIONSHIP
-- ========================================================
-- Because Employee references Payroll and Payroll references Employee,
-- we add the Foreign Key constraint to Employee *after* both tables exist.

ALTER TABLE Employee 
ADD CONSTRAINT fk_employee_payroll 
FOREIGN KEY (payroll_id) REFERENCES Payroll(payroll_id) ON DELETE SET NULL;