INSERT INTO consumer (first_name, last_name, address, city, state, zip, password, customer_id) VALUES (
  'First',
  'Last',
  '1234 A St',
  'City',
  'State',
  '12345',
  'password',
  1)
RETURNING id, created_at;

INSERT INTO provider (provider_id) VALUES (1) RETURNING id, created_at;

INSERT INTO services (service_name, provider_id) VALUES ('mowing', 1) RETURNING id, created_at;
INSERT INTO services (service_name, provider_id) VALUES ('weed-eating', 1) RETURNING id, created_at;
