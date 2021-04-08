CREATE TABLE departments (
	dept_no varchar(4) NOT NULL PRIMARY KEY,
	dept_name varchar(40) NOT NULL UNIQUE
);

CREATE TABLE employees (
	emp_no int NOT NULL PRIMARY KEY,
	birth_date date NOT NULL,
	first_name varchar(40) NOT NULL,
	last_name varchar(40) NOT NULL,
	gender varchar(6) NOT NULL,
	hire_date date NOT NULL
);

CREATE TABLE dept_emp (
	emp_no int NOT NULL,
	dept_no varchar(4) NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no varchar(4) NOT NULL,
	emp_no int NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries (
	emp_no int NOT NULL PRIMARY KEY,
	salary int NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
	emp_no int NOT NULL,
	title varchar NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	PRIMARY KEY (emp_no,title,from_date),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);