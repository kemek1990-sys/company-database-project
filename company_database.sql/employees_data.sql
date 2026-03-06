-- Generate 1000 employees automatically
WITH RECURSIVE EmployeeGenerator AS (
    SELECT 1 AS EmployeeID
    UNION ALL
    SELECT EmployeeID + 1
    FROM EmployeeGenerator
    WHERE EmployeeID < 1000
)
INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID, Salary, HireDate)
SELECT
    EmployeeID,
    CONCAT('Employee_', EmployeeID),
    FLOOR(1 + RAND() * 10),                      -- Random DepartmentID 1-10
    FLOOR(50000 + RAND() * 70000),               -- Random salary 50k–120k
    DATE_ADD('2016-01-01', INTERVAL FLOOR(RAND() * 2500) DAY) -- Random hire date
FROM EmployeeGenerator;