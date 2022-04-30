Week - 3 

Q1 : Find the average age of all sailors

    select avg(age) from sailors;
    
        +----------+
        | avg(age) |
        +----------+
        |     36.9 |
        +----------+

Q2 : Find the average age of sailors with a rating of 10

    select avg(age) from sailors where rating = 10;
  
        +----------+
        | avg(age) |
        +----------+
        |     25.5 |
        +----------+
    
Q3 : Find the name and age of the oldest sailor.

    select sname, age from sailors where age = (select max(age) from sailors);
    
        +-------+------+
        | sname | age  |
        +-------+------+
        | Bob   | 63.5 |
        +-------+------+
    
Q4 : Count the number of sailors.

    select count(*) from sailors;
    
        +----------+
        | count(*) |
        +----------+
        |       10 |
        +----------+

Q5 : Count the names of different sailor names.

    select count( distinct sname ) from sailors;
    
        +-------------------------+
        | count( distinct sname ) |
        +-------------------------+
        |                       9 |
        +-------------------------+
    
Q6 : Find the names of sailors who are older than the oldest sailor with a rating of 10.

    select sname from sailors where
    age > (select max(age) from sailors where rating = 10);
    
        +--------+
        | sname  |
        +--------+
        | Dustin |
        | Lubber |
        | Bob    |
        +--------+

Q7 : Find the age of the youngest sailors for each rating level

    select rating, min(age) from sailors group by rating;
    
        +--------+----------+
        | rating | min(age) |
        +--------+----------+
        |      1 |       33 |
        |      3 |     25.5 |
        |      7 |       35 |
        |      8 |     25.5 |
        |      9 |       35 |
        |     10 |       16 |
        +--------+----------+
 Q8 : Find the age of the youngest sailor who is eligible to vote for each rating level with at least two such sailors. 
 
     select rating, min(age) from sailors group by rating having count(rating) > 1;
        +--------+----------+
        | rating | min(age) |
        +--------+----------+
        |      3 |     25.5 |
        |      7 |       35 |
        |      8 |     25.5 |
        |     10 |       16 |
        +--------+----------+
Q9 : For each red boat, find the number of reservations for this boat.
  
  
