SELECT dept_name, COUNT(s.dept_id) student_number
FROM Department d LEFT JOIN Student s ON d.dept_id = s.dept_id
GROUP BY d.dept_id
ORDER BY student_number DESC, dept_name;