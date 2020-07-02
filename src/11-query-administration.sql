-- To kill runaway queries
SELECT * FROM pg_stat_activity WHERE state='active'

-- polite way to stop
SELECT pg_cancel_backend(pid)

-- stop at all costs - may lead to database RESTART
SELECT pg_terminate_backend(pid)

DROP TABLE IF EXISTS performance_test

CREATE TABLE performance_test (id serial, location text)

INSERT INTO performance_test (location)
SELECT md5(random()::text)
FROM generate_series(1,10000000)

SELECT count(*)
FROM performance_test


-- EXPLAINSELECT *
FROM performance_test
WHERE id=2000000