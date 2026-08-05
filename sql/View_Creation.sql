CREATE OR REPLACE VIEW vw_telco_churn_clean AS
SELECT 
    customer_id,
    gender,
    senior_citizen,
    partner,
    dependents,
    tenure,
    CASE 
        WHEN tenure <= 12 THEN '0-1 Year'
        WHEN tenure <= 24 THEN '1-2 Years'
        WHEN tenure <= 48 THEN '2-4 Years'
        ELSE '4+ Years'
    END AS tenure_cohort,
    phone_service,
    multiple_lines,
    internet_service,
    online_security,
    online_backup,
    device_protection,
    tech_support,
    streaming_tv,
    streaming_movies,
    contract,
    paperless_billing,
    payment_method,
    monthly_charges,
    NULLIF(TRIM(total_charges), '')::NUMERIC AS total_charges,
    churn
FROM telco_churn;