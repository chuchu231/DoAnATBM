alter session set "_ORACLE_SCRIPT"=true;
CREATE ROLE RL_NHANVIEN;
CREATE ROLE RL_GIANGVIEN;
CREATE ROLE RL_GIAOVU;
CREATE ROLE RL_TRUONGBM;
CREATE ROLE RL_TRUONGKHOA;
CREATE ROLE RL_SINHVIEN;

--User test
CREATE USER NV001 IDENTIFIED BY NV001;
CREATE USER GV001 IDENTIFIED BY GV001;
CREATE USER GVU001 IDENTIFIED BY GVU001;
CREATE USER TBM001 IDENTIFIED BY TBM001;
CREATE USER TK001 IDENTIFIED BY TK001;
CREATE USER SV001 IDENTIFIED BY SV001;
GRANT CONNECT TO NV001, GV001, GVU001, TBM001, TK001, SV001;
--Cap role
GRANT RL_NHANVIEN TO NV001;
GRANT RL_GIANGVIEN TO GV001;
GRANT RL_GIAOVU TO GVU001;
GRANT RL_TRUONGBM TO TBM001;
GRANT RL_TRUONGKHOA TO TK001;
GRANT RL_SINHVIEN TO SV001;

--Cap quyen tren bang NHANSU
CREATE OR REPLACE FUNCTION SELECT_NHANSU_FUNCTION 
(P_SCHEMA VARCHAR2, P_OBJ VARCHAR2) 
RETURN VARCHAR2 
AS 
    USER VARCHAR(100); 
    ROLE VARCHAR(5);
BEGIN 
    USER := SYS_CONTEXT('USERENV', 'SESSION_USER');
    ROLE := SUBSTR(USER, 0, 3);
    IF ROLE = 'TK0' THEN
        RETURN '1=1';
    ELSE
        RETURN 'MANV = ''' || USER || '''';
    END IF;  
END;
/

BEGIN
	dbms_rls.add_policy(
    	OBJECT_SCHEMA =>'ADMIN',
    	OBJECT_NAME=>'NHANSU',
    	POLICY_NAME =>'SELECT_NHANSU_POLICY',
    	POLICY_FUNCTION=>'SELECT_NHANSU_FUNCTION',
    	STATEMENT_TYPES=>'SELECT, UPDATE',
    	UPDATE_CHECK => TRUE
	);
END;
/
GRANT SELECT ON ADMIN.NHANSU TO RL_NHANVIEN, RL_GIANGVIEN, RL_GIAOVU, RL_TRUONGBM, RL_TRUONGKHOA;
GRANT UPDATE(DT) ON ADMIN.NHANSU TO RL_NHANVIEN, RL_GIANGVIEN, RL_GIAOVU, RL_TRUONGBM;
GRANT INSERT, DELETE, UPDATE ON ADMIN.NHANSU TO RL_TRUONGKHOA;

--Cap quyen tren bang DONVI
GRANT SELECT ON ADMIN.DONVI TO RL_NHANVIEN, RL_GIANGVIEN, RL_GIAOVU, RL_TRUONGBM, RL_TRUONGKHOA;
GRANT INSERT, UPDATE ON ADMIN.DONVI TO RL_GIAOVU;

--Cap quyen tren bang HOCPHAN
GRANT SELECT ON ADMIN.HOCPHAN TO RL_NHANVIEN, RL_GIANGVIEN, RL_GIAOVU, RL_TRUONGBM, RL_TRUONGKHOA, RL_SINHVIEN;
GRANT INSERT, UPDATE ON ADMIN.HOCPHAN TO RL_GIAOVU;

--Cap quyen tren bang KHMO
CREATE OR REPLACE FUNCTION SELECT_KHMO_FUNCTION (
    P_SCHEMA VARCHAR2,
    P_OBJ VARCHAR2
) RETURN VARCHAR2 AS
    USER VARCHAR(100); 
    ROLE VARCHAR(5);
    MA VARCHAR2(10);
BEGIN
    USER := SYS_CONTEXT('USERENV', 'SESSION_USER');
    ROLE := SUBSTR(USER, 0, 3);  
    
    IF ROLE = 'SV0' THEN
        --LAY MA CHUONG TRINH CUA SINH VIEN
        SELECT MACT
        INTO MA
        FROM ADMIN.SINHVIEN
        WHERE MASV = SYS_CONTEXT('USERENV', 'SESSION_USER');
        RETURN 'MACT = '''|| MA ||'''';
    ELSE
        RETURN '1=1';
    END IF;
END;
/

BEGIN
	dbms_rls.add_policy(
    	OBJECT_SCHEMA =>'ADMIN',
    	OBJECT_NAME=>'KHMO',
    	POLICY_NAME =>'SELECT_KHMO_POLICY',
    	POLICY_FUNCTION=>'SELECT_KHMO_FUNCTION',
    	STATEMENT_TYPES=>'SELECT',
    	UPDATE_CHECK => TRUE
	);
END;
/
GRANT SELECT ON ADMIN.KHMO TO RL_NHANVIEN, RL_GIANGVIEN, RL_GIAOVU, RL_TRUONGBM, RL_TRUONGKHOA, RL_SINHVIEN;
GRANT INSERT, UPDATE ON ADMIN.KHMO TO RL_GIAOVU;

--Cap quyen tren bang SINHVIEN
CREATE OR REPLACE FUNCTION SELECT_SINHVIEN_FUNCTION 
(P_SCHEMA VARCHAR2, P_OBJ VARCHAR2) 
RETURN VARCHAR2 
AS 
    USER VARCHAR(100); 
    ROLE VARCHAR(5);
BEGIN 
    USER := SYS_CONTEXT('USERENV', 'SESSION_USER');
    ROLE := SUBSTR(USER, 0, 3);
    IF ROLE = 'SV0' THEN
        RETURN 'MASV = ''' || USER || '''';
    ELSE
        RETURN '1=1';
    END IF;
END;
/

BEGIN
	dbms_rls.add_policy(
    	OBJECT_SCHEMA =>'ADMIN',
    	OBJECT_NAME=>'SINHVIEN',
    	POLICY_NAME =>'SELECT_SINHVIEN_POLICY',
    	POLICY_FUNCTION=>'SELECT_SINHVIEN_FUNCTION',
    	STATEMENT_TYPES=>'SELECT, UPDATE',
    	UPDATE_CHECK => TRUE
	);
END;
/


GRANT SELECT ON ADMIN.SINHVIEN TO RL_NHANVIEN, RL_GIANGVIEN, RL_GIAOVU, RL_TRUONGBM, RL_TRUONGKHOA, RL_SINHVIEN;
GRANT UPDATE(DCHI, DT) ON ADMIN.SINHVIEN TO RL_SINHVIEN;
GRANT INSERT, UPDATE, DELETE ON ADMIN.SINHVIEN TO RL_GIAOVU;

CREATE OR REPLACE PROCEDURE ADMIN.UPDATE_STUDENT (DCHI NVARCHAR2, DT NVARCHAR2)
AS
    STRSQL VARCHAR(2000);
BEGIN
    IF DCHI IS NULL OR DCHI = '' THEN
        RAISE_APPLICATION_ERROR(-20001, 'Thông tin ??a ch? không ???c ?? tr?ng');
    END IF;
    IF DT IS NULL OR DT = '' THEN
        RAISE_APPLICATION_ERROR(-20002, 'Thông tin s? ?i?n tho?i không ???c ?? tr?ng');
    END IF;
    STRSQL := 'UPDATE ADMIN.SINHVIEN SET DCHI = '''|| DCHI || '''';
    EXECUTE IMMEDIATE (STRSQL);
    STRSQL := 'UPDATE ADMIN.SINHVIEN SET DT = '''|| DT || '''';
    EXECUTE IMMEDIATE (STRSQL);
END;
/

GRANT EXECUTE ON ADMIN.UPDATE_STUDENT TO RL_SINHVIEN;
--Cap quyen cho bang DANGKY
CREATE OR REPLACE FUNCTION DANGKY_FUNCTION 
(P_SCHEMA VARCHAR2, P_OBJ VARCHAR2) 
RETURN VARCHAR2 
AS 
    USER VARCHAR(100);
    ROLE VARCHAR(5);
BEGIN 
    USER:= SYS_CONTEXT('USERENV','SESSION_USER'); 
    ROLE := SUBSTR(USER, 0, 3);
    IF (ROLE = 'GV0') THEN
        RETURN 'MAGV = '''|| USER ||'''';   
    ELSIF (ROLE = 'SV0') THEN
        RETURN 'MASV = '''|| USER ||''''; 
    ELSE
        RETURN '1=1';
    END IF;   
END;
/

BEGIN
	dbms_rls.add_policy(
    	OBJECT_SCHEMA =>'ADMIN',
    	OBJECT_NAME=>'DANGKY',
    	POLICY_NAME =>'DANGKY_POLICY',
    	POLICY_FUNCTION=>'DANGKY_FUNCTION',
    	STATEMENT_TYPES=>'SELECT, DELETE, INSERT, UPDATE',
    	UPDATE_CHECK => TRUE
	);
END;
/


BEGIN
	dbms_rls.drop_policy(
    	OBJECT_SCHEMA =>'ADMIN',
    	OBJECT_NAME=>'DANGKY',
    	POLICY_NAME =>'DANGKY_POLICY'
	);
END;
/

GRANT SELECT ON ADMIN.DANGKY TO RL_GIANGVIEN, RL_GIAOVU, RL_SINHVIEN, RL_TRUONGKHOA;
GRANT UPDATE(DIEMTH, DIEMQT, DIEMCK, DIEMTK) ON ADMIN.DANGKY TO RL_GIANGVIEN;
GRANT INSERT, DELETE ON ADMIN.DANGKY TO RL_GIAOVU, RL_SINHVIEN;

-------PHANCONG
create or replace VIEW ADMIN.UV_GV_Phancong 
AS
    SELECT *
    FROM ADMIN.PHANCONG PC
    WHERE PC.MAGV = SYS_CONTEXT('USERENV', 'SESSION_USER');
/
create or replace VIEW ADMIN.UV_Quanly_Phancong 
AS
    SELECT gv.manv, DV.madv, pc.hk, pc.nam, pc.mahp, pc.mact
    FROM ADMIN.NHANSU GV, ADMIN.DONVI DV, ADMIN.PHANCONG PC, ADMIN.HOCPHAN HP
    WHERE dv.madv = 'VPK' AND HP.MAHP = PC.MAHP AND HP.MADV = DV.MADV AND PC.MAGV  = GV.MANV;
/
CREATE OR REPLACE VIEW ADMIN.UV_TRGDV_QUANLY_PHANCONG
AS
    SELECT PC.MAGV,DV.MADV, HP.MAHP, PC.HK, PC.NAM, PC.MACT
    FROM ADMIN.PHANCONG PC JOIN ADMIN.HOCPHAN HP ON HP.MAHP= PC.MAHP
     JOIN ADMIN.DONVI DV ON DV.MADV = HP.MADV
    WHERE DV.TRGDV = SYS_CONTEXT('USERENV', 'SESSION_USER');
/
CREATE OR REPLACE VIEW ADMIN.UV_TRGDV_PHANCONG
AS
    SELECT gv.manv, pc.hk, pc.nam, pc.mahp, pc.mact
    FROM ADMIN.NHANSU GV JOIN ADMIN.DONVI DV ON dv.madv = gv.madv 
        JOIN ADMIN.PHANCONG PC ON gv.manv =pc.magv
    WHERE DV.TRGDV = SYS_CONTEXT('USERENV', 'SESSION_USER');
/

GRANT SELECT, INSERT, UPDATE ON ADMIN.SINHVIEN TO RL_GIAOVU;
GRANT SELECT, INSERT, UPDATE ON ADMIN.DONVI TO RL_GIAOVU;
GRANT SELECT, INSERT, UPDATE ON ADMIN.HOCPHAN TO RL_GIAOVU;
GRANT SELECT, INSERT, UPDATE ON ADMIN.KHMO TO RL_GIAOVU;
GRANT SELECT, UPDATE ON ADMIN.PHANCONG TO RL_GIAOVU;

GRANT SELECT ON ADMIN.UV_GV_Phancong  TO RL_GIANGVIEN;
/
GRANT SELECT, UPDATE ON ADMIN.UV_Quanly_Phancong TO RL_GIAOVU;
GRANT SELECT, UPDATE ON ADMIN.UV_Quanly_Phancong TO RL_GIAOVU;
/
GRANT SELECT, UPDATE, DELETE, INSERT ON ADMIN.UV_TRGDV_QUANLY_PHANCONG TO RL_TRUONGBM;
GRANT SELECT ON ADMIN.UV_TRGDV_PHANCONG TO RL_TRUONGBM;


----PHANCONG (TruongKhoa)
create or replace view TRK_PHANCONG_VIEW 
as
select * from PHANCONG
where MAHP in (select MAHP from HOCPHAN where MADV = 'VPK');



CREATE OR REPLACE TRIGGER UV_TRGDV_QUANLY_PHANCONG_trig
INSTEAD OF
    UPDATE OR DELETE OR INSERT ON TRK_PHANCONG_VIEW
FOR EACH ROW
DECLARE
    gv_magv NHANSU.MANV%TYPE;
    dv_madv DONVI.MADV%TYPE;
    pc_hk PHANCONG.HK%TYPE;
    pc_nam PHANCONG.NAM%TYPE;
    pc_mahp PHANCONG.MAHP%TYPE;
    pc_mact PHANCONG.MACT%TYPE;
BEGIN
    IF UPDATING THEN
        BEGIN
            -- Check if the new MANV exists in NHANSU
            BEGIN
                SELECT MANV INTO gv_magv 
                FROM NHANSU 
                WHERE MANV = :new.magv;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    raise_application_error(-20001, 'COACHER IS NOT EXIST IN SYSTEM');
            END;
            
            -- Check if the new course information exists in KHMO
            BEGIN
                SELECT HK, NAM, MAHP, MACT INTO pc_hk, pc_nam, pc_mahp, pc_mact
                FROM KHMO
                WHERE MAHP = :new.mahp AND HK = :new.hk AND NAM = :new.nam AND MACT = :new.mact;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    raise_application_error(-20002, 'INFORMATION CANNOT BE FOUND');
            END;
            
            -- Update logic for DANGKY first to avoid integrity constraint violation
            FOR R IN (SELECT DK.MASV FROM DANGKY DK 
                      WHERE DK.MAGV = :old.magv 
                        AND DK.MAHP = :old.mahp 
                        AND DK.HK = :old.hk 
                        AND DK.NAM = :old.nam 
                        AND DK.MACT = :old.mact)
            LOOP
                UPDATE DANGKY
                SET MAGV = :new.magv,
                    MAHP = :new.mahp,
                    HK = :new.hk,
                    NAM = :new.nam,
                    MACT = :new.mact
                WHERE MAGV = :old.magv 
                  AND MAHP = :old.mahp 
                  AND HK = :old.hk 
                  AND NAM = :old.nam 
                  AND MACT = :old.mact
                  AND MASV = R.MASV;
            END LOOP;
        
            -- Update logic for PHANCONG
            UPDATE PHANCONG
            SET MAGV = :new.magv,
                MAHP = :new.mahp,
                HK = :new.hk,
                NAM = :new.nam,
                MACT = :new.mact
            WHERE MAGV = :old.magv 
              AND MAHP = :old.mahp 
              AND HK = :old.hk 
              AND NAM = :old.nam 
              AND MACT = :old.mact;
            
            DBMS_OUTPUT.PUT_LINE('UPDATED');
        END;
    ELSIF INSERTING THEN
        BEGIN
            -- Check if the new MANV exists in NHANSU
            BEGIN
                SELECT MANV INTO gv_magv 
                FROM NHANSU 
                WHERE MANV = :new.magv;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    raise_application_error(-20001, 'COACHER IS NOT EXIST IN SYSTEM');
            END;
            
            -- Check if the new course information exists in KHMO
            BEGIN
                SELECT HK, NAM, MAHP, MACT INTO pc_hk, pc_nam, pc_mahp, pc_mact
                FROM KHMO
                WHERE MAHP = :new.mahp AND HK = :new.hk AND NAM = :new.nam AND MACT = :new.mact and mahp in (select MAHP from HOCPHAN where MADV='VPK');
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    raise_application_error(-20002, 'INFORMATION CANNOT BE FOUND');
            END;
            
            -- Insert logic for PHANCONG
            INSERT INTO PHANCONG (MAGV, MAHP, HK, NAM, MACT)
            VALUES (:NEW.MAGV, :NEW.MAHP, :NEW.HK, :NEW.NAM, :NEW.MACT);
            
            DBMS_OUTPUT.PUT_LINE('INSERTED');
        END;
    ELSIF DELETING THEN
    
    
            
        BEGIN
        
         BEGIN
                SELECT HK, NAM, MAHP, MACT INTO pc_hk, pc_nam, pc_mahp, pc_mact
                FROM KHMO
                WHERE MAHP = :old.mahp AND HK = :old.hk AND NAM = :old.nam AND MACT = :old.mact and mahp in (select MAHP from HOCPHAN where MADV='VPK');
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    raise_application_error(-20002, 'INFORMATION CANNOT BE FOUND');
            END;
            -- Delete logic for DANGKY first to avoid integrity constraint violation
            FOR R IN (SELECT DK.MASV FROM DANGKY DK 
                      WHERE DK.MAGV = :old.magv
                        AND DK.MAHP = :old.mahp 
                        AND DK.HK = :old.hk 
                        AND DK.NAM = :old.nam 
                        AND DK.MACT = :old.mact)
            LOOP
                DELETE FROM DANGKY
                WHERE MAGV = :old.magv
                  AND MAHP = :old.mahp 
                  AND HK = :old.hk 
                  AND NAM = :old.nam 
                  AND MACT = :old.mact
                  AND MASV = R.MASV;
            END LOOP;
        
            -- Delete logic for PHANCONG
            DELETE FROM PHANCONG
            WHERE MAGV = :old.magv
              AND MAHP = :old.mahp 
              AND HK = :old.hk 
              AND NAM = :old.nam 
              AND MACT = :old.mact
              AND MAHP in (select MAHP from HOCPHAN where MADV='VPK'); 
            
            DBMS_OUTPUT.PUT_LINE('DELETED');
        END;
    END IF;
END;
/
BEGIN
   FOR r IN (SELECT table_name  FROM all_tables WHERE owner = 'ADMIN') LOOP
      EXECUTE IMMEDIATE 'GRANT SELECT ON ADMIN.' || r.table_name || ' TO RL_TRUONGKHOA ';
   END LOOP;
END;
/



grant select on TRK_PHANCONG_VIEW to RL_TRUONGKHOA;
grant insert on TRK_PHANCONG_VIEW to RL_TRUONGKHOA;
grant update on TRK_PHANCONG_VIEW to RL_TRUONGKHOA;
grant delete on TRK_PHANCONG_VIEW to RL_TRUONGKHOA;
GRANT SELECT ON ADMIN.PHANCONG TO RL_SINHVIEN;

