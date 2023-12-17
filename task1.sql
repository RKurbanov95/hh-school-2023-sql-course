CREATE TABLE IF NOT EXISTS area (
	id	serial	PRIMARY KEY,
	name	varchar(100)	NOT NULL
);

CREATE TABLE IF NOT EXISTS specialization (
	id	serial	PRIMARY KEY,
	name	varchar(100)	NOT NULL
);

CREATE TABLE IF NOT EXISTS company (
	id	serial	PRIMARY KEY,
	name	varchar(100)	NOT NULL,
	description	text
);

CREATE TABLE IF NOT EXISTS vacancy (
	id	serial	PRIMARY KEY,
	title	varchar(100)	NOT NULL,
	description	text,
	area_id	integer	NOT NULL	REFERENCES area(id),
	specialization_id	integer	NOT NULL REFERENCES specialization(id),
	company_id	integer	NOT NULL	REFERENCES company(id),
	compensation_from	real,
	compensation_to	real,
	publication_date	date	NOT NULL	DEFAULT	CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS worker (
	id	serial	PRIMARY KEY,
	second_name	varchar(100)	NOT NULL,
	first_name	varchar(100)	NOT NULL,
	middle_name	varchar(100),
	area_id	integer	NOT NULL	REFERENCES area(id),
	birthdate	date
);

CREATE TABLE IF NOT EXISTS resume (
	id	serial	PRIMARY KEY,
	title	varchar(100)	NOT NULL,
	worker_id	integer	NOT NULL REFERENCES worker(id),
	specialization_id	integer	NOT NULL REFERENCES specialization(id),
	compensation_expectation	real,
	publication_date	date	NOT NULL	DEFAULT	CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS response (
	vacancy_id	integer	NOT NULL	REFERENCES vacancy(id),
	resume_id	integer	NOT NULL	REFERENCES resume(id),
	responce_date	date	NOT NULL,
	CONSTRAINT	vac_res_pkey	PRIMARY KEY (resume_id, vacancy_id)
);