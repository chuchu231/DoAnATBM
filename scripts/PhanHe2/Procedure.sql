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
GRANT EXECUTE ON ADMIN.GET_KHMO_BYDAY TO RL_SINHVIEN, RL_GIAOVU;

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

GRANT EXECUTE ON ADMIN.GET_KHMO_BYNAME TO RL_SINHVIEN, RL_GIAOVU;

----
CREATE OR REPLACE PROCEDURE ADMIN.GET_PHANCONG_BYDAY(khmo_cursor OUT SYS_REFCURSOR)
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
        SELECT PC.MAGV, PC.MAHP, hp.TENHP ,PC.HK, PC.NAM, PC.MACT 
        FROM ADMIN.PHANCONG PC JOIN ADMIN.HOCPHAN hp ON PC.MAHP = hp.MAHP
        WHERE PC.HK = hk_tmp AND PC.NAM = nam_tmp;
END;
/
GRANT EXECUTE ON ADMIN.GET_PHANCONG_BYDAY TO RL_GIAOVU;

CREATE OR REPLACE PROCEDURE ADMIN.GET_PHANCONG_BYNAME(name in NVARCHAR2 ,khmo_cursor OUT SYS_REFCURSOR)
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
        SELECT PC.MAGV, PC.MAHP, hp.TENHP ,PC.HK, PC.NAM, PC.MACT 
        FROM ADMIN.PHANCONG PC JOIN ADMIN.HOCPHAN hp ON PC.MAHP = hp.MAHP
        WHERE PC.HK = hk_tmp AND PC.NAM = nam_tmp AND (UPPER(PC.MAHP) = UPPER(name) OR UPPER(hp.TENHP) LIKE '%' || UPPER(name) || '%');
END;
/

GRANT EXECUTE ON ADMIN.GET_PHANCONG_BYNAME TO RL_SINHVIEN, RL_GIAOVU;
--Proc insert/delete DANGKY cua sinh vien

CREATE OR REPLACE PROCEDURE ADMIN.InsertDangKy(
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
    p_MASV := v_user;
        EXECUTE IMMEDIATE 'GRANT SELECT ON ADMIN.PHANCONG TO ' || v_user;
    
    BEGIN
        SELECT MAGV INTO v_maGV
        FROM ADMIN.PHANCONG
        WHERE MAHP = p_maHP AND HK = p_hocKy AND NAM = p_namHoc AND MACT = p_maCT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Không tìm th?y h?c ph?n phù h?p');
    END;

    INSERT INTO ADMIN.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK)
    VALUES (p_MASV, v_maGV, p_maHP, p_hocKy, p_namHoc, p_maCT, NULL, NULL, NULL, NULL);
    
    EXECUTE IMMEDIATE 'REVOKE SELECT ON ADMIN.PHANCONG FROM ' || v_user;
    
EXCEPTION
    WHEN OTHERS THEN
        EXECUTE IMMEDIATE 'REVOKE SELECT ON ADMIN.PHANCONG FROM ' || v_user;
        RAISE;
END;
/
GRANT EXECUTE ON ADMIN.InsertDangKy TO RL_SINHVIEN;

CREATE OR REPLACE PROCEDURE ADMIN.DeleteDangKy(
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
        EXECUTE IMMEDIATE 'GRANT SELECT ON ADMIN.PHANCONG TO ' || v_user;
    
    BEGIN
        SELECT MAGV INTO v_maGV
        FROM ADMIN.PHANCONG
        WHERE MAHP = p_maHP AND HK = p_hocKy AND NAM = p_namHoc AND MACT = p_maCT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Không tìm th?y h?c ph?n phù h?p');
    END;

    DELETE FROM ADMIN.DANGKY WHERE MAGV = v_maGV AND MAHP = p_maHP AND HK = p_hocKy AND NAM = p_namHoc AND MACT = p_maCT;
    
    EXECUTE IMMEDIATE 'REVOKE SELECT ON ADMIN.PHANCONG FROM ' || v_user;
    
EXCEPTION
    WHEN OTHERS THEN
        EXECUTE IMMEDIATE 'REVOKE SELECT ON ADMIN.PHANCONG FROM ' || v_user;
        RAISE;
END;
/
GRANT EXECUTE ON ADMIN.DeleteDangKy TO RL_SINHVIEN;

CREATE OR REPLACE PROCEDURE ADMIN.GET_TRGDV_PHANCONG (
    p_result OUT SYS_REFCURSOR
) AS
BEGIN
    my_package.set_context;  
    OPEN p_result FOR
        SELECT gv.manv, pc.hk, pc.nam, pc.mahp, pc.mact
        FROM ADMIN.NHANSU GV 
        JOIN ADMIN.DONVI DV ON dv.madv = gv.madv 
        JOIN ADMIN.PHANCONG PC ON gv.manv = pc.magv
        WHERE DV.TRGDV = SYS_CONTEXT('USERENV', 'SESSION_USER');
    my_package.clear_context;
END;
/
GRANT EXECUTE ON ADMIN.GET_TRGDV_PHANCONG TO RL_TRUONGBM; 
