CREATE OR REPLACE PROCEDURE admin.GetAdminTables (p_cursor OUT SYS_REFCURSOR) IS
BEGIN
    OPEN p_cursor FOR
        SELECT table_name
        FROM all_tables
        WHERE owner = 'ADMIN';
END ;