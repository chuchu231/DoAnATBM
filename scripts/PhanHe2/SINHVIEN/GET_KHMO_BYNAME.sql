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
        SELECT pc.MAGV, pc.MAHP, hp.TENHP ,pc.HK, pc.NAM, pc.MACT 
        FROM ADMIN.PHANCONG pc JOIN ADMIN.HOCPHAN hp ON pc.MAHP = hp.MAHP
        WHERE HK = hk_tmp AND NAM = nam_tmp AND (UPPER(pc.MAHP) = UPPER(name) OR UPPER(hp.TENHP) LIKE '%' || UPPER(name) || '%');
END;
/

GRANT EXECUTE ON ADMIN.GET_KHMO_BYNAME TO SINHVIEN;