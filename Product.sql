CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE products (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  lookupcode character varying(32) UNIQUE NOT NULL DEFAULT(''),
  count int NOT NULL DEFAULT(0),
  price int NOT NULL,
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT product_pkey PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

CREATE INDEX ix_product_lookupcode
  ON products
  USING btree
  (lower(lookupcode::text) COLLATE pg_catalog."default");

INSERT INTO products (lookupcode, count) VALUES (
  'lookupcode1',
  100,
  1000)
RETURNING id, created_at;

INSERT INTO products (lookupcode, count) VALUES (
  'lookupcode2',
  125,
  500)
RETURNING id, created_at;

INSERT INTO products (lookupcode, count) VALUES (
  'lookupcode3',
  150,
  250)
RETURNING id, created_at;


--DROP TABLE products;

--DROP INDEX ix_product_lookupcode;

--DELETE FROM product;
