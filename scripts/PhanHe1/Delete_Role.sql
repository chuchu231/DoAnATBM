CREATE OR REPLACE PROCEDURE Delete_Role(Role_name IN VARCHAR2)
AS
    role_exists NUMBER;
    upper_role_name VARCHAR2(100);
BEGIN
    upper_role_name := UPPER(Role_name);
    IF Role_name IS NULL THEN
        RAISE_APPLICATION_ERROR(-20000, 'Role cannot be null'); 
    ELSE
        SELECT COUNT(*)
        INTO role_exists
        FROM dba_roles
        WHERE role = upper_role_name;

        IF role_exists = 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Role does not exist'); 
        ELSE
            execute immediate('ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE');
            EXECUTE IMMEDIATE 'DROP ROLE ' || upper_role_name;
            execute immediate('ALTER SESSION SET "_ORACLE_SCRIPT" = false');
        END IF;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'An error occurred: ' || SQLERRM);
END;