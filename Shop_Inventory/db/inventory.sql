DROP TABLE products;
DROP TABLE manufacturers;

CREATE TABLE manufacturers (
  id SERIAL PRIMARY KEY,
  manufacturer_name VARCHAR (255),
  lead_time INT,
  email VARCHAR (255),
  contact_number varchar(15)
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  product_name VARCHAR (255),
  description TEXT,
  stock INT,
  buying_cost FLOAT,
  selling_price FLOAT,
  manufacturer_id INT REFERENCES manufacturers(id) ON DELETE CASCADE
);
