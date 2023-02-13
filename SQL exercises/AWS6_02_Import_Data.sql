/* AWS6_02_Import_Data.sql */

-- Grant load from S3 privileges to admin
GRANT LOAD FROM S3 ON *.* TO 'admin'@'%';

-- Load data into Team table - adjust the bucket name and folder
LOAD DATA FROM S3 PREFIX 's3://idsc-3103-bucket-vlelas/baseball/Team.csv'
INTO TABLE Team
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into Player table - adjust the bucket name and folder
LOAD DATA FROM S3 PREFIX 's3://idsc-3103-bucket-vlelas/baseball/Player.csv'
INTO TABLE Player
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;