
CREATE OR REPLACE TRIGGER Check_Valid_Date
BEFORE INSERT OR DELETE ON DANGKY
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
            FROM PHANCONG
            WHERE MAHP = :NEW.MAHP AND HK = :NEW.HK AND 
                  NAM = :NEW.NAM AND MACT = :NEW.MACT AND MAGV = :NEW.MAGV and :NEW.DIEMTH IS NULL
                  AND :NEW.DIEMQT IS NULL AND :NEW.DIEMCK IS NULL AND :NEW.DIEMTK IS NULL;
        ELSIF DELETING THEN
            SELECT 1
            INTO tmp
            FROM PHANCONG
            WHERE MAHP = :OLD.MAHP AND HK = :OLD.HK AND 
                  NAM = :OLD.NAM AND MACT = :OLD.MACT AND MAGV = :OLD.MAGV and :OLD.DIEMTH IS NULL
                  AND :OLD.DIEMQT IS NULL AND :OLD.DIEMCK IS NULL AND :OLD.DIEMTK IS NULL;
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            raise_application_error(-20002, 'Error');
    END;
    
    -- check student
    BEGIN
        -- Check if the necessary information exists in SINHVIEN
        IF INSERTING THEN
            SELECT 1
            INTO tmp
            FROM SINHVIEN
            WHERE MASV = :NEW.MASV;
        ELSIF DELETING THEN
            SELECT 1
            INTO tmp
            FROM SINHVIEN
            WHERE MASV = :OLD.MASV;
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            raise_application_error(-20002, 'STUDENT DOES NOT EXIST IN SYSTEM');
    END;

    -- Check the conditions for the current date
    IF month_tmp = 1 OR month_tmp = 5 OR month_tmp = 9 THEN
        IF day_tmp > 14 THEN
            RAISE_APPLICATION_ERROR(-20001, 'CANNOT WRITE AT THIS TIME');
        END IF;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'CANNOT WRITE AT THIS TIME');
    END IF;
END;
-----------
CREATE OR REPLACE TRIGGER admin.uv_quanly_phancong_trig
INSTEAD OF
    UPDATE ON ADMIN.UV_Quanly_Phancong 
FOR EACH ROW
DECLARE
    gv_manv  NHANSU.MANV%TYPE;
    dv_madv  DONVI.MADV%TYPE;
    pc_hk    PHANCONG.HK%TYPE;
    pc_nam   PHANCONG.NAM%TYPE;
    pc_mahp  PHANCONG.MAHP%TYPE;
    pc_mact  PHANCONG.MACT%TYPE;
BEGIN
    -- Check if the new MANV exists in NHANSU
    BEGIN
        SELECT MANV INTO gv_manv 
        FROM NHANSU 
        WHERE MANV = :new.manv;
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
    -- Update logic for PHANCONG
    -- MAGV, MAHP, HK, NAM, MACT
    UPDATE PHANCONG
    SET MAGV = :new.manv,
        MAHP = :new.mahp,
        HK = :new.hk,
        NAM = :new.nam,
        MACT = :new.mact
    WHERE MAGV = :old.manv 
      AND MAHP = :old.mahp 
      AND HK = :old.hk 
      AND NAM = :old.nam 
      AND MACT = :old.mact;
    
    -- DBMS_OUTPUT.PUT_LINE('INSERTED');

    -- Update logic for DANGKY
    FOR R IN (SELECT DK.MASV FROM DANGKY DK 
              WHERE DK.MAGV = :old.manv 
                AND DK.MAHP = :old.mahp 
                AND DK.HK = :old.hk 
                AND DK.NAM = :old.nam 
                AND DK.MACT = :old.mact)
    LOOP
        UPDATE DANGKY
        SET MAGV = :new.manv,
            MAHP = :new.mahp,
            HK = :new.hk,
            NAM = :new.nam,
            MACT = :new.mact
        WHERE MAGV = :old.manv 
          AND MAHP = :old.mahp 
          AND HK = :old.hk 
          AND NAM = :old.nam 
          AND MACT = :old.mact
          AND MASV = R.MASV;
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('| ERROR!   | ' || SQLERRM);
END;
-----------
CREATE OR REPLACE TRIGGER ADMIN.UV_TRGDV_QUANLY_PHANCONG_trig
INSTEAD OF
    UPDATE OR DELETE OR INSERT ON ADMIN.UV_TRGDV_QUANLY_PHANCONG 
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
                WHERE MAHP = :new.mahp AND HK = :new.hk AND NAM = :new.nam AND MACT = :new.mact;
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
              AND MACT = :old.mact;
            
            DBMS_OUTPUT.PUT_LINE('DELETED');
        END;
    END IF;
END;
/
--------
CREATE OR REPLACE TRIGGER update_DIEMTK_trigger
BEFORE INSERT OR UPDATE ON ADMIN.DANGKY
FOR EACH ROW
DECLARE
    v_diemck NUMBER;
    v_diemth NUMBER;
    v_diemqt NUMBER;
BEGIN
    v_diemck := :NEW.DIEMCK;
    v_diemth := :NEW.DIEMTH;
    v_diemqt := :NEW.DIEMQT;
    
    IF v_diemck >= 0 AND v_diemck <= 10
       AND v_diemth >= 0 AND v_diemth <= 10
       AND v_diemqt >= 0 AND v_diemqt <= 10 THEN
       
        :NEW.DIEMTK := v_diemck * 0.5 + v_diemth * 0.2 + v_diemqt * 0.3;
        
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Diem khong hop le');
    END IF;
END;


--PROCEDURE
CREATE OR REPLACE PROCEDURE ADMIN.GET_KHMO_BYDAY(khmo_cursor OUT SYS_REFCURSOR)
AS
    month_tmp NUMBER;
    year_tmp NUMBER;
    hk_tmp VARCHAR2(10);
    nam_tmp  VARCHAR2(10);   
BEGIN
    -- Extract the current month and year
    SELECT EXTRACT(MONTH FROM CURRENT_DATE) INTO month_tmp FROM dual;
    SELECT EXTRACT(YEAR FROM CURRENT_DATE) INTO year_tmp FROM dual;
    
    IF month_tmp >= 1 and month_tmp < 5 THEN 
        hk_tmp := 'HK2';
        nam_tmp := year_tmp - 1 || '-' || year_tmp;
    ELSIF month_tmp >= 5 and month_tmp < 9 THEN
        hk_tmp := 'HK3';
        nam_tmp := year_tmp - 1 || '-' || year_tmp;
    ELSE 
        hk_tmp := 'HK1';
        nam_tmp := year_tmp || '-' || year_tmp + 1;
    END IF;
    OPEN khmo_cursor FOR
        SELECT khm.MAHP, hp.TENHP ,khm.HK, khm.NAM, khm.MACT 
        FROM ADMIN.KHMO khm JOIN ADMIN.HOCPHAN hp ON khm.MAHP = hp.MAHP
        WHERE HK = hk_tmp AND NAM = nam_tmp;
END;
/
GRANT EXECUTE ON ADMIN.GET_KHMO_BYDAY TO RL_SINHVIEN;

CREATE OR REPLACE PROCEDURE ADMIN.GET_KHMO_BYNAME(name in NVARCHAR2 ,khmo_cursor OUT SYS_REFCURSOR)
AS
    month_tmp NUMBER;
    year_tmp NUMBER;
    hk_tmp VARCHAR2(10);
    nam_tmp  VARCHAR2(10);   
BEGIN
    -- Extract the current month and year
    SELECT EXTRACT(MONTH FROM CURRENT_DATE) INTO month_tmp FROM dual;
    SELECT EXTRACT(YEAR FROM CURRENT_DATE) INTO year_tmp FROM dual;
    
    IF month_tmp >= 1 and month_tmp < 5 THEN 
        hk_tmp := 'HK2';
        nam_tmp := year_tmp - 1 || '-' || year_tmp;
    ELSIF month_tmp >= 5 and month_tmp < 9 THEN
        hk_tmp := 'HK3';
        nam_tmp := year_tmp - 1 || '-' || year_tmp;
    ELSE 
        hk_tmp := 'HK1';
        nam_tmp := year_tmp || '-' || year_tmp + 1;
    END IF;
    OPEN khmo_cursor FOR
        SELECT khm.MAHP, hp.TENHP ,khm.HK, khm.NAM, khm.MACT 
        FROM ADMIN.KHMO khm JOIN ADMIN.HOCPHAN hp ON khm.MAHP = hp.MAHP
        WHERE HK = hk_tmp AND NAM = nam_tmp AND (UPPER(khm.MAHP) = UPPER(name) OR UPPER(hp.TENHP) LIKE '%' || UPPER(name) || '%');
END;
/

GRANT EXECUTE ON ADMIN.GET_KHMO_BYNAME TO RL_SINHVIEN;

