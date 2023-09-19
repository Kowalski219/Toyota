SET SEARCH_PATH TO toyota,public;
select ROUND(AVG(price),0) AS avg_price
from toyota  ;

CREATE TABLE avg_kilometer(avg_mileage text);
INSERT INTO avg_kilometer(avg_mileage)
SELECT ROUND(AVG(Mileage),0) || 'Km' AS avg_mileage
FROM toyota;

CREATE TABLE max_mileage(max_mileage text);
INSERT INTO max_mileage(max_mileage)
SELECT ROUND(MAX(Mileage),0) || 'Km' AS avg_mileage
FROM toyota;

CREATE TABLE min_mileage(min_mileage text);
INSERT INTO min_mileage(min_mileage)
SELECT ROUND(MIN(Mileage),0) || 'Km' AS min_mileage
FROM toyota
WHERE mileage <> 0;

CREATE TABLE max_price(maximum_price INT);
INSERT INTO max_price(maximum_price)
SELECT MAX(price) AS maximum_price
FROM toyota;

CREATE TABLE min_price(min_price INT);
INSERT INTO min_price(min_price)
SELECT MIN(price) AS min_price
FROM toyota;


SELECT MIN(price) AS min_price FROM toyota;

CREATE TABLE max_age(maximum_age TEXT);
INSERT INTO max_age(maximum_age)
SELECT MAX(age) || 'yrs' AS maximum_age
FROM toyota;

CREATE TABLE min_age(min_age TEXT);
INSERT INTO min_age(min_age)
SELECT MIN(age) || 'yr' AS min_age
FROM toyota;

CREATE TABLE diesel_engine_distribution(num_of_diesel_engine BIGINT,fuel_type_percent NUMERIC);
INSERT INTO diesel_engine_distribution(num_of_diesel_engine ,fuel_type_percent)
SELECT
  COUNT(CASE WHEN fueltype = 'Diesel' THEN 1 ELSE NULL END) AS num_of_diesel_engine,
      (COUNT(CASE WHEN fueltype = 'Diesel' THEN 1 ELSE NULL END) * 100.0) / COUNT(*)  AS fuel_type_Percent
FROM
    toyota;
CREATE TABLE petrol_eng_dist(num_of_petrol_engine BIGINT,fuel_type_percent NUMERIC);
INSERT INTO petrol_eng_dist(num_of_petrol_engine ,fuel_type_percent)
SELECT
    COUNT(CASE WHEN fueltype = 'Petrol' THEN 1 ELSE NULL END) AS num_of_petrol_engine,
      (COUNT(CASE WHEN fueltype = 'Petrol' THEN 1 ELSE NULL END) * 100.0) / COUNT(*)  AS fuel_type_Percent
FROM
    toyota;
	

CREATE TABLE cng_dist(num_of_cng_engine BIGINT,fuel_type_percent NUMERIC);
INSERT INTO cng_dist(num_of_cng_engine,fuel_type_percent)
SELECT
		COUNT(CASE WHEN fueltype = 'CNG' THEN 1 ELSE NULL END) AS num_of_unknown_engine,
      (COUNT(CASE WHEN fueltype = 'CNG' THEN 1 ELSE NULL END) * 100.0) / COUNT(*)  AS fuel_type_Percent
FROM
    toyota;
CREATE TABLE unknown_dist(num_of_unknown_engine BIGINT,fuel_type_percent NUMERIC);
INSERT INTO unknown_dist(num_of_unknown_engine,fuel_type_percent)
SELECT
    COUNT(CASE WHEN fueltype = 'unknown' THEN 1 ELSE NULL END) AS num_of_unknown_engine,
      (COUNT(CASE WHEN fueltype = 'unknown' THEN 1 ELSE NULL END) * 100.0) / COUNT(*)  AS fuel_type_Percent
FROM
    toyota;
	
CREATE TABLE max_car_weight(max_car_weight INT);
INSERT INTO max_car_weight(max_car_weight)
SELECT MAX(weight) AS max_car_weight
FROM toyota;

CREATE TABLE min_car_weight(min_car_weight INT);
INSERT INTO min_car_weight(min_car_weight)
SELECT MIN(weight) AS min_car_weight
FROM toyota;

CREATE TABLE toyota_price_dist(price INT,count BIGINT);
INSERT INTO toyota_price_dist(price,count)
SELECT price,COUNT(*) AS count
FROM toyota
GROUP BY price
ORDER BY count DESC;

CREATE TABLE age_vs_price(age INT,price INT);
INSERT INTO age_vs_price(age,price)
SELECT age,price
FROM toyota;

CREATE TABLE fueltype_dist(fueltype VARCHAR(50),count BIGINT);
INSERT INTO fueltype_dist(fueltype,count)
SELECT fueltype, COUNT(*) AS count
FROM toyota
GROUP BY fueltype;

CREATE TABLE corr_horse_mileage("Horse Power" INT, mileage INT);
INSERT INTO corr_horse_mileage("Horse Power",mileage)
SELECT "Horse Power",mileage
FROM toyota;

CREATE TABLE transmission_dist(num_of_auto_cars BIGINT,num_of_manual_cars BIGINT);
INSERT INTO transmission_dist(num_of_auto_cars,num_of_manual_cars)
SELECT 
		COUNT(CASE WHEN automatic=1 THEN 1 ELSE NULL END) AS num_of_auto_cars,
		COUNT(CASE WHEN automatic=0 THEN 1 ELSE NULL END) AS num_of_manual_cars
FROM toyota;

CREATE TABLE eng_size_dist(eng_size INT, count BIGINT);
INSERT INTO eng_size_dist(eng_size,count)
SELECT "Engine size (CC)" AS eng_size, COUNT(*)
FROM toyota
GROUP BY  eng_size
ORDER By eng_size DESC;

CREATE TABLE weight_horse(weight INT,horse_power INT );
INSERT INTO weight_horse(weight,horse_power)
SELECT weight, "Horse Power" AS horse_power
FROM toyota;


SELECT * FROM toyota;


