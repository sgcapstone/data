-- --copy entire file (works whether first build or not)
CREATE EXTENSION IF NOT EXISTS pgcrypto;

DROP TABLE IF EXISTS consumers;
DROP TABLE IF EXISTS services;
DROP TABLE IF EXISTS providers;

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

CREATE TABLE providers (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  provider_name character varying(50) NOT NULL DEFAULT('Provider'),
  address character varying(50) NOT NULL DEFAULT('1111 B St'),
  city character varying(25) NOT NULL DEFAULT('City'),
  state character varying(15) NOT NULL DEFAULT('State'),
  zip int NOT NULL DEFAULT(12345),
  provider_id int NOT NULL UNIQUE,
  phone character varying(15) NOT NULL DEFAULT('18008675309'),
  email character varying(50) NOT NULL DEFAULT('provider@provider.com'),
  password character varying(255) NOT NULL DEFAULT('$2b$10$ZQJQOvD70qQP6z3L5CdeZOiyBSm5GY9gork4zIvaMPfwEWi4Kneou'),
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT provider_pkey PRIMARY KEY(id)
) WITH (
  OIDS=FALSE
);

CREATE TABLE services (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  service_name character varying(25) NOT NULL DEFAULT(''),
  provider_id int NOT NULL,
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT service_pkey PRIMARY KEY(id),
  FOREIGN KEY (provider_id) REFERENCES providers(provider_id)
) WITH (
  OIDS=FALSE
);

INSERT INTO consumers (first_name, last_name, address, city, state, zip, password, customer_id) VALUES ('First', 'Last', '1234 A St', 'City', 'State', '12345', '$2b$10$ZQJQOvD70qQP6z3L5CdeZOiyBSm5GY9gork4zIvaMPfwEWi4Kneou', 1) RETURNING id, created_at;

INSERT INTO providers (provider_id) VALUES (1) RETURNING id, created_at;
INSERT INTO providers (provider_id) VALUES (2) RETURNING id, created_at;
INSERT INTO providers (provider_id) VALUES (3) RETURNING id, created_at;
INSERT INTO providers (provider_name, address, city, state, zip, provider_id, phone, email, password) VALUES ('Burris Bushwhackers', '227 N Harmon Ave', 'Fayetteville', 'AR', '72701', '5', '4795551234', 'burrisbushwhackers@gmail.com', 'hunter2') RETURNING id, created_at;
INSERT INTO providers (provider_name, address, city, state, zip, provider_id, phone, email, password) VALUES ('Foster Fescue', '913 W Fairview St', 'Fayetteville', 'AR', '72701', '6', '4795556442', 'fostersfescue@gmail.com', 'password1') RETURNING id, created_at;
INSERT INTO providers (provider_name, address, city, state, zip, provider_id, phone, email, password) VALUES ('Cuts by Carlos', '648 W Dickson St', 'Fayetteville', 'AR', '72701', '7', '4795553322', 'gmailcarlos@gmail.com', 'passwordcarlos') RETURNING id, created_at;

INSERT INTO services (service_name, provider_id) VALUES ('mowing', 1) RETURNING id, created_at;
INSERT INTO services (service_name, provider_id) VALUES ('weed-eating', 1) RETURNING id, created_at;
INSERT INTO services (service_name, provider_id) VALUES ('mowing', 3) RETURNING id, created_at;
