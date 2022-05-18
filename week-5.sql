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
	
Trigger body: Declare
		<declare statement>
	      begin
		<trigger statement>
	      end;
