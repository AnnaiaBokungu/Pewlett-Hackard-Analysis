SELECT em.emp_no,
	em.first_name, 
	em.last_name, 
	ti.title, 
	ti.from_date, 
	ti.to_date	
INTO retirement_titles
FROM employees as em
INNER JOIN titles as ti
ON (em.emp_no = ti.emp_no)
	WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no;
SELECT * FROM retirement_titles;	

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no,to_date DESC;
SELECT * FROM unique_titles;

SELECT COUNT(utitle.emp_no),
utitle.title
INTO retiring_titles
FROM unique_titles as utitle
GROUP BY title 
ORDER BY COUNT(title) DESC;
SELECT * FROM retiring_titles;
Deliverable #2
SELECT DISTINCT ON (em.emp_no)em.emp_no,
	em.first_name,
	em.last_name,
	em.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as em
left outer join dept_employees as de 
ON (em.emp_no = de.emp_no)
left outer join titles as ti
ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date between '1965-01-01' and '1969-12-31')
ORDER BY em.emp_no;
SELECT * FROM mentorship_eligibility;