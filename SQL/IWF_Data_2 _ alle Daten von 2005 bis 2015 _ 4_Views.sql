use economic_analysis;

select * from iwf_mysql;
select count(distinct country) from iwf_mysql;

select * from weltbank_mysql;

select country, Indicator , year, value
from iwf_mysql
where year between 2005 and 2015 and Indicator like '%debt%'
;

select `Country Name`, `Indicator Name`, year, round(value,3)
from weltbank_mysql
where year between 2005 and 2015 and `Indicator Name` like '%consumer%';

select `Country Name`, `Indicator Name`, year, round(value,3)
from weltbank_mysql
where year between 2005 and 2015 and `Indicator Name` like 'Unemployment%';

------------------------------------------------------------------------------------------------------

-- Erstellung aller vier Views
select * from iwf_mysql;

-- VIEW: Staatsschulden
DROP VIEW IF EXISTS view_debt;
create or replace view view_debt as 
select country, Indicator , year, value
from iwf_mysql
where year between 2005 and 2015 and Indicator like '%debt%'
;

-- VIEW: Reales BIP
DROP VIEW IF EXISTS view_debt;
CREATE OR REPLACE VIEW view_debt AS
SELECT country, year, value AS gdp
FROM iwf_mysql
WHERE year BETWEEN 2005 AND 2015
AND Indicator = 'Gross domestic product (GDP), Constant prices, Domestic currency';

-- VIEW: Arbeitslosigkeit
DROP VIEW IF EXISTS view_unemployment;
CREATE OR REPLACE VIEW view_unemployment AS
SELECT
    `Country Name` AS country,
    year,
    value AS unemployment
FROM weltbank_mysql
WHERE year BETWEEN 2005 AND 2015
AND `Indicator Code` = 'SL.UEM.TOTL.ZS';

-- VIEW: Inflation
DROP VIEW IF EXISTS view_inflation;
CREATE OR REPLACE VIEW view_inflation AS
SELECT
    `Country Name` AS country,
    year,
    value AS inflation
FROM weltbank_mysql
WHERE year BETWEEN 2005 AND 2015
AND `Indicator Code` = 'FP.CPI.TOTL.ZG';

