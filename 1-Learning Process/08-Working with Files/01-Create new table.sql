USE bakery;
DROP TABLE IF EXISTS product_suggestion2;

CREATE TABLE product_suggestion2 (
    product_suggestion_id INT,
    product_suggestion_name TEXT,
    date_received TEXT,
    PRIMARY KEY (product_suggestion_id)
);