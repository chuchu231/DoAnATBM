CREATE OR REPLACE PROCEDURE admin.getAttributes (tablename in varchar2 ,p_cursor OUT SYS_REFCURSOR) IS
BEGIN
    OPEN p_cursor FOR
        SELECT column_name
        FROM all_tab_columns
        WHERE table_name = tablename;
END ;