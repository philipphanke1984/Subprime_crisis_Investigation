CREATE DATABASE IF NOT EXISTS economic_analysis;
USE economic_analysis;

select * from iwf_mysql
limit 100
;

select * from iwf_mysql;

-- describe
describe iwf_mysql;

SELECT DISTINCT Indicator
FROM iwf_mysql;


-- VIEW erstellen um alle Daten bis 2015 zu bekommen
CREATE VIEW iwf_2001_2015 AS
SELECT *
FROM iwf_mysql
WHERE year BETWEEN 2001 AND 2015;

select * from iwf_2001_2015;


-- VIEW erstellen für die gesamte Eurozone
DROP VIEW IF EXISTS euro;
CREATE VIEW euro AS
SELECT *
FROM iwf_2001_2015
WHERE PRIMARY_DOMESTIC_CURRENCY = 'Euro';

select * from euro;

-- VIEW erstellen für die genauere Untersuchung der Krise

DROP VIEW IF EXISTS iwf_crisis_analysis;
CREATE OR REPLACE VIEW iwf_crisis_analysis AS

SELECT
    country,

    MAX(CASE WHEN year = 2007
        AND Indicator = 'Gross debt, General government, Percent of GDP'
        THEN value END) AS debt_2007,

    MAX(CASE WHEN year = 2010
        AND Indicator = 'Gross debt, General government, Percent of GDP'
        THEN value END) AS debt_2010,

    MAX(CASE WHEN year = 2007
        AND Indicator = 'Gross domestic product (GDP), Constant prices, Domestic currency'
        THEN value END) AS gdp_2007,

    MAX(CASE WHEN year = 2009
        AND Indicator = 'Gross domestic product (GDP), Constant prices, Domestic currency'
        THEN value END) AS gdp_2009

FROM iwf_2001_2015

GROUP BY country;
select * from iwf_crisis_analysis; 

--
DROP VIEW IF EXISTS iwf_recovery;
CREATE OR REPLACE VIEW iwf_recovery AS
SELECT
    a.country,
    MIN(b.year) AS recovery_year

FROM iwf_crisis_analysis AS a

JOIN iwf_2001_2015 AS b
    ON a.country = b.country

WHERE b.Indicator = 'Gross domestic product (GDP), Constant prices, Domestic currency'
  AND b.year BETWEEN 2010 AND 2015
  AND b.value >= a.gdp_2007

GROUP BY a.country;

--
DROP VIEW IF EXISTS iwf_final_analysis;
CREATE OR REPLACE VIEW iwf_final_analysis AS
SELECT
    a.*,
    b.recovery_year,
    b.recovery_year - 2007 AS recovery_years

FROM iwf_crisis_analysis AS a

LEFT JOIN iwf_recovery AS b
    ON a.country = b.country;
    
select * from iwf_final_analysis;


    


