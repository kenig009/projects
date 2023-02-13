/* AWS6_01_Baseball_DB.sql */
CREATE TABLE Team
(TeamID INTEGER,
TeamName VARCHAR(20),
Location VARCHAR(20),  
League VARCHAR(10),
Stadium VARCHAR(50),
AtBats INTEGER,
Hits INTEGER,
CONSTRAINT PKTeam PRIMARY KEY (TeamID)
);

CREATE TABLE Player
(PlayerID INTEGER,
PlayerName VARCHAR(20),
TeamID INTEGER,
AtBats INTEGER,
Hits INTEGER,
CONSTRAINT PKPlayer PRIMARY KEY (PlayerID),
CONSTRAINT FKTeam FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

-- Team data: copy/paste into Workbench and execute
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (1,'Angels','Los Angeles','American','Angel Stadium',5536,1518);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (2,'Astros','Houston','National','Minute Maid Park',5407,1276);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (3,'Athletics','Oakland','American','Oakland-Alameda County Colisem',5527,1315);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (4,'Blue Jays','Toronto','American','Rogers Centre',5487,1346);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (5,'Braves','Atlanta','National','Turner Field',5425,1341);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (6,'Brewers','Milwaukee','National','Miller Park',5557,1442);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (7,'Cardinals','St. Louis','National','Busch Stadium',5622,1526);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (8,'Cubs','Chicago','National','Wrigley Field',5411,1297);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (9,'Diamondbacks','Arizona','National','Chase Field',5462,1416);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (10,'Dodgers','Los Angeles','National','Dodger Stadium',5438,1369);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (11,'Giants','San Francisco','National','AT&T Park',5558,1495);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (12,'Indians','Cleveland','American','Progressive Field',5525,1385);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (13,'Mariners','Seattle','American','Safeco Field',5494,1285);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (14,'Marlins','Miami','National','Marlins Park',5437,1327);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (15,'Mets','New York','National','Citi Field',5450,1357);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (16,'Nationals','Washington','National','Nationals Park',5615,1468);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (17,'Orioles','Baltimore','American','Oriole Park',5560,1375);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (18,'Padres','San Diego','National','PETCO Park',5422,1339);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (19,'Phillies','Philadelphia','National','Citizens Bank Park',5544,1414);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (20,'Pirates','Pittsburgh','National','PNC Park',5412,1313);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (21,'Rangers','Texas','American','Rangers Ballpark',5590,1526);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (22,'Rays','Tampa','American','Tropicana Field',5398,1293);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (23,'Red Sox','Boston','American','Fenway Park',5604,1459);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (24,'Reds','Cincinnati','National','Great American Ball Park',5477,1377);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (25,'Rockies','Colorado','National','Coors Field',5577,1526);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (26,'Royals','Kansas City','American','Kauffman Stadium',5636,1492);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (27,'Tigers','Detroit','American','Comerica Park',5476,1467);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (28,'Twins','Minnesota','American','Target Field',5562,1448);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (29,'White Sox','Chicago','American','US Cellular Field',5518,1409);
INSERT INTO Team(TeamID,TeamName,Location,League,Stadium,AtBats,Hits) VALUES (30,'Yankees','New York','American','Yankee Stadium',5524,1462);

-- Player data: copy/paste into Workbench and execute
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (1,'A. J. Pierzynski',29,479,133);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (2,'Aaron Hill',9,609,184);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (3,'Adam Dunn',29,539,110);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (4,'Adam Jones',17,648,186);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (5,'Adam LaRoche',16,571,155);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (6,'Adrian Beltre',21,604,194);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (7,'Adrian Gonzalez',10,629,188);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (8,'AJ Ellis',10,423,114);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (9,'Albert Pujols',1,607,173);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (10,'Alberto Callaspo',1,457,115);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (11,'Alcides Escobar',26,605,177);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (12,'Alejandro De Aza',29,524,147);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (13,'Alex Gordon',26,642,189);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (14,'Alex Rios',29,605,184);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (15,'Alex Rodriguez',30,463,126);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (16,'Alexei Ramirez',29,593,157);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (17,'Alfonso Soriano',8,561,147);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (18,'Allen Craig',7,469,144);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (19,'Andre Ethier',10,556,158);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (20,'Andrew McCutchen',20,593,194);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (21,'Angel Pagan',11,605,174);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (22,'Aramis Ramirez',6,570,171);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (23,'Asdrubal Cabrera',12,555,150);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (24,'Austin Jackson',27,543,163);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (25,'B. J. Upton',22,573,141);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (26,'Ben Revere',28,511,150);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (27,'Ben Zobrist',22,560,151);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (28,'Billy Butler',26,614,192);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (29,'Brandon Phillips',24,580,163);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (30,'Brennan Boesch',27,470,113);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (31,'Brett Lawrie',4,494,135);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (32,'Bryce Harper',16,533,144);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (33,'Buster Posey',11,530,178);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (34,'Cameron Maybin',18,507,123);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (35,'Carlos Beltran',7,547,147);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (36,'Carlos Gonzalez',25,518,157);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (37,'Carlos Lee',14,550,145);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (38,'Carlos Pena',22,497,98);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (39,'Carlos Santana',12,507,128);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (40,'Chase Headley',18,604,173);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (41,'Chris Davis',17,515,139);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (42,'Chris Johnson',9,488,137);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (43,'Coco Crisp',3,455,118);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (44,'Cody Ross',23,476,127);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (45,'Colby Rasmus',4,565,126);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (46,'Corey Hart',6,562,152);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (47,'Curtis Granderson',30,596,138);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (48,'Dan Uggla',5,523,115);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (49,'Daniel Murphy',15,571,166);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (50,'Danny Espinosa',16,594,147);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (51,'Darwin Barney',8,548,139);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (52,'David DeJesus',8,506,133);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (53,'David Freese',7,501,147);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (54,'David Murphy',21,457,139);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (55,'David Wright',15,581,178);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (56,'Dayan Viciedo',29,505,129);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (57,'Delmon Young',27,574,153);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (58,'Denard Span',28,516,146);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (59,'Derek Jeter',30,683,216);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (60,'Desmond Jennings',22,505,124);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (61,'Dexter Fowler',25,454,136);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (62,'Drew Stubbs',24,493,105);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (63,'Dustin Ackley',13,607,137);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (64,'Dustin Pedroia',23,563,163);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (65,'Edwin Encarnacion',4,542,152);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (66,'Elvis Andrus',21,629,180);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (67,'Eric Hosmer',26,535,124);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (68,'Erick Aybar',1,517,150);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (69,'Freddie Freeman',5,540,140);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (70,'Garrett Jones',20,475,130);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (71,'Gordon Beckham',29,525,123);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (72,'Hanley Ramirez',10,604,155);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (73,'Howard Kendrick',1,550,158);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (74,'Hunter Pence',11,617,156);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (75,'Ian Desmond',16,513,150);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (76,'Ian Kinsler',21,655,168);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (77,'Ichiro Suzuki',30,629,178);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (78,'Ike Davis',15,519,118);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (79,'J. J. Hardy',17,663,158);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (80,'Jamey Carroll',28,470,126);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (81,'Jason Heyward',5,587,158);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (82,'Jason Kipnis',12,591,152);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (83,'Jason Kubel',9,506,128);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (84,'Jay Bruce',24,560,141);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (85,'Jeff Francoeur',26,561,132);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (86,'Jemile Weeks',3,444,98);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (87,'Jesus Montero',13,515,134);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (88,'Jhonny Peralta',27,531,127);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (89,'Jimmy Rollins',19,632,158);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (90,'Joe Mauer',28,545,174);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (91,'Jon Jay',7,443,135);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (92,'Jordan Pacheco',25,475,147);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (93,'Jose Altuve',2,576,167);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (94,'Jose Reyes',14,642,184);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (95,'Josh Hamilton',21,562,160);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (96,'Josh Reddick',3,611,148);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (97,'Josh Willingham',28,519,135);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (98,'Justin Morneau',28,505,135);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (99,'Justin Smoak',13,483,105);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (100,'Justin Upton',9,554,155);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (101,'Kelly Johnson',4,507,114);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (102,'Kendrys Morales',1,484,132);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (103,'Kevin Youkilis',29,438,103);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (104,'Kyle Seager',13,594,154);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (105,'Marco Scutaro',11,620,190);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (106,'Mark Reynolds',17,457,101);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (107,'Mark Teixeira',30,451,113);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (108,'Mark Trumbo',1,544,146);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (109,'Martin Prado',5,617,186);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (110,'Matt Holliday',7,599,177);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (111,'Matt Wieters',17,526,131);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (112,'Michael Bourn',5,624,171);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (113,'Michael Brantley',12,552,159);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (114,'Michael Saunders',13,507,125);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (115,'Michael Young',21,611,169);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (116,'Miguel Cabrera',27,622,205);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (117,'Miguel Montero',9,486,139);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (118,'Mike Aviles',23,512,128);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (119,'Mike Moustakas',26,563,136);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (120,'Mike Trout',1,559,182);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (121,'Neil Walker',20,472,132);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (122,'Nelson Cruz',21,585,152);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (123,'Nick Swisher',30,537,146);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (124,'Norichika Aoki',6,520,150);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (125,'Omar Infante',27,554,152);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (126,'Paul Goldschmidt',9,514,147);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (127,'Paul Konerko',29,533,159);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (128,'Pedro Alvarez',20,525,128);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (129,'Prince Fielder',27,581,182);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (130,'Rafael Furcal',7,477,126);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (131,'Rickie Weeks',6,588,135);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (132,'Robinson Cano',30,627,196);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (133,'Ryan Braun',6,598,191);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (134,'Ryan Doumit',28,484,133);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (135,'Ryan Zimmerman',16,578,163);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (136,'Shane Victorino',10,595,152);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (137,'Shin-Soo Choo',12,598,169);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (138,'Starlin Castro',8,646,183);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (139,'Torii Hunter',1,534,167);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (140,'Yadier Molina',7,505,159);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (141,'Yoenis Cespedes',3,487,142);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (142,'Yonder Alonso',18,549,150);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (143,'Yunel Escobar',4,558,141);
INSERT INTO Player(PlayerID,PlayerName,TeamID,AtBats,Hits) VALUES (144,'Zack Cozart',24,561,138);
