CREATE TABLE customer2 (
    c_id int NOT NULL,
    SHARD KEY (c_id),
    -- RECREATE THE SAME RELATION WITH THE SAME SCHEMA,
    -- ...
    PRIMARY KEY (c_w_id,c_d_id,c_id)
);
INSERT INTO customer2 select * from customer; -- REINSERT ALL DATA INTO NEW RELATION
DROP TABLE IF EXISTS customer; -- DROP THE OLD RELATION
ALTER TABLE customer2 rename customer; -- RENAME THE NEW RELATION
CREATE INDEX idx_customer ON customer (c_d_id,c_w_id); -- REBUILD INDEXES
