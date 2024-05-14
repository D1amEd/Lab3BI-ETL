--El valor promedio  de  las ventas diarias
SELECT AVG(DailyAverage) AS OverallAverage FROM (
    SELECT AVG(TotalPrice) AS DailyAverage 
    FROM lab3bi202401-423009.lab_data.Generate_General_ID 
    GROUP BY DateID
) AS DailyAverages;

-- El nombre de los 10 productos más lucrativos
SELECT stockItemName, TotalPrice
FROM (
  SELECT stockItemName, SUM(TotalPrice) as TotalPrice
  FROM lab3bi202401-423009.lab_data.Generate_General_ID as OrderLine
  INNER JOIN lab3bi202401-423009.lab_data.Generate_StockItems_ID as StockItem
  ON OrderLine.StockItemID = StockItem.StockItemID
  GROUP BY stockItemName
) AS Resultados
ORDER BY TotalPrice DESC
LIMIT 10

-- Cuántas órdenes contienen cada tipo de paquete 
SELECT PackageTypeName, COUNT(OrderLine.PackageTypeID) as distintos
  FROM lab3bi202401-423009.lab_data.Generate_General_ID as OrderLine
  INNER JOIN lab3bi202401-423009.lab_data.Generate_PackageTypes_ID as PackageType
  ON OrderLine.PackageTypeID=PackageType.PackageTypeID
  GROUP BY PackageTypeName