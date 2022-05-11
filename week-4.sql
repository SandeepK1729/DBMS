week - 4 :
        create table Staff_Record(staffid int, name varchar(20), dob date, sex char, salary float, award int, district varchar(20), department varchar(20));
        Query OK, 0 rows affected (0.01 sec)
        
        insert into staff_record values 
        (1001, "Jeffrey Lee", "1978-02-19", 'M', 28463.40, 3, "Tai Kok Tsui", "Sales"),
        (1002, "Hugo Cheung", "1976-04-08", 'M', 14598.50, 2, "Central", "Sales"),
        (1003, "Jennifer Wong", "1978-03-29", 'M', 39850.00,6,"Tai Po", "Sales"),
        (1004,"Melinda Ma","1982-08-28","F", 7783.00,6,"Tai Po","Purchase"),
        (1005,"Hilda Leung","1982-10-24","F",45670.50,2,"Western","Sales"),
        (1006, "Nelly Tam", "1973-10-10", 'F', 45670.50, 4, "Shatin", "Sales"),
        (1007, "Mable Mee", "1979-08-30", 'F', 4530.80, 1, "Toi Kok Tsui", "Purchase"),
        (1008, "Barnabv Nge", "1980-05-12", 'M', 3549.40, 5, "Hunghom", "Account"),
        (1009, "Luaretta Tai", "1982-09-23", 'F', 8327.30, 3, "Tai Wai", "Account"),
        (1010, "Gregory tai", "1972-10-22", 'M', 35542.40, 4, "Tai Wo", "Purchase");

Q1 : Write a SQL statement to produce a list of male staff only, showing their names in upper case, department in lower case and the number of characters in the department

        select upper(name) as NAME, lower(department) as DEPT, length(department) as len from staff_record where sex = 'M';
        +---------------+----------+------+
        | NAME          | DEPT     | len  |
        +---------------+----------+------+
        | JEFFREY LEE   | sales    |    5 |
        | HUGO CHEUNG   | sales    |    5 |
        | JENNIFER WONG | sales    |    5 |
        | BARNABV NGE   | account  |    7 |
        | GREGORY TAI   | purchase |    8 |
        +---------------+----------+------+
        5 rows in set (0.01 sec)

Q2 : 
