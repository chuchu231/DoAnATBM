create or replace procedure Create_NewUser(User_name in varchar2,Pass_Word in nvarchar2)
authid current_user 
as
    Tmp_count int;
Begin
    select count(*) into Tmp_count from all_users where username = User_name;
    If(Tmp_count != 0) then
        RAISE_APPLICATION_ERROR(-20000,'User da ton tai'); 
    ELSE 
        IF Pass_Word IS NULL THEN
            EXECUTE IMMEDIATE 'CREATE USER ' || User_name; 
        ELSE
        execute immediate('ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE');
        execute immediate('Create user '|| User_name||' identified by '||Pass_Word);
        execute immediate('grant create session to '||User_name);
        execute immediate('ALTER SESSION SET "_ORACLE_SCRIPT" = false');
        END IF;
    END IF;
End;
GRANT DBA TO Cadmin2;
GRANT EXECUTE ANY PROCEDURE TO Cadmin2;
GRANT CREATE SESSION TO Cadmin2 CONTAINER = ALL;
grant all privileges to cadmin2;