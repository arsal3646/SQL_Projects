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


-- GROUPING data:
    -- Use the GROUP BY clause to group rows that have the same values in specified columns.
        Example:
            SELECT column1, COUNT(*)
            FROM table_name
            GROUP BY column1;





*/


-- sudo /Applications/XAMPP/xamppfiles/xampp start

-- verify using sudo /Applications/XAMPP/xamppfiles/xampp status
-- http://localhost/phpmyadmin

-- Watched video 33 until 0 hr 1 min (total video length is  hr  min)