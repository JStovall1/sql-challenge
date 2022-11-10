-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Employees] (
    [emp_no] int  NOT NULL ,
    [emp_title_id] string  NOT NULL ,
    [birth_date] date  NOT NULL ,
    [first_name] string  NOT NULL ,
    [last_name] string  NOT NULL ,
    [sex] string  NOT NULL ,
    [hire_date] date  NOT NULL ,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Departments] (
    [dept_no] string  NOT NULL ,
    [dept_name] string  NOT NULL 
)

CREATE TABLE [Dept_Emp] (
    [emp_no] int  NOT NULL ,
    [dept_no] string  NOT NULL ,
    CONSTRAINT [PK_Dept_Emp] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Salaries] (
    [emp_no] int  NOT NULL ,
    [salary] money  NOT NULL ,
    CONSTRAINT [PK_Salaries] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Dept_Manager] (
    [dept_no] string  NOT NULL ,
    [emp_no] int  NOT NULL 
)

CREATE TABLE [Titles] (
    [title_id] string  NOT NULL ,
    [title] string  NOT NULL 
)

ALTER TABLE [Employees] WITH CHECK ADD CONSTRAINT [FK_Employees_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Salaries] ([emp_no])

ALTER TABLE [Employees] CHECK CONSTRAINT [FK_Employees_emp_no]

ALTER TABLE [Employees] WITH CHECK ADD CONSTRAINT [FK_Employees_emp_title_id] FOREIGN KEY([emp_title_id])
REFERENCES [Titles] ([title_id])

ALTER TABLE [Employees] CHECK CONSTRAINT [FK_Employees_emp_title_id]

ALTER TABLE [Dept_Emp] WITH CHECK ADD CONSTRAINT [FK_Dept_Emp_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [Dept_Emp] CHECK CONSTRAINT [FK_Dept_Emp_dept_no]

ALTER TABLE [Salaries] WITH CHECK ADD CONSTRAINT [FK_Salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Dept_Emp] ([emp_no])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_emp_no]

ALTER TABLE [Dept_Manager] WITH CHECK ADD CONSTRAINT [FK_Dept_Manager_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [Dept_Manager] CHECK CONSTRAINT [FK_Dept_Manager_dept_no]

COMMIT TRANSACTION QUICKDBD