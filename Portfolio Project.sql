CREATE DATABASE SQL_PROJECT;
USE SQL_PROJECT;

-- 1. Loading and Exploring Data 
--  Explore the structure and first 10 rows of each table. 
CREATE TABLE badges (
    id INT PRIMARY KEY,
    user_id INT,
    name VARCHAR(255),
    date DATE
);

INSERT INTO badges (id, user_id, name, date) VALUES
(1, 1001, 'Gold Contributor', '2024-01-01'),
(2, 1002, 'Silver Helper', '2024-01-05'),
(3, 1003, 'Bronze Reviewer', '2024-02-10'),
(4, 1001, 'Silver Helper', '2024-03-15'),
(5, 1004, 'Gold Contributor', '2024-04-20'),
(6, 1001, 'Gold Contributor', '2024-05-05'),
(7, 1002, 'Bronze Reviewer', '2024-06-10'),
(8, 1003, 'Silver Helper', '2024-07-10'),
(9, 1004, 'Gold Contributor', '2024-08-01'),
(10, 1001, 'Bronze Reviewer', '2024-09-01');


CREATE TABLE comments (
    id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    creation_date DATE,
    text TEXT
);

INSERT INTO comments (id, post_id, user_id, creation_date, text) VALUES
(1, 2001, 1001, '2024-01-01', 'Great explanation!'),
(2, 2002, 1002, '2024-01-05', 'This helped a lot.'),
(3, 2003, 1003, '2024-01-10', 'Can you clarify?'),
(4, 2004, 1001, '2024-01-15', 'Excellent resource.'),
(5, 2005, 1004, '2024-01-20', 'Thank you for sharing.'),
(6, 2001, 1002, '2024-01-25', 'I agree, very useful.'),
(7, 2003, 1003, '2024-02-01', 'This solved my issue.'),
(8, 2004, 1001, '2024-02-05', 'Thanks for the info.'),
(9, 2005, 1004, '2024-02-10', 'Could use more detail.'),
(10, 2006, 1002, '2024-02-15', 'Good job on this one!');


CREATE TABLE post_history (
    id INT PRIMARY KEY,
    post_history_type_id INT,
    post_id INT,
    user_id INT,
    text TEXT,
    creation_date DATE
);

INSERT INTO post_history (id, post_history_type_id, post_id, user_id, text, creation_date) VALUES
(1, 1, 2001, 1001, 'Initial post creation', '2024-01-01'),
(2, 2, 2002, 1002, 'Edited post for clarity', '2024-01-05'),
(3, 3, 2003, 1003, 'Comment added by moderator', '2024-01-10'),
(4, 1, 2004, 1001, 'First version of the post', '2024-01-15'),
(5, 2, 2005, 1004, 'Reworded answer', '2024-01-20'),
(6, 3, 2001, 1002, 'User updated answer with additional info', '2024-01-25'),
(7, 1, 2003, 1003, 'Post originally created', '2024-02-01'),
(8, 3, 2004, 1001, 'Moderators edited content', '2024-02-05'),
(9, 2, 2005, 1004, 'User revised explanation', '2024-02-10'),
(10, 3, 2006, 1002, 'Moderators flagged inappropriate content', '2024-02-15');


CREATE TABLE post_links (
    id INT PRIMARY KEY,
    post_id INT,
    related_post_id INT,
    link_type_id INT
);

INSERT INTO post_links (id, post_id, related_post_id, link_type_id) VALUES
(1, 2001, 2002, 1),
(2, 2002, 2003, 2),
(3, 2003, 2004, 1),
(4, 2004, 2005, 3),
(5, 2005, 2006, 2),
(6, 2001, 2004, 3),
(7, 2002, 2006, 1),
(8, 2003, 2005, 2),
(9, 2004, 2006, 3),
(10, 2005, 2001, 2);


CREATE TABLE posts_answers (
    id INT PRIMARY KEY,
    post_type_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    owner_user_id INT
);

INSERT INTO posts_answers (id, post_type_id, creation_date, score, view_count, owner_user_id) VALUES
(1, 1, '2024-01-01', 10, 100, 1001),
(2, 2, '2024-01-05', 20, 150, 1002),
(3, 1, '2024-01-10', 5, 50, 1003),
(4, 2, '2024-01-15', 15, 120, 1001),
(5, 1, '2024-01-20', 30, 200, 1004),
(6, 2, '2024-01-25', 25, 180, 1002),
(7, 1, '2024-02-01', 40, 300, 1003),
(8, 2, '2024-02-05', 10, 80, 1001),
(9, 1, '2024-02-10', 8, 90, 1004),
(10, 2, '2024-02-15', 50, 400, 1002);

CREATE TABLE tags (
    id INT PRIMARY KEY,
    tag_name VARCHAR(255)
);

INSERT INTO tags (id, tag_name) VALUES
(1, 'SQL'),
(2, 'JavaScript'),
(3, 'React'),
(4, 'Python'),
(5, 'AI'),
(6, 'Machine Learning'),
(7, 'Node.js'),
(8, 'CSS'),
(9, 'HTML'),
(10, 'Database');


CREATE TABLE users (
    id INT PRIMARY KEY,
    display_name VARCHAR(255),
    reputation INT,
    creation_date DATE
);

INSERT INTO users (id, display_name, reputation, creation_date) VALUES
(1001, 'Alice', 1500, '2024-01-01'),
(1002, 'Bob', 1200, '2024-01-05'),
(1003, 'Charlie', 800, '2024-01-10'),
(1004, 'Dave', 1800, '2024-01-15'),
(1005, 'Eve', 1000, '2024-01-20'),
(1006, 'Frank', 2000, '2024-01-25'),
(1007, 'Grace', 1300, '2024-02-01'),
(1008, 'Hank', 1100, '2024-02-05'),
(1009, 'Ivy', 900, '2024-02-10'),
(1010, 'Jack', 1600, '2024-02-15');


CREATE TABLE votes (
    id INT PRIMARY KEY,
    post_id INT,
    vote_type_id INT,
    creation_date DATE
);

INSERT INTO votes (id, post_id, vote_type_id, creation_date) VALUES
(1, 2001, 1, '2024-01-01'),
(2, 2002, 2, '2024-01-05'),
(3, 2003, 1, '2024-01-10'),
(4, 2004, 2, '2024-01-15'),
(5, 2005, 1, '2024-01-20'),
(6, 2001, 2, '2024-01-25'),
(7, 2003, 1, '2024-02-01'),
(8, 2004, 2, '2024-02-05'),
(9, 2005, 1, '2024-02-10'),
(10, 2006, 2, '2024-02-15');


CREATE TABLE posts (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    post_type_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    owner_user_id INT
);

INSERT INTO posts (id, title, post_type_id, creation_date, score, view_count, owner_user_id)
VALUES
(2001, 'How to solve SQL JOIN issues?', 1, '2023-01-01', 10, 100, 1),
(2002, 'Best practices for writing SQL queries', 2, '2023-01-02', 15, 150, 2),
(2003, 'Understanding INNER JOIN in SQL', 1, '2023-01-03', 20, 200, 3),
(2004, 'What is a LEFT JOIN?', 2, '2023-01-04', 25, 250, 4),
(2005, 'Database indexing techniques', 1, '2023-01-05', 30, 300, 5),
(2006, 'Explaining SQL subqueries', 2, '2023-01-06', 35, 350, 6),
(2007, 'How to optimize SQL queries?', 1, '2023-01-07', 40, 400, 7),
(2008, 'Database normalization concepts', 2, '2023-01-08', 45, 450, 8),
(2009, 'SQL Aggregate Functions explained', 1, '2023-01-09', 50, 500, 9),
(2010, 'Introduction to SQL Window Functions', 2, '2023-01-10', 55, 550, 10);

SELECT * FROM badges;
SELECT * FROM comments;
SELECT * FROM post_history;
SELECT * FROM post_links;
SELECT * FROM posts;
SELECT * FROM posts_answers;
SELECT * FROM tags;
SELECT * FROM users;
SELECT * FROM votes;
-------------------------------------------------------------------------------
 -- Basics
-- 1. Loading and Exploring Data 
--  Explore the structure and first 10 rows of each table.
SELECT * FROM badges limit 10;
SELECT * FROM comments limit 10;
SELECT * FROM post_history limit 10;
SELECT * FROM post_links limit 10;
SELECT * FROM posts limit 10;
SELECT * FROM posts_answers limit 10;
SELECT * FROM tags limit 10;
SELECT * FROM users limit 10;
SELECT * FROM votes limit 10;

--  Identify the total number of records in each table.
SELECT 'badges' AS TableName, COUNT(*) AS TotalRecords FROM badges
UNION ALL
SELECT 'comments' AS TableName, COUNT(*) AS TotalRecords FROM comments
UNION ALL
SELECT 'post_history' AS TableName, COUNT(*) AS TotalRecords FROM post_history
UNION ALL
SELECT 'post_links' AS TableName, COUNT(*) AS TotalRecords FROM post_links
UNION ALL
SELECT 'posts' AS TableName, COUNT(*) AS TotalRecords FROM posts
UNION ALL
SELECT 'posts_answers' AS TableName, COUNT(*) AS TotalRecords FROM posts_answers
UNION ALL
SELECT 'tags' AS TableName, COUNT(*) AS TotalRecords FROM tags
UNION ALL
SELECT 'users' AS TableName, COUNT(*) AS TotalRecords FROM users
UNION ALL
SELECT 'votes' AS TableName, COUNT(*) AS TotalRecords FROM votes;

-- 2. Filtering and Sorting 
-- Find all posts with a view_count greater than 100  
Select * from posts
Where view_count > 100;

-- Display comments made in 2005
Select text from comments
Where Year(creation_date) = 2005;

-- 3. Simple Aggregations
-- Count the total number of badges 
Select count(*) from badges;

-- Calculate the average score of posts 
Select post_type_id, avg(score) from posts_answers
Group By post_type_id;
-------------------------------------------------------------------------------
-- Joins 
-- 1. Basic Joins 
-- Combine the post_history and posts tables to display the title of posts and the corresponding changes made in the post history.
Select ph.*, p.title from posts p 
JOIN post_history ph on p.id = ph.post_id;

-- Join the users table with badges to find the total badges earned by each user.
Select u.display_name, count(name) as Total_badges from users u
Inner JOIN badges b on u.id = b.user_id
Group By u.display_name;

-- 2. Multi-Table Joins 
-- Fetch the titles of posts (posts), their comments (comments), and the users who made those comments (users).
Select p.title,c.text,u.display_name from comments c
Join posts p on p.id = c.post_id
Join users u on c.user_id = u.id;

-- Combine post_links with posts to list related questions
Select * from posts p
Join post_links pl on p.id = pl.post_id;

-- Join the users, badges, and comments tables to find the users who have earned badges and made comments
Select u.display_name , b.name , c.text from comments c
join users u on c.user_id = u.id
join badges b on c.user_id = b.user_id;
-------------------------------------------------------------------------------
-- Part 3: Subqueries 
-- 1. Single-Row Subqueries 
-- Find the user with the highest reputation (users table)
Select * from users 
Where reputation = (Select max(reputation) from users);

-- Retrieve posts with the highest score in each post_type_id (posts table).
Select * from posts p1
Where p1.score = (Select Max(score) From posts p2
				  Where p1.post_type_id = p2.post_type_id);

-- 2. Correlated Subqueries 
-- For each post, fetch the number of related posts from post_links.
Select p.*,
			(Select count(related_post_id) from post_links pl
			 Where p.id = pl.post_id) as No_of_related_posts
From posts p;
-------------------------------------------------------------------------------
-- Part 4: Common Table Expressions (CTEs) 
-- 1. Non-Recursive CTE 
--  Create a CTE to calculate the average score of posts by each user and use it to:  
With cte_avgscore as (
					  select u.display_name, avg(p.score) as avg_post_score from posts p
                      Inner join post_history ph on p.id = ph.post_id
                      Inner join users u on u.id = ph.user_id
                      Group by u.display_name
					  )
                      -- ■ Rank users based on their average post score.
                      Select *,
					  Rank() Over(Order by avg_post_score desc) as `Rank`
					  from cte_avgscore
                      -- ■ List users with an average score above 50.
                      Where avg_post_score > 50; -- There is no users avg score > 50.

-- 2. Recursive CTE 
-- Simulate a hierarchy of linked posts using the post_links table.
WITH RECURSIVE post_hierarchy AS (
    SELECT 
        pl.post_id AS original_post_id,
        pl.related_post_id,
        1 AS level
    FROM post_links pl
    WHERE pl.post_id IS NOT NULL

    UNION ALL

    SELECT 
        ph.original_post_id,
        pl.related_post_id,
        ph.level + 1 AS level
    FROM post_links pl
    JOIN post_hierarchy ph ON pl.post_id = ph.related_post_id
    WHERE ph.level < 10  
)
SELECT 
    original_post_id, 
    related_post_id, 
    level
FROM post_hierarchy
ORDER BY level, original_post_id;
-------------------------------------------------------------------------------
-- Part 5: Advanced Queries 
-- 1. Window Functions 
-- Rank posts based on their score within each year (posts table). 
Select *,Year(creation_date) as year,
Dense_Rank() Over (Partition by Year(creation_date) Order by score Desc) as `rank`
From posts;

-- Calculate the running total of badges earned by users (badges table).
Select  user_id,date,
COUNT(name) as badges_earned,
SUM(COUNT(id)) Over (Partition by user_id Order by date) as running_total
From badges Group by user_id, date Order by user_id, date;
-------------------------------------------------------------------------------
-- ● Which users have contributed the most in terms of comments, edits, and votes? 
Select u.display_name,
	count(Distinct c.text) as `No of comments`,
    count(Distinct ph.text) as `No of edits`,
    count(Distinct v.post_id) as `No of votes`,
    (count(Distinct c.text) + Count(Distinct ph.text) + Count(Distinct v.post_id)) as `Total`
from votes v
left Join posts p on v.post_id = p.id -- relate votes with posts
left Join post_history ph on ph.post_id = p.id -- relate posts with post history
left Join users u on ph.user_id = u.id -- relate post history with users 
left Join comments c on c.post_id = v.post_id -- relate comments with votes
Group by u.display_name;
-------------------------------------------------------------------------------
-- ● What types of badges are most commonly earned, and which users are the top earners? 
Select b.name as `Badge Type`, 
       COUNT(*) as `No of times`
From badges b
Group by b.name
Order by `No of times` Desc;
-- which users are the top earners?
Select u.display_name as `Users`, 
       Count(b.name) as `No of badges`
From badges b
Left join users u On b.user_id = u.id
Group by u.display_name
Order by `No of badges` Desc;
-------------------------------------------------------------------------------
-- ● Which tags are associated with the highest-scoring posts? 
SELECT 
    title, score,
    CASE
        WHEN title LIKE '%SQL%' THEN 'SQL'
        WHEN title LIKE '%JavaScript%' THEN 'JavaScript'
        WHEN title LIKE '%React%' THEN 'React'
        WHEN title LIKE '%Python%' THEN 'Python'
        WHEN title LIKE '%AI%' THEN 'AI'
        WHEN title LIKE '%Machine Learning%' THEN 'Machine Learning'
        WHEN title LIKE '%Node.js%' THEN 'Node.js'
        WHEN title LIKE '%CSS%' THEN 'CSS'
        WHEN title LIKE '%HTML%' THEN 'HTML'
        WHEN title LIKE '%Database%' THEN 'Database'
        ELSE 'Other'
    END AS tag
FROM posts;
-------------------------------------------------------------------------------
-- ● How often are related questions linked, and what does this say about knowledge sharing?
-- `Linking related questions enhances knowledge organization, allowing users to find comprehensive solutions more easily.`










