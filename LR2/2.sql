CREATE SEQUENCE students_seq;
CREATE OR REPLACE TRIGGER unique_student
BEFORE INSERT
ON STUDENTS
FOR EACH ROW
DECLARE
counter number;
BEGIN
IF :new.id IS NOT NULL THEN
select count(*) as c into counter
from students
where id = :new.id;
IF counter > 0 THEN
raise_application_error(-300, 'your student id is not unique.');
END IF;
ELSE
counter := 1;
while counter > 0
LOOP
SELECT students_seq.nextval
INTO :new.id
FROM dual;
select count(*) as c into counter
from students
where id = :new.id;
END LOOP;
END IF;
END;


create or replace trigger StudentAutoIncrement
    before insert on students
    for each row
declare
    max_id number := 0;
begin
    select max(id) into max_id from students;
    if (max_id is null) then
        max_id := 0;
    end if;
    if :new.id is null then
        :new.id := max_id + 1;
    end if;
end;


create or replace trigger groupAutoIncrement
    before insert on groups
    for each row
declare
    max_id number := 0;
begin
    select max(id) into max_id from groups;
    if (max_id is null) then
        max_id := 0;
    end if;
    if :new.id is null then
        :new.id := max_id + 1;
    end if;
end;



create or replace trigger GroupUniqueId
    before insert on groups
    for each row
declare
    custom_exception exception;
    pragma exception_init(custom_exception, -20042);
    cursor Group_id is
        select id from groups;
begin
    for ug_id in Group_id
    loop
        if (ug_id.id = :new.id) then
            raise_application_error(-20042, 'id must be unique!');
        end if;
    end loop;
end;




create or replace trigger GroupUniqueName
    before insert on groups
    for each row
declare
    custom_exception exception;
    pragma exception_init(custom_exception, -20069);
    cursor UniGroup_name is
        select name from groups;
begin
    for ug_name in UniGroup_name
    loop
        if (ug_name.name = :new.name) then
            raise_application_error(-20069, 'name should be unique!');
        end if;
    end loop;
end;
