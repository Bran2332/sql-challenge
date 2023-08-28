-- Table Schema

CREATE TABLE Title (
    Title_ID VARCHAR   NOT NULL,
    Title VARCHAR(30)   NOT NULL,
    PRIMARY KEY (Title_ID)
);

CREATE TABLE Employees (
    Emp_No INTEGER   NOT NULL,
    Emp_Title VARCHAR   NOT NULL,
    birth_date date   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date date   NOT NULL,
	PRIMARY KEY (Emp_No),
	FOREIGN KEY(Emp_Title) REFERENCES Title (Title_ID)
);

CREATE TABLE Departments (
    Dept_No VARCHAR   NOT NULL,
    Dept_Name VARCHAR   NOT NULL,
    PRIMARY KEY (Dept_No)
);

CREATE TABLE Depart_Employees (
    Emp_No INTEGER   NOT NULL,
    Dept_No VARCHAR   NOT NULL,
	FOREIGN KEY(Emp_No) REFERENCES Employees (Emp_No),
	FOREIGN KEY(Dept_No) REFERENCES Departments (Dept_No)
);

CREATE TABLE Depart_Managers (
    Dept_No VARCHAR   NOT NULL,
    Emp_No INTEGER   NOT NULL,
	FOREIGN KEY(Dept_No) REFERENCES Departments (Dept_No),
	FOREIGN KEY(Emp_No) REFERENCES Employees (Emp_No)
	
);

CREATE TABLE Salaries (
    Emp_No Integer   NOT NULL,
    Salary VARCHAR   NOT NULL,
	FOREIGN KEY(Emp_No) REFERENCES Employees (Emp_No)
);
