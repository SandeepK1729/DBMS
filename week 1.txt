Enter password: ***
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.5.27 MySQL Community Server (GPL)

Copyright (c) 2000, 2011, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use _6683
Database changed
mysql> .schema
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '.schema' at line 1
mysql> schema;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'schema' at line 1
mysql> show tables;
+-----------------+
| Tables_in__6683 |
+-----------------+
| boat            |
| reserves        |
| sailor          |
+-----------------+
3 rows in set (0.00 sec)

mysql> alter table reserves add foreign key(sid) references sailor(sid);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table boat add primary key(bid);
Query OK, 0 rows affected (0.17 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table reserves add foreign key(bid) references boat(bid);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc sailor;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| sid    | int(11)      | NO   | PRI | 0       |       |
| name   | varchar(100) | YES  |     | NULL    |       |
| rating | int(11)      | YES  |     | NULL    |       |
| age    | int(11)      | NO   |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
4 rows in set (0.03 sec)

mysql> insert into sailor values(6285, "Sai Surya", 4, 19),(6286, "Raj", 3, 19), (6683, "Sandeep",4, 18), (6687, "Teja", 5, 20),(6688, "Noodles", 4, 19), (6691, "Ganesh", 4, 19), (235, "RR", 4, 20);
Query OK, 7 rows affected (0.03 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> select * from sailor;
+------+-----------+--------+-----+
| sid  | name      | rating | age |
+------+-----------+--------+-----+
|  235 | RR        |      4 |  20 |
| 6285 | Sai Surya |      4 |  19 |
| 6286 | Raj       |      3 |  19 |
| 6683 | Sandeep   |      4 |  18 |
| 6687 | Teja      |      5 |  20 |
| 6688 | Noodles   |      4 |  19 |
| 6691 | Ganesh    |      4 |  19 |
+------+-----------+--------+-----+
7 rows in set (0.00 sec)

mysql> select * from boat;
Empty set (0.00 sec)

mysql> desc boat;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| bid    | int(11)      | NO   | PRI | 0       |       |
| bname  | varchar(100) | YES  |     | NULL    |       |
| colour | varchar(100) | NO   |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> insert into boat values(94, "C12H22O11", "pink"), (81, "rsc", "brown"), (62, "90ML", "black"), (89, "#cs50", "blue"), (75, "sd", "white"), (92, "chichhore", "yellow"), (79, "mi", "red");
Query OK, 7 rows affected (0.02 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> select * from boats;
ERROR 1146 (42S02): Table '_6683.boats' doesn't exist
mysql> select * from boat;
+-----+-----------+--------+
| bid | bname     | colour |
+-----+-----------+--------+
|  62 | 90ML      | black  |
|  75 | sd        | white  |
|  79 | mi        | red    |
|  81 | rsc       | brown  |
|  89 | #cs50     | blue   |
|  92 | chichhore | yellow |
|  94 | C12H22O11 | pink   |
+-----+-----------+--------+
7 rows in set (0.00 sec)

mysql> desc reserves;
+-------+---------+------+-----+---------+-------+
| Field | Type    | Null | Key | Default | Extra |
+-------+---------+------+-----+---------+-------+
| sid   | int(11) | YES  | MUL | NULL    |       |
| bid   | int(11) | YES  | MUL | NULL    |       |
| day   | date    | YES  |     | NULL    |       |
+-------+---------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> insert into reserves values(235, 94, "2002-10-16"), (6285, 81, "2002-09-17"), (6683, 89, "2004-01-27"), (6687, 75, "2001-03-20"), (6688, 92, "2002-12-27"), (6286, 62, "2002-11-14"), (6691, 79,"2002-08-22");
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> select * from reserves;
+------+------+------------+
| sid  | bid  | day        |
+------+------+------------+
|  235 |   94 | 2002-10-16 |
| 6285 |   81 | 2002-09-17 |
| 6683 |   89 | 2004-01-27 |
| 6687 |   75 | 2001-03-20 |
| 6688 |   92 | 2002-12-27 |
| 6286 |   62 | 2002-11-14 |
| 6691 |   79 | 2002-08-22 |
+------+------+------------+
7 rows in set (0.00 sec)

mysql> select * from boat;
+-----+-----------+--------+
| bid | bname     | colour |
+-----+-----------+--------+
|  62 | 90ML      | black  |
|  75 | sd        | white  |
|  79 | mi        | red    |
|  81 | rsc       | brown  |
|  89 | #cs50     | blue   |
|  92 | chichhore | yellow |
|  94 | C12H22O11 | pink   |
+-----+-----------+--------+
7 rows in set (0.00 sec)

mysql> select * from sailor;
+------+-----------+--------+-----+
| sid  | name      | rating | age |
+------+-----------+--------+-----+
|  235 | RR        |      4 |  20 |
| 6285 | Sai Surya |      4 |  19 |
| 6286 | Raj       |      3 |  19 |
| 6683 | Sandeep   |      4 |  18 |
| 6687 | Teja      |      5 |  20 |
| 6688 | Noodles   |      4 |  19 |
| 6691 | Ganesh    |      4 |  19 |
+------+-----------+--------+-----+
7 rows in set (0.00 sec)

mysql> select sid, name, day from sailor, reserves where sailor.sid = reserves.sid;
ERROR 1052 (23000): Column 'sid' in field list is ambiguous
mysql> select sailor.sid, name, day from sailor, reserves where sailor.sid = reserves.sid;
+------+-----------+------------+
| sid  | name      | day        |
+------+-----------+------------+
|  235 | RR        | 2002-10-16 |
| 6285 | Sai Surya | 2002-09-17 |
| 6683 | Sandeep   | 2004-01-27 |
| 6687 | Teja      | 2001-03-20 |
| 6688 | Noodles   | 2002-12-27 |
| 6286 | Raj       | 2002-11-14 |
| 6691 | Ganesh    | 2002-08-22 |
+------+-----------+------------+
7 rows in set (0.00 sec)

mysql> select sailor.sid, name, day from sailor, reserves;
+------+-----------+------------+
| sid  | name      | day        |
+------+-----------+------------+
|  235 | RR        | 2002-10-16 |
| 6285 | Sai Surya | 2002-10-16 |
| 6286 | Raj       | 2002-10-16 |
| 6683 | Sandeep   | 2002-10-16 |
| 6687 | Teja      | 2002-10-16 |
| 6688 | Noodles   | 2002-10-16 |
| 6691 | Ganesh    | 2002-10-16 |
|  235 | RR        | 2002-09-17 |
| 6285 | Sai Surya | 2002-09-17 |
| 6286 | Raj       | 2002-09-17 |
| 6683 | Sandeep   | 2002-09-17 |
| 6687 | Teja      | 2002-09-17 |
| 6688 | Noodles   | 2002-09-17 |
| 6691 | Ganesh    | 2002-09-17 |
|  235 | RR        | 2004-01-27 |
| 6285 | Sai Surya | 2004-01-27 |
| 6286 | Raj       | 2004-01-27 |
| 6683 | Sandeep   | 2004-01-27 |
| 6687 | Teja      | 2004-01-27 |
| 6688 | Noodles   | 2004-01-27 |
| 6691 | Ganesh    | 2004-01-27 |
|  235 | RR        | 2001-03-20 |
| 6285 | Sai Surya | 2001-03-20 |
| 6286 | Raj       | 2001-03-20 |
| 6683 | Sandeep   | 2001-03-20 |
| 6687 | Teja      | 2001-03-20 |
| 6688 | Noodles   | 2001-03-20 |
| 6691 | Ganesh    | 2001-03-20 |
|  235 | RR        | 2002-12-27 |
| 6285 | Sai Surya | 2002-12-27 |
| 6286 | Raj       | 2002-12-27 |
| 6683 | Sandeep   | 2002-12-27 |
| 6687 | Teja      | 2002-12-27 |
| 6688 | Noodles   | 2002-12-27 |
| 6691 | Ganesh    | 2002-12-27 |
|  235 | RR        | 2002-11-14 |
| 6285 | Sai Surya | 2002-11-14 |
| 6286 | Raj       | 2002-11-14 |
| 6683 | Sandeep   | 2002-11-14 |
| 6687 | Teja      | 2002-11-14 |
| 6688 | Noodles   | 2002-11-14 |
| 6691 | Ganesh    | 2002-11-14 |
|  235 | RR        | 2002-08-22 |
| 6285 | Sai Surya | 2002-08-22 |
| 6286 | Raj       | 2002-08-22 |
| 6683 | Sandeep   | 2002-08-22 |
| 6687 | Teja      | 2002-08-22 |
| 6688 | Noodles   | 2002-08-22 |
| 6691 | Ganesh    | 2002-08-22 |
+------+-----------+------------+
49 rows in set (0.00 sec)

mysql> select sailor.sid, name, day from sailor, reserves where sailor.sid = reserves.sid;
+------+-----------+------------+
| sid  | name      | day        |
+------+-----------+------------+
|  235 | RR        | 2002-10-16 |
| 6285 | Sai Surya | 2002-09-17 |
| 6683 | Sandeep   | 2004-01-27 |
| 6687 | Teja      | 2001-03-20 |
| 6688 | Noodles   | 2002-12-27 |
| 6286 | Raj       | 2002-11-14 |
| 6691 | Ganesh    | 2002-08-22 |
+------+-----------+------------+
7 rows in set (0.00 sec)

mysql> select name, age from sailor;
+-----------+-----+
| name      | age |
+-----------+-----+
| RR        |  20 |
| Sai Surya |  19 |
| Raj       |  19 |
| Sandeep   |  18 |
| Teja      |  20 |
| Noodles   |  19 |
| Ganesh    |  19 |
+-----------+-----+
7 rows in set (0.00 sec)

mysql> select name from sailor where sid in (
    -> select sid from reserves where bid = 92);
+---------+
| name    |
+---------+
| Noodles |
+---------+
1 row in set (0.00 sec)

mysql> select sid from reserves where bid > 80);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> select name from sailor where sid in (
    -> select sid from reserves where bid > 80);
+-----------+
| name      |
+-----------+
| RR        |
| Sai Surya |
| Sandeep   |
| Noodles   |
+-----------+
4 rows in set (0.00 sec)

mysql> select name from sailor where rating < 4;
+------+
| name |
+------+
| Raj  |
+------+
1 row in set (0.00 sec)

mysql> select sid from reserves where bid in (
    -> select bid from boat where colour = "red");
+------+
| sid  |
+------+
| 6691 |
+------+
1 row in set (0.00 sec)

mysql> select sailor.sid from sailor, boat, reserves
    -> where colour = "red" and sailor.sid = reserves.sid and boat.bid = reserves.bid;
+------+
| sid  |
+------+
| 6691 |
+------+
1 row in set (0.00 sec)

mysql> where colour = "red" and sailor.sid = reserves.sid;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where colour = "red" and sailor.sid = reserves.sid' at line 1
mysql> select sailor.sid from sailor, boat, reserves
    -> where colour = "red" and sailor.sid = reserves.sid;
+------+
| sid  |
+------+
|  235 |
| 6285 |
| 6683 |
| 6687 |
| 6688 |
| 6286 |
| 6691 |
+------+
7 rows in set (0.00 sec)

mysql> select sailor.sid from sailor, boat, reserves
    -> where colour = "red";
+------+
| sid  |
+------+
|  235 |
| 6285 |
| 6286 |
| 6683 |
| 6687 |
| 6688 |
| 6691 |
|  235 |
| 6285 |
| 6286 |
| 6683 |
| 6687 |
| 6688 |
| 6691 |
|  235 |
| 6285 |
| 6286 |
| 6683 |
| 6687 |
| 6688 |
| 6691 |
|  235 |
| 6285 |
| 6286 |
| 6683 |
| 6687 |
| 6688 |
| 6691 |
|  235 |
| 6285 |
| 6286 |
| 6683 |
| 6687 |
| 6688 |
| 6691 |
|  235 |
| 6285 |
| 6286 |
| 6683 |
| 6687 |
| 6688 |
| 6691 |
|  235 |
| 6285 |
| 6286 |
| 6683 |
| 6687 |
| 6688 |
| 6691 |
+------+
49 rows in set (0.00 sec)

mysql> select name from sailor where rating < 4;
+------+
| name |
+------+
| Raj  |
+------+
1 row in set (0.00 sec)

mysql> select name from sailor where sid in (
    -> select sid from reserves where bid in (
    -> select bid from boat where colour = "red"));
+--------+
| name   |
+--------+
| Ganesh |
+--------+
1 row in set (0.00 sec)

mysql> select name from sailor, boat, reserves where
    -> sailor.sid = reserves.sid and
    -> boat.bid = reserves.bid and
    -> boat.colour = "red";
+--------+
| name   |
+--------+
| Ganesh |
+--------+
1 row in set (0.00 sec)

mysql> select colour from boat where bid in (
    -> select bid from reserves from sid in (
    -> select sid from sailor where name = "Raj"));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from sid in (
select sid from sailor where name = "Raj"))' at line 2
mysql> select colour from boat where bid in (
    -> select bid from reserves from where sid in (
    -> select sid from sailor where name = "Raj"));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from where sid in (
select sid from sailor where name = "Raj"))' at line 2
mysql> select colour from boat where bid in (
    -> select bid from reserves where sid in (
    -> select sid from sailor where name = "Raj"));
+--------+
| colour |
+--------+
| black  |
+--------+
1 row in set (0.00 sec)

mysql> select colour from boat where bid = (
    -> select bid from reserves where sid = (
    -> select sid from sailor where name = "Raj"));
+--------+
| colour |
+--------+
| black  |
+--------+
1 row in set (0.00 sec)

mysql> select name from sailor where
    -> (select count(bid) from reserves
    -> (select count(bid) from reserves;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(select count(bid) from reserves' at line 3
mysql> select count(bid) from reserves;
+------------+
| count(bid) |
+------------+
|          7 |
+------------+
1 row in set (0.00 sec)

mysql> select name from sailor s, reserves r, boat b where s.sid = r.sid and b.bid = r.bid;
+-----------+
| name      |
+-----------+
| RR        |
| Sai Surya |
| Sandeep   |
| Teja      |
| Noodles   |
| Raj       |
| Ganesh    |
+-----------+
7 rows in set (0.00 sec)

mysql> select distinct name from sailor s, reserves r, boat b where s.sid = r.sid and b.bid = r.bid;
+-----------+
| name      |
+-----------+
| RR        |
| Sai Surya |
| Sandeep   |
| Teja      |
| Noodles   |
| Raj       |
| Ganesh    |
+-----------+
7 rows in set (0.00 sec)

mysql> select name, rating + 1 as rating from sailor where sid in (
    -> select sid from reserves where 1 < (
    -> se;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 3
mysql> select name, rating + 1 as rating from sailor where sid in (
    -> select sid from reserves r1, reserves r2 where r1.sid <> r2.sid and r1.day = r2.day);
ERROR 1052 (23000): Column 'sid' in field list is ambiguous
mysql> select name, rating + 1 as rating from sailor where sid in (
    -> select r1.sid from reserves r1, reserves r2 where r1.sid <> r2.sid and r1.day = r2.day);
Empty set (0.00 sec)

mysql> select name, rating + 1 as rating from sailor where sid in (
    -> select r1.sid from reserves r1, reserves r2 where r1.sid = r2.sid and r1.bid <> r2.bid and r1.day = r2.day);
Empty set (0.00 sec)

mysql> select age from sailor where name like "s%s" and len(name) > 2;
ERROR 1305 (42000): FUNCTION _6683.len does not exist
mysql> select ages from sailor where name like "s%s" and len(name) > 2;
ERROR 1054 (42S22): Unknown column 'ages' in 'field list'
mysql> select age from sailor where name like "s%s" and len(name) > 2;
ERROR 1305 (42000): FUNCTION _6683.len does not exist
mysql> select age from sailor where name like "s%";
+-----+
| age |
+-----+
|  19 |
|  18 |
+-----+
2 rows in set (0.00 sec)

mysql>
