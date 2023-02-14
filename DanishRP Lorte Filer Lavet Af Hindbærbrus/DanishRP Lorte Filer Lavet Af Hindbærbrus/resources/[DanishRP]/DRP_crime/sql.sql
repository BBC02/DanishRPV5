INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('gambino', 'Gambino', 1);

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('gambino',0,'medlem','Medlem',20,'{}','{}'),
	('gambino',1,'hojrehond','Højre Hånd',40,'{}','{}'),
	('gambino',2,'ledelse','Ledelse',60,'{}','{}'),
	('gambino',3,'underboss','Underboss',85,'{}','{}'),
	('gambino',4,'boss','Boss',100,'{}','{}')
;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('pistolkasse', '9mm Kasse', 1, 0, 1),
	('vintagekasse', 'Vintage Kasse', 1, 0, 1),
    ('deaglekasse', 'Deagle Kasse', 1, 0, 1),
    ('akkasse', 'AK-47 Kasse', 1, 0, 1),
    ('teckasse', 'TEC-9 Kasse', 1, 0, 1),
    ('gusenbergkasse', 'Gusenberg Kasse', 1, 0, 1),
    ('scorpionkasse', 'Scorpion Kasse', 1, 0, 1),
    ('uzikasse', 'Uzi Kasse', 1, 0, 1),
    ('revolverkasse', 'Revolver Kasse', 1, 0, 1),
    ('snskasse', 'SNS Kasse', 1, 0, 1),
    ('pumpkasse', 'Pump Kasse', 1, 0, 1),
    ('dbkasse', 'Double Shotgun Kasse', 1, 0, 1),
    ('sawedoffkasse', 'Sawedoff Shotgun Kasse', 1, 0, 1)
;