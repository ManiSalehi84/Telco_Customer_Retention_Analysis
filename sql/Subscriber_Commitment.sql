SELECT 
    contract, 
    tenure_cohort, 
    COUNT(*) AS total_customers, 
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers, 
    ROUND(
        (SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)::NUMERIC / COUNT(*)) * 100, 
        2
    ) AS churn_rate_pct, 
    ROUND(SUM(CASE WHEN churn = 'Yes' THEN monthly_charges ELSE 0 END), 2) AS lost_mrr 
FROM vw_telco_churn_clean 
GROUP BY contract, tenure_cohort 
ORDER BY lost_mrr DESC;