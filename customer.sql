CREATE TABLE customer (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  first character varying(15) NOT NULL DEFAULT(''),
  last character varying(15) NOT NULL DEFAULT(''),
  address character varying(50) NOT NULL DEFAULT(''),
  city character varying(25) NOT NULL DEFAULT(''),
  state character varying(15) NOT NULL DEFAULT(''),
  zip int NOT NULL DEFAULT('')
);
