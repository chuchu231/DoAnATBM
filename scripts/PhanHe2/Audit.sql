alter session set container = CDB$ROOT;
alter session set "_ORACLE_SCRIPT" = true;

alter session set "_optimizer_filter_pred_pullup" = false; 

GRANT AUDIT_ADMIN TO ADMIN;
GRANT AUDIT_VIEWER TO ADMIN;


CREATE AUDIT POLICY role_dba_audit_pol
ROLES DBA
CONTAINER = ALL;
ALTER SYSTEM SET AUDIT_TRAIL= DB, EXTENDED SCOPE=SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL=NONE SCOPE=SPFILE;
SHOW PARAMETER audit_trail;
SELECT * FROM v$option WHERE parameter = 'Audit Option';
SELECT VALUE FROM V$OPTION WHERE PARAMETER = 'Unified Auditing' ;
SHUTDOWN IMMEDIATE;
STARTUP;

-- ============== STANDARD AUDIT ============== --
select *
from unified_audit_trail
--where object_schema = 'ADMIN'
order by event_timestamp desc;

select object_schema,
       object_name,
       object_type,
       audit_option,
       condition_eval_opt,
       audit_condition
from   audit_unified_policies;


CREATE OR REPLACE PROCEDURE AUDIT_TABLE_OBJ AS
BEGIN
    FOR R IN (SELECT TABLE_NAME FROM ALL_TABLES WHERE OWNER = 'ADMIN')
    LOOP
     EXECUTE IMMEDIATE 'CREATE AUDIT POLICY all_actions_on_'||r.table_name||' ACTIONS ALL ON ADMIN.'||r.table_name;
     EXECUTE IMMEDIATE 'AUDIT POLICY all_actions_on_'||r.table_name;
    END LOOP;
END;
/
EXEC AUDIT_TABLE_OBJ;

CREATE OR REPLACE PROCEDURE AUDIT_VIEW_OBJ AS
BEGIN
    FOR R IN (SELECT VIEW_NAME FROM ALL_VIEWS WHERE OWNER = 'ADMIN')
    LOOP
     EXECUTE IMMEDIATE 'CREATE AUDIT POLICY all_actions_on_'||r.view_name||' ACTIONS ALL ON ADMIN.'||r.view_name;
     EXECUTE IMMEDIATE 'AUDIT POLICY all_actions_on_'||r.view_name;
    END LOOP;
END;
/
EXEC AUDIT_VIEW_OBJ;
CREATE OR REPLACE PROCEDURE AUDIT_PROCEDURE_OBJ AS
BEGIN
    FOR R IN (SELECT OBJECT_NAME FROM ALL_OBJECTS WHERE OWNER = 'ADMIN' AND OBJECT_TYPE = 'PROCEDURE')
    LOOP
     EXECUTE IMMEDIATE 'CREATE AUDIT POLICY all_actions_on_'||r.object_name||' ACTIONS ALL ON ADMIN.'||r.object_name;
     EXECUTE IMMEDIATE 'AUDIT POLICY all_actions_on_'||r.object_name;
    END LOOP;
END;
/
EXEC AUDIT_PROCEDURE_OBJ;
SELECT OBJECT_NAME
FROM ALL_OBJECTS
WHERE OBJECT_TYPE = 'PROCEDURE' AND OWNER = 'ADMIN';


-- =============== FINE-GRAINED AUDIT ===============

-- 3a) Hành vi C?p nh?t quan h? ?ANGKY t?i các tr??ng liên quan ??n ?i?m s?
--     nh?ng ng??i ?ó không thu?c vai tr? Gi?ng viên
alter session set "_ORACLE_SCRIPT" = true;
alter session set "_optimizer_filter_pred_pullup" = false; 

create or replace function f_CheckRoleGiangVien 
return number 
as
    USER VARCHAR(100); 
    ROLE VARCHAR(20);
begin
    
    USER := SYS_CONTEXT('USERENV', 'SESSION_USER');
    ROLE := GETROLE_BYUSERNAME(USER);    
    IF (ROLE = 'ADMIN') THEN
        RETURN 0;
    ELSIF ( ROLE = 'RL_GIANGVIEN' ) then
        return 1;  -- TRUE
    else
        return 0; -- FALSE
    end if;
end;
/
grant RL_GIANGVIEN to NS002
begin
    dbms_fga.add_policy(
        object_schema   => 'ADMIN',
        object_name     => 'DANGKY',
        policy_name     => 'FGA_POLICY_DIEM',
        audit_condition => '(f_CheckRoleGiangVien = 0)',
        audit_column    => 'DIEMTH, DIEMQT, DIEMCK, DIEMTK',
        statement_types => 'UPDATE'
    );
end;
/

begin
    dbms_fga.drop_policy(
        object_schema   => 'ADMIN',
        object_name     => 'DANGKY',
        policy_name     => 'FGA_POLICY_DIEM'
    );
end;
/


-- 3b) Hành vi c?a ng??i dùng này có th? ??c trên tr??ng PHUCAP c?a ng??i khác ? quan h? NHANSU
begin
    dbms_fga.add_policy(
        object_schema   => 'ADMIN',
        object_name     => 'NHANSU',
        policy_name     => 'FGA_POLICY_PHUCAP',
        audit_condition => 'MANV <> sys_context(''USERENV'', ''SESSION_USER'')',
        audit_column    => 'PHUCAP',
        statement_types => 'SELECT'
    );
end;
/

begin
    dbms_fga.enable_policy(
        object_schema => 'ADMIN',
        object_name   => 'DANGKY',
        policy_name   => 'FGA_POLICY_DIEM',
        enable        => true
    );
    
end;
begin
    dbms_fga.enable_policy(
        object_schema => 'ADMIN',
        object_name   => 'NHANSU',
        policy_name   => 'FGA_POLICY_PHUCAP',
        enable        => true
    );
end;
/


 BEGIN
     dbms_fga.disable_policy(
         object_schema => 'ADMIN',
         object_name   => 'DANGKY',
         policy_name   => 'FGA_POLICY_DIEM'
     );

     dbms_fga.disable_policy(
         object_schema => 'ADMIN',
         object_name   => 'NHANSU',
         policy_name   => 'FGA_POLICY_PHUCAP'
     );
 END;
 /
 begin
 	dbms_fga.drop_policy(
 	                    object_schema => 'ADMIN',
 	                    object_name   => 'DANGKY',
 	                    policy_name   => 'fga_policy_diem'
 	);
 end;


---============ L?Y TR?NG THÁI AUDIT ?? BI?T KHI NÀO NÊN KÍCH HOAT HAY T?T
create or replace procedure sp_GetStateAudit(p_result OUT number)
as
    flag NUMBER;
begin
    select count(*) into flag
    from DBA_PRIV_AUDIT_OPTS;
    
    if (flag > 12000) then
        p_result := 1;
    elsif (flag <= 12000) then
        p_result := 0;
    end if;
end;
/

create or replace procedure sp_GetStateFGAAudit(p_result OUT number)
as
    flag1 NUMBER;
    flag2 NUMBER;
begin
    select count(*) into flag1
    from DBA_AUDIT_POLICIES
    where OBJECT_SCHEMA = 'OLS_ADMIN' 
    and POLICY_OWNER = 'OLS_ADMIN'
    and OBJECT_NAME = 'DANGKY'
    and POLICY_NAME = 'FGA_POLICY_DIEM'
    and ENABLED = 'YES';

    select count(*) into flag2
    from DBA_AUDIT_POLICIES
    where OBJECT_SCHEMA = 'ADMIN' 
    and POLICY_OWNER = 'ADMIN'
    and OBJECT_NAME = 'NHANSU'
    and POLICY_NAME = 'FGA_POLICY_PHUCAP'
    and ENABLED = 'YES';

    IF flag1 > 0 AND flag2 > 0 THEN
        p_result := 1;
    ELSE
        p_result := 0;
    END IF;
end;
/   

-- ======== L?NH XÓA L?CH S? AUDIT ========
-- TRUNCATE table sys.Aud$;
-- TRUNCATE table sys.FGA_LOG$;
SELECT VALUE FROM V$OPTION WHERE PARAMETER = 'Unified Auditing';
SELECT DBUSERNAME ,ACTION_NAME, OBJECT_SCHEMA, OBJECT_NAME, EVENT_TIMESTAMP, SQL_TEXT
FROM unified_audit_trail
WHERE object_name = 'DANGKY' AND AUDIT_TYPE='FineGrainedAudit';