--Eligible Mentors by Department
SELECT
DEPT_NAME AS "DEPARTMENT",
COUNT(ME.EMP_NO) AS "ELIGIBLE MENTORS"
FROM MENTORSHIP_ELIGIBILITY ME
JOIN DEPT_EMP DE
ON ME.EMP_NO = DE.EMP_NO
JOIN DEPARTMENTS DEPT
ON DE.DEPT_NO = DEPT.DEPT_NO
WHERE DE.TO_DATE = '9999-01-01'
GROUP BY 1
ORDER BY 2 DESC

--Retiring Employees by Department
SELECT
DEPT_NAME AS "DEPARTMENT",
COUNT(ME.EMP_NO) AS "RETIRING EMPLOYEES"
FROM RETIREMENT_INFO ME
JOIN DEPT_EMP DE
ON ME.EMP_NO = DE.EMP_NO
JOIN DEPARTMENTS DEPT
ON DE.DEPT_NO = DEPT.DEPT_NO
WHERE DE.TO_DATE = '9999-01-01'
GROUP BY 1
ORDER BY 2 DESC