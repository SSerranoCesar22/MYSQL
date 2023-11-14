DROP DATABASE IF EXISTS Cinema;
CREATE DATABASE IF NOT EXISTS Cinema;
use Cinema;
CREATE TABLE IF NOT EXISTS movies(
	id int AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
    anyo int NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    certificate VARCHAR(45) ,
    runtime int,
    imdb_rating FLOAT,
    description TEXT,
    metascore int,
    votes int,
    gross int
);
CREATE TABLE IF NOT EXISTS directors(
	id int AUTO_INCREMENT PRIMARY KEY,
    neim  VARCHAR(45) NOT NULL,
    about TEXT,
    UNIQUE (neim)
);
CREATE TABLE IF NOT EXISTS movies_directors(
	movies_id int NOT NULL,
    directors_id int NOT NULL,
    FOREIGN KEY (movies_id) REFERENCES movies(id) ON DELETE CASCADE ,
    FOREIGN KEY (directors_id) REFERENCES directors(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS stars(
	id int AUTO_INCREMENT PRIMARY KEY,
    neim  VARCHAR(45) NOT NULL,
    about TEXT,
    UNIQUE (neim)
);
CREATE TABLE IF NOT EXISTS movies_stars(
	movies_id int NOT NULL ,
    stars_id int NOT NULL,
    FOREIGN KEY (movies_id) REFERENCES movies(id) ON DELETE CASCADE,
    FOREIGN KEY (stars_id) REFERENCES stars(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS genres(
	id int AUTO_INCREMENT PRIMARY KEY,
    neim  VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS movies_genres(
	movies_id int NOT NULL ,
    genres_id int NOT NULL,
    FOREIGN KEY (movies_id) REFERENCES movies(id) ON DELETE CASCADE,
    FOREIGN KEY (genres_id) REFERENCES genres(id) ON DELETE CASCADE
);

INSERT INTO movies (title, anyo, image_url, certificate, runtime, imdb_rating, description, metascore, votes, gross)
VALUES
    ('The Shawshank Redemption', 1994, 'imagen1.jpg', 'R', 142, 9.3, 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 80, 2331000, 28616847),
    ('The Godfather', 1972, 'imagen2.jpg', 'R', 175, 9.2, 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 90, 1612000, 134966411),
    ('The Dark Knight', 2008, 'imagen3.jpg', 'PG-13', 152, 9.0, 'When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.', 84, 2345000, 534858444),
    ('Pulp Fiction', 1994, 'imagen4.jpg', 'R', 154, 8.9, 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 94, 1663000, 107928762),
    ('Schindler''s List', 1993, 'imagen5.jpg', 'R', 195, 8.9, 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.', 94, 1191000, 96898818),
    ('Forrest Gump', 1994, 'imagen6.jpg', 'PG-13', 142, 8.8, 'The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate, and other history unfold through the perspective of an Alabama man with an IQ of 75.', 82, 1806000, 67822648),
    ('Inception', 2010, 'imagen7.jpg', 'PG-13', 148, 8.8, 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', 74, 2007000, 292576195),
    ('Fight Club', 1999, 'imagen8.jpg', 'R', 139, 8.8, 'An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.', 66, 1932000, 37030102),
    ('The Lord of the Rings: The Return of the King', 2003, 'imagen9.jpg', 'PG-13', 201, 8.9, 'Gandalf and Aragorn lead the World of Men against Sauron''s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 94, 1714000, 377845905),
    ('Goodfellas', 1990, 'imagen10.jpg', 'R', 146, 8.7, 'The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito in the Italian-American crime syndicate.', 89, 977000, 46836214);
INSERT INTO directors (neim, about)
VALUES
    ('Frank Darabont', 'Frank Darabont is a film director best known for his work on "The Shawshank Redemption" and "The Green Mile."'),
    ('Francis Ford Coppola', 'Francis Ford Coppola is a renowned filmmaker famous for directing "The Godfather" trilogy.'),
    ('Christopher Nolan', 'Christopher Nolan is a filmmaker known for his work on "The Dark Knight" trilogy and "Inception."'),
    ('Quentin Tarantino', 'Quentin Tarantino is a director famous for his unique style and films like "Pulp Fiction" and "Django Unchained."'),
    ('Steven Spielberg', 'Steven Spielberg is one of the most influential directors in the history of cinema, with iconic films like "Schindler''s List" and "Jurassic Park."'),
    ('Robert Zemeckis', 'Robert Zemeckis is a director known for "Forrest Gump" and the "Back to the Future" trilogy.'),
    ('David Fincher', 'David Fincher is a director known for films like "Fight Club" and "The Social Network."'),
    ('Peter Jackson', 'Peter Jackson is best known for directing "The Lord of the Rings" trilogy.'),
    ('Martin Scorsese', 'Martin Scorsese is a legendary director known for "Goodfellas" and "Taxi Driver."');
INSERT INTO movies_directors (movies_id, directors_id)
VALUES
    (1, 1),
    (2, 2), 
    (3, 3), 
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9);

INSERT INTO stars (neim, about)
VALUES
    ('Morgan Freeman', 'Morgan Freeman is a renowned actor known for his roles in "The Shawshank Redemption" and "The Dark Knight."'),
    ('Marlon Brando', 'Marlon Brando was a legendary actor famous for his performance in "The Godfather."'),
    ('Heath Ledger', 'Heath Ledger was a talented actor known for his role as The Joker in "The Dark Knight."'),
    ('John Travolta', 'John Travolta is an actor famous for his role in "Pulp Fiction."'),
    ('Liam Neeson', 'Liam Neeson is an actor known for his role in "Schindler''s List."'),
    ('Tom Hanks', 'Tom Hanks is an acclaimed actor known for his roles in "Forrest Gump" and "Saving Private Ryan."'),
    ('Leonardo DiCaprio', 'Leonardo DiCaprio is a versatile actor famous for his work in "Inception" and "The Revenant."'),
    ('Brad Pitt', 'Brad Pitt is a well-known actor with roles in films like "Fight Club" and "Ocean''s Eleven."'),
    ('Elijah Wood', 'Elijah Wood is an actor best known for his role as Frodo Baggins in "The Lord of the Rings" trilogy.'),
    ('Robert De Niro', 'Robert De Niro is a legendary actor known for his roles in "Goodfellas" and "Taxi Driver."');

INSERT INTO movies_stars (movies_id, stars_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);
INSERT INTO genres (neim)
VALUES
    ('Comedy'),
    ('Romance'),
    ('Science Fiction'),
    ('Horror'),
    ('Fantasy'),
    ('Mystery'),
    ('Thriller'),
    ('Animation'),
    ('Documentary'),
    ('Biography');

