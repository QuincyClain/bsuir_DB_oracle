create or replace procedure DML_insert(val in number) is
    rows_amount number;
begin
    select count(*) into rows_amount from MyTable;
    insert into MyTable(id, val) values (rows_amount+1, val);
        exception
            when others then
                dbms_output.put_line('some error');
end DML_insert;

begin
    DML_update(10002, 322);
    dbms_output.put_line(rowid_search(10001));
end;



create or replace procedure DML_update(row_id in number, next_val in number) is
begin
    update MyTable set val = next_val where id=row_id;
        exception
            when others then
                dbms_output.put_line('some error');
end;


begin
    DML_update(10001, 323);
    dbms_output.put_line(rowid_search(10001));
end;

create or replace procedure DML_delete(row_id in number) is
begin
    delete from MyTable where row_id=id;
        exception
            when others then
                dbms_output.put_line('some error');
end;

begin
    DML_delete(10001);
    dbms_output.put_line(rowid_search(10001));
end;
