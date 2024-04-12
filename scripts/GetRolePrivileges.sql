CREATE OR REPLACE PROCEDURE GetRolePrivileges(Role_name IN VARCHAR2, ResultCursor OUT SYS_REFCURSOR)
AUTHID current_user
AS
    upper_role_name VARCHAR2(100);
BEGIN
    upper_role_name := UPPER(Role_name);
    
    OPEN ResultCursor FOR
    SELECT DISTINCT d.grantee AS user_name, t.table_name, t.privilege
    FROM dba_role_privs r
    JOIN dba_role_privs d ON r.granted_role = d.granted_role
    JOIN dba_tab_privs t ON d.grantee = t.grantee
    WHERE r.granted_role = upper_role_name and d.grantee <> 'CADMIN2';

END;