-- 1-5
SELECT mov_title, mov_year FROM movie;
SELECT mov_year FROM movie WHERE mov_title='American Beauty';
SELECT mov_title FROM movie WHERE mov_year=1999;
SELECT mov_title FROM movie WHERE mov_year<1998;
SELECT reviewer.rev_name FROM reviewer UNION (SELECT movie.mov_title FROM movie);

-- 6-10
SELECT reviewer.rev_name
FROM reviewer, rating
WHERE rating.rev_id = reviewer.rev_id
AND rating.rev_stars>=7 
AND reviewer.rev_name IS NOT NULL;

SELECT mov_title
FROM movie
WHERE mov_id NOT IN (
SELECT mov_id 
FROM rating
);

SELECT mov_title
FROM movie
WHERE mov_id in (905, 907, 917);

SELECT mov_id, mov_title, mov_year
FROM movie
WHERE mov_title LIKE '%Boogie%Nights%'
ORDER BY mov_year ASC;

SELECT act_id
FROM actor 
WHERE act_fname='Woody' 
AND act_lname='Allen';