/*
Identify the top 10 average best paying skills for Data Analysts.
Focuses on job postings in Brazil.
Provides insights on the best average paying skills for job seekers.
*/
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS salary_avg
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
AND job_country = 'Brazil'
GROUP BY skills
ORDER BY salary_avg DESC
LIMIT 10;