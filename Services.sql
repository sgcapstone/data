CREATE TABLE services(
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  service_name character varying(25) NOT NULL DEFAULT(''),
  provider_id int NOT NULL,
  CONSTRAINT service_pkey PRIMARY KEY(id),
  FOREIGN KEY (provider_id) REFERENCES provider(provider_id)
) WITH (
  OIDS=FALSE
);
