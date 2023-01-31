create trigger total_sal_insert
on employee
after insert
as
	begin
		declare @sal float;
		select @sal = i.salary
		from inserted i;
		update department
		set total_sal = total_sal + @sal
	end


select * from department

insert into employee
values(9999,'Mostafa', 75000, 3, 8888)

select * from department

---------------------------------------------------
create trigger total_sal_delete
on employee
after delete
as
	begin
		declare @sal float;
		select @sal = d.salary
		from deleted d;
		update department
		set total_sal = total_sal - @sal
	end


select * from department

delete from employee
where employee.ssn = 1111

select * from department

--------------------------------------------------
---------------------------------------------------

create trigger total_sal_update
on employee
after update
as
	begin
		declare @old_sal float;
		select @old_sal = d.salary
		from deleted d;

		declare @new_sal float;
		select @new_sal = i.salary
		from inserted i;

		if (UPDATE(salary))
		begin
			update department
			set total_sal = total_sal - @old_sal + @new_sal
		end

		if (UPDATE(dno))
		begin
			declare @old_dep int
			select @old_dep = d.dno
			from deleted d

			declare @new_dep int
			select @new_dep = i.dno
			from inserted i

			update department
			set total_sal = total_sal - @old_sal
			where dno = @old_dep

			update department
			set total_sal = total_sal + @new_sal
			where dno = @new_dep
		end
	end

select * from department

update employee
set salary = 300000
where ssn = 6666

select * from department


select * from department

update employee
set dno = 3
where ssn = 6666

select * from department

