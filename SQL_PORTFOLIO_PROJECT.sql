CREATE DATABASE CUSTOMER_SUPPORT;

SELECT *
FROM customer_support_tickets_200k
ORDER BY ticket_id DESC
LIMIT 10;

SELECT COUNT(*) 
FROM customer_support_tickets_200k;

SELECT *
FROM customer_support_tickets_200k
WHERE customer_satisfaction_score IS NULL;

SELECT AVG(resolution_time_hours) AS avg_resolution_time
FROM customer_support_tickets_200k;

SELECT region,
COUNT(*) AS ticket_count
FROM customer_support_tickets_200k
GROUP BY region
ORDER BY ticket_count DESC;

SELECT AVG(customer_satisfaction_score)
FROM customer_support_tickets_200k;

SELECT customer_gender,
AVG(customer_satisfaction_score) AS avg_satisfaction
FROM customer_support_tickets_200k
GROUP BY customer_gender;


SELECT age_group,
AVG(satisfaction_score) AS avg_satisfaction
FROM
(
SELECT 
CASE 
    WHEN customer_age < 25 THEN 'Under 25'
    WHEN customer_age BETWEEN 25 AND 40 THEN '25-40'
    WHEN customer_age BETWEEN 41 AND 60 THEN '41-60'
    ELSE '60+'
END AS age_group,
satisfaction_score
FROM customer_support_tickets_200k
) AS age_data
GROUP BY age_group;

SELECT customer_name,
COUNT(ticket_id) AS complaint_count
FROM customer_support_tickets_200k
GROUP BY customer_name
HAVING COUNT(ticket_id) > 1;

SELECT region,
COUNT(*) AS total_tickets,
RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_region
FROM customer_support_tickets_200k
GROUP BY region;

