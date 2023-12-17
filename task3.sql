SELECT
	area.name AS area_name,
	AVG(vacancy.compensation_from) AS avg_compensation_from,
	AVG(vacancy.compensation_to) AS avg_compensation_to,
	AVG((vacancy.compensation_from+vacancy.compensation_to)/2) AS avg_compensation
FROM vacancy
LEFT JOIN area ON area.id = vacancy.area_id
GROUP BY area.name;
