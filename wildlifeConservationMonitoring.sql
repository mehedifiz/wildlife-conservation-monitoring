
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
(1, 1, 'Shadow Ridge', '2024-05-10', 'Tracks and distant calls heard'),       -- Seen once
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
  SELECT species_id
  FROM sightings
  GROUP BY species_id
  HAVING COUNT(*) = 1
)


