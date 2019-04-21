-- CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE consumers (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  first_name character varying(15) NOT NULL DEFAULT(''),
  last_name character varying(15) NOT NULL DEFAULT(''),
  address character varying(50) NOT NULL DEFAULT(''),
  city character varying(25) NOT NULL DEFAULT(''),
  state character varying(15) NOT NULL DEFAULT(''),
  zip int NOT NULL,
  password character varying(255) NOT NULL,
  customer_id int NOT NULL UNIQUE DEFAULT(1),
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT customer_pkey PRIMARY KEY (id)
) WITH (
    OIDS=FALSE
);

INSERT INTO consumers (first_name, last_name, address, city, state, zip, password, customer_id) VALUES (
  'First',
  'Last',
  '1234 A St',
  'City',
  'State',
  '12345',
  '$2b$10$ZQJQOvD70qQP6z3L5CdeZOiyBSm5GY9gork4zIvaMPfwEWi4Kneou',
  1)
RETURNING id, created_at;

--DROP TABLE consumer;

--DELETE FROM consumer;
