DECLARE
    i NUMBER := 0;
    a INTEGER;
BEGIN
    LOOP
        i := i + 1;
        EXIT WHEN (i > 10000);
        a := dbms_random.random();
        INSERT INTO MyTable (id, val) VALUES (i, a);
    END LOOP;
END;

SELECT val as znachenie FROM MyTable;


CREATE TABLE SomeTable
(
    id number primary key,
    val number
);

DECLARE
    iter NUMBER := 0;
    v INTEGER;
BEGIN
    LOOP
        iter := iter + 1;
        EXIT WHEN (iter > 10);
        v := dbms_random.value(1, 100);
        INSERT INTO MyTable(id, val) values (iter, v);
    END LOOP;
END;

SELECT * FROM MyTable2;

DROP TABLE SomeTable;

SELECT * FROM SomeTable;
