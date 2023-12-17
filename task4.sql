--- Месяц с наибольшим количеством вакансий
WITH vacancy_by_months AS (
	SELECT 
		DATE_PART('month', publication_date) AS month_name,
		COUNT(id) as count_vacancy
	FROM vacancy
	GROUP BY DATE_PART('month', publication_date))

SELECT 
	month_name
FROM vacancy_by_months
ORDER BY count_vacancy DESC
LIMIT 1;

--- Месяц с наибольшим количеством резюме
WITH resume_by_months AS (
	SELECT 
		DATE_PART('month', publication_date) AS month_name,
		COUNT(id) as count_resume
	FROM resume
	GROUP BY DATE_PART('month', publication_date))

SELECT 
	month_name
FROM resume_by_months
ORDER BY count_resume DESC
LIMIT 1;
 
