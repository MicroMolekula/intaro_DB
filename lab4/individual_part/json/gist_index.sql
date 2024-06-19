CREATE EXTENSION IF NOT EXISTS btree_gist;
CREATE INDEX gist_json_index ON table_json USING gin (json);