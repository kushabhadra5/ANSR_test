/*Creating a database mydatabase*/
CREATE DATABASE IF NOT EXISTS mydatabase;


/*Creating a table*/
CREATE TABLE IF NOT EXISTS mydatabase.user_activity (
	user_id INTEGER,
    activity_date DATE,
    activity_type TEXT
);


/*The activity_type can be either 'login', 'click', or 'purchase'.*/
/*Insert 20 sample records into the user_activity table*/
INSERT INTO mydatabase.user_activity (user_id, activity_date, activity_type)
VALUES
    (1, '2023-08-01', 'login'),
    (2, '2023-08-01', 'click'),
    (3, '2023-08-01', 'purchase'),
    (4, '2023-08-01', 'click'),
    (5, '2023-08-01', 'login'),
    (1, '2023-08-02', 'click'),
    (2, '2023-08-02', 'click'),
    (3, '2023-08-02', 'purchase'),
    (4, '2023-08-02', 'click'),
    (5, '2023-08-02', 'login'),
    (6, '2023-08-02', 'purchase'),
    (7, '2023-08-02', 'purchase'),
    (1, '2023-08-03', 'click'),
    (2, '2023-08-03', 'click'),
    (3, '2023-08-03', 'click'),
    (4, '2023-08-03', 'click'),
    (5, '2023-08-03', 'login'),
    (6, '2023-08-03', 'purchase'),
    (7, '2023-08-03', 'purchase');
    
    
/*For detailed engagement rate*/
SELECT
  activity_date,
  round(
    (
      SELECT COUNT(DISTINCT user_id)
      FROM mydatabase.user_activity
      WHERE activity_date = activity_date
      AND activity_type IN ('login', 'click', 'purchase')
    )
    /
    (
      SELECT COUNT(DISTINCT user_id)
      FROM mydatabase.user_activity
      WHERE activity_date = activity_date
    )
    * 100,
    2
  ) AS engagement_rate
FROM mydatabase.user_activity
GROUP BY activity_date