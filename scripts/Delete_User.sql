CREATE OR REPLACE PROCEDURE Delete_User(User_name IN VARCHAR2)
authid current_user 
AS
    user_exists NUMBER;
    upper_user_name VARCHAR2(100);
BEGIN
    upper_user_name := UPPER(User_name);
    IF User_name IS NULL THEN
        RAISE_APPLICATION_ERROR(-20000, 'Username cannot be null'); 
    ELSE
        SELECT COUNT(*)
        INTO user_exists
        FROM all_users
        WHERE username = upper_user_name;

        IF user_exists = 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'User does not exist'); 
        ELSE
            execute immediate('ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE');
            EXECUTE IMMEDIATE('DROP USER ' || upper_user_name);
            execute immediate('ALTER SESSION SET "_ORACLE_SCRIPT" = false');
        END IF;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'An error occurred: ' || SQLERRM);
END;