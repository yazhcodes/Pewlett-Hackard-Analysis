# OVERVIEW
  As a huge cohort of baby boomers begin to retire, Pewlett-Hackard is looking to future proof itself by planning ahead for this upcoming change. PH wants to determine the list of retiring employees eligible for a retirement package and the number of vacancies that have to be filled in. They would also like to hand pick few of these qualified retiring employees and see if they would be interested to participate in a Mentorship program for the new employees. 
  
# ASSUMPTIONS
The following analysis has been performed based on the below assumptions about the Pewlett-Hackard's policies.
* Employees who were born between 1952 and 1955 have already retired.
* Employees born in 1965 are set to retire this year.
* All of these employees who are retiring this year are eleigible for a Mentorship program.
* The vacancies created by the retired employees and retiring employees are yet to be filled in.
* There is no mention about the status of employees born between 1956 and 1964, so they will ignored for the sake of this analysis.

# RESULTS 
* Development, Production and Sales have the most number of retiring employees; Marketing, HR and Finance have the least number of retiring employees.
* 90,398 employees have retired, and 1,549 employees who are up for retirement are eligible for the Mentorship program.
<p align='center'>
<img src="https://github.com/yazhcodes/Pewlett-Hackard-Analysis/blob/main/Challenge/Images/Retirees%20and%20Mentors%20by%20Department.png" width=480 height=300 align></img>
</p>

* A significantly high number of Senior Engineers and Senior Staffs are retiring compared to lower designations like Manager and Assistant Engineer.
* Around 1000+ senior employees are eligible for Mentorship program, so it is vital to offer them the best benefits and retain them for a smooth transition.
<p align='center'>
<img src="https://github.com/yazhcodes/Pewlett-Hackard-Analysis/blob/main/Challenge/Images/Retirees%20and%20Mentors%20by%20Title.png" width=480 height=250></img>
</p>

# SUMMARY
* As the "silver tsunami" begins to make an impact, **91,947 vacancies** will open up in Pewlett-Hackard!
* There are **not enough** qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett-Hackard employees. 
* In order to guarantee a smooth transition, PH has to bridge this gap by **altering the Mentorship Eligibility criteria**. Instead of considering only those employees who are set to retire this year, PH could rope in the retired employees too and filter them based on their past performance rating, say for the last 10 years. So out of 91,947 (retired + retiring) employees, if 10% pass the eligibility criteria, there could be around **9,200 mentors for the 91,947 new recruits**. 
  Since the Performance data has not been sourced in from PH yet, I will present the hypothetical query to identify eligible mentors.
  ```
  SELECT 
  EMP.EMP_NO,
  EMP.FIRST_NAME,
  EMP.LAST_NAME,
  SUM(EP.RATING) AS CUMULATIVE_RATING
  FROM EMPLOYEES EMP
  JOIN EMP_PERFORMANCE EP
  ON EMP.EMP_NO = EP.EMP_NO
  WHERE (BIRTH_DATE BETWEEN '1952-01-01' AND '1955-12-31'
  OR BIRTH_DATE BETWEEN '1965-01-01' AND '1965-12-31') 
  AND EP.YEAR >= '2011'
  AND CUMULATIVE_RATING >= 90
  GROUP BY 1,2,3
  ORDER BY 4 DESC;
  ```
* Further, to improvise the Eligibility criteria and increase the efficiency of the Mentorship Program, PH could pick only Senior Employees holding Titles such as Senior Engineer, Senior Staff and Technique Leader.
  ```
  SELECT 
  EMP.EMP_NO,
  EMP.FIRST_NAME,
  EMP.LAST_NAME
  SUM(EP.RATING) AS CUMULATIVE_RATING
  FROM EMPLOYEES EMP
  JOIN EMP_PERFORMANCE EP
  ON EMP.EMP_NO = EP.EMP_NO
  JOIN TITLES T
  ON EMP.EMP_NO = T.EMP_NO
  WHERE (BIRTH_DATE BETWEEN '1952-01-01' AND '1955-12-31'
  OR BIRTH_DATE BETWEEN '1965-01-01' AND '1965-12-31') 
  AND EP.YEAR >= '2011'
  AND CUMULATIVE_RATING >= 90
  AND TITLE IN ('Senior Engineer','Senior Staff','Technique Leader')
  GROUP BY 1,2,3
  ORDER BY 4 DESC;
  ```
