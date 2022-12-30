-- Exercices requêtes SQL niveau facile avec deux tables
SELECT * FROM departement;
SELECT * FROM villes_france_free;

-- 1.Obtenir la liste des 10 villes les plus peuplées en 2012
SELECT ville_nom FROM villes_france_free 
ORDER BY ville_population_2012 DESC
LIMIT 10;

-- 2.Obtenir la liste des 50 villes ayant la plus faible superficie
SELECT ville_nom FROM villes_france_free
ORDER BY ville_surface
LIMIT 50;

/* 3.Obtenir la liste des départements d’outres-mer, 
c’est-à-dire ceux dont le numéro de département commencent par “97” */
SELECT departement_nom FROM departement
WHERE departement_code LIKE "97%";

/* 4.Obtenir le nom des 10 villes les plus peuplées en 2012, 
ainsi que le nom du département associé */
SELECT ville_nom, ville_departement FROM villes_france_free 
ORDER BY ville_population_2012 DESC
LIMIT 10;

/* 5.Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune 
au sein de ces département, en triant afin d’obtenir en priorité les départements 
qui possèdent le plus de communes   */
SELECT ville_departement, COUNT(ville_nom)as nombre_de_villes
FROM villes_france_free
GROUP BY ville_departement
ORDER BY nombre_de_villes DESC;

-- 6.Obtenir la liste des 10 plus grands départements, en terme de superficie
SELECT ville_departement, SUM(ville_surface)as superficie
FROM villes_france_free
GROUP BY ville_departement
ORDER BY superficie DESC
LIMIT 10;

-- 7.Compter le nombre de villes dont le nom commence par “Saint”
SELECT COUNT(*) as nombre_villes_saintes
FROM villes_france_free
WHERE ville_nom LIKE "Saint%" ;

/* 8. Obtenir la liste des villes qui ont un nom existants plusieurs fois, 
et trier afin d’obtenir en premier celles dont le nom est le plus souvent 
utilisé par plusieurs communes  */ 
SELECT ville_nom, count(*) as nombre_de_villes
FROM villes_france_free
GROUP BY ville_nom
ORDER BY nombre_de_villes DESC;

/* 9.Obtenir en une seule requête SQL la liste des villes 
dont la superficie est supérieur à la superficie moyenne */

SELECT ville_nom,ville_surface
FROM villes_france_free
WHERE ville_surface > (SELECT AVG (Ville_surface) FROM villes_france_free)
ORDER BY ville_surface ;

 -- 10.Obtenir la liste des départements qui possèdent plus de 2 millions d’habitants
SELECT ville_departement, ville_population_2012
FROM villes_france_free
WHERE ville_population_2012 > 2000000;

/* 11. Remplacez les tirets par un espace vide, pour toutes les villes 
commençant par “SAINT-” (dans la colonne qui contient les noms en majuscule)  */
SELECT ville_departement, replace(ville_nom, "SAINT-","SAINT ")as ville_nom
FROM villes_france_free
WHERE ville_nom LIKE "SAINT%";


















