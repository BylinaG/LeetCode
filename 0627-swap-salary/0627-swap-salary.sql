/* Write your T-SQL query statement below */
UPDATE salary SET sex = 
CASE sex 
    WHEN 'f' THEN 'm' 
    ELSE 'f' 
END;
