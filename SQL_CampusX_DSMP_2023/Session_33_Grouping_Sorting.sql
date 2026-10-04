/*

-- Session 33: Grouping and Sorting in SQL

-- SORTING data:
    -- Use the ORDER BY clause to sort the result set by one or more columns.
        Example:
           
            SELECT column1, column2
            FROM table_name
            ORDER BY column1 ASC, column2 DESC;

    Example: find top 5 Samsung phone in the smartphones table

            SELECT model, screen_size
            FROM campusx.smartphones_cleaned_v6
            WHERE brand_name = 'samsung'
            ORDER BY screen_size DESC LIMIT 5;
    
    Example: find top 5 phones by TOTAL MAX CAMERA, i.e. add primary_camera_rear and secondary_camera_front and then select the top 5

            SELECT model, num_front_cameras + num_rear_cameras AS total_cameras
            FROM campusx.smartphones_cleaned_v6
            ORDER BY total_cameras DESC LIMIT 15;

    Example: sort data on the basis of PPI (some measure of pixel density) in decreasing order

            SELECT model, ROUND(SQRT(resolution_width * resolution_width + resolution_height * resolution_height), 2) AS ppi
            FROM campusx.smartphones_cleaned_v6
            ORDER BY ppi DESC LIMIT 15;

    Example: find the phone with second largest battery capacity
           
            SELECT model, battery_capacity
            FROM campusx.smartphones_cleaned_v6
            ORDER BY battery_capacity DESC
            LIMIT 1 OFFSET 1;

    Example: find the apple phone with worst rating 
            
            SELECT model, rating
            FROM campusx.smartphones_cleaned_v6
            WHERE brand_name = 'apple'
            ORDER BY rating ASC
            LIMIT 1;

    Example: find the cheapest phone for apple brand
        
            SELECT model, brand_name, price
            FROM campusx.smartphones_cleaned_v6
            WHERE brand_name = 'apple'
            ORDER BY price ASC
            LIMIT 1;

-- GROUPING data:
    -- Use the GROUP BY clause to group rows that have the same values in specified columns.
        Example:
            SELECT column1, COUNT(*)
            FROM table_name
            GROUP BY column1;

        Example: count the number of phones for each brand and order by the total number of phones in descending order

            SELECT brand_name, COUNT(*) AS total_phones,
            FORMAT(AVG(price), 2) AS avg_price_per_brand,
            FORMAT(MAX(price), 2) AS max_price_per_brand,
            FORMAT(MIN(price), 2) AS min_price_per_brand
            FROM campusx.smartphones_cleaned_v6
            GROUP BY brand_name ORDER BY total_phones DESC LIMIT 5;





*/


-- sudo /Applications/XAMPP/xamppfiles/xampp start

-- verify using sudo /Applications/XAMPP/xamppfiles/xampp status
-- http://localhost/phpmyadmin


-- FJWGHSDO  (Frank Just Wants Good SQL Done Orderly)

-- Watched video 33 until 0 hr 42 min (total video length is  hr  min)