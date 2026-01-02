SELECT 
    LoginID,
    RIGHT(LoginID,(len(LoginID)-CHARINDEX('\',LoginID))) AS LoginID_Without_Domain_Name,
    SUBSTRING(EmailAddress, CHARINDEX('@', EmailAddress), 5) AS Company_Name
  

FROM DimEmployee;

-- Watched video minute 30