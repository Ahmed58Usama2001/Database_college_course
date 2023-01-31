use Company
go
create procedure spGetEmployees
as
begin
	set nocount on
	select * from employee
end
execute spGetEmployees
---------------------------------------------------------------
create procedure spGetEmpName
@input_ssn int,
@emp_name varchar(20) output
as
begin
	select @emp_name = name
	from employee
	where ssn = @input_ssn
end

declare @result varchar(20)
execute spGetEmpName @input_ssn = 4444, @emp_name = @result output
select @result

---------------------------------------------------------------
create procedure spInsertEmp
@emp_ssn int,
@emp_name varchar(20),
@emp_salary float,
@emp_dno int,
@emp_supervisor_ssn int
as 
begin
	begin try
		insert into employee(ssn, name, salary, dno, supervisor_ssn)
		values(@emp_ssn, @emp_name, @emp_salary, @emp_dno, @emp_supervisor_ssn)
		return 0
	end try
	begin catch
		return 1
	end catch
end

execute spGetEmployees
declare @status int
execute @status = spInsertEmp 2222, 'ahmed', 10000, 2, 4444
select @status
execute spGetEmployees

-----------------------------------------------------------------
execute spGetEmployees
declare @status int
execute @status = spInsertEmp 1234, 'ahmed', 10000, 2, 4444
select @status
execute spGetEmployees

select * from department

