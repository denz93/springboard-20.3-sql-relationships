-- write your queries here

-- 1.
SELECT * FROM owners as o
LEFT JOIN vehicles as v ON v.owner_id = o.id;

-- 2.
SELECT o.first_name, o.last_name, COUNT(o.id) FROM owners as o
INNER JOIN vehicles as v ON v.owner_id = o.id
GROUP BY o.id
ORDER BY COUNT(o.id) ASC