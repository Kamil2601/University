-- Kamil Michalak, rfe

-- Zadanie 1
CREATE VIEW ranking AS
SELECT displayname, liczba_odpowiedzi FROM
(SELECT owneruserid as id, COUNT(acceptedanswerid) as liczba_odpowiedzi FROM posts
WHERE acceptedanswerid IS NOT NULL AND owneruserid IS NOT NULL
GROUP BY owneruserid) as count_answers
JOIN users USING(id)
ORDER BY liczba_odpowiedzi DESC, displayname;

--Zadanie 2

CREATE VIEW avg_upvotes AS
(SELECT AVG(upvotes) FROM
((SELECT userid from badges WHERE name='Enlightened' GROUP BY userid ORDER BY userid) as be
JOIN
users on be.userid=users.id));

CREATE VIEW comments_count AS
SELECT userid, COUNT(id) FROM
(SELECT userid, id, creationdate FROM comments
WHERE date_part('year',creationdate)=2020) AS tab
GROUP BY userid;


SELECT id, displayname, reputation FROM
users JOIN comments_count ON comments_count.userid=users.id 
WHERE id NOT IN
(SELECT userid AS id from badges WHERE name='Enlightened')
AND upvotes>ANY(select avg from avg_upvotes)
AND count>1
ORDER BY users.creationdate;

-- Zadanie 3

CREATE VIEW base_owners AS
SELECT owneruserid as id FROM posts WHERE
body LIKE '%recurrence%'
GROUP BY owneruserid;

CREATE VIEW posts_comments AS(
SELECT comments.userid as comment_owner_id, posts.owneruserid as post_owner_id FROM
posts JOIN comments ON posts.id=comments.postid
WHERE userid IS NOT NULL AND owneruserid IS NOT NULL
GROUP BY post_owner_id, comment_owner_id
ORDER BY post_owner_id);

WITH RECURSIVE rec(id) AS (
    (SELECT id FROM base_owners)
    UNION
    (SELECT comment_owner_id as id FROM
    rec r JOIN posts_comments p ON r.id=p.post_owner_id
    GROUP BY comment_owner_id)
) SELECT id, displayname from rec JOIN users USING(id) GROUP BY id,displayname ORDER BY id;
