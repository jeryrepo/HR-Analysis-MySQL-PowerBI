
https://github.com/jeryrepo/HR-Analysis-MySQL-PowerBI/assets/142509067/e69bf4e5-33ba-4a0b-a731-6b4eb24800b5



# HR-Analysis-MySQL-PowerBI
The dataset was cleaned and queried using MySQL and visualized using PowerBI.

# Data Cleaning Summary:

In the process of cleaning the data, the following steps were undertaken to ensure data quality and consistency:

1) Ambiguous Column Names:
   Ambiguous column names were revised for clarity and understanding.

2) Date Column Handling:
   The date column, initially stored in varchar datatype with varying date formats, was addressed. A Case statement was utilized to identify the diverse date formats present in the data. Subsequently, the str_to_date() function was applied to convert these varied formats into a standardized date format. Finally, the date_format() function was employed to ensure uniformity in date representation.

3) Missing Date Values:
   In instances where the date column had missing values and the existing dates were in UTC format, a specific date format was assigned to the missing values, as they held significance for the analysis. Similar to step 2, the str_to_date() and date_format() functions were employed to achieve consistency in date formatting.

4) Handling Format Issues:
   To address format inconsistencies, the str_to_date() function, which returns null when it cannot parse its input datetime argument using the format string argument, was utilized. Coalesce() was employed in conjunction with str_to_date() to handle these cases and ensure data integrity.

5) Gender Format Standardization:
   The gender column was modified to follow a uniform format. Both "male" and "female" formats were transformed into "M" and "F," respectively.

These cleaning steps were crucial to enhance data quality and consistency, making the dataset more suitable for analysis and reporting.


*********************************************************************************************


# Summary of Findings:

The analysis revealed several key findings:

1. Gender Distribution:
   Male employees constitute the highest percentage, followed by females, with non-confirming genders being the least represented in the workforce.

2. Racial Diversity:
   The analysis illustrates a predominance of individuals of the White race, while Native Hawaiian and American Indian employees are the least prevalent among the workforce.

3. Age Range:
   The youngest employee  is 21 years old, while the oldest is 57 years old. To better understand the age distribution, three age groups were created, with "Millennials" being the largest group, followed by "Gen X" and "Gen Z."

4. Work Location:
   A significant number of employees work at the headquarters.

5. Average Employment Length:
   Terminated employees, on average, had an employment tenure of approximately 7 years, indicating relatively stable career lengths within the organization.

6. Gender Distribution by Department:
   Gender distribution across departments is generally balanced, although there are more male employees than females in the organization.

7. Turnover Rates by Department:
   The Auditing department exhibits the highest turnover rate, followed by Legal. In contrast, the Marketing, HR, Services, and Business Development departments experience the lowest turnover rates.

8. Employee Origin:
   A significant proportion of employees hail from the state of Ohio, indicating a regional concentration of the workforce.

9. Yearly Employee Changes:
   The data shows an increasing trend in the net change of employees over the years, potentially reflecting growth or expansion of the organization.

10. Departmental Tenure:
    On average, the tenure within each department is approximately 7 years. Sales, Marketing, and Auditing have the highest departmental tenures, while Support, Product Management, and Legal departments have the lowest.
