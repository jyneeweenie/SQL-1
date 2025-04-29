CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Full_Name VARCHAR(100),
    Manager_Id INT,
    Department VARCHAR(50),
    City VARCHAR(50),
    Date_Of_Joining DATE
);
CREATE TABLE Salary_Details (
    Emp_Id INT,
    Base_Salary DECIMAL(10, 2),
    Bonus DECIMAL(10, 2),
    FOREIGN KEY (Emp_Id) REFERENCES Employee(Emp_Id)
);
-- Insert employee data
INSERT INTO Employee (Emp_Id, Full_Name, Manager_Id, Department, City, Date_Of_Joining)
VALUES
    (101, 'John Doe', NULL, 'Engineering', 'Nairobi', '2020-03-15'),
    (102, 'Jane Smith', 101, 'Marketing', 'Mombasa', '2019-07-22'),
    (103, 'Alice Johnson', 101, 'Engineering', 'Kisumu', '2021-01-10');

-- Insert salary details
INSERT INTO Salary_Details (Emp_Id, Base_Salary, Bonus)
VALUES
    (101, 75000.00, 5000.00),
    (102, 65000.00, 4000.00),
    (103, 70000.00, 4500.00);
SELECT
    e.Emp_Id,
    e.Full_Name,
    e.Department,
    e.City,
    e.Date_Of_Joining,
    s.Base_Salary,
    s.Bonus,
    (s.Base_Salary + s.Bonus) AS Total_Salary
FROM
    Employee e
JOIN
    Salary_Details s ON e.Emp_Id = s.Emp_Id;
