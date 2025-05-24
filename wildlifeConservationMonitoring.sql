
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


INSERT INTO rangers (name, region) values 
('Daniel Silva', 'Western Forest'),
('Eva Martinez', 'Southern Plateau'),
('Farid Khan', 'Highland Reserve');
SELECT * from rangers;


INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Black Panther', 'Panthera pardus', '1800-06-10', 'Endangered'),
('Indian Cobra', 'Naja naja', '1758-03-01', 'Vulnerable'),
('Great Hornbill', 'Buceros bicornis', '1786-01-01', 'Near Threatened');

SELECT * from species;

INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(5, 4, 'Moonlight Clearing', '2024-06-05', 'Heard rustling and spotted silhouette'),
(6, 5, 'Rocky Bend', '2024-06-07', 'Observed basking near rocks'),
(7, 6, 'Skyhill Cliffs', '2024-06-10', 'Flying in pairs across canyon'),
(5, 5, 'Shadow Glen', '2024-06-12', NULL);

SELECT * from sightings;



