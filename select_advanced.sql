select genre_id, count (executor_id) from genre_executor
group by genre_id;

SELECT COUNT(song_id) FROM song
WHERE song_id IN(
    SELECT album_id FROM album
	WHERE year_of_issue BETWEEN '01.01.2019' AND '31.12.2022');

SELECT album_id, AVG(duration) FROM song
GROUP BY album_id;

SELECT DISTINCT a.name FROM executor AS a
LEFT JOIN executor_album AS aa ON a.executor_id = aa.album_id
LEFT JOIN album AS am ON aa.album_id = am.album_id
WHERE year_of_issue < '01.01.2020';

SELECT DISTINCT c.name FROM compilation AS c
LEFT JOIN executor AS a ON c.compilation_id = a.executor_id
WHERE a.executor_id = 7;

SELECT DISTINCT a.name FROM album AS a
LEFT JOIN executor_album AS aa ON a.album_id = aa.executor_id
LEFT JOIN genre_executor AS ag ON aa.executor_id = ag.genre_id
GROUP BY a.name
HAVING COUNT(ag.genre_id) > 1;

SELECT t.name FROM song AS t
LEFT JOIN song_compilation AS d ON t.song_id = d.compilation_id
WHERE d.compilation_id IS NULL;

SELECT a.name FROM executor AS a
JOIN executor_album AS aa ON a.executor_id = aa.album_id
JOIN album AS am ON aa.album_id = am.song_id
JOIN song AS t ON am.song_id = t.album_id
WHERE t.duration = (SELECT MIN(duration) FROM song);





