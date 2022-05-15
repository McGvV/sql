create table salary (
	id serial primary key,
	monthly_salary int not null
);
-- primary key - автоматически прописываетс€ по пор€дку
-- int число
-- varchar (x) строка (количество символов)
-- unque уникальный
create table roles (
	id serial primary key,
	role_title varchar (50) unique not null
);

--foreign key (id_role) references roles(id) св€зываем столбец () со столбцом () 
-- рел€ци€
create table roles_salary (
	id serial primary key,
	id_role int not null,
	id_salary int not null,
	foreign key (id_role)
		references roles(id),
	foreign key (id_salary)
		references salary(id)
);

--так как id у нас прописываетс€ автоматически (primary key), мы вводим данные только дл€ второго столбца
-- если мы указываем в параметрах ид insert into salary (id, monthly_salary)
-- то следует исплозтвать параметр default values (default, 1000)
insert into salary (monthly_salary)
values (1000),(1200),(2000),(2100),(1100),(3000),(2000),(2500),(3500),(4000),(12000),(1500);

insert into salary (id, monthly_salary)
values (default,1000),
		(default,1250),
		(default,4300),
		(default,2100),
		(default,1400),
		(default,3000),
		(default,2050),
		(default,2700),
		(default,3600),
		(default,2600),
		(default,6000),
		(default,1900);
	
insert into roles (role_title)
values ('QA_engineer_automation_junior'),
		('QA_engineer_automation_middle'),
		('QA_engineer_automation_senior'),
		('java_developer_junior'),
		('java_developer_middle'),
		('java_developer_senior'), 
		('python_developer_junior'),
		('python_developer_middle'),
		('python_developer_senior'), 
		('manager'),
		('designer'),
		('HR');
		
insert into roles_salary(id_role,id_salary)
values (1,3),
	   (2,19),
	   (3,20),
	   (4,8),
	   (5,6),
	   (6,7),
	   (7,11),
	   (8,15),
	   (9,12),
	   (10,13),
	   (11,10),
	   (12,9),
	   (13,5),
	   (14,14),
	   (15,18),
	   (16,15);
	  
--добавл€ем в таблицу roles столбец parking с числовым значением
alter table roles
add column parking int;
	 
-- переименовываем столбец
alter table roles
rename column parking to taxi;

--удал€ем столбец
alter table roles
drop column taxi;

--мен€ем числовое значение  на строку
alter table roles
alter column parking type varchar (30) using parking::varchar(30);

--мен€ем строку на числовое значение
alter table roles
alter column parking type int using parking::int;

--мен€ем значени€ в таблице
update roles
set role_title = 'HR_partner'
where id = 18;

