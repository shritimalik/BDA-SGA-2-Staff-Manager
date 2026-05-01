INSERT INTO departments (name, location)
SELECT * FROM (SELECT 'Engineering', 'New York') AS tmp
WHERE NOT EXISTS (SELECT name FROM departments WHERE name = 'Engineering');

INSERT INTO departments (name, location)
SELECT * FROM (SELECT 'Marketing', 'London') AS tmp
WHERE NOT EXISTS (SELECT name FROM departments WHERE name = 'Marketing');

INSERT INTO departments (name, location)
SELECT * FROM (SELECT 'Finance', 'Chicago') AS tmp
WHERE NOT EXISTS (SELECT name FROM departments WHERE name = 'Finance');

INSERT INTO departments (name, location)
SELECT * FROM (SELECT 'Human Resources', 'Toronto') AS tmp
WHERE NOT EXISTS (SELECT name FROM departments WHERE name = 'Human Resources');

INSERT INTO departments (name, location)
SELECT * FROM (SELECT 'Operations', 'Berlin') AS tmp
WHERE NOT EXISTS (SELECT name FROM departments WHERE name = 'Operations');

INSERT INTO departments (name, location)
SELECT * FROM (SELECT 'Product', 'San Francisco') AS tmp
WHERE NOT EXISTS (SELECT name FROM departments WHERE name = 'Product');

INSERT INTO departments (name, location)
SELECT * FROM (SELECT 'Legal', 'Paris') AS tmp
WHERE NOT EXISTS (SELECT name FROM departments WHERE name = 'Legal');

INSERT INTO departments (name, location)
SELECT * FROM (SELECT 'Design', 'Amsterdam') AS tmp
WHERE NOT EXISTS (SELECT name FROM departments WHERE name = 'Design');

INSERT INTO departments (name, location)
SELECT * FROM (SELECT 'Sales', 'Dubai') AS tmp
WHERE NOT EXISTS (SELECT name FROM departments WHERE name = 'Sales');

INSERT INTO departments (name, location)
SELECT * FROM (SELECT 'Research', 'Tokyo') AS tmp
WHERE NOT EXISTS (SELECT name FROM departments WHERE name = 'Research');

INSERT INTO departments (name, location)
SELECT * FROM (SELECT 'Customer Support', 'Sydney') AS tmp
WHERE NOT EXISTS (SELECT name FROM departments WHERE name = 'Customer Support');

INSERT INTO departments (name, location)
SELECT * FROM (SELECT 'Data Analytics', 'Singapore') AS tmp
WHERE NOT EXISTS (SELECT name FROM departments WHERE name = 'Data Analytics');


-- Employees with North Indian names
INSERT INTO employees (name, email, job_title, department_id)
SELECT * FROM (SELECT 'Rahul Sharma', 'rahul.sharma@company.com', 'Software Engineer', 1) AS tmp
WHERE NOT EXISTS (SELECT email FROM employees WHERE email = 'rahul.sharma@company.com');

INSERT INTO employees (name, email, job_title, department_id)
SELECT * FROM (SELECT 'Priya Singh', 'priya.singh@company.com', 'Marketing Analyst', 2) AS tmp
WHERE NOT EXISTS (SELECT email FROM employees WHERE email = 'priya.singh@company.com');

INSERT INTO employees (name, email, job_title, department_id)
SELECT * FROM (SELECT 'Amit Verma', 'amit.verma@company.com', 'Financial Controller', 3) AS tmp
WHERE NOT EXISTS (SELECT email FROM employees WHERE email = 'amit.verma@company.com');

INSERT INTO employees (name, email, job_title, department_id)
SELECT * FROM (SELECT 'Neha Gupta', 'neha.gupta@company.com', 'HR Coordinator', 4) AS tmp
WHERE NOT EXISTS (SELECT email FROM employees WHERE email = 'neha.gupta@company.com');

INSERT INTO employees (name, email, job_title, department_id)
SELECT * FROM (SELECT 'Rajesh Kumar', 'rajesh.kumar@company.com', 'Operations Manager', 5) AS tmp
WHERE NOT EXISTS (SELECT email FROM employees WHERE email = 'rajesh.kumar@company.com');

INSERT INTO employees (name, email, job_title, department_id)
SELECT * FROM (SELECT 'Pooja Mehta', 'pooja.mehta@company.com', 'Product Manager', 6) AS tmp
WHERE NOT EXISTS (SELECT email FROM employees WHERE email = 'pooja.mehta@company.com');

INSERT INTO employees (name, email, job_title, department_id)
SELECT * FROM (SELECT 'Sanjay Malhotra', 'sanjay.malhotra@company.com', 'Legal Counsel', 7) AS tmp
WHERE NOT EXISTS (SELECT email FROM employees WHERE email = 'sanjay.malhotra@company.com');

INSERT INTO employees (name, email, job_title, department_id)
SELECT * FROM (SELECT 'Anjali Nair', 'anjali.nair@company.com', 'UI Designer', 8) AS tmp
WHERE NOT EXISTS (SELECT email FROM employees WHERE email = 'anjali.nair@company.com');

INSERT INTO employees (name, email, job_title, department_id)
SELECT * FROM (SELECT 'Vikram Rathore', 'vikram.rathore@company.com', 'Sales Executive', 9) AS tmp
WHERE NOT EXISTS (SELECT email FROM employees WHERE email = 'vikram.rathore@company.com');

INSERT INTO employees (name, email, job_title, department_id)
SELECT * FROM (SELECT 'Divya Joshi', 'divya.joshi@company.com', 'Research Scientist', 10) AS tmp
WHERE NOT EXISTS (SELECT email FROM employees WHERE email = 'divya.joshi@company.com');

INSERT INTO employees (name, email, job_title, department_id)
SELECT * FROM (SELECT 'Manish Tiwari', 'manish.tiwari@company.com', 'Support Specialist', 11) AS tmp
WHERE NOT EXISTS (SELECT email FROM employees WHERE email = 'manish.tiwari@company.com');

INSERT INTO employees (name, email, job_title, department_id)
SELECT * FROM (SELECT 'Kavita Reddy', 'kavita.reddy@company.com', 'Data Analyst', 12) AS tmp
WHERE NOT EXISTS (SELECT email FROM employees WHERE email = 'kavita.reddy@company.com');

INSERT INTO employees (name, email, job_title, department_id)
SELECT * FROM (SELECT 'Arjun Kapoor', 'arjun.kapoor@company.com', 'Backend Engineer', 1) AS tmp
WHERE NOT EXISTS (SELECT email FROM employees WHERE email = 'arjun.kapoor@company.com');

INSERT INTO employees (name, email, job_title, department_id)
SELECT * FROM (SELECT 'Swati Saxena', 'swati.saxena@company.com', 'Brand Strategist', 2) AS tmp
WHERE NOT EXISTS (SELECT email FROM employees WHERE email = 'swati.saxena@company.com');