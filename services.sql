CREATE TABLE services(
  service_name character varying(25) NOT NULL DEFAULT(''),
  service_id int NOT NULL DEFAULT(1),
  provider_id int NOT NULL,
  CONSTRAINT service_pkey PRIMARY KEY(provider_id)
);
