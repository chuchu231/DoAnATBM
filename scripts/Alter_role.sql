CREATE OR REPLACE PROCEDURE Alter_role(role_name IN VARCHAR2, pass_word IN VARCHAR2)
AUTHID current_user
AS
    tmp_query VARCHAR2(100);
BEGIN
    IF pass_word IS NULL OR LENGTH(pass_word) = 0 THEN
        tmp_query := 'ALTER ROLE ' || role_name || ' IDENTIFIED BY NULL';
    ELSE 
        tmp_query := 'ALTER ROLE ' || role_name || ' IDENTIFIED BY ' || pass_word;
    END IF;
    execute immediate('ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE');
    EXECUTE IMMEDIATE(tmp_query);
    execute immediate('ALTER SESSION SET "_ORACLE_SCRIPT" = false');
END;
