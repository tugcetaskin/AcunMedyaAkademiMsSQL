SELECT TOP (1000) [customer_id]
      ,[customer_name]
      ,[city]
      ,[grade]
      ,[salesman_id]
  FROM [SALESDETAILS].[dbo].[Customer]

  --1-Find the name and city of those customers and salesmen who lives in the same city
  SELECT C.customer_name, S.name, C.city
  FROM [SALESDETAILS].[dbo].[Customer] C LEFT JOIN [SALESDETAILS].[dbo].[Salesman] S ON C.salesman_id = S.salesman_id
  WHERE C.city = S.city

  --2-Find the names of all customers along with the salesmen who works for them
  SELECT C.customer_name, S.name
  FROM [SALESDETAILS].[dbo].[Customer] C LEFT JOIN [SALESDETAILS].[dbo].[Salesman] S ON C.salesman_id = S.salesman_id

  --3- Display all those orders by the customers not located in the same cities where their salesmen live
  SELECT *
  FROM [SALESDETAILS].[dbo].[Order] O LEFT JOIN [SALESDETAILS].[dbo].[Customer] C ON O.customer_id = C.customer_id
  WHERE C.customer_id NOT IN (
  SELECT C.customer_id
  FROM [SALESDETAILS].[dbo].[Customer] C LEFT JOIN [SALESDETAILS].[dbo].[Salesman] S ON C.salesman_id = S.salesman_id
  WHERE C.city = S.city)

  --4- Display all the orders issued by the salesman 'Paul Adam' from the orders table
  SELECT *
  FROM [SALESDETAILS].[dbo].[Order] O LEFT JOIN [SALESDETAILS].[dbo].[Salesman] S ON O.salesman_id = S.salesman_id
  WHERE name = 'Paul Adam'

  --5- Extract the data from the orders table for the salesman who earned the maximum commission
  SELECT *
  FROM [SALESDETAILS].[dbo].[Order] O LEFT JOIN [SALESDETAILS].[dbo].[Salesman] S ON O.salesman_id = S.salesman_id
  WHERE S.commission IN (
  SELECT MAX(S.commission)
  FROM [SALESDETAILS].[dbo].[Salesman] S)

  --6- Find the name and ids of all salesmen who had more than one customer
  SELECT COUNT(C.salesman_id)
  FROM [SALESDETAILS].[dbo].[Customer] C LEFT JOIN [SALESDETAILS].[dbo].[Salesman] S ON C.salesman_id = S.salesman_id
  GROUP BY C.salesman_id

  --7- Display all the orders that had amounts that were greater than at least one of the orders from September 10th 2012.
  



