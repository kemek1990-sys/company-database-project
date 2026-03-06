-- employee_project_assignments.sql
-- Assign employees to projects
-- Each employee will be assigned to 1–3 random projects

INSERT INTO Employee_Projects (EmployeeID, ProjectID)
SELECT e.EmployeeID, p.ProjectID
FROM Employees e
JOIN Projects p
WHERE p.ProjectID IN (
    FLOOR(1 + RAND() * 20),  -- random project 1
    FLOOR(1 + RAND() * 20),  -- random project 2
    FLOOR(1 + RAND() * 20)   -- random project 3
)
ORDER BY RAND();