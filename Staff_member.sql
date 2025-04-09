create table if not exists Employees (
	Employee_ID SERIAL primary key,
	name VARCHAR(80) not null,
	departament VARCHAR(100) not null,
	Boss_ID INT, FOREIGN key (Employee_ID) REFERENCES Employees(Employee_ID)
)