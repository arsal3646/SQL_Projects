SELECT 
    LoginID,
    RIGHT(LoginID,(len(LoginID)-CHARINDEX('\',LoginID))) AS LoginID_Without_Domain_Name,
    CHARINDEX('@', EmailAddress) AS At_Position, -- This is the starting position
    CHARINDEX('.', EmailAddress) AS Dot_Position,
    SUBSTRING(EmailAddress, CHARINDEX('@', EmailAddress)+1, (CHARINDEX('.', EmailAddress))- (CHARINDEX('@', EmailAddress)+1)) AS EmailDomain,
    
    -- Replace hiphen with space
    REPLACE (SUBSTRING(EmailAddress, CHARINDEX('@', EmailAddress)+1, (CHARINDEX('.', EmailAddress))- (CHARINDEX('@', EmailAddress)+1)), '-', ' ') AS EmailDomain_Without_Hiphen

FROM DimEmployee;

-- Watched video till the end.