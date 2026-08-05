SELECT 
    contract, 
    internet_service, 
    payment_method, 
    COUNT(*) AS total_customers, 
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers, 
    ROUND(
        (SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)::NUMERIC / COUNT(*)) * 100, 
        2
    ) AS churn_rate_pct, 
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN monthly_charges ELSE 0 END)::NUMERIC, 
        2
    ) AS lost_mrr 
FROM vw_telco_churn_clean 
GROUP BY contract, internet_service, payment_method 
HAVING COUNT(*) >= 50 
ORDER BY lost_mrr DESC;
```[cite: 4]