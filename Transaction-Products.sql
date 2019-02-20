CREATE TABLE transactionsProduct (
  trans_id uuid NOT NULL,
  product_id uuid NOT NULL,
  quantity int NOT NULL,
  created_at timestamp without time zone NOT NULL DEFAULT now(), 
  updated_at timestamp without time zone NOT NULL DEFAULT now(),
  FOREIGN KEY (trans_id) REFERENCES transactions (id),
  FOREIGN KEY (product_id) REFERENCES products (id),
  CONSTRAINT transproduct_pkey PRIMARY KEY (trans_id, product_id)
) WITH (
  OIDS=FALSE
);
