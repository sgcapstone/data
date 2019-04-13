CREATE TABLE provider (
  provider_name character varying(50) NOT NULL DEFAULT(''),
  address character varying(50) NOT NULL DEFAULT(''),
  city character varying(20) NOT NULL DEFAULT(''),
  state character varying(15) NOT NULL DEFAULT(''),
  zip int NOT NULL,
  provider_id int NOT NULL DEFAULT(1),
  role character varying(32) NOT NULL CHECK (role in ('customer', 'service provider')) DEFAULT('service provider'),
  phone character varying(15) NOT NULL DEFAULT(''),
  email character varying(50) NOT NULL DEFAULT(''),
  password character varying(20) NOT NULL DEFAULT(''),                                                    
  CONSTRAINT provider_pkey PRIMARY KEY(id),
  FOREIGN KEY (provider_id) REFERENCES services (provider_id)
) WITH (
  OIDS=FALSE
);
