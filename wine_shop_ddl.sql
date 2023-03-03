DROP DATABASE IF EXISTS wine_shop;
CREATE DATABASE wine_shop;
USE wine_shop;


DROP TABLE IF EXISTS products;
CREATE TABLE products (
	id SERIAL PRIMARY KEY, 
    name VARCHAR(50),
    price DECIMAL(8, 2) UNSIGNED,
    producer_id BIGINT UNSIGNED,
	type_id BIGINT UNSIGNED,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX product_name_id_idx(name, id)
) COMMENT 'товары';


DROP TABLE IF EXISTS product_profiles;
CREATE TABLE product_profiles (
	product_id BIGINT UNSIGNED NOT NULL UNIQUE,
    foto_id BIGINT UNSIGNED NOT NULL,
    country VARCHAR(50),
	region VARCHAR(50) DEFAULT NULL,
    variety VARCHAR(50),
    alc DECIMAL (4, 2) NOT NULL,
    volume DECIMAL(4, 3) NOT NULL,
    description TEXT,
    gift_box BIT(1) NOT NULL,
    
    FOREIGN KEY (product_id) REFERENCES products(id)
);


DROP TABLE IF EXISTS product_rating;
CREATE TABLE product_rating (
	product_id BIGINT UNSIGNED NOT NULL UNIQUE,
	js DECIMAL (3, 0) DEFAULT NULL COMMENT 'James Suckling',
	rp DECIMAL (3, 0) DEFAULT NULL COMMENT 'Robert Parker',
	jr DECIMAL (2, 1) DEFAULT NULL COMMENT 'Jancis Robinson',
	vv DECIMAL (1, 1) DEFAULT NULL COMMENT 'ViVino',
	
	FOREIGN KEY (product_id) REFERENCES products(id)
);	


DROP TABLE IF EXISTS producers;
CREATE TABLE producers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	site VARCHAR(50),
	description TEXT,
	contact VARCHAR(50)
);


DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30)
);


DROP TABLE IF EXISTS product_types;
CREATE TABLE product_types (
	id SERIAL PRIMARY KEY,
	name VARCHAR (30),
	category_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (category_id) REFERENCES categories(id)
);



DROP TABLE IF EXISTS fotos;
CREATE TABLE fotos(
	id SERIAL,
    filename VARCHAR(255),
    size INT,
    file BLOB,
	metadata JSON
);


DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(120) UNIQUE,
 	password_hash VARCHAR(100),
 	birthday DATE,
	phone BIGINT UNSIGNED UNIQUE DEFAULT NULL,
	created_at DATETIME DEFAULT NOW()
);


DROP TABLE IF EXISTS wine_shop_raiting;
CREATE TABLE wine_shop_raiting (
	product_id BIGINT UNSIGNED NOT NULL,
	from_user_id BIGINT UNSIGNED NOT NULL,
	score TINYINT UNSIGNED,
	created_at DATETIME DEFAULT NOW(),
	
	PRIMARY KEY (product_id, from_user_id),
	FOREIGN KEY (product_id) REFERENCES products(id),
	FOREIGN KEY (from_user_id) REFERENCES users(id)
);


DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	percent TINYINT,
	started_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	finished_at DATETIME,
	created_at DATETIME DEFAULT NOW(),
	
	INDEX discnts_for_orders_idx (user_id, percent),
	FOREIGN KEY (user_id) REFERENCES users(id),
	CHECK (started_at < finished_at)
);


DROP TABLE IF EXISTS user_orders;
CREATE TABLE user_orders (
	id  SERIAL PRIMARY KEY,
	order_number BIGINT UNSIGNED NOT NULL,
	product_id BIGINT UNSIGNED NOT NULL,
	`count` BIGINT,
	from_user_id BIGINT UNSIGNED NOT NULL,
	discount TINYINT,
	
	INDEX in_orders (`count`),
	FOREIGN KEY (product_id) REFERENCES products(id),
	FOREIGN KEY (from_user_id, discount) REFERENCES discounts(user_id, percent)
	ON UPDATE CASCADE
);


DROP TABLE IF EXISTS stock;
CREATE TABLE stock (
	product_id BIGINT UNSIGNED NOT NULL,
	total_count BIGINT,
	
	INDEX stock_prod_idx(product_id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);

-- end
ALTER TABLE wine_shop.products
ADD CONSTRAINT products_fk1
	FOREIGN KEY (producer_id) REFERENCES producers(id);

ALTER TABLE wine_shop.products
ADD CONSTRAINT products_fk2
	FOREIGN KEY (type_id) REFERENCES product_types(id);

ALTER TABLE wine_shop.product_profiles 
ADD CONSTRAINT profiles_fk1
	FOREIGN KEY (foto_id) REFERENCES fotos(id);

