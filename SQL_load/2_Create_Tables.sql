
--create customer_dim table with primary key

CREATE TABLE public.customers_dim
(
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

-- create menu_dim table with primary key

CREATE TABLE public.menu_dim
(
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    price DECIMAL(10,2)
);

-- Create order_dim table with a composite primary key and foreign keys

CREATE TABLE public.order_dim
(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP,
    store_city VARCHAR(50),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES public.customers_dim(customer_id)
);

-- Create order_item_dim table with a composite primary key and foreign keys

CREATE TABLE public.order_item_dim
(
    order_item_id INT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    FOREIGN KEY (item_id) REFERENCES public.menu_dim(item_id),
    FOREIGN KEY (order_id) REFERENCES public.order_dim(order_id)
);



-- Set ownership of the tables to the postgres user
ALTER TABLE public.customers_dim OWNER TO postgres;
ALTER TABLE public.menu_dim OWNER TO postgres;
ALTER TABLE public.order_dim OWNER TO postgres;
ALTER TABLE public.order_item_dim OWNER TO postgres;

-- Indexing on foreign key
CREATE INDEX idx_order_customer_id ON public.order_dim(customer_id);
CREATE INDEX idx_order_item_order_id ON public.order_item_dim(order_id);
CREATE INDEX idx_order_item_item_id ON public.order_item_dim(item_id);
