CREATE TABLE services(
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  service_name character varying(25) NOT NULL DEFAULT(''),
  provider_id int NOT NULL,
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT service_pkey PRIMARY KEY(id),
  FOREIGN KEY (provider_id) REFERENCES provider(provider_id)
) WITH (
  OIDS=FALSE
);

INSERT INTO services (service_name, provider_id) VALUES ('mowing', 1) RETURNING id, created_at;
INSERT INTO services (service_name, provider_id) VALUES ('weed-eating', 1) RETURNING id, created_at;
