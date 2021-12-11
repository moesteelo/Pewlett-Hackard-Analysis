SELECT e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.bith_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) emp_no, 
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles AS r
ORDER BY r.emp_no, to_date DESC;


SELECT COUNT (title), title
INTO TABLE Retiring_Titles
FROM unique_titles
GROUP BY title 
ORDER BY COUNT (title) DESC;



SELECT DISTINCT ON (em.emp_no) em.emp_no,
    em.first_name,
    em.last_name,
    em.bith_date,
	de.from_date,
	de.to_date,
	t.title
INTO TABLE mentorship_eligibility
FROM employees em
INNER JOIN dept_emp AS de ON (em.emp_no = de.emp_no)
INNER JOIN titles AS t ON (em.emp_no = t.emp_no)
WHERE de.to_date = ('9999-01-01')
AND (em.bith_date BETWEEN '1965-01-01' AND '1965-12-31');


