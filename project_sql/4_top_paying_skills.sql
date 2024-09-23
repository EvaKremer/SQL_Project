/*
Question: What are the top skills based on salary in Poland?
- Look at the average salary associated with each skills for Data Analyst positions
- Focuses on roles with specified salaries in Ppland
- Why? It reveals how different skills impact salary levels for Data Analyst and
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),1) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_location = 'Poland'
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
Here is the breakdown of the results for the top paying 
    skills in Poland

- BigQuery & Airflow: Both average at $111,175
- Tableau: Skills in Tableau: average $109,006
- Windows, Spark, Flow, Git: average around $102.500 - $108.000 

[
  {
    "skills": "bigquery",
    "avg_salary": "111175.0"
  },
  {
    "skills": "airflow",
    "avg_salary": "111175.0"
  },
  {
    "skills": "tableau",
    "avg_salary": "109006.3"
  },
  {
    "skills": "windows",
    "avg_salary": "108283.3"
  },
  {
    "skills": "spark",
    "avg_salary": "102500.0"
  },
  {
    "skills": "flow",
    "avg_salary": "102500.0"
  },
  {
    "skills": "git",
    "avg_salary": "102500.0"
  },
  {
    "skills": "hadoop",
    "avg_salary": "102500.0"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "102500.0"
  },
  {
    "skills": "looker",
    "avg_salary": "99979.4"
  },
  {
    "skills": "python",
    "avg_salary": "96072.8"
  },
  {
    "skills": "sql",
    "avg_salary": "86346.7"
  },
  {
    "skills": "gcp",
    "avg_salary": "80492.2"
  },
  {
    "skills": "pyspark",
    "avg_salary": "77757.0"
  },
  {
    "skills": "excel",
    "avg_salary": "74239.2"
  },
  {
    "skills": "sap",
    "avg_salary": "60108.8"
  },
  {
    "skills": "powerpoint",
    "avg_salary": "60108.8"
  },
  {
    "skills": "gdpr",
    "avg_salary": "43200.0"
  }
]

*/