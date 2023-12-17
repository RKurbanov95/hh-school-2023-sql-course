Написать запрос для получения id и title вакансий, которые собрали больше 
5 откликов в первую неделю после публикации

SELECT
	vacancy.id AS vacancy_id,
	vacancy.title AS vacancy_title
FROM vacancy
INNER JOIN response ON vacancy.id = response.vacancy_id
WHERE 
	ABS(vacancy.publication_date - response.responce_date) <= 7
GROUP BY vacancy.id, vacancy.title
HAVING COUNT(vacancy.id) >= 5; 	