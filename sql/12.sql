/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
*/

SELECT behind_scenes.title
FROM (
    SELECT film_id, title
    FROM film
    CROSS JOIN unnest(special_features) AS special_feature
    WHERE special_feature = 'Behind the Scenes'
) AS behind_scenes
INNER JOIN (
    SELECT film_id, title
    FROM film
    CROSS JOIN unnest(special_features) AS special_feature
    WHERE special_feature = 'Trailers'
) AS trailers
    ON behind_scenes.film_id = trailers.film_id
ORDER BY behind_scenes.title;
