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

INSERT INTO providers (provider_id) VALUES (1) RETURNING id, created_at;
