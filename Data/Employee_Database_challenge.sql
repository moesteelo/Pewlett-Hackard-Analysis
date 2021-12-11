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


