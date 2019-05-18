-- Create Database
CREATE DATABASE hotel_reviews;
USE hotel_reviews;

-- Create Two Tables
CREATE TABLE `df1` (
  `index` bigint(20) DEFAULT NULL,
  `reviews_dateAdded` text,
  `address` text,
  `categories` text,
  `city` text,
  `country` text,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `name` text,
  `postalCode` text,
  `province` text,
  `reviews_date` text,
  `reviews_rating` double DEFAULT NULL,
  `reviews_text` text,
  `reviews_title` text,
  `reviews_userCity` text,
  `reviews_userProvince` text,
  `websites` text,
  KEY `ix_premise_index` (`index`)
) ;
CREATE TABLE `df2` (
  `index` bigint(20) DEFAULT NULL,
  `address` text,
  `categories` text,
  `city` text,
  `country` text,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `name` text,
  `postalCode` text,
  `province` text,
  `reviews_date` text,
  `reviews_dateAdded` text,
  `reviews_rating` double DEFAULT NULL,
  `reviews_text` text,
  `reviews_title` text,
  `reviews_userCity` text,
  `reviews_userProvince` text,
  KEY `ix_county_index` (`index`)
) ;

-- Create view to get all the data from both tables

CREATE VIEW v_merge_data AS
SELECT
address,categories,city,country,latitude,longitude,name,
 postalCode, province, reviews_date, reviews_dateAdded, reviews_rating,
 reviews_text, reviews_title, reviews_userCity, reviews_userProvince from df1
 UNION ALL
 SELECT
 address, categories, city, country, latitude, longitude, name,
 postalCode, province, reviews_date, reviews_dateAdded, reviews_rating,
 reviews_text, reviews_title, reviews_userCity, reviews_userProvince from df2;
 
-- Create view for PowerBI data slider
CREATE VIEW v_hotel_name AS
SELECT distinct(name)
FROM v_merge_data
ORDER BY name;

CREATE VIEW v_city AS
SELECT distinct(city)
FROM v_merge_data
ORDER BY city;

CREATE VIEW v_state AS
SELECT distinct(province)
FROM v_merge_data
ORDER BY province;
 