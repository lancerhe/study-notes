Mysql:
```SQL
SELECT * FROM EVENT WHERE eventId IN(443,419,431,440,420,414,509)  ORDER BY INSTR(',443,419,431,440,420,414,509,',CONCAT(',',eventId,','))
```
Oracle:
```SQL
SELECT NAME FROM order WHERE oderid IN (111,222,333,444,555,666) ORDER BY INSTR('111,222,333,444,555,666',orderid)
```