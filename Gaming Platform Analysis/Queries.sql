-- Selecting all columns from table
SELECT * FROM users;

-- Selecting Specific Columns from the table
SELECT user_id,user_name FROM users;

-- Selecting Distinct Columns From the table
SELECT DISTINCT gener from games;

-- Select data on basic where clause
SELECT * FROM GAMES WHERE GENER = 'Action';

-- Using Compariosn Operator
Select * from users where age >=25;

-- Usign Logical Operator 
SELECT * FROM users WHERE age>=25 and join_date > '2024-01-01';

-- Using Like Pattern matching
Select * from users where email like '%@example.com';
-- Here the % is wildcard that replace anything that is before it 


-- Using In For Multiple Values
SELECT * FROM Games
WHERE gener IN ('Action', 'RPG', 'Strategy');

-- Using Between 
SELECT * FROM Users
WHERE join_date BETWEEN '2023-01-01' AND '2023-12-31';

-- Sorting results with order by
SELECT * FROM Games
ORDER BY release_date;
-- It is by default Ascending Order 


-- Sorting in Descending order
SELECT * FROM Users
ORDER BY age DESC;

-- Sorting by multiple columns
SELECT * FROM Reviews
ORDER BY game_id ASC, rating DESC;
-- it wiil first sort by gameid ascending and then rating descending


-- Limiting Result 
Select * From Users limit 2;
-- it will return first 2 rows only.

-- Limit with offset
Select * From Users limit 2 offset 2;
-- offset will skip first 2 rows and next 2 will be returned.

-- Aggregate funcitons
-- Count
Select Count(*) as Total_users from users;

-- Sum
Select sum(amount_paid) as total_revenue from purchases;

-- Average
Select avg(rating) as avg_rating from reviews;

-- Min Max
Select Min(price) as cheapest_game, Max(price) as expensive_game from games;


-- Group By
SELECT gener, COUNT(*) AS number_of_games
FROM Games
GROUP BY gener;

-- Group By Multiple Columns
SELECT user_id, game_id, COUNT(*) AS purchase_count
FROM Purchases
GROUP BY user_id, game_id;

-- Filtering Using Having Clause
SELECT gener, COUNT(*) AS number_of_games
FROM Games
GROUP BY gener
HAVING COUNT(*) > 2;

-- Having Claues combined with aggregate function
SELECT user_id, AVG(rating) AS average_rating
FROM Reviews
GROUP BY user_id
HAVING AVG(rating) >= 8;


-- Joins
-- Inner Join
Select users.user_name,games.title,reviews.rating from Reviews 
Inner Join Users on reviews.user_id = users.user_id
Inner join games on reviews.game_id = games.game_id;


INSERT INTO Users (user_name, email, join_date, age) VALUES
('karan', 'karan@example.com', '2023-05-10', 25);

-- Left join
SELECT Users.user_name, Purchases.amount_paid
FROM Users
LEFT JOIN Purchases ON Users.user_id = Purchases.user_id;

INSERT INTO Games (title, gener, release_date, price) VALUES
('karan', 'Action', '2023-09-15', 59.99);

-- Right Join 
SELECT Games.title, Purchases.amount_paid
FROM Purchases
RIGHT JOIN Games ON Purchases.game_id = Games.game_id;

-- Cross Join
SELECT Users.user_name,games.title
FROM Users
CROSS JOIN Games;
-- Creates cross values for each user

-- Full outer join
SELECT Games.title, Purchases.amount_paid
FROM Purchases
RIGHT JOIN Games ON Purchases.game_id = Games.game_id
union all
SELECT Games.title, Purchases.amount_paid
FROM Purchases
Left JOIN Games ON Purchases.game_id = Games.game_id;

-- Combining Clauses for complex queries
SELECT Users.user_name, Users.email
FROM Users
INNER JOIN Purchases ON Users.user_id = Purchases.user_id
WHERE Purchases.game_id = 3;

-- Find games with null reivews 
SELECT Games.title
FROM Games
LEFT JOIN Reviews ON Games.game_id = Reviews.game_id
WHERE Reviews.review_id IS NULL;

-- Findnig montly revenue
SELECT DATE_FORMAT(purchase_date, '%Y-%m') AS month, SUM(amount_paid) AS monthly_revenue
FROM Purchases
GROUP BY month
ORDER BY month;


-- Best Practices 
-- Uses alaises
SELECT u.username, g.title
FROM Users AS u
INNER JOIN Purchases AS p ON u.user_id = p.user_id
INNER JOIN Games AS g ON p.game_id = g.game_id;

-- Avoid Selecting Everything Only Select Required Columns To increase Performance
SELECT username, email FROM Users
WHERE age > 25;


-- More Practice Queries 
-- to find most recent joined user
SELECT * FROM Users
ORDER BY join_date DESC
LIMIT 1;

-- To find games released after a specific date
SELECT * FROM Games
WHERE release_date > '2023-01-01';

-- To find user who have made most purchase
SELECT u.user_name, COUNT(p.purchase_id) AS purchase_count
FROM Users u
INNER JOIN Purchases p ON u.user_id = p.user_id
GROUP BY u.user_name
ORDER BY purchase_count DESC
LIMIT 1;

