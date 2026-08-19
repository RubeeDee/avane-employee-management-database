-- ============================================
-- AVANE EMPLOYEE MANAGEMENT DATABASE
-- SQL QUERIES
-- ============================================


-- 1. View all employees
SELECT *
FROM employees;


-- 2. View employee names and job titles
SELECT
    employee_id,
    first_name,
    last_name,
    job_title
FROM employees;


-- 3. View employees with their departments
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;


-- 4. View employees with their job titles
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    j.job_title_name
FROM employees e
JOIN job_title j
    ON e.job_title_id = j.job_title_id;


-- 5. Count employees by department
SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY employee_count DESC;


-- 6. View employment history
SELECT
    eh.employee_id,
    eh.job_title,
    eh.department,
    eh.start_date,
    eh.end_date,
    eh.reason_for_change
FROM employment_history eh
ORDER BY eh.start_date DESC;


-- 7. View employee documents
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.document_type,
    d.document_status,
    d.date_added,
    d.expiry_date
FROM employees e
JOIN documents d
    ON e.employee_id = d.employee_id;


-- 8. Find documents that have an expiry date
SELECT
    employee_id,
    document_type,
    expiry_date
FROM documents
WHERE expiry_date IS NOT NULL
ORDER BY expiry_date;


-- 9. View employees by employment status
SELECT
    es.employment_status_name,
    COUNT(e.employee_id) AS employee_count
FROM employment_status es
LEFT JOIN employees e
    ON es.employment_status_id = e.employment_status_id
GROUP BY es.employment_status_name;


-- 10. View employee identification records
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    i.other_id_type,
    i.other_id_number
FROM employees e
JOIN identification i
    ON e.employee_id = i.employee_id;
