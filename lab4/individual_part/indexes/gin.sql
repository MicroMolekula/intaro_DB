CREATE EXTENSION pg_trgm;
CREATE EXTENSION btree_gin;
CREATE INDEX gin_job_index ON table4 USING gin (job_title);