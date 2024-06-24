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
            raise_application_error(-20002, 'Error');
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
    IF month_tmp = 1 OR month_tmp = 6 OR month_tmp = 9 THEN
        IF day_tmp > 28 THEN
            RAISE_APPLICATION_ERROR(-20001, 'CANNOT WRITE AT THIS TIME');
        END IF;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'CANNOT WRITE AT THIS TIME');
    END IF;
END;
/
-----------
CREATE OR REPLACE TRIGGER admin.uv_quanly_phancong_trig
INSTEAD OF
    UPDATE OR DELETE OR INSERT ON ADMIN.UV_Quanly_Phancong 
FOR EACH ROW
DECLARE
    pc_magv  NHANSU.MANV%TYPE;
    pc_hk    PHANCONG.HK%TYPE;
    pc_nam   PHANCONG.NAM%TYPE;
    pc_mahp  PHANCONG.MAHP%TYPE;
    pc_mact  PHANCONG.MACT%TYPE;
    l_count  INTEGER;
    k_count INTEGER;
BEGIN
    SELECT COUNT(*) 
    INTO k_count
    FROM ADMIN.KHMO 
    WHERE MAHP = :NEW.MAHP AND HK = :NEW.HK AND NAM = :NEW.NAM AND MACT = :NEW.MACT;
    SELECT COUNT(*)
    INTO l_count
    FROM ADMIN.HOCPHAN
    WHERE MAHP = :NEW.MAHP AND MADV = 'VPK';
    IF UPDATING THEN
        IF k_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20002, 'H?c ph?n này không ???c m?');
        END IF;
        IF l_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Mã h?c ph?n không thu?c v?n phòng khoa');
        END IF;
        my_package.set_context;  
        BEGIN   
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
        END;
        my_package.clear_context;
    ELSIF INSERTING THEN
        IF k_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20002, 'H?c ph?n này không ???c m?');
        END IF;
        IF l_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Mã h?c ph?n không thu?c v?n phòng khoa');
        END IF;
        
        BEGIN
            -- Insert logic for PHANCONG
            INSERT INTO PHANCONG (MAGV, MAHP, HK, NAM, MACT)
            VALUES (:NEW.MAGV, :NEW.MAHP, :NEW.HK, :NEW.NAM, :NEW.MACT);
            
            DBMS_OUTPUT.PUT_LINE('INSERTED');
        END;
    ELSIF DELETING THEN
        my_package.set_context;  
        BEGIN
             -- Delete logic for PHANCONG
            DELETE FROM PHANCONG
            WHERE MAGV = :old.magv
              AND MAHP = :old.mahp 
              AND HK = :old.hk 
              AND NAM = :old.nam 
              AND MACT = :old.mact;
            
            DBMS_OUTPUT.PUT_LINE('DELETED');
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
        END;
        my_package.clear_context;
    END IF;   
EXCEPTION
    WHEN OTHERS THEN
       my_package.clear_context;
       IF SQLCODE = -20001 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Mã h?c ph?n không thu?c v?n phòng khoa');
        ELSIF SQLCODE = -20002 THEN
            RAISE_APPLICATION_ERROR(-20002, 'H?c ph?n này không ???c m?');
        ELSE
            RAISE;
        END IF;
END;
/

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
    l_count  INTEGER;
    k_count  INTEGER;
BEGIN    
    SELECT COUNT(*) 
    INTO k_count
    FROM ADMIN.KHMO 
    WHERE MAHP = :NEW.MAHP AND HK = :NEW.HK AND NAM = :NEW.NAM AND MACT = :NEW.MACT;
    SELECT COUNT(*)
    INTO l_count
    FROM ADMIN.HOCPHAN HP JOIN ADMIN.NHANSU NS ON HP.MADV = NS.MADV 
    WHERE MAHP = :NEW.MAHP;
    IF UPDATING THEN        
        IF k_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20002, 'H?c ph?n này không ???c m?');
        END IF;
        IF l_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Mã h?c ph?n không thu?c chuyên ngành');
        END IF;
        my_package.set_context;  
        BEGIN   
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
        END;
        my_package.clear_context;
    ELSIF INSERTING THEN

        IF l_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Mã h?c ph?n không thu?c chuyên ngành');
        END IF;
        IF k_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20002, 'H?c ph?n này không ???c m?');
        END IF;
        BEGIN
            -- Insert logic for PHANCONG
            INSERT INTO PHANCONG (MAGV, MAHP, HK, NAM, MACT)
            VALUES (:NEW.MAGV, :NEW.MAHP, :NEW.HK, :NEW.NAM, :NEW.MACT);
            
            DBMS_OUTPUT.PUT_LINE('INSERTED');
        END;
    ELSIF DELETING THEN
        my_package.set_context;  
        BEGIN
             -- Delete logic for PHANCONG
            DELETE FROM PHANCONG
            WHERE MAGV = :old.magv
              AND MAHP = :old.mahp 
              AND HK = :old.hk 
              AND NAM = :old.nam 
              AND MACT = :old.mact;
            
            DBMS_OUTPUT.PUT_LINE('DELETED');
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
        END;
        my_package.clear_context;
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        my_package.clear_context;
        IF SQLCODE = -20001 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Mã h?c ph?n không thu?c chuyên ngành');
        ELSIF SQLCODE = -20002 THEN
            RAISE_APPLICATION_ERROR(-20002, 'H?c ph?n này không ???c m?');
        ELSE
            RAISE;
        END IF;
END;
/
--------
CREATE OR REPLACE TRIGGER ADMIN.UPDATE_DIEM_TRIGGER
BEFORE UPDATE ON ADMIN.DANGKY
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
/

CREATE OR REPLACE TRIGGER ADMIN.KHMO_TRIG
AFTER UPDATE ON ADMIN.KHMO 
FOR EACH ROW
DECLARE
    mahp KHMO.MAHP%TYPE;
    hk KHMO.HK%TYPE;
    nam KHMO.NAM%TYPE;
    mact KHMO.MACT%TYPE;
BEGIN
        my_package.set_context;  
        BEGIN             
            -- Update logic for PHANCONG first to avoid integrity constraint violation
            FOR R IN (SELECT PC.MAGV FROM PHANCONG PC 
                      WHERE PC.MAHP = :old.mahp 
                        AND PC.HK = :old.hk 
                        AND PC.NAM = :old.nam 
                        AND PC.MACT = :old.mact)
            LOOP
                UPDATE PHANCONG
                SET MAHP = :new.mahp,
                    HK = :new.hk,
                    NAM = :new.nam,
                    MACT = :new.mact
                WHERE MAGV = R.magv 
                  AND MAHP = :old.mahp 
                  AND HK = :old.hk 
                  AND NAM = :old.nam 
                  AND MACT = :old.mact;
            END LOOP;
            
            --DBMS_OUTPUT.PUT_LINE('UPDATED');
            -- Update logic for DANGKY first to avoid integrity constraint violation
            FOR D IN (SELECT DK.MAGV, DK.MASV FROM DANGKY DK 
                        WHERE DK.MAHP = :old.mahp 
                        AND DK.HK = :old.hk 
                        AND DK.NAM = :old.nam 
                        AND DK.MACT = :old.mact)
            LOOP
                UPDATE DANGKY
                SET MAHP = :new.mahp,
                    HK = :new.hk,
                    NAM = :new.nam,
                    MACT = :new.mact
                WHERE MAGV = D.magv 
                  AND MAHP = :old.mahp 
                  AND HK = :old.hk 
                  AND NAM = :old.nam 
                  AND MACT = :old.mact
                  AND MASV = D.MASV;
            END LOOP;
        
            
        END;
    my_package.clear_context;
END;
/