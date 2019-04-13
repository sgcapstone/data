CREATE TABLE customer (
  --id uuid NOT NULL DEFAULT gen_random_uuid(),
  first_name character varying(15) NOT NULL DEFAULT(''),
  last_name character varying(15) NOT NULL DEFAULT(''),
  address character varying(50) NOT NULL DEFAULT(''),
  city character varying(25) NOT NULL DEFAULT(''),
  state character varying(15) NOT NULL DEFAULT(''),
  zip int NOT NULL,
  password character varying(255) NOT NULL,
  customer_id int NOT NULL DEFAULT(1),
  CONSTRAINT customer_pkey PRIMARY KEY (customer_id)
) WITH (
    OIDS=FALSE
);
