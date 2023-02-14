CREATE TABLE IF NOT EXISTS `allhousing` (
  `id` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `ownername` varchar(50) NOT NULL,
  `owned` tinyint(4) NOT NULL,
  `price` int(11) NOT NULL,
  `resalepercent` int(11) NOT NULL,
  `resalejob` varchar(50) NOT NULL,
  `entry` longtext NOT NULL,
  `garage` longtext NOT NULL,
  `furniture` longtext NOT NULL,
  `shell` varchar(50) NOT NULL,
  `shells` longtext NOT NULL,
  `housekeys` longtext NOT NULL,
  `wardrobe` longtext NOT NULL,
  `inventory` longtext NOT NULL,
  `inventorylocation` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `owned_vehicles`
  ADD `storedhouse` int(11) NOT NULL
;
