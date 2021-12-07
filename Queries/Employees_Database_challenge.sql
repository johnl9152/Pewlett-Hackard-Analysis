-- Deliverable 1

-- Retrieve emp_no, first name, and last name columns from the Employees table
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles;

-- Create "unique_titles" table
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

-- Create "retiring_titles" table
SELECT COUNT (ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT DESC;

SELECT * FROM retiring_titles;