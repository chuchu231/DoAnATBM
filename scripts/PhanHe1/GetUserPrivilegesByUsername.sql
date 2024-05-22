CREATE OR REPLACE PROCEDURE GetUserPrivilegesByUsername( Username IN VARCHAR2, UserCursor OUT SYS_REFCURSOR)
AS
    upper_user_name VARCHAR2(100);
BEGIN
    upper_user_name := UPPER(Username);
    OPEN UserCursor FOR
    SELECT TABLE_NAME , PRIVILEGE
    FROM USER_TAB_PRIVS r
    WHERE r.GRANTEE = upper_user_name;

END;