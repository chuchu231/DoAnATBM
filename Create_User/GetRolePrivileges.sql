CREATE OR REPLACE PROCEDURE GetRolePrivileges(Role_name IN VARCHAR2, ResultCursor OUT SYS_REFCURSOR)
AS
    upper_role_name VARCHAR2(100);
BEGIN
    upper_role_name := UPPER(Role_name);
    
    OPEN ResultCursor FOR
    SELECT p.role, p.table_name, p.privilege
    FROM ROLE_TAB_PRIVS p
    WHERE p.role = upper_role_name;
END;