
COPY customers_dim
FROM 'D:\Data Analysis Project\New_MCD\Original - Copy\Clean_Dataset\customers_cleaned.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY menu_dim
FROM 'D:\Data Analysis Project\New_MCD\Original - Copy\Clean_Dataset\menu_items.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY order_dim
FROM 'D:\Data Analysis Project\New_MCD\Original - Copy\Clean_Dataset\orders_cleand.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY order_item_dim
FROM 'D:\Data Analysis Project\New_MCD\Original - Copy\Clean_Dataset\order_items.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
  