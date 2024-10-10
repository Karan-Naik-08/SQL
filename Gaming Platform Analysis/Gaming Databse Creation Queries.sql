-- Creating DataBase
CREATE DATABASE IF NOT EXISTS gaming_platform;

USE gaming_platform;

-- Creating Tables

-- User Table
CREATE TABLE users (
user_id INT auto_increment PRIMARY KEY,
user_name VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
join_date DATE NOT NULL,
age INT
);

-- Games Talbe
CREATE TABLE games (
game_id INT auto_increment PRIMARY KEY,
title VARCHAR(100) NOT NULL,
gener VARCHAR(50) ,
release_date DATE,
price DECIMAL(10,2) DEFAULT(0.0)
);

-- Reviews Table
CREATE TABLE reviews (
review_id INT auto_increment PRIMARY KEY,
user_id INT NOT NULL,
game_id INT NOT NULL,
rating INT CHECK(rating BETWEEN 1 AND 10),
review_text TEXT,
review_date DATE,
FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
FOREIGN KEY (game_id) REFERENCES games(game_id) ON DELETE CASCADE 
/*Cascade ensure that when record are deleted in user, games table the corresponding
records in reviews table would be deleted. ( Cascade help in maintaining Data Consistency )
eg. When certain game is deleted, the reveiws and users in the game shall also be deleted other wise
there would be redundant data. */
);

-- Purchase Table
CREATE TABLE purchases (
purchase_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
game_id INT NOT NULL,
purchase_date DATE NOT NULL,
amount_paid DECIMAL(10,2) NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
FOREIGN KEY (game_id) REFERENCES games(game_id) ON DELETE CASCADE 
);

-- Inserting Data Into Tables
INSERT INTO Users (user_name, email, join_date, age) VALUES
('gamer_one', 'gamer1@example.com', '2023-05-10', 25),
('player_two', 'player2@example.com', '2024-01-15', 30),
('pro_gamer', 'progamer@example.com', '2022-11-20', 22),
('casual_player', 'casual@example.com', '2023-07-25', 28),
('elite_shooter', 'elite@example.com', '2024-03-30', 27);
-- Here we aren't inserting user_id as it is auto increment and would be assigned to each row automatically.

INSERT INTO Games (title, gener, release_date, price) VALUES
('Battle Quest', 'Action', '2023-09-15', 59.99),
('Mystic Lands', 'RPG', '2022-06-20', 49.99),
('Speed Racer', 'Racing', '2024-02-10', 39.99),
('Puzzle Mania', 'Puzzle', '2023-12-05', 19.99),
('Space Odyssey', 'Sci-Fi', '2024-07-22', 69.99),
('Fantasy World', 'Adventure', '2023-03-18', 29.99),
('Horror Nights', 'Horror', '2024-04-01', 24.99),
('Strategy Master', 'Strategy', '2022-10-30', 34.99),
('Arcade Legends', 'Arcade', '2023-08-08', 14.99),
('Sports Pro', 'Sports', '2024-05-16', 44.99);

INSERT INTO Reviews (user_id, game_id, rating, review_text, review_date) VALUES
(1, 1, 9, 'Amazing graphics and gameplay!', '2023-09-20'),
(2, 2, 8, 'Engaging story but a bit repetitive.', '2024-01-20'),
(3, 3, 10, 'Best racing game I have ever played!', '2024-02-15'),
(4, 4, 7, 'Good puzzles but lacks variety.', '2023-12-10'),
(5, 5, 9, 'Stunning visuals and immersive experience.', '2024-07-25'),
(1, 6, 8, 'Fun adventure with great characters.', '2023-03-25'),
(2, 7, 6, 'Too scary for my taste.', '2024-04-05'),
(3, 8, 7, 'Solid strategy mechanics.', '2022-11-05'),
(4, 9, 8, 'Nostalgic and entertaining.', '2023-08-15'),
(5, 10, 9, 'Realistic sports simulation!', '2024-05-20');

INSERT INTO Purchases (user_id, game_id, purchase_date, amount_paid) VALUES
(1, 1, '2023-09-16', 59.99),
(1, 6, '2023-03-19', 29.99),
(2, 2, '2024-01-18', 49.99),
(2, 7, '2024-04-02', 24.99),
(3, 3, '2024-02-12', 39.99),
(3, 8, '2022-11-22', 34.99),
(4, 4, '2023-12-07', 19.99),
(4, 9, '2023-08-10', 14.99),
(5, 5, '2024-07-25', 69.99),
(5, 10, '2024-05-17', 44.99);

Select * From Reviews;

