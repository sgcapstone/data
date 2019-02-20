
--DROP TABLE employee;
CREATE TABLE employees (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  first_name character varying(10) NOT NULL DEFAULT(''),
  last_name character varying(10) NOT NULL DEFAULT(''),
  employee_id int NOT NULL UNIQUE DEFAULT(1),
  active boolean NOT NULL,
  role character varying(32) NOT NULL CHECK (role in ('general manager','shift manager','cashier')),
  manager_id uuid,
  password character varying(255) NOT NULL,
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT employee_pkey PRIMARY KEY (id),
  FOREIGN KEY (manager_id) REFERENCES employees (id)
) WITH (
  OIDS=FALSE
);

INSERT INTO employees (first_name, last_name, employee_id, active, role, manager_id, password) VALUES
('Jared', 'Ramirez', 1, '1', 'general manager', NULL, 'jramirez')
RETURNING id, created_at;

INSERT INTO employees (first_name, last_name, employee_id, active, role, manager_id, password) VALUES
('Ben', 'Clarke', 2, '1', 'shift manager', (SELECT id FROM employees WHERE employee_id = 1), 'bclarke')
RETURNING id, created_at;

INSERT INTO employees (first_name, last_name, employee_id, active, role, manager_id, password) VALUES
('Carlos', 'Interiano', 3, '1', 'cashier', (SELECT id FROM employees WHERE employee_id = 2), 'cinteriano')
RETURNING id, created_at;

INSERT INTO employees (first_name, last_name, employee_id, active, role, manager_id, password) VALUES
('John', 'Mangrum', 4, '1', 'cashier', (SELECT id FROM employees WHERE employee_id = 2), 'jmangrum')
RETURNING id, created_at;

INSERT INTO employees (first_name, last_name, employee_id, active, role, manager_id, password) VALUES
('Andrew', 'Foster', 5, '1', 'cashier', (SELECT id FROM employees WHERE employee_id = 1), 'afoster')
RETURNING id, created_at;

INSERT INTO employees (first_name, last_name, employee_id, active, role, manager_id, password) VALUES
('Brendan', 'Mitchell', 6, '1', 'cashier', (SELECT id FROM employees WHERE employee_id = 1), 'bmitchell')
RETURNING id, created_at;
