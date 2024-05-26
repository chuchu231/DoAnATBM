alter session set "_ORACLE_SCRIPT"=true;
--Cap quyen tren bang NHANSU
/*CREATE OR REPLACE FUNCTION SELECT_NHANSU_FUNCTION 
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
/*/
--GRANT  RL_GIANGVIEN TO RL_NHANVIEN ;
CREATE OR REPLACE FUNCTION SELECT_NHANSU_FUNCTION (p_schema VARCHAR2, p_obj VARCHAR2)
RETURN VARCHAR2
AS
    v_user VARCHAR2(60);
    v_condition VARCHAR2(4000);
    v_vaitro VARCHAR2(20);
    CURSOR role_cur IS
        SELECT granted_role 
        FROM DBA_ROLE_PRIVS 
        WHERE GRANTEE = v_user;
BEGIN
    v_user := SYS_CONTEXT('USERENV', 'SESSION_USER');
    v_condition := 'MANV = ''' || v_user || '''';

    FOR role_rec IN role_cur LOOP
        v_vaitro := role_rec.granted_role;

        IF v_vaitro = 'RL_TRUONGKHOA' THEN
            v_condition := '1=1';
        ELSIF v_vaitro = 'RL_SINHVIEN' THEN
               v_condition := '1=0';
        END IF;
    END LOOP;

    RETURN v_condition;
END;
/
BEGIN
	dbms_rls.add_policy(
    	OBJECT_SCHEMA =>'CADMIN2',
    	OBJECT_NAME=>'NHANSU',
    	POLICY_NAME =>'SELECT_NHANSU_POLICY',
    	POLICY_FUNCTION=>'SELECT_NHANSU_FUNCTION',
    	STATEMENT_TYPES=>'SELECT, UPDATE',
    	UPDATE_CHECK => TRUE
	);
END;
/

GRANT SELECT ON NHANSU TO RL_NHANVIEN, RL_GIANGVIEN, RL_GIAOVU, RL_TRUONGBM, RL_TRUONGKHOA;
GRANT UPDATE(DT) ON NHANSU TO RL_NHANVIEN, RL_GIANGVIEN, RL_GIAOVU, RL_TRUONGBM;
GRANT INSERT, DELETE, UPDATE ON NHANSU TO RL_TRUONGKHOA;

--Cap quyen tren bang DONVI
GRANT SELECT ON DONVI TO RL_NHANVIEN, RL_GIANGVIEN, RL_GIAOVU, RL_TRUONGBM, RL_TRUONGKHOA;
GRANT INSERT, UPDATE ON DONVI TO RL_GIAOVU;

--Cap quyen tren bang HOCPHAN
GRANT SELECT ON HOCPHAN TO RL_NHANVIEN, RL_GIANGVIEN, RL_GIAOVU, RL_TRUONGBM, RL_TRUONGKHOA, RL_SINHVIEN;
GRANT INSERT, UPDATE ON HOCPHAN TO RL_GIAOVU;

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
        FROM CADMIN2.SINHVIEN
        WHERE MASV = TO_NUMBER(SUBSTR(SYS_CONTEXT('USERENV', 'SESSION_USER'), 5));
        RETURN 'MACT = '''|| MA ||'''';
    ELSE
        RETURN '1=1';
    END IF;
END;
/

BEGIN
	dbms_rls.add_policy(
    	OBJECT_SCHEMA =>'CADMIN2',
    	OBJECT_NAME=>'KHMO',
    	POLICY_NAME =>'SELECT_KHMO_POLICY',
    	POLICY_FUNCTION=>'SELECT_KHMO_FUNCTION',
    	STATEMENT_TYPES=>'SELECT',
    	UPDATE_CHECK => TRUE
	);
END;
/
GRANT SELECT ON KHMO TO RL_NHANVIEN, RL_GIANGVIEN, RL_GIAOVU, RL_TRUONGBM, RL_TRUONGKHOA, RL_SINHVIEN;
GRANT INSERT, UPDATE ON KHMO TO RL_GIAOVU;

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
        RETURN 'MASV = TO_NUMBER(SUBSTR(SYS_CONTEXT(''USERENV'', ''SESSION_USER''), 5))' ;
    ELSE
        RETURN '1=1';
    END IF;
END;
/

BEGIN
	dbms_rls.add_policy(
    	OBJECT_SCHEMA =>'CADMIN2',
    	OBJECT_NAME=>'SINHVIEN',
    	POLICY_NAME =>'SELECT_SINHVIEN_POLICY',
    	POLICY_FUNCTION=>'SELECT_SINHVIEN_FUNCTION',
    	STATEMENT_TYPES=>'SELECT, UPDATE',
    	UPDATE_CHECK => TRUE
	);
END;
/

GRANT SELECT ON SINHVIEN TO RL_NHANVIEN, RL_GIANGVIEN, RL_GIAOVU, RL_TRUONGBM, RL_TRUONGKHOA, RL_SINHVIEN;
GRANT UPDATE(DCHI, DT) ON SINHVIEN TO RL_SINHVIEN;
GRANT INSERT, UPDATE, DELETE ON SINHVIEN TO RL_GIAOVU;

--Cap quyen cho bang DANGKY

CREATE OR REPLACE PROCEDURE CADMIN2.UpdateDangKy(
    p_maHP VARCHAR2,
    p_hocKy VARCHAR2,
    p_namHoc VARCHAR2,
    p_maCT VARCHAR2
) AS
    v_maGV VARCHAR2(20);
    v_user VARCHAR2(30);
    p_MASV VARCHAR2(20);
BEGIN
    v_user := SYS_CONTEXT('USERENV', 'SESSION_USER');
    p_MASV := TO_NUMBER(SUBSTR(SYS_CONTEXT('USERENV', 'SESSION_USER'), 5));
        EXECUTE IMMEDIATE 'GRANT SELECT ON CADMIN2.PHANCONG TO ' || v_user;
    
    BEGIN
        SELECT MAGV INTO v_maGV
        FROM CADMIN2.PHANCONG
        WHERE MAHP = p_maHP AND HK = p_hocKy AND NAM = p_namHoc AND MACT = p_maCT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Không tìm thấy học phần phù hợp');
    END;

    INSERT INTO CADMIN2.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK)
    VALUES (p_MASV, v_maGV, p_maHP, p_hocKy, p_namHoc, p_maCT, NULL, NULL, NULL, NULL);
    
    EXECUTE IMMEDIATE 'REVOKE SELECT ON CADMIN2.PHANCONG FROM ' || v_user;
    
EXCEPTION
    WHEN OTHERS THEN
        EXECUTE IMMEDIATE 'REVOKE SELECT ON CADMIN2.PHANCONG FROM ' || v_user;
        RAISE;
END;
/
GRANT EXECUTE ON CADMIN2.UpdateDangKy TO RL_SINHVIEN;

CREATE OR REPLACE PROCEDURE CADMIN2.DeleteDangKy(
    p_maHP VARCHAR2,
    p_hocKy VARCHAR2,
    p_namHoc VARCHAR2,
    p_maCT VARCHAR2
) AS
    v_maGV VARCHAR2(20);
    v_user VARCHAR2(30);
    p_MASV VARCHAR2(20);
BEGIN
    v_user := SYS_CONTEXT('USERENV', 'SESSION_USER');
    p_MASV := TO_NUMBER(SUBSTR(SYS_CONTEXT('USERENV', 'SESSION_USER'), 5));
        EXECUTE IMMEDIATE 'GRANT SELECT ON CADMIN2.PHANCONG TO ' || v_user;
    
    BEGIN
        SELECT MAGV INTO v_maGV
        FROM CADMIN2.PHANCONG
        WHERE MAHP = p_maHP AND HK = p_hocKy AND NAM = p_namHoc AND MACT = p_maCT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Không tìm thấy học phần phù hợp');
    END;

    DELETE FROM CADMIN2.DANGKY WHERE MASV = p_MASV AND MAGV = v_maGV AND MAHP = p_maHP AND HK = p_hocKy AND NAM = p_namHoc AND MACT = p_maCT;
    
    EXECUTE IMMEDIATE 'REVOKE SELECT ON CADMIN2.PHANCONG FROM ' || v_user;
    
EXCEPTION
    WHEN OTHERS THEN
        EXECUTE IMMEDIATE 'REVOKE SELECT ON CADMIN2.PHANCONG FROM ' || v_user;
        RAISE;
END;
/
GRANT EXECUTE ON CADMIN2.DeleteDangKy TO RL_SINHVIEN;
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
        RETURN 'MASV = TO_NUMBER(SUBSTR(SYS_CONTEXT(''USERENV'', ''SESSION_USER''), 5))' ;
    ELSE
        RETURN '1=1';
    END IF;   
END;
/

BEGIN
	dbms_rls.add_policy(
    	OBJECT_SCHEMA =>'CADMIN2',
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

GRANT SELECT ON DANGKY TO RL_GIANGVIEN, RL_GIAOVU, RL_SINHVIEN, RL_TRUONGKHOA;
GRANT UPDATE(DIEMTH, DIEMQT, DIEMCK, DIEMTK) ON DANGKY TO RL_GIANGVIEN;
GRANT INSERT, DELETE ON DANGKY TO RL_GIAOVU, RL_SINHVIEN;

-------PHANCONG
insert into CADMIN2.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP222', N'NG_NH_TRG', 4, 8, 1, 75, 'CNTT');
insert into KHMO (MAHP, HK, NAM, MACT) values ('HP222', 'HK1', '2023-2024', 'CLC');
insert into PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV005', 'HP222', 'HK1', '2023-2024', 'CLC');

create or replace VIEW UV_GV_Phancong 
AS
    SELECT *
    FROM CADMIN2.PHANCONG PC
    WHERE PC.MAGV = SYS_CONTEXT('USERENV', 'SESSION_USER');
/
create or replace VIEW UV_Quanly_Phancong 
AS
    SELECT gv.manv, DV.madv, pc.hk, pc.nam, pc.mahp, pc.mact
    FROM CADMIN2.NHANSU GV, CADMIN2.DONVI DV, CADMIN2.PHANCONG PC, CADMIN2.HOCPHAN HP
    WHERE dv.madv = 'VPK' AND HP.MAHP = PC.MAHP AND HP.MADV = DV.MADV AND PC.MAGV  = GV.MANV;
/
CREATE OR REPLACE VIEW UV_TRGDV_QUANLY_PHANCONG
AS
    SELECT *
    FROM CADMIN2.PHANCONG PC 
    JOIN CADMIN2.HOCPHAN HP ON HP.MAHP= PC.MAHP
    JOIN CADMIN2.DONVI DV ON DV.MADV = HP.MADV
    WHERE DV.TRGDV = SYS_CONTEXT('USERENV', 'SESSION_USER');
/

CREATE OR REPLACE VIEW UV_TRGDV_PHANCONG
AS
    SELECT gv.manv, pc.hk, pc.nam, pc.mahp, pc.mact
    FROM CADMIN2.NHANSU GV JOIN CADMIN2.DONVI DV ON dv.madv = gv.madv 
        JOIN CADMIN2.PHANCONG PC ON gv.manv =pc.magv
    WHERE DV.TRGDV = SYS_CONTEXT('USERENV', 'SESSION_USER');
    SELECT * 
    FROM CADMIN2.PHANCONG
/

GRANT SELECT, INSERT, UPDATE ON SINHVIEN TO RL_GIAOVU;
GRANT SELECT, INSERT, UPDATE ON DONVI TO RL_GIAOVU;
GRANT SELECT, INSERT, UPDATE ON HOCPHAN TO RL_GIAOVU;
GRANT SELECT, INSERT, UPDATE ON KHMO TO RL_GIAOVU;
GRANT SELECT, UPDATE ON PHANCONG TO RL_GIAOVU;

GRANT SELECT ON UV_GV_Phancong  TO RL_GIANGVIEN;
/
GRANT SELECT, UPDATE ON UV_Quanly_Phancong TO RL_GIAOVU;
GRANT SELECT, UPDATE ON UV_Quanly_Phancong TO RL_GIAOVU;
/
GRANT SELECT, UPDATE, DELETE, INSERT ON UV_TRGDV_QUANLY_PHANCONG TO RL_TRUONGBM;
GRANT SELECT ON UV_TRGDV_PHANCONG TO RL_TRUONGBM;


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


