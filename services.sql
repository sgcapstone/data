CREATE TABLE services(
  service_name character varying(25) NOT NULL DEFAULT(''),
  provider_id int NOT NULL,
  CONSTRAINT service_pkey PRIMARY KEY(service_name),
  FOREIGN KEY (provider_id) REFERENCES provider(provider_id)
);
