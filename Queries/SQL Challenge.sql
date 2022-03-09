--Pull in names, titles, and dates
SELECT e.emp_no, e.first_name, e.last_name,
	tt.title, tt.from_date, tt.to_date
INTO retirement_title
FROM employees as e
	INNER JOIN titles as tt
		ON e.emp_no = tt.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

--Checking information

SELECT * FROM retirement_title

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON(emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_title
WHERE to_date = '9999-01-01'
ORDER BY emp_no;

--Checking unique titles data
SELECT * FROM unique_titles

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY 1 DESC;

--Deliverable 2: Employees Eligible for the Mentorship Program
SELECT DISTINCT ON (emp_no) e.emp_no,
	e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no =de.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (t.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT * FROM mentorship_eligibilty