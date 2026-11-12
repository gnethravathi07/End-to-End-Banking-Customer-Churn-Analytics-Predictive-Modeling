--- Which customer profiles have the highest churn risk rate based on the gender

USE BankChurn;

WITH 
    MainTlb AS
    (

    SELECT 
        [Gender],
        COUNT(*) AS TotalCustomer,
        SUM(CAST([Churned] AS INT)) AS TotalChurn
    FROM [dbo].[demographic]
    GROUP BY [Gender]
    )

SELECT *,
        FORMAT((TotalChurn *100/TotalCustomer), 'N2')+ '%' AS ChurnRate
FROM MainTlb

