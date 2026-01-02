SELECT 
    LoginID,
    RIGHT(LoginID,(len(LoginID)-CHARINDEX('\',LoginID))) AS LoginID_Without_Domain_Name,
    SUBSTRING(EmailAddress, 17, 5) AS Substring_EmailAddress
    

FROM DimEmployee;

-- Watched video minute 30