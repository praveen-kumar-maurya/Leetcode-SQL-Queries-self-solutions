# Write your MySQL query statement below
/*
UPDATE salary SET sex =
CASE sex
    WHEN 'm' THEN 'f'
    ELSE 'm'
END;
*/

/* another approach*/
UPDATE SALARY 
SET SEX = IF(SEX='m','f','m');