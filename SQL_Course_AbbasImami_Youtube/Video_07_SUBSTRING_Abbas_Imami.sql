SELECT 
    LoginID,
    RIGHT(LoginID,(len(LoginID)-CHARINDEX('\',LoginID))) AS PositionOfBackslash

FROM DimEmployee;

-- Watched video minute 11