ALTER TABLE urls ADD PRIMARY KEY (id);
CREATE INDEX CONCURRENTLY ON urls (url ASC NULLS LAST);
CREATE INDEX CONCURRENTLY ON urls (lower(url) ASC NULLS LAST);
CREATE INDEX CONCURRENTLY ON urls (file_id ASC NULLS LAST);
CREATE INDEX CONCURRENTLY ON urls (agent ASC NULLS LAST);

CREATE INDEX CONCURRENTLY ON urls(url text_pattern_ops)
CREATE INDEX CONCURRENTLY ON urls USING gist (url gist_trgm_ops);
CREATE INDEX CONCURRENTLY ON urls USING gin(url gin_trgm_ops);


ALTER TABLE urls
ADD CONSTRAINT urls_files FOREIGN KEY (file_id)
REFERENCES files (id) MATCH SIMPLE
ON UPDATE NO ACTION 
ON DELETE NO ACTION
DEFERRABLE
INITIALLY DEFERRED;