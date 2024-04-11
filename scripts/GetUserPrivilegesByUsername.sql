CREATE OR REPLACE PROCEDURE GetUserPrivilegesByUsername( Username IN VARCHAR2, UserCursor OUT SYS_REFCURSOR)
AS
    upper_user_name VARCHAR2(100);
BEGIN
    upper_user_name := UPPER(Username);
    OPEN UserCursor FOR
    SELECT u.username, tp.table_name, tp.privilege
    FROM DBA_TAB_PRIVS tp
    JOIN dba_users u ON u.username = tp.grantee
    WHERE u.username = upper_user_name;
END;