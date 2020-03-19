-- Kamil Michalak, grupa: Robert Ferens

-- Zadanie 1
SELECT creationdate FROM posts
WHERE body LIKE '%Turing%'
ORDER BY creationdate DESC;

-- Zadanie 2
SELECT id,title FROM posts
WHERE creationdate>='2018-10-11 00:00:00'
AND date_part('month',creationdate)>=9
AND title IS NOT NULL
AND score>=9
ORDER BY title;

-- Zadanie 3
SELECT users.Displayname,users.Reputation FROM
users JOIN posts ON users.Id=posts.OwnerUserId JOIN comments ON posts.Id=comments.PostId
WHERE posts.Body LIKE '%deterministic%' AND comments.Text LIKE '%deterministic%'
GROUP BY users.Displayname, users.Reputation
ORDER BY users.Reputation DESC;

-- Zadanie 4
SELECT Displayname FROM
(SELECT Id, count_posts, count_comments FROM
(SELECT users.Id, COUNT(posts.id) AS count_posts
FROM users LEFT JOIN posts ON users.id=posts.OwnerUserId
GROUP BY users.Id) AS tab_posts
LEFT JOIN
(SELECT users.Id, COUNT(comments.id) AS count_comments
FROM users LEFT JOIN comments ON users.id=comments.UserId
GROUP BY users.Id) AS tab_comments
USING(Id)
WHERE count_posts>0 AND count_comments=0) as tab1
JOIN
users USING(Id)
ORDER BY Displayname
LIMIT 10;