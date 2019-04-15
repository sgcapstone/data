CREATE TABLE provider (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  provider_name character varying(50) NOT NULL DEFAULT(''),
  address character varying(50) NOT NULL DEFAULT(''),
  city character varying(20) NOT NULL DEFAULT(''),
  state character varying(15) NOT NULL DEFAULT(''),
  zip int NOT NULL,
  provider_id int NOT NULL UNIQUE,
  phone character varying(15) NOT NULL DEFAULT(''),
  email character varying(50) NOT NULL DEFAULT(''),
  password character varying(20) NOT NULL DEFAULT(''),
  createdAt timestamp without time zone NOT NULL DEFAULT now(),
  updatedAt timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT provider_pkey PRIMARY KEY(id)
) WITH (
  OIDS=FALSE
);
