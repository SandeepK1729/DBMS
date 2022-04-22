Q1 : sailors who reserved red or green boats

        select sname from Sailors where sid in (
        select sid from reserves where bid in (
        select bid from Boats where color in ("RED", "GREEN")));
        
Q2 : sailors who reserved red and green boats
    
        select sname from Sailors where
        sid in (select sid from reserves where bid in ( select bid from Boats where color = "GREEN")) and
        sid in (select sid from reserves where bid in ( select bid from Boats where color = "RED"));
        
Q3 : sailors who reserved red but not green

        select sname from Sailors where
        sid in (select sid from reserves where bid in ( select bid from Boats where color = "RED")) and
        sid not in (select sid from reserves where bid in ( select bid from Boats where color = "GREEN"));
        
Q4 : sailors id whose rating is 10 or boat id is not 104

        select sid from Sailors where
        rating = 10 or
        sid not in ( select sid from reserves where bid = 104);
        
Q5 : sailors whose boat id = 103

        select sname from Sailors where
        sid in ( select sid from reserves where bid = 103)
        
Q6 : sailors who has red boat
        
        select sname from Sailors where
        sid in ( select sid from reserves where
        bid in ( select bid from Boats where color = "RED"));
        
Q7 : sailors who has not red boat
         
        select sname from Sailors where
        sid in ( select sid from reserves where
        bid not in ( select bid from Boats where color = "RED"));
        
  
