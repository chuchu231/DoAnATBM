ALTER SESSION SET NLS_DATE_FORMAT = 'DD--MM--YYYY';
alter session set "_ORACLE_SCRIPT" = true;
-- Grant admin with pw admin123
--drop user admin cascade;
--create user admin identified by admin123;
--grant grant any role to admin;
--grant all privileges to admin;
--grant create session to admin;
--grant connect to admin;

--SELECT granted_role, grantee
--    FROM dba_role_privs
--    WHERE granted_role = upper_role_name
--    UNION
--    SELECT granted_role, grantee
--    FROM dba_role_privs
--    WHERE grantee IN (SELECT username FROM dba_users WHERE username IN (SELECT grantee FROM dba_role_privs WHERE granted_role = upper_role_name));
--
--SELECT * FROM dba_role_privs r join dba_roles d on r.granted_role = d.role where d.role = 'RLTEST'
--create user test2;
--grant RLTEST to TEST2
--create role RLTEST;
--grant select on DANGKY to RLTEST;
-- DANGKY
ALTER TABLE DANGKY DROP CONSTRAINT fk_dangky_sinhvien;
ALTER TABLE DANGKY DROP CONSTRAINT fk_dangky_phancong;

-- PHANCONG
ALTER TABLE PHANCONG DROP CONSTRAINT fk_phancong_nhansu;
ALTER TABLE PHANCONG DROP CONSTRAINT fk_phancong_KHMO;

-- NHANSU
ALTER TABLE NHANSU DROP CONSTRAINT fk_nhansu_donvi;

-- DONVI
ALTER TABLE NHANSU DROP CONSTRAINT fk_donvi_nhansu;

-- Xóa các ràng bu?c trên b?ng HOCPHAN
ALTER TABLE HOCPHAN DROP CONSTRAINT fk_hocphan_donvi;

-- Xóa các ràng bu?c trên b?ng KHMO
ALTER TABLE KHMO DROP CONSTRAINT fk_khmo_hocphan;

-- Xóa b?ng �?ANGKY
DROP TABLE DANGKY;

-- Xóa b?ng PHANCONG
DROP TABLE PHANCONG;

-- Xóa b?ng KHMO
DROP TABLE KHMO;

-- Xóa b?ng HOCPHAN
DROP TABLE HOCPHAN;

-- Xóa b?ng DONVI
DROP TABLE DONVI;

-- Xóa b?ng SINHVIEN
DROP TABLE SINHVIEN;

-- Xóa b?ng NHANSU
DROP TABLE NHANSU;



-- T?o b?ng NHANSU
CREATE TABLE NHANSU (
    MANV VARCHAR2(20) PRIMARY KEY,
    HOTEN NVARCHAR2(100),
    PHAI NVARCHAR2(10),
    NGSINH DATE,
    PHUCAP NUMBER,
    DT NVARCHAR2(20),
    VAITRO NVARCHAR2(50),
    MADV VARCHAR2(20),
    constraint check_phai_NS check (PHAI in (N'Nam', N'Nu'))
);


-- T?o b?ng SINHVIEN
CREATE TABLE SINHVIEN (
    MASV VARCHAR2(20) PRIMARY KEY,
    HOTEN NVARCHAR2(100),
    PHAI NVARCHAR2(10),
    NGSINH DATE,
    DCHI NVARCHAR2(200),
    DT NVARCHAR2(20),
    MACT NVARCHAR2(10),
    MANGANH NVARCHAR2(10),
    SOTCTL NUMBER,
    DTBTL FLOAT,
    constraint check_phai check (PHAI in (N'Nam', N'Nu')),
    constraint check_ctdt check (MACT in (N'CQ', N'CLC',N'VP'))
);

-- T?o b?ng DONVI
CREATE TABLE DONVI (
    MADV VARCHAR2(20) PRIMARY KEY,
    TENDV NVARCHAR2(100),
    TRGDV VARCHAR2(20)
);

-- T?o b?ng HOCPHAN
CREATE TABLE HOCPHAN (
    MAHP VARCHAR2(20) PRIMARY KEY,
    TENHP NVARCHAR2(100),
    SOTC NUMBER,
    STLT NUMBER,
    STTH NUMBER,
    SOSVTD NUMBER,
    MADV VARCHAR2(20)
);

 
-- T?o b?ng KHMO
CREATE TABLE KHMO (
    MAHP VARCHAR2(20),
    HK VARCHAR(10),
    NAM VARCHAR(10),
    MACT VARCHAR2(20),
    PRIMARY KEY (MAHP, HK, NAM, MACT),
    constraint check_ctdt_1 check (MACT in (N'CQ', N'CLC',N'VP'))
);

-- T?o b?ng PHANCONG
CREATE TABLE PHANCONG (
    MAGV VARCHAR2(20),
    MAHP VARCHAR2(20),
    HK VARCHAR(10),
    NAM VARCHAR(10),
    MACT VARCHAR2(20),
    PRIMARY KEY (MAGV, MAHP, HK, NAM, MACT)
);

-- T?o b?ng �?ANGKY
CREATE TABLE DANGKY (
    MASV VARCHAR2(20),
    MAGV VARCHAR2(20),
    MAHP VARCHAR2(20),
    HK VARCHAR(10),
    NAM VARCHAR(10),
    MACT VARCHAR2(20),
    DIEMTH FLOAT,
    DIEMQT FLOAT,
    DIEMCK FLOAT,
    DIEMTK FLOAT,
    PRIMARY KEY (MASV, MAGV, MAHP, HK, NAM, MACT)
);


-- NHANSU
ALTER TABLE NHANSU
ADD CONSTRAINT fk_nhansu_donvi
FOREIGN KEY (MADV)
REFERENCES DONVI(MADV);

-- DONVI
ALTER TABLE DONVI
ADD CONSTRAINT fk_donvi_nhansu
FOREIGN KEY (TRGDV)
REFERENCES NHANSU(MANV);

-- HOCPHAN
ALTER TABLE HOCPHAN
ADD CONSTRAINT fk_hocphan_donvi
FOREIGN KEY (MADV)
REFERENCES DONVI(MADV);

-- KHMO
ALTER TABLE KHMO
ADD CONSTRAINT fk_khmo_hocphan
FOREIGN KEY (MAHP)
REFERENCES HOCPHAN(MAHP);

-- PHANCONG
ALTER TABLE PHANCONG
ADD CONSTRAINT fk_phancong_nhansu
FOREIGN KEY (MAGV)
REFERENCES NHANSU(MANV);

ALTER TABLE PHANCONG
ADD CONSTRAINT fk_phancong_KHMO
FOREIGN KEY (MAHP, HK, NAM, MACT)
REFERENCES KHMO(MAHP, HK, NAM, MACT);

-- DANGKY
ALTER TABLE DANGKY
ADD CONSTRAINT fk_dangky_sinhvien
FOREIGN KEY (MASV)
REFERENCES SINHVIEN(MASV);

ALTER TABLE DANGKY
ADD CONSTRAINT fk_dangky_phancong
FOREIGN KEY (MAGV, MAHP, HK, NAM, MACT)
REFERENCES PHANCONG(MAGV, MAHP, HK, NAM, MACT);

-- Insert
insert into DONVI (MADV, TENDV, TRGDV) values (N'VPK', N'Van phong khoa', null);
insert into DONVI (MADV, TENDV, TRGDV) values (N'HTTT', N'Bo mon HTTT', null);
insert into DONVI (MADV, TENDV, TRGDV) values (N'CNPM', N'Bo mon CNPM', null);
insert into DONVI (MADV, TENDV, TRGDV) values (N'KHMT', N'Bo mon KHMT', null);
insert into DONVI (MADV, TENDV, TRGDV) values (N'CNTT', N'Bo mon CNTT', null);
insert into DONVI (MADV, TENDV, TRGDV) values (N'TGMT', N'Bo mon TGMT', null);
insert into DONVI (MADV, TENDV, TRGDV) values (N'MMT', N'Bo mon MMT va Vien thong', null);


insert into NHANSU values('GV001', 'Nguyen Van An', 'Nam', '05-01-1989', 1000, '0768897001',  'Giang vien', 'HTTT');
insert into NHANSU values('TK001', 'Nguyen Thi Bich', 'Nu', '06-07-1990', 1000, '0768897002',  'Nhan vien', 'VPK');
insert into NHANSU values('NV002', 'Nguyen Van Chung', 'Nam', '03-07-1987', 1000, '0768897003',  'Nhan vien', 'VPK');
insert into NHANSU values('GV002', 'Nguyen Van Chu', 'Nam', '11-04-1979', 1500, '0768897013',  'Giang vien', 'CNPM');
insert into NHANSU values('NV003', 'Nguyen Van Chun', 'Nam', '12-03-1993', 900, '0768897093',  'Nhan vien', 'VPK');
insert into NHANSU values('GVU001', 'Nguyen Van Ha', 'Nam', '02-04-1991', 1100, '0768897093',  'Giao vu','VPK');
insert into NHANSU values('GVU002', 'Nguyen Van Chun', 'Nam', '12-03-1994',980, '0768897093',  'Giao vu','VPK');
insert into NHANSU values('GV003', 'Tran Van Hai', 'Nam', '05-08-1990', 1400, '0492295395', 'Giang vien','KHMT');
insert into NHANSU values('NV004', 'Nguyen Thi Ha', 'Nu', '16-05-1991', 1100, '0768897093',  'Nhan vien', 'VPK');
insert into NHANSU values('TBMCNTT', 'Nguyen Van Luan', 'Nam', '15-01-1989', 1200, '0768897001',  'Giang vien', 'CNTT');
insert into NHANSU values('TBMTGMT', 'Nguyen Quang An', 'Nam', '05-02-1987', 900, '0768897002',  'Giang vien', 'TGMT');
insert into NHANSU values('TBMMMT', 'Nguyen Van Tri', 'Nam', '05-11-1981', 800, '0768897201',  'Giang vien', 'MMT');
insert into NHANSU values('TBMHTTT', 'Nguyen Le Ngoc', 'Nu', '05-12-1989', 1100, '0768897321',  'Giang vien', 'HTTT');
insert into NHANSU values('TBMCNPM', 'Phan Van Trieu', 'Nam', '25-11-1999', 2000, '0768827301',  'Giang vien', 'CNPM');
insert into NHANSU values('GV009', 'Hoang Ngoc Tu Trinh', 'Nu', '15-12-1992', 1200, '0768397021',  'Giang vien', 'KHMT');

UPDATE DONVI SET TRGDV = 'TBMHTTT' WHERE MADV = 'HTTT';
UPDATE DONVI SET TRGDV = 'TBMCNPM' WHERE MADV = 'CNPM';
UPDATE DONVI SET TRGDV = 'TBMKHMT' WHERE MADV = 'KHMT';
UPDATE DONVI SET TRGDV = 'TBMCNTT' WHERE MADV = 'CNTT';
UPDATE DONVI SET TRGDV = 'TBMTGMT' WHERE MADV = 'TGMT';
UPDATE DONVI SET TRGDV = 'TBMMMT' WHERE MADV = 'MMT';
UPDATE DONVI SET TRGDV = 'TK001' WHERE MADV = 'VPK';

--
--
insert into HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP100', N'Cơ s? trí tu? nhân t?o', 4, 3, 1, 75, 'TGMT');
insert into HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP085', N'H? qu?n tr? cơ s? d? li?u', 4, 2, 2, 90, 'CNTT');
insert into HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP120', N'Cơ s? d? li?u', 4, 3, 1, 80, 'KHMT');
insert into HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP075', N'Thi?t k? ph?n m?m', 4, 3, 1, 120, 'HTTT');
insert into HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP090', N'Quy ho?ch tuy?n tính', 3, 2, 1, 95, 'CNPM');
insert into HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP110', N'Toán r?i r?c', 4, 2, 2, 90, 'CNPM');
insert into HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP095', N'Kh?i nghi?p', 2, 2, 0, 100, 'VPK');
insert into HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP105', N'L?p tr?nh ?ng d?ng', 4, 3, 1, 100, 'HTTT');
insert into HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP080', N'M? hóa', 4, 3, 1, 110, 'CNPM');
insert into HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP115', N'An toàn và b?o m?t d? li?u', 4, 3, 1, 90, 'TGMT');
insert into HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP295', N'Kh?i nghi?p', 2, 2, 0, 100, 'VPK');


insert into KHMO (MAHP, HK, NAM, MACT) values ('HP100', 'HK1', '2023-2024', 'CLC');
insert into KHMO (MAHP, HK, NAM, MACT) values ('HP085', 'HK2', '2023-2024', 'CLC');
insert into KHMO (MAHP, HK, NAM, MACT) values ('HP120', 'HK3', '2023-2024', 'CQ');
insert into KHMO (MAHP, HK, NAM, MACT) values ('HP075', 'HK1', '2023-2024', 'CLC');
insert into KHMO (MAHP, HK, NAM, MACT) values ('HP090', 'HK2', '2023-2024', 'CLC');
insert into KHMO (MAHP, HK, NAM, MACT) values ('HP110', 'HK3', '2023-2024', 'VP');
insert into KHMO (MAHP, HK, NAM, MACT) values ('HP095', 'HK1', '2023-2024', 'VP');
insert into KHMO (MAHP, HK, NAM, MACT) values ('HP105', 'HK2', '2023-2024', 'CQ');
insert into KHMO (MAHP, HK, NAM, MACT) values ('HP080', 'HK3', '2023-2024', 'CQ');
insert into KHMO (MAHP, HK, NAM, MACT) values ('HP115', 'HK1', '2023-2024', 'VP');
--
insert into PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV001', 'HP100', 'HK1', '2023-2024', 'CLC');
insert into PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV008', 'HP085', 'HK2', '2023-2024', 'CLC');
insert into PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV003', 'HP120', 'HK3', '2023-2024', 'CQ');
insert into PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV001', 'HP075', 'HK1', '2023-2024', 'CLC');
insert into PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV002', 'HP090', 'HK2', '2023-2024', 'CLC');
insert into PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV003', 'HP110', 'HK3', '2023-2024', 'VP');
insert into PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV001', 'HP095', 'HK1', '2023-2024', 'VP');
insert into PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV001', 'HP105', 'HK2', '2023-2024', 'CQ');
insert into PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV003', 'HP080', 'HK3', '2023-2024', 'CQ');
insert into PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV002', 'HP115', 'HK1', '2023-2024', 'VP');
SELECT * FROM PHANCONG;
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00001', 'Ichabod Radley', 'Nam', '08-07-2006', '1293 Grasskamp Center', '814 974 8950', 'CLC', 'KHDL', 131, 6.3);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00002', 'Lonny Willshaw', 'Nu', '04-01-2005', '54 Elka Parkway', '443 809 3568', 'CLC', 'HTTT', 110, 8.2);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00003', 'Mickey Ritmeyer', 'Nu', '23-10-2009', '69 Evergreen Road', '532 662 5974', 'CQ', 'CNPM', 130, 6.3);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00004', 'Currie Dallewater', 'Nam', '21-03-2016', '447 Barnett Terrace', '176 695 2016', 'VP', 'CNTT', 107, 8.1);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00005', 'Kissee Lambie', 'Nu', '08-08-2018', '435 Almo Hill', '649 606 6462', 'CLC', 'HTTT', 133, 6.7);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00006', 'Egbert Portsmouth', 'Nam', '07-12-2016', '31 Sunbrook Way', '322 811 8260', 'CQ', 'HTTT', 100, 6.8);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00007', 'Abby Yeowell', 'Nam', '14-12-2014', '6505 Lunder Place', '337 731 5474', 'VP', 'HTTT', 110, 8.4);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00008', 'Francoise Ryhorovich', 'Nam', '10-12-2001', '3 Hansons Drive', '349 646 0677', 'VP', 'HTTT', 134, 8.0);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00009', 'Germain Pablos', 'Nu', '17-04-2008', '0 Mariners Cove Trail', '876 927 7315', 'VP', 'KHDL', 136, 6.7);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00010', 'Emalia Bygott', 'Nam', '03-11-2021', '6 Meadow Ridge Point', '267 473 9564', 'VP', 'KHMT', 138, 8.3);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00011', 'Gill Mapis', 'Nam', '01-01-2003', '2342 Waxwing Drive', '145 824 8838', 'VP', 'CNTT', 101, 8.5);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00012', 'Shirley Mathivon', 'Nam', '25-03-2023', '856 Declaration Circle', '130 751 0705', 'VP', 'CNPM', 123, 6.4);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00013', 'Corilla Chavrin', 'Nu', '28-02-2007', '66 Hoffman Avenue', '992 695 8089', 'CLC', 'CNPM', 106, 8.2);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00014', 'Lenard Klagge', 'Nam', '04-09-2012', '3 Rusk Plaza', '807 681 1519', 'CLC', 'CNTT', 99, 6.1);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00015', 'Rodd Dumelow', 'Nam', '12-05-2000', '49 Carpenter Drive', '231 920 3963', 'CLC', 'KHMT', 122, 6.9);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00016', 'Taber Abrashkin', 'Nu', '18-08-2006', '8163 Superior Lane', '196 548 8487', 'VP', 'CNTT', 121, 6.3);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00017', 'Malvina Broadhurst', 'Nu', '23-03-2019', '28 Tony Hill', '903 553 0557', 'CLC', 'CNTT', 132, 8.0);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00018', 'Ned Okker', 'Nu', '08-03-2004', '798 Hoard Junction', '112 488 6750', 'CLC', 'KHDL', 116, 7.8);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00019', 'Moria Roskam', 'Nu', '02-05-2017', '8 Sachtjen Center', '270 149 8304', 'CLC', 'HTTT', 132, 7.3);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00020', 'Damita Auty', 'Nu', '02-12-2010', '64 Browning Way', '125 780 8005', 'CQ', 'HTTT', 116, 7.8);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00021', 'Waylin Swalwell', 'Nu', '28-12-2023', '289 Dottie Plaza', '622 695 2453', 'VP', 'HTTT', 103, 6.3);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00022', 'Ainslee Keeney', 'Nu', '29-05-2012', '0 6th Hill', '385 672 9858', 'CQ', 'HTTT', 111, 7.4);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00023', 'Shane Raspin', 'Nam', '04-05-2012', '736 Jenna Court', '114 172 7317', 'VP', 'CNPM', 121, 8.0);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00024', 'Nicola Putten', 'Nam', '01-02-2000', '09537 Aberg Avenue', '979 318 2185', 'CQ', 'CNTT', 137, 7.0);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00025', 'Koressa Easey', 'Nu', '16-02-2022', '71756 Bluestem Place', '920 865 3359', 'CQ', 'HTTT', 123, 8.4);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00026', 'Dolli Milsted', 'Nam', '24-07-2006', '81 Butterfield Place', '685 912 6163', 'CQ', 'KHDL', 138, 8.8);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00027', 'Phineas Izkovitz', 'Nam', '29-05-2018', '22 Johnson Junction', '786 643 3231', 'VP', 'CNTT', 124, 6.8);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00028', 'Artemas Cookes', 'Nu', '10-08-2021', '8 Lake View Lane', '972 215 5235', 'VP', 'CNTT', 131, 7.6);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00029', 'Larissa Reddel', 'Nu', '22-02-2008', '356 Elmside Pass', '132 386 2436', 'CQ', 'KHMT', 118, 8.0);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00030', 'Yank Rolfe', 'Nam', '20-10-2010', '2 Walton Point', '707 448 4269', 'CLC', 'KHDL', 119, 6.9);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00031', 'Karyn Impleton', 'Nam', '15-11-2016', '0 Ryan Circle', '861 661 3602', 'VP', 'CNPM', 118, 6.1);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00032', 'Cherida Polgreen', 'Nu', '23-05-2008', '6 Farmco Center', '628 585 9486', 'CQ', 'KHDL', 108, 7.3);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00033', 'Ruddy Gagin', 'Nam', '26-09-2011', '18889 Ridge Oak Pass', '111 469 6933', 'VP', 'KHDL', 101, 6.1);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00034', 'Winslow Lashmore', 'Nu', '08-07-2018', '47474 Park Meadow Drive', '643 113 7496', 'CQ', 'HTTT', 106, 6.0);
insert into SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV00035', 'Joan Goncalo', 'Nu', '22-12-2011', '580 Melby Alley', '929 825 0255', 'CLC', 'CNPM', 99, 7.6);


insert into DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV00001', 'GV001', 'HP100', 'HK1', '2023-2024', 'CLC', 8.1, 8.4, 6.8, 5.7);
insert into DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV00002', 'GV008', 'HP085', 'HK2', '2023-2024', 'CLC', 9.0, 8.3, 7.0, 6.8);
insert into DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV00003', 'GV003', 'HP120', 'HK3', '2023-2024', 'CQ', 9.7, 7.1, 7.6, 8.4);
insert into DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV00004', 'GV006', 'HP075', 'HK1', '2023-2024', 'CLC', 6.2, 7.7, 6.4, 8.3);
insert into DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV00005', 'GV008', 'HP090', 'HK2', '2023-2024', 'CLC', 6.0, 8.3, 6.5, 5.3);
insert into DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV00006', 'GV003', 'HP110', 'HK3', '2023-2024', 'VP', 9.3, 5.5, 8.3, 6.8);
insert into DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV00007', 'GV001', 'HP095', 'HK1', '2023-2024', 'VP', 7.4, 6.2, 10.0, 9.3);
insert into DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV00008', 'GV001', 'HP105', 'HK2', '2023-2024', 'CQ', 6.1, 5.8, 8.9, 9.5);
insert into DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV00009', 'GV004', 'HP080', 'HK3', '2023-2024', 'CQ', 9.7, 8.4, 9.4, 5.2);
insert into DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV00010', 'GV002', 'HP115', 'HK1', '2023-2024', 'VP', 8.2, 7.9, 6.2, 5.3);
