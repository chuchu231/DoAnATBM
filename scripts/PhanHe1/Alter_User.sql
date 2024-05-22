CREATE OR REPLACE PROCEDURE Alter_User(User_name IN VARCHAR2, Pass_Word IN VARCHAR2)
authid current_user 
AS
    Tmp_count INT;
    upper_user_name VARCHAR2(100);
BEGIN
    upper_user_name := UPPER(User_name);

    SELECT COUNT(*) INTO Tmp_count FROM all_users WHERE username = upper_user_name;
    
    IF Tmp_count != 0 THEN
        execute immediate('ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE');
        EXECUTE IMMEDIATE 'ALTER USER ' || upper_user_name || ' IDENTIFIED BY ' || Pass_Word;
        execute immediate('ALTER SESSION SET "_ORACLE_SCRIPT" = false');
    ELSE
        RAISE_APPLICATION_ERROR(-20000, 'User ' || upper_user_name || ' does not exist');
    END IF;
END;