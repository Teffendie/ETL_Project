
-- Select Database
USE hotel_reviews;

-- Data Prep
-- Verify Records count to make sure the same as the source
SELECT count(*) FROM df1;	-- 10000 Records
SELECT count(*) FROM df2;	-- 35912 Records before clean up, 28232 records total after drop record

-- Do the record count to verify new total record count
SELECT COUNT(*) FROM v_merge_data;  -- 45912 Records

-- Data clean up, drop records with invalid "Province"
SELECT count(*) FROM df2
WHERE length(province) > 2 ;  -- 7680 records

DELETE FROM df2
WHERE length(province) > 2 ;

-- Verify data
SELECT * FROM v_merge_data;
SELECT * FROM v_hotel_name;
SELECT * FROM v_city;
SELECT * FROM v_state;

SELECT distinct(reviews_rating) FROM v_merge_data;




