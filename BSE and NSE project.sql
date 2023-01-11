####### MYSQL ASSIGNMENT - STOCK MARKET ANALYSIS ######

# create schema
create schema `Assignment`;

# select schema in use
use `Assignment`;

# import csv files with Stock price data of stocks into tables from the import wizard

# check bajaj data
desc bajaj;

select * from bajaj limit 10;

# convert Date column values from string to date format
UPDATE bajaj SET Date = STR_TO_DATE(Date,'%d-%M-%Y');

# convert data type of Date column to date
ALTER TABLE bajaj MODIFY COLUMN Date date;

desc bajaj;

# Check if 'Date' column has unique values
SELECT COUNT(DISTINCT date) AS 'Number of Distinct Dates', COUNT(date) AS 'Number of Rows' FROM bajaj;

# Making Date column as a primary key for the table bajaj
ALTER TABLE bajaj ADD PRIMARY KEY (Date);

desc bajaj;

# check eicher data
desc eicher;

select * from eicher limit 10;

# convert Date column values from string to date format
UPDATE eicher SET Date = STR_TO_DATE(Date,'%d-%M-%Y');

# convert data type of Date column to date
ALTER TABLE eicher MODIFY COLUMN Date date;

desc eicher;

# Check if 'Date' column has unique values
SELECT COUNT(DISTINCT date) AS 'Number of Distinct Dates', COUNT(date) AS 'Number of Rows' FROM eicher;

# Making Date column as a primary key for the table eicher
ALTER TABLE eicher ADD PRIMARY KEY (Date);

desc eicher;

# check hero data
desc hero;

select * from hero limit 10;

# convert Date column values from string to date format
UPDATE hero SET Date = STR_TO_DATE(Date,'%d-%M-%Y');

# convert data type of Date column to date
ALTER TABLE hero MODIFY COLUMN Date date;

desc hero;

# Check if 'Date' column has unique values
SELECT COUNT(DISTINCT date) AS 'Number of Distinct Dates', COUNT(date) AS 'Number of Rows' FROM hero;

# Making Date column as a primary key for the table hero
ALTER TABLE hero ADD PRIMARY KEY (Date);

desc hero;

# check infosys data
desc infosys;

select * from infosys limit 10;

# convert Date column values from string to date format
UPDATE infosys SET Date = STR_TO_DATE(Date,'%d-%M-%Y');

# convert data type of Date column to date
ALTER TABLE infosys MODIFY COLUMN Date date;

desc infosys;

# Check if 'Date' column has unique values
SELECT COUNT(DISTINCT date) AS 'Number of Distinct Dates', COUNT(date) AS 'Number of Rows' FROM infosys;

# Making Date column as a primary key for the table infosys
ALTER TABLE infosys ADD PRIMARY KEY (Date);

desc infosys;

# check tcs data
desc tcs;

select * from tcs limit 10;

# convert Date column values from string to date format
UPDATE tcs SET Date = STR_TO_DATE(Date,'%d-%M-%Y');

# convert data type of Date column to date
ALTER TABLE tcs MODIFY COLUMN Date date;

desc tcs;

# Check if 'Date' column has unique values
SELECT COUNT(DISTINCT date) AS 'Number of Distinct Dates', COUNT(date) AS 'Number of Rows' FROM tcs;

# Making Date column as a primary key for the table tcs
ALTER TABLE tcs ADD PRIMARY KEY (Date);

desc tcs;

# check tvs data
desc tvs;

select * from tvs limit 10;

# convert Date column values from string to date format
UPDATE tvs SET Date = STR_TO_DATE(Date,'%d-%M-%Y');

# convert data type of Date column to date
ALTER TABLE tvs MODIFY COLUMN Date date;

desc tvs;

# Check if 'Date' column has unique values
SELECT COUNT(DISTINCT date) AS 'Number of Distinct Dates', COUNT(date) AS 'Number of Rows' FROM tvs;

# Making Date column as a primary key for the table tvs
ALTER TABLE tvs ADD PRIMARY KEY (Date);

desc tvs;

###### QUESTION 1 ######
# Creating a new table 'bajaj1' containing the columns as date, close price, 20 Day MA and 50 Day MA
CREATE TABLE bajaj1 AS
(SELECT Date,`Close Price`,
CASE WHEN ROW_NUMBER() OVER w >= 20 THEN AVG(`Close Price`) OVER (ORDER BY Date ROWS 19 PRECEDING) 
	 ELSE NULL
END AS `20 Day MA`,
CASE WHEN ROW_NUMBER() OVER w >= 50 THEN AVG(`Close Price`) OVER (ORDER BY Date ROWS 49 PRECEDING) 
	 ELSE NULL 
END AS `50 Day MA`
FROM bajaj
WINDOW w AS (ORDER BY DATE));

# Making Date column as a primary key for the table bajaj1
ALTER TABLE bajaj1
ADD PRIMARY KEY (Date);

desc bajaj1;

SELECT * FROM bajaj1 LIMIT 25;

# Creating a new table 'eicher1' containing the columns as date, close price, 20 Day MA and 50 Day MA
CREATE TABLE eicher1 AS
(SELECT Date,`Close Price`,
CASE WHEN ROW_NUMBER() OVER w >= 20 THEN AVG(`Close Price`) OVER (ORDER BY Date ROWS 19 PRECEDING) 
	 ELSE NULL
END AS `20 Day MA`,
CASE WHEN ROW_NUMBER() OVER w >= 50 THEN AVG(`Close Price`) OVER (ORDER BY Date ROWS 49 PRECEDING) 
	 ELSE NULL 
END AS `50 Day MA`
FROM eicher
WINDOW w AS (ORDER BY DATE));

# Making Date column as a primary key for the table eicher1
ALTER TABLE eicher1 ADD PRIMARY KEY (Date);

desc eicher1;

SELECT * FROM eicher1 LIMIT 25;

# Creating a new table 'hero1' containing the columns as date, close price, 20 Day MA and 50 Day MA
CREATE TABLE hero1 AS
(SELECT Date,`Close Price`,
CASE WHEN ROW_NUMBER() OVER w >= 20 THEN AVG(`Close Price`) OVER (ORDER BY Date ROWS 19 PRECEDING) 
	 ELSE NULL
END AS `20 Day MA`,
CASE WHEN ROW_NUMBER() OVER w >= 50 THEN AVG(`Close Price`) OVER (ORDER BY Date ROWS 49 PRECEDING) 
	 ELSE NULL 
END AS `50 Day MA`
FROM hero
WINDOW w AS (ORDER BY DATE));

# Making Date column as a primary key for the table hero1
ALTER TABLE hero1 ADD PRIMARY KEY (Date);

desc hero1;

SELECT * FROM hero1 LIMIT 25;

# Creating a new table 'infosys1' containing the columns as date, close price, 20 Day MA and 50 Day MA
CREATE TABLE infosys1 AS
(SELECT Date,`Close Price`,
CASE WHEN ROW_NUMBER() OVER w >= 20 THEN AVG(`Close Price`) OVER (ORDER BY Date ROWS 19 PRECEDING) 
	 ELSE NULL
END AS `20 Day MA`,
CASE WHEN ROW_NUMBER() OVER w >= 50 THEN AVG(`Close Price`) OVER (ORDER BY Date ROWS 49 PRECEDING) 
	 ELSE NULL 
END AS `50 Day MA`
FROM infosys
WINDOW w AS (ORDER BY DATE));

# Making Date column as a primary key for the table infosys1
ALTER TABLE infosys1
ADD PRIMARY KEY (Date);

desc infosys1;

SELECT * FROM infosys1 LIMIT 25;

# Creating a new table 'tcs1' containing the columns as date, close price, 20 Day MA and 50 Day MA
CREATE TABLE tcs1 AS
(SELECT Date,`Close Price`,
CASE WHEN ROW_NUMBER() OVER w >= 20 THEN AVG(`Close Price`) OVER (ORDER BY Date ROWS 19 PRECEDING) 
	 ELSE NULL
END AS `20 Day MA`,
CASE WHEN ROW_NUMBER() OVER w >= 50 THEN AVG(`Close Price`) OVER (ORDER BY Date ROWS 49 PRECEDING) 
	 ELSE NULL 
END AS `50 Day MA`
FROM tcs
WINDOW w AS (ORDER BY DATE));

# Making Date column as a primary key for the table tcs1
ALTER TABLE tcs1 ADD PRIMARY KEY (Date);

desc tcs1;

SELECT * FROM tcs1 LIMIT 25;

# Creating a new table 'tvs1' containing the columns as date, close price, 20 Day MA and 50 Day MA
CREATE TABLE tvs1 AS
(SELECT Date,`Close Price`,
CASE WHEN ROW_NUMBER() OVER w >= 20 THEN AVG(`Close Price`) OVER (ORDER BY Date ROWS 19 PRECEDING) 
	 ELSE NULL
END AS `20 Day MA`,
CASE WHEN ROW_NUMBER() OVER w >= 50 THEN AVG(`Close Price`) OVER (ORDER BY Date ROWS 49 PRECEDING) 
	 ELSE NULL 
END AS `50 Day MA`
FROM tvs
WINDOW w AS (ORDER BY DATE));

# Making Date column as a primary key for the table tvs1
ALTER TABLE tvs1 ADD PRIMARY KEY (Date);

desc tvs1;

SELECT * FROM tvs1 LIMIT 25;

###### QUESTION 2 ######
# Creating a master table containing the date and close price of all the six stocks
CREATE TABLE Stocks_Master as
SELECT b.Date AS Date, b.`Close Price` as Bajaj, tc.`Close Price` as TCS, tv.`Close Price` as TVS,
i.`Close Price` as Infosys, e.`Close Price` as Eicher, h.`Close Price` as Hero
FROM bajaj1 AS b INNER JOIN eicher1 AS e ON b.Date = e.Date
INNER JOIN hero1 AS h ON e.Date = h.Date
INNER JOIN infosys1 AS i ON h.Date = i.Date
INNER JOIN tcs1 AS tc ON i.Date = tc.Date
INNER JOIN tvs1 AS tv ON tc.Date = tv.Date
ORDER BY Date;

# Making Date column as a primary key for the master table
ALTER TABLE Stocks_Master ADD PRIMARY KEY (Date);

desc Stocks_Master;

SELECT * from Stocks_Master LIMIT 10;

###### QUESTION 3 ######
# When the shorter-term moving average crosses above the longer-term moving average, it is a signal to BUY (Golden Cross)
# when the shorter-term moving average crosses below the longer term moving average, it is a signal to SELL (Death Cross)
# When the signal is neither buy nor sell, it is classified as HOLD

# Creating a new table 'bajaj2' containing the columns as date, close price and Signal
CREATE TABLE bajaj2 AS
SELECT `Date`,`Close Price`,
CASE 
	WHEN `50 Day MA` IS NULL THEN 'NA'
	WHEN (`20 Day MA` > `50 Day MA`) AND (lag(`20 Day MA`) OVER (ORDER BY date) < lag(`50 Day MA`) OVER (ORDER BY date)) THEN "Buy"
    WHEN (`20 Day MA` < `50 Day MA`) AND (lag(`20 Day MA`) OVER (ORDER BY date) > lag(`50 Day MA`) OVER (ORDER BY date)) THEN "Sell"
	ELSE "Hold"
END AS `Signal`
FROM bajaj1;

# Making Date column as a primary key for bajaj2 table
ALTER TABLE bajaj2 ADD PRIMARY KEY (Date);

desc bajaj2;

SELECT * FROM bajaj2 LIMIT 100;

# Creating a new table 'eicher2' containing the columns as date, close price and Signal
CREATE TABLE eicher2 AS
SELECT `Date`,`Close Price`,
CASE
	WHEN `50 Day MA` IS NULL THEN 'NA'
	WHEN (`20 Day MA` > `50 Day MA`) AND (lag(`20 Day MA`) OVER (ORDER BY date) < lag(`50 Day MA`) OVER (ORDER BY date)) THEN "Buy"
    WHEN (`20 Day MA` < `50 Day MA`) AND (lag(`20 Day MA`) OVER (ORDER BY date) > lag(`50 Day MA`) OVER (ORDER BY date)) THEN "Sell"
	ELSE "Hold"
END AS `Signal`
FROM eicher1;

# Making Date column as a primary key for eicher2 table
ALTER TABLE eicher2 ADD PRIMARY KEY (Date);

desc eicher2;

SELECT * FROM eicher2 LIMIT 100;

# Creating a new table 'hero2' containing the columns as date, close price and Signal
CREATE TABLE hero2 AS
SELECT `Date`,`Close Price`,
CASE
	WHEN `50 Day MA` IS NULL THEN 'NA'
	WHEN (`20 Day MA` > `50 Day MA`) AND (lag(`20 Day MA`) OVER (ORDER BY date) < lag(`50 Day MA`) OVER (ORDER BY date)) THEN "Buy"
    WHEN (`20 Day MA` < `50 Day MA`) AND (lag(`20 Day MA`) OVER (ORDER BY date) > lag(`50 Day MA`) OVER (ORDER BY date)) THEN "Sell"
	ELSE "Hold"
END AS `Signal`
FROM hero1;

# Making Date column as a primary key for hero2 table
ALTER TABLE hero2 ADD PRIMARY KEY (Date);

desc hero2;

SELECT * FROM hero2 LIMIT 100;

# Creating a new table 'infosys2' containing the columns as date, close price and Signal
CREATE TABLE infosys2 AS
SELECT `Date`,`Close Price`,
CASE
	WHEN `50 Day MA` IS NULL THEN 'NA'
	WHEN (`20 Day MA` > `50 Day MA`) AND (lag(`20 Day MA`) OVER (ORDER BY date) < lag(`50 Day MA`) OVER (ORDER BY date)) THEN "Buy"
    WHEN (`20 Day MA` < `50 Day MA`) AND (lag(`20 Day MA`) OVER (ORDER BY date) > lag(`50 Day MA`) OVER (ORDER BY date)) THEN "Sell"
	ELSE "Hold"
END AS `Signal`
FROM infosys1;

# Making Date column as a primary key for infosys2 table
ALTER TABLE infosys2 ADD PRIMARY KEY (Date);

DESC infosys2;

SELECT * FROM infosys2 LIMIT 100;

# Creating a new table 'tcs2' containing the columns as date, close price and Signal
CREATE TABLE tcs2 AS
SELECT `Date`,`Close Price`,
CASE
	WHEN `50 Day MA` IS NULL THEN 'NA'
	WHEN (`20 Day MA` > `50 Day MA`) AND (lag(`20 Day MA`) OVER (ORDER BY date) < lag(`50 Day MA`) OVER (ORDER BY date)) THEN "Buy"
    WHEN (`20 Day MA` < `50 Day MA`) AND (lag(`20 Day MA`) OVER (ORDER BY date) > lag(`50 Day MA`) OVER (ORDER BY date)) THEN "Sell"
	ELSE "Hold"
END AS `Signal`
FROM tcs1;

# Making Date column as a primary key for tcs2 table
ALTER TABLE tcs2 ADD PRIMARY KEY (Date);

desc tcs2;

SELECT * FROM tcs2 LIMIT 100;

# Creating a new table 'tvs2' containing the columns as date, close price and Signal
CREATE TABLE tvs2 AS
SELECT `Date`,`Close Price`,
CASE
	WHEN `50 Day MA` IS NULL THEN 'NA'
	WHEN (`20 Day MA` > `50 Day MA`) AND (lag(`20 Day MA`) OVER (ORDER BY date) < lag(`50 Day MA`) OVER (ORDER BY date)) THEN "Buy"
    WHEN (`20 Day MA` < `50 Day MA`) AND (lag(`20 Day MA`) OVER (ORDER BY date) > lag(`50 Day MA`) OVER (ORDER BY date)) THEN "Sell"
	ELSE "Hold"
END AS `Signal`
FROM tvs1;

# Making Date column as a primary key for tvs2 table
ALTER TABLE tvs2 ADD PRIMARY KEY (Date);

desc tvs2;

SELECT * FROM tvs2 LIMIT 100;

###### QUESTION 4 ######

# Create user-defined function for bajaj to that takes date as input and returns the signal for that particular day (Buy/Sell/Hold) 
CREATE FUNCTION getBajajSignal (dt date)
RETURNS CHAR(4) DETERMINISTIC
RETURN (SELECT `Signal` FROM bajaj2 WHERE date = dt);

# Signal for Buy
SELECT getBajajSignal('2018-05-10');
SELECT getBajajSignal('2018-02-01');

# Signal for Sell
SELECT getBajajSignal('2018-01-25');
SELECT getBajajSignal('2017-06-13'); 

# Signal for Hold
SELECT getBajajSignal('2018-07-27');
SELECT getBajajSignal('2017-10-31');

### THANK YOU ###