Создать необходимые индексы (обосновать выбор столбцов)

--- Таблицы area, specialization, company без индексов, так как у них маленький размер

--- Для остальных таблиц есть ценность добавить индекс так как их размеры достаточно большие.
--- Индексы будет добавлять по тем полям по которым скорее всего будет происходить поиск данных
--- В таблицах vacancy, resume индекс может быть полезен для поля title, так как по title обычно происходить
--- поиск вакансий/резюме. Индексы по полям area_id, specialization_id, company_id не будут иметь большой 
--- ценности так как у этих полей низкая селективность.
CREATE INDEX vacancy_index ON vacancy (title);
CREATE INDEX resume_index ON resume (title);
--- В таблице response скорее будет иметь смысл добавить индекс по дате отклика
CREATE INDEX  response_date_index ON response (responce_date);