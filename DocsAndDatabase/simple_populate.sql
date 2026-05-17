-- ========================================================
-- 1. POPULATE JOBS
-- ========================================================
INSERT INTO Job (job_id, title, description, date) VALUES
(101, 'Software Engineer', 'Develop and maintain web applications.', '2026-01-15'),
(102, 'HR Specialist', 'Manage recruitment and employee relations.', '2026-02-01'),
(103, 'System Administrator', 'Maintain IT infrastructure and security.', '2026-03-10');

-- ========================================================
-- 2. POPULATE CANDIDATES
-- ========================================================
INSERT INTO Candidate (candidate_id, name, email, status, job_id) VALUES
(501, 'Alice Smith', 'alice.smith@email.com', 'Hired', 101),
(502, 'Bob Jones', 'bob.jones@email.com', 'Interviewing', 101),
(503, 'Charlie Brown', 'charlie.b@email.com', 'Applied', 102);

-- ========================================================
-- 3. POPULATE EMPLOYEES (Initial Insert without payroll_id)
-- ========================================================
INSERT INTO Employee (emp_id, name, department, password, age, gender, role, payroll_id) VALUES
(1, 'John Doe', 'Engineering', '$2b$12$R9h/lHSK9yAky..fakehash1', 32, 'M', 'ADMIN', NULL),
(2, 'Jane Doe', 'Human Resources', '$2b$12$E2j/mGAW12Aky..fakehash2', 29, 'F', 'HR', NULL),
(3, 'Mark Evans', 'Engineering', '$2b$12$K7m/vXTL91Bny..fakehash3', 45, 'M', 'DEVELOPER', NULL);

-- ========================================================
-- 4. POPULATE PAYROLL
-- ========================================================
INSERT INTO Payroll (payroll_id, current_salary, allocation, current_deduction, current_bonus, emp_id) VALUES
(201, 6500.00, 500.00, 200.00, 150.00, 1),
(202, 5500.00, 400.00, 150.00, 0.00, 2),
(203, 8000.00, 600.00, 300.00, 500.00, 3);

-- ========================================================
-- 5. BACKFILL EMPLOYEE LINK TO PAYROLL
-- ========================================================
-- Resolves the circular reference by updating the nullable payroll_id field
UPDATE Employee SET payroll_id = 201 WHERE emp_id = 1;
UPDATE Employee SET payroll_id = 202 WHERE emp_id = 2;
UPDATE Employee SET payroll_id = 203 WHERE emp_id = 3;

-- ========================================================
-- 6. POPULATE LEAVE REQUESTS
-- ========================================================
INSERT INTO Leave (request_id, start_date, end_date, reason, type, status, emp_id) VALUES
(301, '2026-06-01', '2026-06-05', 'Annual family vacation', true, true, 1),      -- Paid & Approved
(302, '2026-05-10', '2026-05-12', 'Minor surgical procedure', true, true, 2),   -- Paid & Approved
(303, '2026-07-15', '2026-07-20', 'Personal reasons', false, NULL, 3);           -- Unpaid & Pending

-- ========================================================
-- 7. POPULATE ATTENDANCE LOGS
-- ========================================================
INSERT INTO Attendance (clock_time, emp_id, type) VALUES
('2026-05-15 08:00:00', 1, true),  -- John Clock In
('2026-05-15 17:00:00', 1, false), -- John Clock Out
('2026-05-15 08:30:00', 2, true),  -- Jane Clock In
('2026-05-15 16:30:00', 2, false), -- Jane Clock Out
('2026-05-15 09:00:00', 3, true),  -- Mark Clock In
('2026-05-15 18:00:00', 3, false); -- Mark Clock Out

-- ========================================================
-- 8. POPULATE PAYSLIPS
-- ========================================================
INSERT INTO Payslip (payslip_number, date, period_start, period_end, valid_hours, net_salary, payroll_id, emp_id) VALUES
(401, '2026-04-30', '2026-04-01', '2026-04-30', 160, 6450.00, 201, 1), -- Net: 6500 + 500 - 200 + 150
(402, '2026-04-30', '2026-04-01', '2026-04-30', 160, 5750.00, 202, 2), -- Net: 5500 + 400 - 150 + 0
(403, '2026-04-30', '2026-04-01', '2026-04-30', 170, 8800.00, 203, 3); -- Net: 8000 + 600 - 300 + 500