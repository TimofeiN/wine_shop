USE wine_shop;

-- функция подсчета цены по позиции в заказе
DROP FUNCTION IF EXISTS f_position_price;
DELIMITER $$
CREATE FUNCTION f_position_price(position_num BIGINT)
RETURNS FLOAT DETERMINISTIC
  BEGIN
    DECLARE discnt TINYINT;
   	DECLARE full_price FLOAT;
    DECLARE `_result` FLOAT;
    
   	SET full_price = (
   		SELECT (uo2.`count` * p.price)  FROM user_orders uo2
   		JOIN products p ON uo2.product_id = p.id
   		WHERE uo2.id = position_num);
   		
   	SET discnt = (
   		SELECT uo.discount 
   		FROM user_orders uo
   		WHERE uo.id = position_num);
	
	   	IF discnt IS NOT NULL THEN
	   		SET `_result` = (
	   			SELECT (full_price * ((100 - uo.discount) / 100)) FROM user_orders uo
	   			WHERE uo.id = position_num);		
	   	ELSE
	   		SET `_result` = full_price;
	   	END IF;

	return `_result`;
  END$$
DELIMITER ;

SELECT *, f_position_price(id) FROM user_orders;


-- просмотр всех товаров в заказах/заказе с суммами
SELECT 
	CONCAT(u.firstname, ' ', u.lastname) AS client_name, uo.order_number, p.name AS product, 
	p.price, uo.`count`, uo.discount, f_position_price(uo.id) `position price`
FROM user_orders uo
JOIN users u ON uo.from_user_id = u.id
JOIN products p ON uo.product_id = p.id
-- WHERE uo.order_number = 1
ORDER BY uo.order_number;


-- просмотр всех заказов с суммами (часть заказов из нескольких позиций) и именами пользователей
CREATE or replace VIEW full_orders_list
AS
	SELECT 
		uo.order_number, CONCAT(u.firstname, ' ', u.lastname) AS client_name, 
		uo.discount, COUNT(f_position_price(uo.id)) AS `positions in order`, SUM(f_position_price(uo.id)) AS `price per order` 
	FROM user_orders uo
	JOIN users u ON uo.from_user_id = u.id
	JOIN products p ON uo.product_id = p.id
	GROUP BY order_number;

SELECT * FROM full_orders_list;


-- вывод полной информации о товарных остатках
CREATE or replace VIEW full_stock
AS
	(SELECT 
		s.product_id, p.name product_name, 
		s.total_count, 
		SUM(uo.`count`) AS in_orders,
		(s.total_count - (SUM(uo.`count`))) AS available_stock
	FROM stock s 
	LEFT JOIN user_orders uo ON s.product_id = uo.product_id 
	JOIN products p ON s.product_id = p.id 
	GROUP BY s.product_id
	HAVING in_orders IS NOT NULL)
		UNION
	(SELECT 
		s.product_id, p.name product_name, 
		s.total_count, 
		SUM(uo.`count`) AS in_orders,
		s.total_count AS available_stock
	FROM stock s 
	LEFT JOIN user_orders uo ON s.product_id = uo.product_id 
	JOIN products p ON s.product_id = p.id 
	GROUP BY s.product_id
	HAVING in_orders IS NULL);

SELECT * FROM full_stock;


-- ТОП 5 товаров по рейтингу пользователей c информацией о товаре и производителе
CREATE OR REPLACE VIEW top_5
AS
	SELECT 
		p.name `product`, p.price, pt.name `type`, c.name `category`, p2.name `producer`,
		p2.site, wsr.score `w_shop rating`
	FROM products p 
	JOIN product_types pt ON p.type_id = pt.id 
	JOIN categories c ON pt.category_id = c.id 
	JOIN producers p2 ON p.producer_id = p2.id
	JOIN wine_shop_raiting wsr ON p.id = wsr.product_id  
	HAVING wsr.score >= 4
	ORDER BY wsr.score DESC
	LIMIT 5;

SELECT * FROM top_5;


-- все рейтинги товаров
CREATE OR REPLACE VIEW all_ratings
AS
	SELECT 
		pr.js, pr.rp, pr.jr, pr.vv, wsr.score `ws_r`, p.name `product name`, 
		p2.name `producer`, c.name `category`, pt.name `type`, p.price
	FROM products p 
	JOIN product_types pt ON p.type_id = pt.id 
	JOIN categories c ON pt.category_id = c.id 
	JOIN producers p2 ON p.producer_id = p2.id
	JOIN product_rating pr ON p.id = pr.product_id 
	JOIN wine_shop_raiting wsr ON wsr.product_id = p.id;

SELECT * FROM all_ratings;


-- Товары в подарочной упаковке с доп. информацией
SELECT 
	p.name `product name`, p2.name `producer`, pt.name `type`, c.name `category`,
	pp.country, pp.region, pp.variety, pp.alc, pp.volume `volume (L)`, p.price, pp.gift_box -- , pp.product_id 
FROM product_profiles pp 
JOIN products p ON pp.product_id = p.id
JOIN product_types pt ON p.type_id  = pt.id 
JOIN categories c ON pt.category_id = c.id
JOIN producers p2 ON p.producer_id  = p2.id 
WHERE pp.gift_box = 1
ORDER BY `category`;


--  справка о товаре с фото (вложенные запросы)
SELECT 
	(SELECT p.name FROM products p WHERE p.id = pp.product_id) `product name`,
	(SELECT p.price FROM products p WHERE p.id = pp.product_id) `price`,
	(SELECT f.file FROM fotos f WHERE f.id = pp.foto_id) `photo`,
	pp.country, pp.region, pp.variety, pp.alc, pp.volume, 
	(SELECT 
		(SELECT
				(SELECT c.name FROM categories c WHERE c.id = pt.category_id) 
		FROM product_types pt WHERE pt.id = p.type_id) 	
	FROM products p WHERE p.id = pp.product_id)  AS `category`,	
	(SELECT 
		(SELECT name FROM product_types pt WHERE pt.id = p.type_id) 
	FROM products p WHERE p.id = pp.product_id) AS `type`	
FROM product_profiles pp;


-- оценки пользователей для товаров
SELECT 
	p.name `product`, CONCAT(u.firstname, ' ', u.lastname) name, wsr.score, wsr.created_at
FROM wine_shop_raiting wsr
JOIN products p ON wsr.product_id = p.id
JOIN users u ON wsr.from_user_id = u.id 
ORDER BY score DESC;


-- личный топ для пользователя с id 2 (ранее оцененные)
SELECT 
	p.name `product`, CONCAT(u.firstname, ' ', u.lastname) `user name`, wsr.score
FROM wine_shop_raiting wsr
JOIN products p ON wsr.product_id = p.id
JOIN users u ON wsr.from_user_id = u.id 
WHERE u.id = 2
ORDER BY `product`;




