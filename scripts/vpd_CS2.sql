CREATE OR REPLACE FUNCTION PHANCONG_GV_policy (
    schema_name IN VARCHAR2,
    table_name IN VARCHAR2
) RETURN VARCHAR2 IS
BEGIN
    RETURN 'MAGV = SYS_CONTEXT(''USERENV'', ''SESSION_USER'')';
END PHANCONG_GV_policy;
/
BEGIN
    DBMS_RLS.ADD_POLICY(
        object_schema => 'CADMIN2',
        object_name => 'PHANCONG',
        policy_name => 'PC_PHANCONG_GV',
        function_schema => 'CADMIN2',
        policy_function => 'PHANCONG_GV_policy',
        statement_types => 'SELECT'
    );
END;
/
GRANT SELECT ON PHANCONG TO RL_GIANGVIEN; 

------
CREATE OR REPLACE FUNCTION GIANGVIEN_DANGKY_POLICY (
    schema_name IN VARCHAR2,
    table_name IN VARCHAR2
) RETURN VARCHAR2 IS
    v_condition VARCHAR2(200);

BEGIN
    v_condition := 'MAGV = SYS_CONTEXT(''USERENV'', ''SESSION_USER'')';
    RETURN v_condition;   
END GIANGVIEN_DANGKY_POLICY;
/
BEGIN
    DBMS_RLS.ADD_POLICY(
        object_schema => 'CADMIN2',
        object_name => 'DANGKY',
        policy_name => 'PC_GIANGVIEN_DANGKY',
        function_schema => 'CADMIN2',
        policy_function => 'GIANGVIEN_DANGKY_POLICY',
        statement_types => 'SELECT'
    );
END;
/
GRANT SELECT ON DANGKY TO RL_GIANGVIEN; 

-------

BEGIN
    DBMS_RLS.ADD_POLICY(
        object_schema => 'CADMIN2',
        object_name => 'DANGKY',
        policy_name => 'PC_UPDATE_GIANGVIEN_DANGKY',
        function_schema => 'CADMIN2',
        policy_function => 'GIANGVIEN_DANGKY_POLICY',
        statement_types => 'SELECT,UPDATE',
        UPDATE_CHECK => TRUE
    );
END;
/
GRANT UPDATE (DIEMTH,DIEMQT,DIEMCK,DIEMTK) ON DANGKY TO RL_GIANGVIEN;
/
CREATE OR REPLACE TRIGGER update_DIEMTK_trigger
BEFORE INSERT OR UPDATE ON CADMIN2.DANGKY
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