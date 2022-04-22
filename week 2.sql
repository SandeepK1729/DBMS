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
        
