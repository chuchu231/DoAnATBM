CREATE OR REPLACE PROCEDURE Alter_Role(Role_name IN VARCHAR2, Pass_Word IN VARCHAR2)
AS
    Tmp_count INT;
    upper_role_name VARCHAR2(100);
BEGIN
    upper_role_name := UPPER(Role_name);

    SELECT COUNT(*) INTO Tmp_count FROM dba_roles WHERE Role = upper_role_name;
    
    IF Tmp_count != 0 THEN
        execute immediate('ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE');
        EXECUTE IMMEDIATE 'ALTER Role ' || upper_role_name || ' IDENTIFIED BY ' || Pass_Word;
        execute immediate('ALTER SESSION SET "_ORACLE_SCRIPT" = false');
    ELSE
        RAISE_APPLICATION_ERROR(-20000, 'Role ' || upper_role_name || ' does not exist');
    END IF;
END;