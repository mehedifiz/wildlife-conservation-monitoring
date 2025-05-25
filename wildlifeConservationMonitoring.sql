
CREATE TABLE rangers (
   ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    region VARCHAR(50) NOT NULL
  );

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(50) NOT NULL,
    discovery_date DATE,
    conservation_status VARCHAR(15)
);


CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INTEGER,
    ranger_id INTEGER,
    location  VARCHAR(50) NOT NULL,
    sighting_time DATE,
    notes TEXT
 
);


INSERT INTO rangers (name, region) VALUES 
('Meera Patel', 'Deepwood Valley'),
('Arjun Rao', 'Northern Cliffs'),
('Laila Khan', 'Eastern Meadows');
SELECT * FROM rangers;


INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Shadow Leopard', 'Panthera pardus noctis', '1798-09-14', 'Endangered'),
('Golden Langur', 'Trachypithecus geei', '1953-01-01', 'Vulnerable'),
('Indian Pangolin', 'Manis crassicaudata', '1825-05-10', 'Endangered'),
('Forest Eagle', 'Aquila sylvanus', '1880-02-22', 'Near Threatened');


SELECT * from species;
DROP table species;

INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'pass Ridge', '2024-05-10', 'Tracks and distant calls heard'),       -- Seen once
(2, 2, 'Langur Creek', '2024-05-12', 'Group seen on treetop'),               -- Seen once
(3, 3, 'Pine Hollow', '2024-05-13', 'Burrows found near stream'),            -- Seen once
(4, 1, 'Eagle Rock', '2024-05-14', 'Circling above cliffs'),                 -- Seen 2x
(4, 2, 'Cliffside Watch', '2024-05-15', 'Nesting pair observed');

SELECT * FROM sightings;
DROP table sightings;


--1 Register a new ranger

INSERT into rangers (name , region) VALUES
('Derek Fox' ,'Coastal Plains')

SELECT * FROM rangers;

-- Count unique species ever sighted.

 
SELECT COUNT(*)
FROM (
  SELECT species_id FROM sightings
  GROUP BY species_id
  HAVING COUNT(*) = 1
  )



  --3️⃣ Find all sightings where the location includes "Pass".

  select * from sightings 
  where location like '%pass%' ;


--4️⃣ List each ranger's name and their total number of sightings.

  SELECT  name , count(sightings.sighting_id) from rangers  
  left JOIN sightings ON rangers.ranger_id = sightings.ranger_id

  GROUP BY name ;


-- 5️⃣ List species that have never been sighted.

INSERT into species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Mountain Viper', 'Vipera montana', '2000-03-01', 'Least Concern'),
('River Otter', 'Lutra lutra', '1995-07-20', 'Least Concern');

SELECT * from species 
where species_id not in 
   (SELECT distinct species_id from sightings);



-- SELECT distinct species_id from sightings


--6️⃣ Show the most recent 2 sightings.

SELECT * FROM sightings 

ORDER BY sighting_time desc limit 2 ; 

-- 7️⃣ Update all species discovered before year 1800 to have status 'Historic'. 

update species set conservation_status = 'Historic' where 

extract(year from discovery_date) < '1800'

  select * from species;

  --8️⃣ Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'. 
SELECT 
  sighting_id,  
  sighting_time,
  CASE 
     WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
     when EXTRACT(HOUR FROM sighting_time) < 17 THEN 'Afternoon'
   
  END  
FROM sightings;

 

 --9️⃣ Delete rangers who have never sighted any species
  DELETE FROM rangers
  WHERE ranger_id NOT IN (
  SELECT DISTINCT ranger_id FROM sightings
  )