DROP TABLE manufacturers;
DROP TABLE products;

CREATE TABLE manufacturers (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255),
  delivery_lead INT
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255),
  description VARCHAR (255),
  stock_quantity INT,
  buying_cost INT,
  selling_price INT,
  manufacturers_id INT REFERENCES manufacturers(id) ON DELETE CASCADE,
  low_stock BOOLEAN,
  out_of_stock BOOLEAN,
);
