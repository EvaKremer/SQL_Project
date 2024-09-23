/*
Question: What are the top-paying data analyst jobs?
- Using ROUND to change decimal place and remove .0 
- Changing Date Data Type to remove exact time of posting
- Identify the top 10 highest-paying Data Analyst roles that are avalible remotely in Poland.
- Focus on job postings with salary specified (remove NULLs)
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights from dataset
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    ROUND(salary_year_avg) AS salary_year_avg,
    job_posted_date::date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Poland' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;