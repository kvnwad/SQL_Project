-- Top skills based on salary in Canada for Data Engineers, Data Analysts
-- and Data Scientists.


SELECT
    skills,
    ROUND (AVG(salary_year_avg), 0) AS avg_salary,
    COUNT(skills) AS skill_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
        (job_title_short LIKE '%Data%' AND
        job_location LIKE '%Canada%' AND
        salary_year_avg IS NOT NULL) AND
        job_title_short LIKE '%Engineer%'-- Replace with "Scientist" or "Analyst"

        
GROUP BY
    skills
HAVING 
 COUNT(skills) > 40
ORDER BY
    avg_salary DESC



