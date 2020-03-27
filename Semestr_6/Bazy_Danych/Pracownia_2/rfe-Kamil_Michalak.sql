-- Kamil Michalak, grupa: Robert Ferens

-- Zadanie 1
SELECT users.id, users.displayname, users.reputation, COUNT(posts.id)
FROM users JOIN posts ON users.id=posts.owneruserid JOIN postlinks ON posts.id=postlinks.postid
WHERE postlinks.linktypeid=3
GROUP BY users.id, users.displayname, users.reputation
ORDER BY 4 DESC, 2 ASC
LIMIT 20;

-- Zadanie 2
SELECT id, displayname, reputation, comments_count, score_avg FROM
    (SELECT users.id, displayname, reputation FROM
    users JOIN badges ON users.id=badges.userid
    WHERE badges.name='Fanatic') as users_tab
LEFT JOIN 
    (SELECT owneruserid, score_avg, comments_count FROM
        (SELECT posts.owneruserid, COUNT(comments.id) as comments_count, AVG(comments.score) as score_avg
        FROM posts JOIN comments ON posts.id=comments.postid
        GROUP BY posts.owneruserid) as tab1
    WHERE comments_count<=100) as comments_tab
ON users_tab.id=comments_tab.owneruserid
ORDER BY comments_count DESC NULLS LAST, displayname ASC
LIMIT 20;

-- Zadanie 3
ALTER TABLE users ADD PRIMARY KEY (id);
ALTER TABLE badges ADD FOREIGN KEY (userid) REFERENCES users (id);
ALTER TABLE posts DROP COLUMN viewcount;
DELETE FROM posts WHERE body IS NULL or body='';


-- Zadanie 4 
CREATE SEQUENCE id_inc
    INCREMENT 1
    START 11511;

INSERT INTO posts(id, posttypeid, parentid, owneruserid, body, score, creationdate)
SELECT nextval('id_inc'), 3, postid, userid, text, score, creationdate
FROM comments;