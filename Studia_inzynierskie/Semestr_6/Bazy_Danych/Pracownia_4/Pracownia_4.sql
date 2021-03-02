-- Kamil Michalak, rfe

-- Zadanie 1
ALTER TABLE comments
ADD COLUMN lasteditdate TIMESTAMP DEFAULT now() NOT NULL; 
UPDATE comments
SET lasteditdate = creationdate;

-- CREATE TABLE commenthistory(
--     id SERIAL PRIMARY KEY,
--     commentid INTEGER,
--     creationdate TIMESTAMP,
--     text TEXT);

-- Zadanie 2

CREATE FUNCTION check_comments_update() RETURNS TRIGGER AS $X$
BEGIN
    NEW.creationdate := OLD.creationdate;
    IF NEW.id <> OLD.id THEN
        RAISE EXCEPTION 'id';
    END IF;
    IF NEW.postid <> OLD.postid THEN
        RAISE EXCEPTION 'postid';
    END IF;
    IF NEW.lasteditdate <> OLD.lasteditdate THEN
        RAISE EXCEPTION 'lasteditdate';
    END IF;
    IF NEW.text <> OLD.text THEN
        NEW.lasteditdate := now();
        INSERT INTO commenthistory(commentid, creationdate, text)
            VALUES (OLD.id, OLD.lasteditdate, OLD.text);
    END IF;
RETURN NEW;
END
$X$ LANGUAGE plpgsql;

CREATE TRIGGER comments_update BEFORE UPDATE ON comments FOR EACH ROW
EXECUTE PROCEDURE check_comments_update();


-- Zadanie 3

CREATE FUNCTION set_lasteditdate() RETURNS TRIGGER AS $X$
BEGIN
    NEW.lasteditdate := NEW.creationdate;
RETURN NEW;
END
$X$ LANGUAGE plpgsql;

CREATE TRIGGER insert_comment BEFORE INSERT ON comments FOR EACH ROW
EXECUTE PROCEDURE set_lasteditdate();