					--lEFT AND RIGHT OUTER JOIN
/*
 **SHOW ALL THE INFORMATION FOR ONE TABLE AND OPNLY THE INTERSECTION 
 **FOR THE OTHER TABLE
 **PUT A NULL VALUE IF THE PRODUCT SUBCATEGORY IS NOT ASOCIATED WITH THE PRODUCT BUR RETURN ALL
 */

USE [AdventureWorks2012]
GO

--find all product information regardless of the product asociation with the product subcartegory
--LEFT
SELECT P.Name, P.ProductNumber, PS.Name AS [ProductSubCategoryName]
FROM Production.Product P
LEFT OUTER JOIN Production.ProductSubcategory PS
ON PS.ProductSubcategoryID = P.ProductSubcategoryID

--RIGFHT
SELECT P.Name, P.ProductNumber, PS.Name AS [ProductSubCategoryName]
FROM Production.ProductSubcategory PS
RIGHT OUTER JOIN Production.Product P
ON P.ProductSubcategoryID = PS.ProductSubcategoryID

----- more examples on left and outer join
SELECT 
	PP.FirstName, PP.LastName,
	SO.SalesOrderNumber, SO.TotalDue,
	ST.Name AS [Territory Name]
FROM Sales.SalesOrderHeader SO
LEFT OUTER JOIN Sales.SalesPerson SP
ON  SO.SalesPersonID = SP.BusinessEntityID
LEFT OUTER JOIN HumanResources.Employee HE
ON HE.BusinessEntityID = SP.BusinessEntityID
LEFT OUTER JOIN Person.Person PP
ON PP.BusinessEntityID = HE.BusinessEntityID
LEFT  OUTER JOIN Sales.SalesTerritory ST
ON ST.TerritoryID = SP.TerritoryID 
WHERE ST.Name = 'Northwest'
ORDER BY TotalDue DESC