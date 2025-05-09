/* 
Question: What are the top paying Data related jobs in Candad?
*/

SELECT
    job_id,
    job_title_short,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short LIKE '%Data%' AND
    job_location LIKE '%Canada%' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC


