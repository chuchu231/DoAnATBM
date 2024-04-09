create or replace procedure Create_NewRole(Role_name in varchar2,Pass_Word in nvarchar2)
authid current_user 
as
    Tmp_count int;
Begin
    select count(*) into Tmp_count from dba_roles where role = Role_name;
    If(Tmp_count != 0) then
        RAISE_APPLICATION_ERROR(-20000,'Role da ton tai'); 
    ELSE 
        IF Pass_Word IS NULL THEN
            EXECUTE IMMEDIATE 'CREATE Role ' || Role_name; 
        ELSE
        execute immediate('ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE');
        execute immediate('Create role '|| Role_name||' identified by '||Pass_Word);
        execute immediate('ALTER SESSION SET "_ORACLE_SCRIPT" = false');
        END IF;
    END IF;
End;