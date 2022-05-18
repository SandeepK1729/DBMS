Aim : Working with triggers using QL/SQL
working with triggers using ql/sql
A trigger is the set of sql statement stored in the database which are executed or fixed when some event associated with the table occurs.
Trigger are special kind of storing procedures that are executed atomatically in reponse of some event
Syntax :
	create (or) replace trigger <trigger_name>
	<trigger_time>	// before or after
	<trigger_event> // insert, update, delete ( DDL & DML )
	on <tablename>
	for each row 
	<trigger_body>
	
Trigger body: 
	Declare
		<declare statement>
      	begin
		<trigger statement>
      	end;
	
Example-1:
mysql> create table student(sid int,name varchar(20), branch varchar(10));
	Query OK, 0 rows affected (0.02 sec)

mysql> delimiter @

mysql> create trigger trig
    -> before insert on student
    -> for each row begin
    -> insert into log values ("one row is created");
    -> end
    -> @
	Query OK, 0 rows affected (0.05 sec)

mysql> select * from student;
    -> @
	Empty set (0.00 sec)

mysql> select * from log;@
	Empty set (0.00 sec)

mysql> insert into student values(1, "K. Sandeep", "CSM");@
	Query OK, 1 row affected (0.00 sec)

mysql> select * from student;
    -> @
	+------+------------+--------+
	| sid  | name       | branch |
	+------+------------+--------+
	|    1 | K. Sandeep | CSM    |
	+------+------------+--------+
	1 row in set (0.00 sec)

mysql> select * from log;@
	+--------------------+
	| log                |
	+--------------------+
	| one row is created |
	+--------------------+
	1 row in set (0.00 sec)

Example-2:
	create trigger norder 
	after update on medicine
	for each row begin
		if new.quantity < 20 then 
			insert into neworder values(new.mid, new.medicine, new.quantity);
		endif;
	end;
	@
