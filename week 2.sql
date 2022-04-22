Q1 : sailors who reserved red or green boats

        select sname from Sailors where sid in (
        select sid from reserves where bid in (
        select bid from Boats where color in ("RED", "GREEN")));
        
        +---------+
        | sname   |
        +---------+
        | Dustin  |
        | Lubber  |
        | Horatio |
        | Horatio |
        +---------+
        4 rows in set (0.00 sec)
        
Q2 : sailors who reserved red and green boats
    
        select sname from Sailors where
        sid in (select sid from reserves where bid in ( select bid from Boats where color = "GREEN")) and
        sid in (select sid from reserves where bid in ( select bid from Boats where color = "RED"));
        
        +---------+
        | sname   |
        +---------+
        | Dustin  |
        | Lubber  |
        | Horatio |
        | Horatio |
        +---------+
        4 rows in set (0.00 sec)
        
Q3 : sailors who reserved red but not green

        select sname from Sailors where
        sid in (select sid from reserves where bid in ( select bid from Boats where color = "RED")) and
        sid not in (select sid from reserves where bid in ( select bid from Boats where color = "GREEN"));

        +--------+
        | sname  |
        +--------+
        | Dustin |
        | Lubber |
        +--------+
        2 rows in set (0.00 sec)
        
Q4 : sailors id whose rating is 10 or boat id is not 104

        select sid from Sailors where
        rating = 10 or
        sid not in ( select sid from reserves where bid = 104);
        
        +-----+
        | sid |
        +-----+
        |  29 |
        |  32 |
        |  58 |
        |  64 |
        |  71 |
        |  74 |
        |  85 |
        |  95 |
        +-----+
        8 rows in set (0.00 sec)

Q5 : sailors whose boat id = 103

        select sname from Sailors where
        sid in ( select sid from reserves where bid = 103)
        
        +---------+
        | sname   |
        +---------+
        | Dustin  |
        | Lubber  |
        | Horatio |
        +---------+
        3 rows in set (0.00 sec)

Q6 : sailors who has red boat
        
        select sname from Sailors where
        sid in ( select sid from reserves where
        bid in ( select bid from Boats where color = "RED"));

        +---------+
        | sname   |
        +---------+
        | Dustin  |
        | Lubber  |
        | Horatio |
        +---------+
        3 rows in set (0.00 sec)

Q7 : sailors who has not red boat
         
        select sname from Sailors where
        sid in ( select sid from reserves where
        bid not in ( select bid from Boats where color = "RED"));
 
         +---------+
        | sname   |
        +---------+
        | Dustin  |
        | Lubber  |
        | Horatio |
        +---------+
        3 rows in set (0.00 sec)

  Q8 : sailors whose bid = 103
  
        select sname from Sailors where
        sid in ( select sid from reserves where bid = 103);
        
        +---------+
        | sname   |
        +---------+
        | Dustin  |
        | Lubber  |
        | Horatio |
        +---------+
        3 rows in set (0.00 sec)
        
       
