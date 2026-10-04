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

        Example: count the number of phones that have NFC
            SELECT has_nfc, 
            COUNT(*) AS 'total_phones', 
            FORMAT(AVG(price), 2) AS 'average_price', 
            FORMAT(AVG(rating), 2) AS 'average_rating'
            FROM campusx.smartphones_cleaned_v6
            GROUP BY has_nfc;

        Example: count the number of phones that have 5G

            SELECT has_5g, 
            COUNT(*) AS 'total_phones', 
            FORMAT(AVG(price), 2) AS 'average_price', 
            FORMAT(AVG(rating), 2) AS 'average_rating'
            FROM campusx.smartphones_cleaned_v6
            GROUP BY has_5g;
    
    -- GROUPBY using multiple columns


-- Side Important Note:
        -- Use FORMAT() for display. 
        -- Use the underlying numeric value for calculations, numeric comparisons, and sorting.
        -- This is because the formatted value is a string, not a numeric value.
        -- This means that if you do sorting on the formatted value, it may not behave as expected numerically.
        -- Always keep this in mind when working with formatted numeric values in SQL.
        
        -- Example: 900, 250, 12000 (if you format this, it will become '900', '250', '12000' as strings)
        -- and then if you sort descending, the output will be:
                -- '900', '250', '12000' (this is definitely wrong)

                -- Correct way is to sort using the underlying numeric values, not the formatted strings.
                -- i.e. use the actual numeric values for sorting, not the formatted strings.

        -- Example: find the brand with the highest number of phones that have both NFC and IR blaster
                SELECT brand_name, COUNT(*) AS 'count'
                FROM campusx.smartphones_cleaned_v6
                WHERE has_nfc = 'True' AND has_ir_blaster = 'TRUE'
                GROUP BY brand_name
                ORDER BY 'count' DESC LIMIT 1;

HAVING:
        -- easy to remember 
                1. WHERE is for SELECT
                2. HAVING is for GROUP BY
        
        WHERE filters ROWS before grouping.
        HAVING filters GROUPS after grouping.

        Example: find average price of those brands which have at least 20 phones

                SELECT brand_name, 
                COUNT(*) AS 'count',
                AVG(price) AS 'average_price'
                FROM campusx.smartphones_cleaned_v6
                GROUP BY brand_name
                HAVING COUNT(*) >= 20
                ORDER BY average_price DESC;

        Example: Find the top 3 brands with 
                        1. the highest average RAM that have refresh rate of at least 90Hz and 
                        2. fast charging available, and 
                        3. don't consider brands which have less than 10 phones.


                SELECT brand_name, 
                FORMAT(AVG(ram_capacity), 2) AS avg_ram_capacity
                FROM campusx.smartphones_cleaned_v6
                WHERE refresh_rate >= 90 AND fast_charging_available = 1
                GROUP BY brand_name
                HAVING COUNT(*) > 10
                ORDER BY avg_ram_capacity DESC LIMIT 3;
        
        Example: Find the top 10 batters with the most runs in IPL

                SELECT batter, SUM(batsman_run) AS total_runs
                FROM campusx.ipl
                GROUP BY batter
                ORDER BY total_runs DESC LIMIT 10;

        Example: Find batsman who hit second highest number of sixes in IPL

                SELECT batter, COUNT(*) AS total_sixes
                FROM campusx.ipl
                WHERE batsman_run = 6
                GROUP BY batter
                ORDER BY total_sixes DESC LIMIT 1 OFFSET 1;


*/


-- sudo /Applications/XAMPP/xamppfiles/xampp start

-- verify using sudo /Applications/XAMPP/xamppfiles/xampp status
-- http://localhost/phpmyadmin


-- FJWGHSDO  (Frank Just Wants Good SQL Done Orderly)

-- Watched video 33 until 2 hr 05 min (total video length is  2 hr  05 min)