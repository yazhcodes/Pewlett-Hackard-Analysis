--Retired Employees by Department
SELECT 
DEPT_NAME, 
COUNT(EMP_NO) 
FROM (
	SELECT 
	DISTINCT ON (UT.EMP_NO)
	DEPT_NAME,
	UT.EMP_NO AS EMP_NO
	FROM UNIQUE_TITLES UT
	LEFT JOIN DEPT_EMP DE
	ON UT.EMP_NO = DE.EMP_NO
	JOIN DEPARTMENTS DEPT
	ON DE.DEPT_NO = DEPT.DEPT_NO
	ORDER BY EMP_NO, TO_DATE DESC
	) AS A
GROUP BY 1
ORDER BY 2 DESC;

--Eligible Mentors by Department
SELECT
DEPT_NAME,
COUNT(EMP.EMP_NO)
FROM EMPLOYEES EMP
LEFT JOIN DEPT_EMP DE
ON EMP.EMP_NO = DE.EMP_NO
JOIN DEPARTMENTS DEPT
ON DE.DEPT_NO = DEPT.DEPT_NO
WHERE BIRTH_DATE BETWEEN '1965-01-01' AND '1965-12-31'
AND DE.TO_DATE = '9999-01-01'
GROUP BY 1
ORDER BY 2 DESC;

--Retired Employees by Title
SELECT 
TITLE, 
COUNT(EMP_NO) 
FROM UNIQUE_TITLES 
GROUP BY 1 
ORDER BY 2 DESC;

--Eligible Mentors by Title
SELECT
T.TITLE,
COUNT(EMP.EMP_NO)
FROM EMPLOYEES EMP
LEFT JOIN DEPT_EMP DE
ON EMP.EMP_NO = DE.EMP_NO
JOIN TITLES T
ON EMP.EMP_NO = T.EMP_NO
WHERE BIRTH_DATE BETWEEN '1965-01-01' AND '1965-12-31'
AND T.TO_DATE = '9999-01-01'
AND DE.TO_DATE = '9999-01-01'
GROUP BY 1
ORDER BY 2 DESC;