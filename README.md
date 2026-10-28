Author: Philipp Hanke
Date: 10/28/2026
project: An investigation on the subprime crisis in 2007/08. Lead higher government debts to a quicker economic recovery?

# Government Debt and Economic Recovery - an investigation on the subprime crisis in 2007/08

1. Project Overview

This project investigates the relationship between changes in government debt and economic recovery following the global financial crisis of 2007/08.
The analysis includes 20 selected countries (19 European countries and the United States) and examines two periods:

Financial Crisis: 2007–2010
Economic Recovery: 2010–2015

The objective is to determine whether changes in government debt are statistically associated with GDP growth during and after the financial crisis.

2. Research Question
How is the change in government debt associated with economic recovery following the 2008 financial crisis?

Two hypotheses were examined:
H0: There is no linear relationship between changes in government debt and GDP growth.
H1: There is a linear relationship between changes in government debt and GDP growth.

3. Data Sources
Economic data was obtained from:
International Monetary Fund (IMF)
World Bank

The analysis focuses on economic indicators including:
Government debt
GDP growth
Inflation
Unemployment

4. Technologies and Tools
The project uses the following technologies:
Python / Pandas: Data cleaning, preparation and transformation
MySQL: Data processing, SQL queries and database views
Statistical Analysis: Pearson correlation, OLS regression and multiple regression
Data Visualization: Graphical presentation of statistical relationships

5. Statistical Methodology
Three statistical approaches were applied:
Pearson Correlation
Measures the strength and direction of the linear relationship between changes in government debt and GDP growth.
Ordinary Least Squares (OLS) Regression
Estimates the statistical association between changes in government debt and GDP growth.
Multiple Regression
Examines GDP growth in relation to government debt, inflation and unemployment.

6. Key Findings
Metric
Crisis 2007–2010
Recovery 2010–2015
Pearson Correlation
-0.3775
+0.2381
OLS Coefficient
-0.1764
+0.1985
p-value
0.101
0.312
R²
0.142
0.057

The analysis identifies a moderate negative correlation during the financial crisis and a weak positive correlation during the recovery period.
However, neither simple OLS regression coefficient is statistically significant at the 5% significance level.
The null hypothesis cannot be rejected.

7. Economic Interpretation

The results do not establish a statistically significant linear relationship between changes in government debt and GDP growth.
Additional government borrowing might have mitigated the economic downturn. However, this hypothesis cannot be confirmed by the correlation and regression analyses conducted in this project.

Structural differences between countries, initial debt levels and other economic factors may influence economic recovery.
Correlation does not imply causation.

8. Repository Structure

Pandas/ – Python and Pandas scripts for data preparation and analysis
SQL/ – MySQL scripts, queries and database transformations
README.md – Project overview, methodology and findings

9. Conclusion

This project demonstrates the application of data analytics and statistical methods to an economic research question.
It combines economic data, programming, database operations and statistical analysis to investigate the relationship between government debt and economic recovery following the global financial crisis.


