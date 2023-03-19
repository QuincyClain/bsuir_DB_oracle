create or replace function count_salary(month_salary in real, premium in number) return float is
    premium_percent float := 0;
begin
    if month_salary<0 or premium > 100 or premium < 0  then
        dbms_output.put_line('incorrect input');
        return -1;
    end if;
    premium_percent := premium/100;
    return (1+premium_percent) * month_salary * 12;
        exception
            when others then
                dbms_output.put_line('some error');
                return -1;
end;

begin
    dbms_output.put_line(count_salary(-1000, -5));
end;

