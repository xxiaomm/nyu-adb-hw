DROP TABLE IF EXISTS ticks

CREATE TABLE ticks(id INT, date INT, endofdayprice INT)

LOAD DATA INFILE "data/ticks.csv" INTO TABLE TICKS FIELDS TERMINATED BY ","



SELECT id, max(ratios(endofdayprice)) as max_return, 
    min(ratios(endofdayprice)) as min_return FROM ticks 
ASSUMING ASC id, ASC date 
GROUP BY id 

SELECT id, max(ratios(endofdayprice)) as max_return, 
    min(ratios(endofdayprice)) as min_return FROM ticks 
ASSUMING ASC date 
GROUP BY id 


begin 
at some non-leaf node n (not necessarily to be the root)

n is some non-leaf node
while x is not in n:
    if x in keyset(n):
        return None
    else if x is in inset(n) and edgeset(n, n'):
        n =: n'
    else:
        set n to some ancestor node
if n is leaf:
    return key x and its value
else:                                                            (All data items are in leave nodes.)
    return None