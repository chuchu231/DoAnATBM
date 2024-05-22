--Tao role SINVIEN
alter session set "_ORACLE_SCRIPT"=true;
CREATE ROLE SINHVIEN;

--Tao tai khoan sinh vien
CREATE OR REPLACE PROCEDURE USP_CREATESINHVIEN
AS
    CURSOR CUR IS (SELECT MASV
                    FROM ADMIN.SINHVIEN
                    WHERE MASV NOT IN (SELECT USERNAME
                                        		      FROM ALL_USERS)
                    );
    STRSQL VARCHAR(2000);
    USR VARCHAR2(5);
BEGIN
    OPEN CUR;
    STRSQL := 'ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE';
    EXECUTE IMMEDIATE(STRSQL);
    LOOP
        FETCH CUR INTO USR;
        EXIT WHEN CUR%NOTFOUND;
            
        STRSQL := 'CREATE USER '||USR||' IDENTIFIED BY '||USR;
        EXECUTE IMMEDIATE(STRSQL);
        STRSQL := 'GRANT CONNECT TO '||USR;
        EXECUTE IMMEDIATE(STRSQL);
    END LOOP;
    STRSQL := 'ALTER SESSION SET "_ORACLE_SCRIPT" = FALSE';
    EXECUTE IMMEDIATE(STRSQL);
    CLOSE CUR;
END;
/
EXEC USP_CREATESINHVIEN;

--Cap role cho sinh vien
CREATE OR REPLACE PROCEDURE USP_GRANTROLESV
AS
    CURSOR CUR IS (SELECT MASV
                    FROM ADMIN.SINHVIEN);
    STRSQL VARCHAR(2000);
    USR VARCHAR2(5);
BEGIN
    OPEN CUR;
    LOOP
        FETCH CUR INTO USR;
        EXIT WHEN CUR%NOTFOUND;
        
        STRSQL := 'GRANT SINHVIEN TO '||USR;
        EXECUTE IMMEDIATE (STRSQL);
    END LOOP;
    CLOSE CUR;
END;
/
EXEC USP_GRANTROLESV;

--Sinh vien xem thong tin cua chinh minh, chinh sua thong tin tren truong DCHI, DT
CREATE OR REPLACE FUNCTION SV1_FUNCTION 
(P_SCHEMA VARCHAR2, P_OBJ VARCHAR2) 
RETURN VARCHAR2 
AS 
    USER VARCHAR(100); 
    ROLE VARCHAR(5);
BEGIN 
    USER:= SYS_CONTEXT('USERENV','SESSION_USER'); 
    ROLE := SUBSTR(USER, 0, 3);
    IF (ROLE = 'SV0') THEN
        RETURN 'MASV = '''|| USER ||''''; 
    ELSE 
        RETURN '';
    END IF;
END;
/

BEGIN
	dbms_rls.add_policy(
    	OBJECT_SCHEMA =>'ADMIN',
    	OBJECT_NAME=>'SINHVIEN',
    	POLICY_NAME =>'SV1',
    	POLICY_FUNCTION=>'SV1_FUNCTION',
    	STATEMENT_TYPES=>'SELECT, UPDATE',
    	UPDATE_CHECK => TRUE
	);
END;
/
GRANT SELECT ON ADMIN.SINHVIEN TO SINHVIEN;
GRANT UPDATE(DCHI, DT) ON ADMIN.SINHVIEN TO SINHVIEN;

--Xem danh sach hoc phan, khoa hoc mo cua chuong trinh dang theo hoc
CREATE OR REPLACE FUNCTION SV_KHMO_FUNCTION (
    P_SCHEMA VARCHAR2,
    P_OBJ VARCHAR2
) RETURN VARCHAR2 AS
    MA VARCHAR2(30);
BEGIN
    --LAY MA CHUONG TRINH CUA SINH VIEN
    SELECT MACT
    INTO MA
    FROM ADMIN.SINHVIEN
    WHERE MASV = SYS_CONTEXT('USERENV', 'SESSION_USER');
    
    RETURN 'MACT = '''|| MA ||''''; 
END;
/

BEGIN
	dbms_rls.add_policy(
    	OBJECT_SCHEMA =>'ADMIN',
    	OBJECT_NAME=>'KHMO',
    	POLICY_NAME =>'SV_KHMO',
    	POLICY_FUNCTION=>'SV_KHMO_FUNCTION',
    	STATEMENT_TYPES=>'SELECT',
    	UPDATE_CHECK => TRUE
	);
END;
/

BEGIN
	dbms_rls.add_policy(
    	OBJECT_SCHEMA =>'ADMIN',
    	OBJECT_NAME=>'PHANCONG',
    	POLICY_NAME =>'SV_PHANCONG',
    	POLICY_FUNCTION=>'SV_KHMO_FUNCTION',
    	STATEMENT_TYPES=>'SELECT',
    	UPDATE_CHECK => TRUE
	);
END;
/
GRANT SELECT ON ADMIN.PHANCONG TO SINHVIEN;
GRANT SELECT ON ADMIN.HOCPHAN TO SINHVIEN;
GRANT SELECT ON ADMIN.KHMO TO SINHVIEN;

--Xem, them, xoa tren bang DANGKY cac dong lien quan den chinh minh
BEGIN
	dbms_rls.add_policy(
    	OBJECT_SCHEMA =>'ADMIN',
    	OBJECT_NAME=>'DANGKY',
    	POLICY_NAME =>'SV_DANGKY',
    	POLICY_FUNCTION=>'SV1_FUNCTION',
    	STATEMENT_TYPES=>'SELECT, DELETE',
    	UPDATE_CHECK => TRUE
	);
END;
/
       --Tao trigger cho insert, delete
CREATE OR REPLACE TRIGGER Check_Valid_Date
BEFORE INSERT OR DELETE ON ADMIN.DANGKY
FOR EACH ROW
DECLARE 
    month_tmp NUMBER;
    day_tmp NUMBER;
    tmp NUMBER;  
BEGIN
    -- Extract the current month and day
    SELECT EXTRACT(MONTH FROM CURRENT_DATE) INTO month_tmp FROM dual;
    SELECT EXTRACT(DAY FROM CURRENT_DATE) INTO day_tmp FROM dual;

    BEGIN
        -- Check if the necessary information exists in PHANCONG
        IF INSERTING THEN
            SELECT 1
            INTO tmp
            FROM ADMIN.PHANCONG
            WHERE MAHP = :NEW.MAHP AND HK = :NEW.HK AND 
                  NAM = :NEW.NAM AND MACT = :NEW.MACT AND MAGV = :NEW.MAGV and :NEW.DIEMTH IS NULL
                  AND :NEW.DIEMQT IS NULL AND :NEW.DIEMCK IS NULL AND :NEW.DIEMTK IS NULL;
        ELSIF DELETING THEN
            SELECT 1
            INTO tmp
            FROM ADMIN.PHANCONG
            WHERE MAHP = :OLD.MAHP AND HK = :OLD.HK AND 
                  NAM = :OLD.NAM AND MACT = :OLD.MACT AND MAGV = :OLD.MAGV and :OLD.DIEMTH IS NULL
                  AND :OLD.DIEMQT IS NULL AND :OLD.DIEMCK IS NULL AND :OLD.DIEMTK IS NULL;
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            raise_application_error(-20003, 'Error');
    END;
    
    -- check student
    BEGIN
        -- Check if the necessary information exists in SINHVIEN
        IF INSERTING THEN
            SELECT 1
            INTO tmp
            FROM ADMIN.SINHVIEN
            WHERE MASV = :NEW.MASV;
        ELSIF DELETING THEN
            SELECT 1
            INTO tmp
            FROM ADMIN.SINHVIEN
            WHERE MASV = :OLD.MASV;
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            raise_application_error(-20002, 'STUDENT DOES NOT EXIST IN SYSTEM');
    END;

    -- Check the conditions for the current date
    IF month_tmp = 1 OR month_tmp = 5 OR month_tmp = 9 THEN
        IF day_tmp < 14 THEN
            RAISE_APPLICATION_ERROR(-20001, 'CANNOT WRITE AT THIS TIME');
        END IF;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'CANNOT WRITE AT THIS TIME');
    END IF;
END;
/

GRANT SELECT, INSERT, DELETE ON ADMIN.DANGKY TO SINHVIEN;

