CREATE OR REPLACE PROCEDURE GetRolePrivileges(Role_name IN VARCHAR2, ResultCursor OUT SYS_REFCURSOR)
AUTHID current_user
AS
    upper_role_name VARCHAR2(100);
BEGIN
    upper_role_name := UPPER(Role_name);
    
    OPEN ResultCursor FOR
    SELECT r.role, r.table_name, r.privilege
    FROM role_tab_privs r
    WHERE r.role = upper_role_name;
END;