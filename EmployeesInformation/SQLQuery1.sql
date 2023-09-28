SELECT TOP (1000) [EmpId]
      ,[FullName]
      ,[ManagerId]
      ,[DateOfJoining]
      ,[City]
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails]

  --1--
  SELECT EmpId, FullName
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails]
  WHERE ManagerId = 986

  --2--
  SELECT Project
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary]
  GROUP BY Project

  --3--
  SELECT Count (Project) AS Employees_Working_In_P1
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary]
  WHERE Project = 'P1'

  --4--
  SELECT 
  MIN (Salary) AS Min_Salary,
  MAX (Salary) AS Max_Salary,
  AVG (Salary) AS Average
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary]

  --5--
  SELECT EmpId
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary]
  WHERE Salary > 9000 AND Salary < 15000

  SELECT EmpId
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary]
  WHERE Salary BETWEEN 9000 AND 15000

  --6--
  SELECT *
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails]
  WHERE City = 'Toronto' AND ManagerId = 321

  --7--
  SELECT *
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails]
  WHERE City = 'California' OR ManagerId = 321

  --8--
  SELECT *
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails] D, [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary] S
  WHERE D.EmpId = S.EmpId AND NOT Project = 'P1'

  --9--
  SELECT EmpId, Salary+Variable AS TotalSalary
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary]

  --10--
  SELECT *
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails]
  WHERE CHARINDEX('hn', FullName) = 3

  --11--
  SELECT EmpId FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails]
  UNION ALL
  SELECT EmpId FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails]
 
  select top 1 EmpId
  from [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails]
  order by NEWID()

  --12--
  SELECT DISTINCT D.EmpId
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails] D INNER JOIN [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary] S ON D.EmpId = S.EmpId

  --13--
  SELECT *
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails] D
  WHERE D.EmpId NOT IN (SELECT S.EmpId FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary] S)

  --14--
  SELECT D.EmpId AS EmpIds
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary] S, [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails] D
  GROUP BY D.EmpId

  --15--
  SELECT *
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails] D
  WHERE D.EmpId NOT IN(select S.EmpId from [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary] S)

  --16--
  SELECT FullName, REPLACE(FullName, ' ', '-')
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails]

  --17--
  SELECT CHARINDEX('hn', 'John')

  SELECT CHARINDEX('hn', FullName) AS MatchPosition
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails]

  --18--
  SELECT EmpID, ManagerId
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails]

  --19--
  SELECT 
  UPPER(FullName) AS FullName,
  LOWER(City) AS City
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails]

  --20--
  SELECT COUNT(CHARINDEX('n', FullName))
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails]

  --21--
  UPDATE [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails]
  SET FullName = '' + FullName + ''
  WHERE FullName = '_' + FullName + ' '

  UPDATE [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails]
  select LTRIM(FullName)
  from [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails]
  

  --22--
  SELECT *
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails] D 
  WHERE D.EmpId NOT IN (SELECT S.EmpId FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary] S)

  --23--
  SELECT D.FullName
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails] D, [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary] S
  WHERE D.EmpId = S.EmpId AND Salary > 5000 AND Salary <= 10000

  SELECT D.FullName
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails] D
  inner join [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary] S on D.EmpId = S.EmpId
  where Salary between 5000 And 10000

  --24--
  SELECT GETDATE();

  --25--
  SELECT *
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails] D
  WHERE YEAR(DateOfJoining) = '2020'

  --26--
  SELECT *
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails] D
  WHERE D.EmpId IN(Select EmpId From [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary])

  --27--
  SELECT Project, Count(Project) AS Nmb_Of_Emp
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary]
  GROUP BY Project
  ORDER BY Count(Project) Desc

  --28--
  SELECT FullName, Salary
  FROM [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails] D, [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary] S
  WHERE D.EmpId = S.EmpId

  --29--

  Select *
  from [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary] S Right Join [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails] D
  on S.EmpId = D.EmpId
  where S.EmpId IS NULL

  Select * From [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary]
  Select * From [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails]

  select *
  from [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails] D
  where D.EmpId not in (select D.EmpId from [EMPLOYEEINFORMATION].[dbo].[EmployeeSalary] S inner join [EMPLOYEEINFORMATION].[dbo].[EmployeeDetails] D on D.EmpId = S.EmpId)
