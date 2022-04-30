Week - 3 

Q1 : Find the average age of all sailors

    mysql> select avg(age) from sailors;
    
    +----------+
    | avg(age) |
    +----------+
    |     36.9 |
    +----------+

Q2 : Find the average age of sailors with a rating of 10

    mysql> select avg(age) from sailors where rating = 10;
  
    +----------+
    | avg(age) |
    +----------+
    |     25.5 |
    +----------+
    
Q3 : Find the name and age of the oldest sailor.

    mysql> select sname, age from sailors where age = (select max(age) from sailors);
    
    +-------+------+
    | sname | age  |
    +-------+------+
    | Bob   | 63.5 |
    +-------+------+
    
Q4 : Count the number of sailors.

    mysql> select count(*) from sailors;
    +----------+
    | count(*) |
    +----------+
    |       10 |
    +----------+

Q5 : Count the names of different sailor names.
