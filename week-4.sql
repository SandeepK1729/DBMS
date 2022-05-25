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

        +---------+---------------+------------+------+---------+-------+--------------+------------+
        | staffid | name          | dob        | sex  | salary  | award | district     | department |
        +---------+---------------+------------+------+---------+-------+--------------+------------+
        |    1001 | Jeffrey Lee   | 1978-02-19 | M    | 28463.4 |     3 | Tai Kok Tsui | Sales      |
        |    1002 | Hugo Cheung   | 1976-04-08 | M    | 14598.5 |     2 | Central      | Sales      |
        |    1003 | Jennifer Wong | 1978-03-29 | M    |   39850 |     6 | Tai Po       | Sales      |
        |    1004 | Melinda Ma    | 1982-08-28 | F    |    7783 |     6 | Tai Po       | Purchase   |
        |    1005 | Hilda Leung   | 1982-10-24 | F    | 45670.5 |     2 | Western      | Sales      |
        |    1006 | Nelly Tam     | 1973-10-10 | F    | 45670.5 |     4 | Shatin       | Sales      |
        |    1007 | Mable Mee     | 1979-08-30 | F    |  4530.8 |     1 | Toi Kok Tsui | Purchase   |
        |    1008 | Barnabv Nge   | 1980-05-12 | M    |  3549.4 |     5 | Hunghom      | Account    |
        |    1009 | Luaretta Tai  | 1982-09-23 | F    |  8327.3 |     3 | Tai Wai      | Account    |
        |    1010 | Gregory tai   | 1972-10-22 | M    | 35542.4 |     4 | Tai Wo       | Purchase   |
        +---------+---------------+------------+------+---------+-------+--------------+------------+
        10 rows in set (0.01 sec)

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

Q2 : Write a SQL statement to produce a list of all staff member with their names appended with first letter of their Department
        
        select concat( concat(name, '('), concat(substr(department, 1, 1), ')')) as staff from staff_record;
        
        +------------------+
        | staff            |
        +------------------+
        | Jeffrey Lee(S)   |
        | Hugo Cheung(S)   |
        | Jennifer Wong(S) |
        | Melinda Ma(P)    |
        | Hilda Leung(S)   |
        | Nelly Tam(S)     |
        | Mable Mee(P)     |
        | Barnabv Nge(A)   |
        | Luaretta Tai(A)  |
        | Gregory tai(P)   |
        +------------------+
        10 rows in set (0.00 sec)
        
 Q3 : Write a SQL statement to print a list of first names of staff
        
        select substr(name, 1, instr(name, ' ')) as first_name from staff_record;
        
        +------------+
        | first_name |
        +------------+
        | Jeffrey    |
        | Hugo       |
        | Jennifer   |
        | Melinda    |
        | Hilda      |
        | Nelly      |
        | Mable      |
        | Barnabv    |
        | Luaretta   |
        | Gregory    |
        +------------+
        10 rows in set (0.00 sec)
        
 Q4 : Write a SQL statement to print a list of districts that consists of a single word.The list should not consist of repeating items and is arranged in descending alphabetical order.

        select distinct district from staff_record where instr(district, ' ') = 0 order by district desc;
        
        +----------+
        | district |
        +----------+
        | Western  |
        | Shatin   |
        | Hunghom  |
        | Central  |
        +----------+
        4 rows in set (0.00 sec)
 
 Q5 : Given that the bonus of staff is calculated by, Bonus=SQRT(Salary* Award) + 999, Write a SQL statement to print a list of salary and bonus for each staff.
        
        select name, salary, (sqrt(salary * award ) + 999) as bonus from staff_record;

        +---------------+---------+--------------------+
        | name          | salary  | bonus              |
        +---------------+---------+--------------------+
        | Jeffrey Lee   | 28463.4 | 1291.2160179933246 |
        | Hugo Cheung   | 14598.5 | 1169.8712965948348 |
        | Jennifer Wong |   39850 |  1487.978527135906 |
        | Melinda Ma    |    7783 | 1215.0972003520637 |
        | Hilda Leung   | 45670.5 | 1301.2267360774026 |
        | Nelly Tam     | 45670.5 |  1426.413149072417 |
        | Mable Mee     |  4530.8 | 1066.3112160392866 |
        | Barnabv Nge   |  3549.4 | 1132.2178648369609 |
        | Luaretta Tai  |  8327.3 |  1157.056633565512 |
        | Gregory tai   | 35542.4 |  1376.053834021085 |
        +---------------+---------+--------------------+
        10 rows in set (0.00 sec)

        
        
        
        
        
        
        
        
        
        
        
