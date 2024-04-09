ALTER SESSION SET NLS_DATE_FORMAT = 'DD--MM--YYYY';
alter session set "_ORACLE_SCRIPT" = true;
-- Grant admin with pw admin123
drop user admin cascade;
create user admin identified by admin123;
grant sysdba to admin ;
grant grant any role to admin;
grant create session to admin;
grant unlimited tablespace to admin;

-- DANGKY
ALTER TABLE admin.DANGKY DROP CONSTRAINT fk_dangky_sinhvien;
ALTER TABLE admin.DANGKY DROP CONSTRAINT fk_dangky_phancong;

-- PHANCONG
ALTER TABLE admin.PHANCONG DROP CONSTRAINT fk_phancong_nhansu;
ALTER TABLE admin.PHANCONG DROP CONSTRAINT fk_phancong_hocphan;

-- NHANSU
ALTER TABLE admin.NHANSU DROP CONSTRAINT fk_nhansu_donvi;

-- DONVI
ALTER TABLE admin.NHANSU DROP CONSTRAINT fk_donvi_nhansu;

-- Xóa các ràng bu?c trên b?ng HOCPHAN
ALTER TABLE admin.HOCPHAN DROP CONSTRAINT fk_hocphan_donvi;

-- Xóa các ràng bu?c trên b?ng KHMO
ALTER TABLE admin.KHMO DROP CONSTRAINT fk_khmo_hocphan;

-- Xóa b?ng ÐANGKY
DROP TABLE admin.DANGKY;

-- Xóa b?ng PHANCONG
DROP TABLE admin.PHANCONG;

-- Xóa b?ng KHMO
DROP TABLE admin.KHMO;

-- Xóa b?ng HOCPHAN
DROP TABLE admin.HOCPHAN;

-- Xóa b?ng DONVI
DROP TABLE admin.DONVI;

-- Xóa b?ng SINHVIEN
DROP TABLE admin.SINHVIEN;

-- Xóa b?ng NHANSU
DROP TABLE admin.NHANSU;



-- T?o b?ng NHANSU
CREATE TABLE admin.NHANSU (
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
CREATE TABLE admin.SINHVIEN (
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
CREATE TABLE admin.DONVI (
    MADV VARCHAR2(20) PRIMARY KEY,
    TENDV NVARCHAR2(100),
    TRGDV VARCHAR2(20)
);

-- T?o b?ng HOCPHAN
CREATE TABLE admin.HOCPHAN (
    MAHP VARCHAR2(20) PRIMARY KEY,
    TENHP NVARCHAR2(100),
    SOTC NUMBER,
    STLT NUMBER,
    STTH NUMBER,
    SOSVTD NUMBER,
    MADV VARCHAR2(20)
);

 
-- T?o b?ng KHMO
CREATE TABLE admin.KHMO (
    MAHP VARCHAR2(20),
    HK VARCHAR(10),
    NAM VARCHAR(10),
    MACT VARCHAR2(20),
    PRIMARY KEY (MAHP, HK, NAM, MACT),
    constraint check_ctdt_1 check (MACT in (N'CQ', N'CLC',N'VP'))
);

-- T?o b?ng PHANCONG
CREATE TABLE admin.PHANCONG (
    MAGV VARCHAR2(20),
    MAHP VARCHAR2(20),
    HK VARCHAR(10),
    NAM VARCHAR(10),
    MACT VARCHAR2(20),
    PRIMARY KEY (MAGV, MAHP, HK, NAM, MACT)
);

-- T?o b?ng ÐANGKY
CREATE TABLE admin.DANGKY (
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
ALTER TABLE admin.NHANSU
ADD CONSTRAINT fk_nhansu_donvi
FOREIGN KEY (MADV)
REFERENCES admin.DONVI(MADV);
select * from admin.KHMO
-- DONVI
ALTER TABLE admin.DONVI
ADD CONSTRAINT fk_donvi_nhansu
FOREIGN KEY (TRGDV)
REFERENCES admin.NHANSU(MANV);

-- HOCPHAN
ALTER TABLE admin.HOCPHAN
ADD CONSTRAINT fk_hocphan_donvi
FOREIGN KEY (MADV)
REFERENCES admin.DONVI(MADV);

-- KHMO
ALTER TABLE admin.KHMO
ADD CONSTRAINT fk_khmo_hocphan
FOREIGN KEY (MAHP)
REFERENCES admin.HOCPHAN(MAHP);

-- PHANCONG
ALTER TABLE admin.PHANCONG
ADD CONSTRAINT fk_phancong_nhansu
FOREIGN KEY (MAGV)
REFERENCES admin.NHANSU(MANV);

ALTER TABLE admin.PHANCONG
ADD CONSTRAINT fk_phancong_hocphan
FOREIGN KEY (MAHP, HK, NAM, MACT)
REFERENCES admin.KHMO(MAHP, HK, NAM, MACT);

-- DANGKY
ALTER TABLE admin.DANGKY
ADD CONSTRAINT fk_dangky_sinhvien
FOREIGN KEY (MASV)
REFERENCES admin.SINHVIEN(MASV);

ALTER TABLE admin.DANGKY
ADD CONSTRAINT fk_dangky_phancong
FOREIGN KEY (MAGV, MAHP, HK, NAM, MACT)
REFERENCES admin.PHANCONG(MAGV, MAHP, HK, NAM, MACT);

-- Insert
insert into admin.DONVI (MADV, TENDV, TRGDV) values (N'VPK', N'V?n phòng khoa', null);
insert into admin.DONVI (MADV, TENDV, TRGDV) values (N'HTTT', N'B? môn HTTT', null);
insert into admin.DONVI (MADV, TENDV, TRGDV) values (N'CNPM', N'B? môn CNPM', null);
insert into admin.DONVI (MADV, TENDV, TRGDV) values (N'KHMT', N'B? môn KHMT', null);
insert into admin.DONVI (MADV, TENDV, TRGDV) values (N'CNTT', N'B? môn CNTT', null);
insert into admin.DONVI (MADV, TENDV, TRGDV) values (N'TGMT', N'B? môn TGMT', null);
insert into admin.DONVI (MADV, TENDV, TRGDV) values (N'MMT', N'B? môn MMT và Vi?n thông', null);
insert into admin.DONVI (MADV, TENDV, TRGDV) values (N'GVK', N'Giáo v? khoa', null);

insert into admin.NHANSU values('GV001', 'Nguyen Van An', 'Nam', '05-01-1989', 1000, '0768897001',  'Giang vien', 'HTTT');
insert into admin.NHANSU values('NV001', 'Nguyen Thi Bich', 'Nu', '06-07-1990', 1000, '0768897002',  'Nhan vien', 'VPK');
insert into admin.NHANSU values('NV002', 'Nguyen Van Chung', 'Nam', '03-07-1987', 1000, '0768897003',  'Nhan vien', 'VPK');
insert into admin.NHANSU values('GV002', 'Nguyen Van Chu', 'Nam', '11-04-1979', 1500, '0768897013',  'Giang vien', 'CNPM');
insert into admin.NHANSU values('NV003', 'Nguyen Van Chun', 'Nam', '12-03-1993', 900, '0768897093',  'Nhan vien', 'VPK');
insert into admin.NHANSU values('GVU001', 'Nguyen Van Ha', 'Nam', '02-04-1991', 1100, '0768897093',  'Giao vu','GVK');
insert into admin.NHANSU values('GVU002', 'Nguyen Van Chun', 'Nam', '12-03-1994',980, '0768897093',  'Giao vu','GVK');
insert into admin.NHANSU values('GV003', 'Tran Van Hai', 'Nam', '05-08-1990', 1400, '0492295395', 'Giang vien','KHMT');
insert into admin.NHANSU values('TL001', 'Nguyen Thi Ha', 'Nu', '16-05-1991', 1100, '0768897093',  'Tro ly', 'VPK');
insert into admin.NHANSU values('GV004', 'Nguyen Van Luan', 'Nam', '15-01-1989', 1200, '0768897001',  'Giang vien', 'CNTT');
insert into admin.NHANSU values('GV005', 'Nguyen Quang An', 'Nam', '05-02-1987', 900, '0768897002',  'Giang vien', 'TGMT');
insert into admin.NHANSU values('GV006', 'Nguyen Van Tri', 'Nam', '05-11-1981', 800, '0768897201',  'Giang vien', 'MMT');
insert into admin.NHANSU values('GV007', 'Nguyen Le Ngoc', 'Nu', '05-12-1989', 1100, '0768897321',  'Giang vien', 'HTTT');
insert into admin.NHANSU values('GV008', 'Phan Van Trieu', 'Nam', '25-11-1999', 2000, '0768827301',  'Giang vien', 'CNPM');
insert into admin.NHANSU values('GV009', 'Hoang Ngoc Tu Trinh', 'Nu', '15-12-1992', 1200, '0768397021',  'Giang vien', 'KHMT');

UPDATE admin.DONVI SET TRGDV = 'GV007' WHERE MADV = 'HTTT';
UPDATE admin.DONVI SET TRGDV = 'GV008' WHERE MADV = 'CNPM';
UPDATE admin.DONVI SET TRGDV = 'GV003' WHERE MADV = 'KHMT';
UPDATE admin.DONVI SET TRGDV = 'GV004' WHERE MADV = 'CNTT';
UPDATE admin.DONVI SET TRGDV = 'GV005' WHERE MADV = 'TGMT';
UPDATE admin.DONVI SET TRGDV = 'GV006' WHERE MADV = 'MMT';
UPDATE admin.DONVI SET TRGDV = 'NV001' WHERE MADV = 'VPK';
UPDATE admin.DONVI SET TRGDV = 'GVU001' WHERE MADV = 'GVK';


insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP100', N'C? s? trí tu? nhân t?o', 4, 3, 1, 75, 'TGMT');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP085', N'H? qu?n tr? c? s? d? li?u', 4, 2, 2, 90, 'CNTT');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP120', N'C? s? d? li?u', 4, 3, 1, 80, 'KHMT');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP075', N'Thi?t k? ph?n m?m', 4, 3, 1, 120, 'HTTT');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP090', N'Quy ho?ch tuy?n tính', 3, 2, 1, 95, 'CNPM');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP110', N'Toán r?i r?c', 4, 2, 2, 90, 'CNPM');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP095', N'Kh?i nghi?p', 2, 2, 0, 100, 'VPK');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP105', N'L?p trình ?ng d?ng', 4, 3, 1, 100, 'HTTT');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP080', N'Mã hóa', 4, 3, 1, 110, 'CNPM');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP115', N'An toàn và b?o m?t d? li?uu', 4, 3, 1, 90, 'TGMT');


insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP100', 'HK1', '2023-2024', 'CLC');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP085', 'HK2', '2023-2024', 'CLC');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP120', 'HK3', '2023-2024', 'CQ');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP075', 'HK1', '2023-2024', 'CLC');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP090', 'HK2', '2023-2024', 'CLC');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP110', 'HK3', '2023-2024', 'VP');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP095', 'HK1', '2023-2024', 'VP');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP105', 'HK2', '2023-2024', 'CQ');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP080', 'HK3', '2023-2024', 'CQ');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP115', 'HK1', '2023-2024', 'VP');

insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV001', 'HP100', 'HK1', '2023-2024', 'CLC');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV008', 'HP085', 'HK2', '2023-2024', 'CLC');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV003', 'HP120', 'HK3', '2023-2024', 'CQ');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV006', 'HP075', 'HK1', '2023-2024', 'CLC');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV008', 'HP090', 'HK2', '2023-2024', 'CLC');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV003', 'HP110', 'HK3', '2023-2024', 'VP');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV001', 'HP095', 'HK1', '2023-2024', 'VP');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV001', 'HP105', 'HK2', '2023-2024', 'CQ');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV004', 'HP080', 'HK3', '2023-2024', 'CQ');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('GV002', 'HP115', 'HK1', '2023-2024', 'VP');

insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (1, 'Ichabod Radley', 'Nam', '08-07-2006', '1293 Grasskamp Center', '814 974 8950', 'CLC', 'KHDL', 131, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (2, 'Lonny Willshaw', 'Nu', '04-01-2005', '54 Elka Parkway', '443 809 3568', 'CLC', 'HTTT', 110, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (3, 'Mickey Ritmeyer', 'Nu', '23-10-2009', '69 Evergreen Road', '532 662 5974', 'CQ', 'CNPM', 130, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (4, 'Currie Dallewater', 'Nam', '21-03-2016', '447 Barnett Terrace', '176 695 2016', 'VP', 'CNTT', 107, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (5, 'Kissee Lambie', 'Nu', '08-08-2018', '435 Almo Hill', '649 606 6462', 'CLC', 'HTTT', 133, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (6, 'Egbert Portsmouth', 'Nam', '07-12-2016', '31 Sunbrook Way', '322 811 8260', 'CQ', 'HTTT', 100, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (7, 'Abby Yeowell', 'Nam', '14-12-2014', '6505 Lunder Place', '337 731 5474', 'VP', 'HTTT', 110, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (8, 'Francoise Ryhorovich', 'Nam', '10-12-2001', '3 Hansons Drive', '349 646 0677', 'VP', 'HTTT', 134, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (9, 'Germain Pablos', 'Nu', '17-04-2008', '0 Mariners Cove Trail', '876 927 7315', 'VP', 'KHDL', 136, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (10, 'Emalia Bygott', 'Nam', '03-11-2021', '6 Meadow Ridge Point', '267 473 9564', 'VP', 'KHMT', 138, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (11, 'Gill Mapis', 'Nam', '01-01-2003', '2342 Waxwing Drive', '145 824 8838', 'VP', 'CNTT', 101, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (12, 'Shirley Mathivon', 'Nam', '25-03-2023', '856 Declaration Circle', '130 751 0705', 'VP', 'CNPM', 123, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (13, 'Corilla Chavrin', 'Nu', '28-02-2007', '66 Hoffman Avenue', '992 695 8089', 'CLC', 'CNPM', 106, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (14, 'Lenard Klagge', 'Nam', '04-09-2012', '3 Rusk Plaza', '807 681 1519', 'CLC', 'CNTT', 99, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (15, 'Rodd Dumelow', 'Nam', '12-05-2000', '49 Carpenter Drive', '231 920 3963', 'CLC', 'KHMT', 122, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (16, 'Taber Abrashkin', 'Nu', '18-08-2006', '8163 Superior Lane', '196 548 8487', 'VP', 'CNTT', 121, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (17, 'Malvina Broadhurst', 'Nu', '23-03-2019', '28 Tony Hill', '903 553 0557', 'CLC', 'CNTT', 132, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (18, 'Ned Okker', 'Nu', '08-03-2004', '798 Hoard Junction', '112 488 6750', 'CLC', 'KHDL', 116, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (19, 'Moria Roskam', 'Nu', '02-05-2017', '8 Sachtjen Center', '270 149 8304', 'CLC', 'HTTT', 132, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (20, 'Damita Auty', 'Nu', '02-12-2010', '64 Browning Way', '125 780 8005', 'CQ', 'HTTT', 116, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (21, 'Waylin Swalwell', 'Nu', '28-12-2023', '289 Dottie Plaza', '622 695 2453', 'VP', 'HTTT', 103, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (22, 'Ainslee Keeney', 'Nu', '29-05-2012', '0 6th Hill', '385 672 9858', 'CQ', 'HTTT', 111, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (23, 'Shane Raspin', 'Nam', '04-05-2012', '736 Jenna Court', '114 172 7317', 'VP', 'CNPM', 121, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (24, 'Nicola Putten', 'Nam', '01-02-2000', '09537 Aberg Avenue', '979 318 2185', 'CQ', 'CNTT', 137, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (25, 'Koressa Easey', 'Nu', '16-02-2022', '71756 Bluestem Place', '920 865 3359', 'CQ', 'HTTT', 123, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (26, 'Dolli Milsted', 'Nam', '24-07-2006', '81 Butterfield Place', '685 912 6163', 'CQ', 'KHDL', 138, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (27, 'Phineas Izkovitz', 'Nam', '29-05-2018', '22 Johnson Junction', '786 643 3231', 'VP', 'CNTT', 124, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (28, 'Artemas Cookes', 'Nu', '10-08-2021', '8 Lake View Lane', '972 215 5235', 'VP', 'CNTT', 131, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (29, 'Larissa Reddel', 'Nu', '22-02-2008', '356 Elmside Pass', '132 386 2436', 'CQ', 'KHMT', 118, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (30, 'Yank Rolfe', 'Nam', '20-10-2010', '2 Walton Point', '707 448 4269', 'CLC', 'KHDL', 119, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (31, 'Karyn Impleton', 'Nam', '15-11-2016', '0 Ryan Circle', '861 661 3602', 'VP', 'CNPM', 118, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (32, 'Cherida Polgreen', 'Nu', '23-05-2008', '6 Farmco Center', '628 585 9486', 'CQ', 'KHDL', 108, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (33, 'Ruddy Gagin', 'Nam', '26-09-2011', '18889 Ridge Oak Pass', '111 469 6933', 'VP', 'KHDL', 101, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (34, 'Winslow Lashmore', 'Nu', '08-07-2018', '47474 Park Meadow Drive', '643 113 7496', 'CQ', 'HTTT', 106, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (35, 'Joan Goncalo', 'Nu', '22-12-2011', '580 Melby Alley', '929 825 0255', 'CLC', 'CNPM', 99, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (36, 'Thea Farrance', 'Nam', '21-05-2002', '3118 Fairview Way', '591 570 6620', 'VP', 'KHMT', 109, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (37, 'Terrill McIlraith', 'Nu', '24-05-2020', '117 Victoria Junction', '606 220 4990', 'CLC', 'CNPM', 107, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (38, 'Cash Brecknock', 'Nu', '03-11-2006', '3 Donald Circle', '350 953 9158', 'CQ', 'KHMT', 110, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (39, 'Cindi Duding', 'Nu', '16-05-2007', '336 Chinook Way', '925 155 0247', 'CLC', 'CNPM', 116, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (40, 'Bernadina Felce', 'Nam', '12-03-2015', '1 Hoepker Drive', '339 862 1840', 'VP', 'KHMT', 136, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (41, 'Terry Manuello', 'Nu', '08-05-2006', '5627 Parkside Point', '648 768 7170', 'CQ', 'KHDL', 100, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (42, 'Vera Darnbrough', 'Nu', '21-11-2006', '4 Sycamore Way', '578 973 1545', 'CLC', 'CNTT', 100, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (43, 'Drucie Imos', 'Nu', '06-08-2010', '3 Lighthouse Bay Alley', '746 517 8346', 'VP', 'KHMT', 124, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (44, 'Dexter McCrea', 'Nam', '14-10-2008', '66775 3rd Circle', '740 419 8530', 'CLC', 'KHMT', 101, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (45, 'Maurise Von Der Empten', 'Nu', '16-02-2003', '15349 Mifflin Place', '765 860 7798', 'CLC', 'KHDL', 105, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (46, 'Hillard Hatliffe', 'Nu', '11-09-2021', '5 Truax Avenue', '871 160 3335', 'CQ', 'CNTT', 115, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (47, 'Maryjane Pfleger', 'Nu', '22-09-2021', '21635 Logan Pass', '111 674 4615', 'VP', 'CNTT', 130, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (48, 'Gisella Snartt', 'Nam', '13-02-2008', '300 Red Cloud Trail', '619 970 4238', 'CLC', 'CNTT', 113, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (49, 'Mike Shelp', 'Nam', '17-02-2006', '2444 Killdeer Terrace', '940 886 5337', 'CQ', 'KHMT', 124, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (50, 'Pearl Diehn', 'Nam', '05-05-2009', '261 Cardinal Parkway', '652 733 1086', 'CQ', 'KHDL', 103, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (51, 'Sashenka Mil', 'Nu', '12-04-2022', '9 Division Trail', '244 998 1667', 'VP', 'KHMT', 99, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (52, 'Clara Garmons', 'Nam', '20-03-2021', '27177 Crowley Alley', '764 535 7115', 'CQ', 'HTTT', 126, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (53, 'Lorie Stuer', 'Nam', '06-01-2024', '0228 Kedzie Street', '768 680 0578', 'CQ', 'HTTT', 102, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (54, 'Katina Balfre', 'Nam', '13-09-2023', '7510 Monument Center', '149 604 4976', 'CLC', 'CNTT', 133, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (55, 'Silvio Van der Spohr', 'Nam', '11-02-2016', '718 Meadow Valley Road', '782 105 8393', 'VP', 'CNPM', 124, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (56, 'Anallise Sammons', 'Nu', '29-05-2002', '47 Havey Way', '816 556 0181', 'CQ', 'CNPM', 115, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (57, 'Zelda Polglaze', 'Nu', '13-04-2001', '5 Lake View Parkway', '630 487 0850', 'CLC', 'CNPM', 110, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (58, 'Violante Meere', 'Nu', '19-04-2011', '93 Magdeline Hill', '573 980 3917', 'VP', 'KHDL', 108, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (59, 'Fanchon Dykins', 'Nu', '28-08-2009', '667 Holy Cross Way', '117 243 9555', 'CLC', 'CNTT', 136, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (60, 'Schuyler Fleming', 'Nam', '20-07-2007', '1 Onsgard Terrace', '487 875 9869', 'CLC', 'CNTT', 113, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (61, 'Bradan Godbehere', 'Nu', '26-05-2017', '49009 Huxley Street', '264 395 8562', 'VP', 'HTTT', 129, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (62, 'Penn Chene', 'Nu', '12-04-2004', '46 Maple Wood Pass', '665 329 9637', 'CLC', 'KHMT', 103, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (63, 'Rivalee Vanyushkin', 'Nu', '02-02-2002', '2 Grayhawk Lane', '751 380 3544', 'CLC', 'KHDL', 102, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (64, 'Daniele Haugg', 'Nu', '25-05-2001', '188 Lake View Road', '854 910 3534', 'CQ', 'CNTT', 127, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (65, 'Jaimie Slyford', 'Nu', '08-10-2011', '62 Lake View Road', '982 650 5207', 'CQ', 'KHDL', 111, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (66, 'Cornell Medland', 'Nam', '04-03-2008', '95705 Bashford Junction', '621 852 4778', 'VP', 'HTTT', 110, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (67, 'Alaric Meekin', 'Nu', '13-06-2004', '5123 Ridgeview Park', '615 676 7935', 'CLC', 'KHMT', 133, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (68, 'Horatius Titley', 'Nu', '23-10-2013', '66060 Farragut Road', '783 654 2585', 'CQ', 'KHMT', 132, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (69, 'Hannie Lusher', 'Nam', '21-12-2017', '9 Briar Crest Hill', '248 790 3538', 'CQ', 'KHMT', 130, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (70, 'Enid Coveny', 'Nam', '22-12-2011', '0476 Graceland Street', '178 142 2573', 'CLC', 'HTTT', 99, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (71, 'Nomi Malecky', 'Nu', '12-12-2009', '717 Marquette Terrace', '252 846 9713', 'CLC', 'CNTT', 129, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (72, 'Arnaldo McGuinley', 'Nu', '26-05-2023', '0 Chive Way', '260 541 6334', 'CQ', 'KHDL', 106, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (73, 'Janeva Quinnelly', 'Nam', '25-05-2004', '67 Summer Ridge Junction', '659 713 2238', 'VP', 'CNPM', 134, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (74, 'Carly Fawks', 'Nam', '09-02-2015', '6754 Merrick Alley', '927 468 4226', 'VP', 'KHMT', 124, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (75, 'Dominik Harbour', 'Nam', '21-06-2023', '2 Ridgeway Terrace', '533 863 8569', 'VP', 'KHDL', 102, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (76, 'Hogan Josephoff', 'Nam', '05-02-2009', '48 Stephen Trail', '362 892 8844', 'VP', 'HTTT', 116, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (77, 'Ricca Menhci', 'Nu', '23-08-2005', '63859 Clove Park', '702 422 1869', 'VP', 'KHMT', 118, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (78, 'Madalyn Siderfin', 'Nu', '12-03-2018', '8 3rd Way', '839 493 6832', 'CLC', 'HTTT', 103, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (79, 'Winny Chimes', 'Nam', '07-12-2023', '710 Ilene Road', '851 363 0589', 'CLC', 'HTTT', 129, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (80, 'Montague Alsina', 'Nam', '05-10-2001', '55 Blaine Point', '108 880 4886', 'VP', 'HTTT', 134, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (81, 'Josephine Amsberger', 'Nam', '15-09-2023', '077 Algoma Court', '622 652 4330', 'VP', 'CNPM', 137, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (82, 'Henka Masden', 'Nu', '25-10-2016', '17 Mallard Avenue', '584 620 5245', 'CLC', 'CNTT', 112, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (83, 'Linc Clench', 'Nam', '20-06-2005', '9004 Kropf Plaza', '962 469 0070', 'CLC', 'HTTT', 123, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (84, 'Sayre Muncey', 'Nam', '25-11-2009', '7 Eliot Terrace', '403 489 4032', 'CQ', 'KHMT', 115, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (85, 'Sophronia Eingerfield', 'Nam', '02-02-2010', '0006 Twin Pines Trail', '639 349 3473', 'VP', 'KHDL', 108, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (86, 'Junette Folder', 'Nam', '28-11-2012', '56467 Thackeray Court', '985 132 1614', 'CQ', 'CNPM', 137, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (87, 'Lila Andriveau', 'Nam', '04-03-2013', '73079 Vahlen Lane', '404 220 2740', 'CQ', 'KHMT', 126, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (88, 'Bridie Middas', 'Nam', '09-02-2001', '89 Union Junction', '465 976 4218', 'VP', 'CNTT', 108, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (89, 'Shepard Folkerd', 'Nu', '31-05-2003', '2 Canary Pass', '713 888 5088', 'VP', 'KHMT', 131, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (90, 'Corbett Flade', 'Nu', '29-10-2005', '5 Old Gate Road', '922 791 6350', 'CLC', 'HTTT', 111, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (91, 'Nadeen Fripps', 'Nu', '13-02-2015', '3 Hagan Way', '980 406 2223', 'VP', 'KHMT', 132, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (92, 'Yetty Yancey', 'Nam', '10-08-2001', '64 Magdeline Way', '203 760 8673', 'CQ', 'CNPM', 115, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (93, 'Sebastian Fritzer', 'Nu', '05-04-2009', '0 Quincy Parkway', '620 269 7070', 'CLC', 'KHDL', 121, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (94, 'Yurik Phethean', 'Nam', '26-06-2002', '41146 Hoard Parkway', '226 151 2093', 'CQ', 'KHMT', 136, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (95, 'Myrtice Anniwell', 'Nam', '08-05-2010', '1 Pond Parkway', '145 839 8971', 'CQ', 'HTTT', 104, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (96, 'Ileana Doumenc', 'Nam', '14-04-2001', '26803 Hayes Place', '464 560 8139', 'CQ', 'KHDL', 119, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (97, 'Rickey Tomblin', 'Nam', '02-01-2018', '137 Novick Court', '689 633 6815', 'VP', 'KHDL', 124, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (98, 'Shelli Senechell', 'Nam', '06-04-2003', '07442 Bellgrove Junction', '880 547 7640', 'CLC', 'CNPM', 113, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (99, 'Elfrida Kivelle', 'Nu', '06-10-2022', '0 Melby Center', '966 125 5871', 'VP', 'KHDL', 129, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (100, 'Sidonia McLennan', 'Nam', '02-10-2008', '69461 Declaration Parkway', '650 588 6213', 'VP', 'CNTT', 106, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (101, 'Aurilia Denness', 'Nam', '26-04-2011', '4685 Bartelt Lane', '817 250 2046', 'CQ', 'HTTT', 120, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (102, 'Juieta Showt', 'Nam', '20-07-2002', '91109 Gale Road', '563 671 6047', 'CLC', 'KHDL', 100, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (103, 'Greg Crake', 'Nam', '01-12-2014', '65188 Atwood Drive', '318 821 5400', 'CLC', 'CNTT', 101, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (104, 'Marigold Sjollema', 'Nam', '31-08-2009', '2 Barby Center', '242 592 6774', 'CQ', 'KHDL', 115, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (105, 'Kamillah Gummory', 'Nam', '21-05-2000', '13928 Debra Hill', '633 587 6104', 'CLC', 'KHMT', 106, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (106, 'Alidia Tesmond', 'Nam', '07-09-2009', '89 Waubesa Hill', '794 830 6822', 'VP', 'CNTT', 105, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (107, 'Darius Yelyashev', 'Nu', '19-07-2002', '29 Buell Way', '216 312 6678', 'CQ', 'CNTT', 113, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (108, 'Emily Hans', 'Nu', '16-07-2010', '6877 Buena Vista Hill', '159 614 4312', 'VP', 'CNPM', 137, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (109, 'Clerc Cortese', 'Nu', '05-03-2012', '86 Almo Circle', '282 181 2101', 'VP', 'KHMT', 106, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (110, 'Grayce Olivi', 'Nu', '09-08-2021', '46 Trailsway Parkway', '957 304 2596', 'CLC', 'CNPM', 124, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (111, 'Magnum Suttaby', 'Nu', '26-02-2016', '759 Waubesa Lane', '495 503 9667', 'CLC', 'CNPM', 105, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (112, 'Stavros Ivancevic', 'Nam', '20-09-2013', '42 Bonner Road', '318 794 6508', 'CQ', 'HTTT', 120, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (113, 'Mal Wheeldon', 'Nu', '03-05-2014', '9085 Golf View Street', '384 509 0666', 'CQ', 'CNPM', 134, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (114, 'Britteny Mityakov', 'Nu', '19-04-2007', '412 Dottie Way', '242 297 7360', 'CQ', 'KHMT', 132, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (115, 'Obediah Lynnitt', 'Nam', '14-01-2002', '96294 Fuller Drive', '588 774 8762', 'VP', 'HTTT', 103, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (116, 'Noell Mallows', 'Nam', '18-04-2009', '9038 Hauk Parkway', '804 665 0277', 'VP', 'KHMT', 136, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (117, 'Stanleigh Prestie', 'Nu', '19-11-2006', '5309 Arrowood Park', '636 984 5056', 'CLC', 'CNPM', 101, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (118, 'Amory Litton', 'Nam', '01-11-2017', '73035 Bellgrove Junction', '819 140 6181', 'CQ', 'KHMT', 111, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (119, 'Melisande Shipcott', 'Nam', '21-12-2014', '4 Badeau Trail', '338 144 4644', 'CQ', 'HTTT', 127, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (120, 'Dareen Golda', 'Nu', '04-12-2022', '51 Schiller Lane', '916 637 5534', 'CQ', 'HTTT', 104, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (121, 'Mill Fahrenbach', 'Nam', '05-01-2006', '2859 Emmet Crossing', '274 287 9077', 'VP', 'CNPM', 113, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (122, 'Lizbeth Hinkley', 'Nu', '07-06-2014', '654 Gateway Drive', '330 468 9705', 'CLC', 'CNPM', 115, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (123, 'Rodrigo Jewar', 'Nu', '21-03-2006', '39 Randy Terrace', '353 629 7325', 'CQ', 'KHMT', 109, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (124, 'Nancey Collick', 'Nu', '20-04-2019', '60006 Morningstar Avenue', '536 154 7139', 'CQ', 'CNTT', 110, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (125, 'Adan Love', 'Nu', '12-11-2016', '51480 Dottie Pass', '914 307 6354', 'CLC', 'KHMT', 130, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (126, 'Reuben McAline', 'Nu', '22-09-2008', '2 Sheridan Street', '106 656 7247', 'CLC', 'KHMT', 129, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (127, 'Bruis Haslehurst', 'Nu', '23-12-2018', '1663 Menomonie Circle', '163 435 5591', 'CLC', 'HTTT', 136, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (128, 'Edee Zarfat', 'Nu', '13-12-2003', '87 Heffernan Circle', '524 410 6304', 'CLC', 'HTTT', 137, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (129, 'Edlin Devaney', 'Nam', '16-02-2020', '08 Grasskamp Street', '323 554 5313', 'VP', 'KHMT', 116, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (130, 'Orel Sidon', 'Nu', '20-01-2015', '423 Buena Vista Circle', '761 868 3760', 'CLC', 'CNTT', 109, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (131, 'Xaviera Longstaff', 'Nu', '06-05-2004', '7 Hermina Alley', '740 637 0685', 'CQ', 'CNTT', 134, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (132, 'Angele Cottell', 'Nu', '28-07-2019', '3344 Parkside Pass', '768 158 7694', 'VP', 'KHMT', 129, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (133, 'Otes St. Hill', 'Nu', '31-07-2023', '87881 Granby Crossing', '882 899 4119', 'CQ', 'KHDL', 122, 9.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (134, 'Jarret Noden', 'Nam', '11-12-2005', '19 Norway Maple Plaza', '468 691 4669', 'CLC', 'KHDL', 136, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (135, 'Lonnard Locker', 'Nu', '25-06-2017', '52 Eagle Crest Circle', '529 404 3538', 'VP', 'HTTT', 126, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (136, 'Marcie Lawrenceson', 'Nu', '29-06-2018', '521 Washington Junction', '735 362 6743', 'CQ', 'KHMT', 100, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (137, 'Alisun FitzGibbon', 'Nam', '12-11-2004', '9239 Mandrake Parkway', '113 488 9658', 'VP', 'HTTT', 115, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (138, 'Kerrin Brumhead', 'Nam', '09-08-2006', '162 Debs Pass', '981 805 1451', 'CLC', 'HTTT', 111, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (139, 'Charmine Caulkett', 'Nu', '02-08-2012', '7253 Elmside Terrace', '943 404 5657', 'CQ', 'CNTT', 110, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (140, 'Auroora O''Henery', 'Nam', '23-11-2023', '1 Main Pass', '111 307 7222', 'VP', 'KHMT', 122, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (141, 'Ab Pottage', 'Nu', '15-05-2002', '762 Goodland Road', '719 804 3310', 'CQ', 'KHMT', 101, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (142, 'Bethena Emmison', 'Nam', '07-05-2010', '3575 Independence Alley', '572 375 9385', 'CQ', 'CNTT', 122, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (143, 'Tobye Widocks', 'Nu', '02-10-2012', '2965 Novick Hill', '785 370 5830', 'VP', 'KHMT', 110, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (144, 'Annnora Mattia', 'Nam', '07-11-2015', '440 John Wall Hill', '739 995 9646', 'VP', 'CNPM', 135, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (145, 'Hermy Featherbie', 'Nu', '20-03-2010', '84 Old Gate Road', '799 226 2546', 'CLC', 'KHDL', 131, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (146, 'Sheilah Grebbin', 'Nam', '19-08-2006', '8 Thierer Plaza', '569 266 7349', 'VP', 'CNPM', 101, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (147, 'Cale Ghilks', 'Nu', '10-09-2021', '3132 Manufacturers Trail', '795 482 8982', 'CQ', 'HTTT', 137, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (148, 'Kitti Goodreid', 'Nu', '01-02-2003', '98496 Sauthoff Crossing', '733 300 8891', 'VP', 'CNPM', 103, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (149, 'Quincey Trawin', 'Nam', '07-06-2012', '6144 Village Green Parkway', '707 785 1049', 'CQ', 'CNTT', 130, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (150, 'Yasmeen Cripin', 'Nam', '09-04-2017', '166 Thierer Center', '454 519 2007', 'CLC', 'KHDL', 137, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (151, 'Zelma Dobbinson', 'Nu', '27-10-2006', '146 Butternut Street', '466 527 4566', 'CLC', 'HTTT', 136, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (152, 'Darrick Haysham', 'Nu', '08-12-2005', '314 Jenifer Court', '618 133 0598', 'CLC', 'HTTT', 130, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (153, 'Ealasaid Yurocjhin', 'Nu', '20-05-2015', '247 Center Way', '828 990 9779', 'VP', 'CNTT', 103, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (154, 'Leonora Delacote', 'Nu', '28-09-2022', '25 Maryland Center', '313 380 4791', 'CLC', 'CNTT', 111, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (155, 'Bonnee Good', 'Nam', '19-12-2020', '04 Pond Circle', '149 206 3668', 'VP', 'HTTT', 138, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (156, 'Niki Harrington', 'Nam', '28-08-2014', '6139 Northridge Way', '631 380 5529', 'CQ', 'CNPM', 116, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (157, 'Faber Mixon', 'Nam', '21-06-2003', '9 Farmco Plaza', '133 877 2681', 'CLC', 'CNTT', 131, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (158, 'Rosella Trevain', 'Nam', '31-03-2013', '57685 Hagan Avenue', '753 362 9706', 'VP', 'HTTT', 109, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (159, 'Pepito Iacabucci', 'Nam', '23-04-2009', '52112 Morrow Park', '167 475 1482', 'CQ', 'KHDL', 120, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (160, 'Dalenna Tothe', 'Nu', '03-04-2009', '22519 Wayridge Crossing', '687 366 7642', 'VP', 'KHMT', 112, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (161, 'Ewan Olman', 'Nu', '02-02-2001', '33 Merry Avenue', '418 484 7054', 'CLC', 'CNTT', 123, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (162, 'Geraldine Huggins', 'Nam', '11-05-2020', '84594 Drewry Alley', '339 868 3055', 'CQ', 'CNPM', 135, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (163, 'Tomlin Gaskoin', 'Nam', '20-04-2016', '6 Hooker Circle', '989 333 0939', 'VP', 'HTTT', 119, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (164, 'Linette Wisniewski', 'Nu', '21-01-2003', '27 Basil Way', '360 310 6769', 'CLC', 'KHMT', 127, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (165, 'Maryann Hakes', 'Nam', '26-09-2009', '20 Daystar Crossing', '634 705 2207', 'CQ', 'CNPM', 108, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (166, 'Hatti Freckleton', 'Nu', '04-03-2013', '5994 Kedzie Avenue', '773 110 3112', 'CQ', 'KHMT', 137, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (167, 'Linoel Ricart', 'Nu', '25-04-2011', '0600 Roxbury Park', '225 356 8307', 'CLC', 'CNTT', 119, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (168, 'Dulcine Falconer-Taylor', 'Nam', '31-10-2018', '4 Clemons Way', '382 819 8300', 'CQ', 'KHMT', 118, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (169, 'Archibald Bretherton', 'Nu', '24-07-2012', '1 Becker Terrace', '859 786 9658', 'CQ', 'KHMT', 116, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (170, 'Aguie Collingdon', 'Nu', '15-12-2014', '90 Dunning Avenue', '239 683 7422', 'VP', 'KHMT', 107, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (171, 'Miguelita Mullis', 'Nu', '26-02-2001', '5 5th Place', '125 443 2501', 'CLC', 'KHMT', 137, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (172, 'Babara Proudman', 'Nu', '04-12-2011', '971 Oriole Circle', '689 684 6966', 'CLC', 'CNPM', 110, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (173, 'Orlan Gollop', 'Nu', '17-01-2024', '4 Starling Street', '818 575 4403', 'CLC', 'CNPM', 124, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (174, 'Rochester Dakhno', 'Nam', '15-03-2013', '1 Duke Park', '452 644 0452', 'VP', 'CNPM', 104, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (175, 'Willard Cottham', 'Nam', '10-12-2002', '22 Lake View Terrace', '484 458 3333', 'VP', 'KHMT', 100, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (176, 'Chane Conroy', 'Nu', '28-05-2019', '26 Orin Alley', '846 691 1950', 'VP', 'KHDL', 126, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (177, 'Meredeth Hedon', 'Nu', '06-07-2003', '801 Melody Lane', '510 948 5489', 'CLC', 'KHDL', 120, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (178, 'Robbert Pladen', 'Nu', '11-04-2023', '107 Village Place', '752 957 4360', 'CLC', 'KHMT', 108, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (179, 'Jere Chupin', 'Nam', '19-12-2008', '27 School Plaza', '501 959 2855', 'CLC', 'CNPM', 101, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (180, 'Cleavland Leggett', 'Nu', '08-11-2010', '1 Straubel Lane', '676 778 8053', 'CLC', 'KHDL', 130, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (181, 'Concordia Wittering', 'Nu', '13-06-2009', '3852 Lakeland Crossing', '847 930 0252', 'CLC', 'CNPM', 124, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (182, 'Burnard Tawton', 'Nu', '11-01-2021', '64 Coolidge Hill', '441 823 3300', 'VP', 'CNTT', 120, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (183, 'Herold Maliffe', 'Nam', '09-08-2000', '4 Anzinger Drive', '357 706 3547', 'CQ', 'CNPM', 137, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (184, 'Alastair Oakenfall', 'Nam', '17-02-2000', '6 Shasta Street', '681 766 3349', 'CQ', 'CNTT', 135, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (185, 'Stevy MacCallester', 'Nam', '04-01-2020', '57 Chive Place', '181 330 1226', 'CLC', 'CNTT', 131, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (186, 'Trudie Renol', 'Nu', '23-08-2011', '88266 Vidon Place', '776 835 1251', 'VP', 'CNTT', 114, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (187, 'Katey Bonhan', 'Nam', '13-07-2010', '10637 Meadow Ridge Center', '302 716 4398', 'VP', 'CNPM', 135, 9.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (188, 'Halimeda Boarleyson', 'Nam', '11-12-2003', '21898 Twin Pines Junction', '281 528 4790', 'CLC', 'HTTT', 120, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (189, 'Hamel Thickett', 'Nu', '26-09-2019', '266 Havey Place', '664 166 3383', 'CQ', 'HTTT', 109, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (190, 'Janek Caldicot', 'Nam', '30-01-2020', '272 Muir Way', '376 998 7177', 'CQ', 'CNPM', 120, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (191, 'Cad Martynikhin', 'Nam', '15-02-2005', '27449 Namekagon Place', '954 842 9928', 'VP', 'KHMT', 136, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (192, 'Bella Gossage', 'Nam', '26-10-2020', '7277 Corben Center', '801 823 9123', 'CQ', 'HTTT', 131, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (193, 'Annis Le Leu', 'Nam', '18-03-2006', '33 Butternut Drive', '729 789 8477', 'VP', 'KHDL', 131, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (194, 'Fletch Adds', 'Nam', '14-12-2005', '024 Del Sol Parkway', '186 742 1204', 'CLC', 'KHDL', 99, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (195, 'Thorsten Cuffley', 'Nu', '25-11-2023', '771 Prairie Rose Way', '666 596 9655', 'CLC', 'KHMT', 122, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (196, 'Mike Alway', 'Nam', '30-06-2008', '8 Dawn Court', '255 188 2845', 'VP', 'CNPM', 130, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (197, 'Susanna Hamman', 'Nu', '09-07-2008', '84 Delaware Park', '188 547 5381', 'VP', 'KHDL', 118, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (198, 'Wiatt Aspinwall', 'Nam', '19-12-2021', '5 Fordem Junction', '531 832 8284', 'VP', 'KHMT', 105, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (199, 'Goldi Heugh', 'Nam', '25-10-2015', '9829 Crest Line Avenue', '483 730 7928', 'VP', 'CNTT', 136, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (200, 'Mikol Frear', 'Nam', '14-05-2013', '53 Upham Hill', '831 495 2618', 'VP', 'HTTT', 123, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (201, 'Drusi Bloys', 'Nu', '19-09-2007', '9 Namekagon Avenue', '200 981 7078', 'CQ', 'CNPM', 124, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (202, 'Nanette Motherwell', 'Nu', '21-04-2004', '067 Granby Drive', '742 544 0295', 'CLC', 'CNPM', 99, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (203, 'Lilias Brinson', 'Nu', '18-10-2019', '7 Oriole Pass', '879 777 2125', 'VP', 'CNPM', 105, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (204, 'Kata Goor', 'Nu', '06-04-2022', '9 Dexter Drive', '491 537 9556', 'CLC', 'CNTT', 119, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (205, 'Cleavland Gonin', 'Nu', '19-04-2000', '267 Pepper Wood Plaza', '748 813 3164', 'VP', 'KHDL', 138, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (206, 'Frants Pickett', 'Nu', '16-10-2021', '5855 Namekagon Drive', '202 397 7759', 'CQ', 'CNPM', 119, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (207, 'Olympe Vedntyev', 'Nam', '28-02-2019', '4 Londonderry Junction', '446 920 4078', 'CQ', 'CNTT', 126, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (208, 'Harcourt Pole', 'Nam', '02-07-2019', '10563 Lyons Trail', '769 473 7214', 'CLC', 'KHDL', 111, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (209, 'Bjorn Handling', 'Nam', '09-12-2000', '3 Reinke Terrace', '108 861 4100', 'VP', 'KHDL', 111, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (210, 'Morgan Pilch', 'Nu', '05-04-2013', '069 Spohn Parkway', '815 394 2886', 'CQ', 'HTTT', 133, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (211, 'Enrika Watman', 'Nam', '28-12-2006', '1 Monument Terrace', '521 880 8904', 'VP', 'CNTT', 103, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (212, 'Gerri Divis', 'Nam', '06-01-2022', '765 Granby Parkway', '825 674 8039', 'CLC', 'CNPM', 107, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (213, 'Lorianna Brogioni', 'Nu', '08-02-2018', '35096 Fallview Park', '471 428 5063', 'CQ', 'CNTT', 119, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (214, 'Myrah Parkyn', 'Nu', '14-09-2000', '12718 Kennedy Road', '147 754 8491', 'CLC', 'KHDL', 120, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (215, 'Shell Keinrat', 'Nu', '12-05-2016', '51 Dovetail Avenue', '789 208 7355', 'VP', 'CNPM', 104, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (216, 'Gweneth Butlin', 'Nu', '27-03-2021', '5787 Sycamore Avenue', '288 724 5918', 'CQ', 'KHMT', 133, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (217, 'Hank Barette', 'Nu', '30-11-2011', '0 Burning Wood Street', '404 330 4067', 'VP', 'CNTT', 115, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (218, 'Rasia Measham', 'Nam', '12-03-2004', '3755 Transport Center', '553 799 6418', 'CQ', 'HTTT', 113, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (219, 'Philis Lehemann', 'Nu', '06-07-2020', '652 Mitchell Place', '321 204 2586', 'CLC', 'CNTT', 132, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (220, 'Dot Vanshin', 'Nu', '14-03-2003', '54 Continental Park', '418 845 1121', 'CLC', 'HTTT', 138, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (221, 'Doroteya Benditt', 'Nam', '30-08-2004', '25 Evergreen Point', '841 607 3495', 'CLC', 'CNTT', 137, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (222, 'Hamlen Muris', 'Nu', '28-06-2018', '668 Hanover Junction', '154 603 1212', 'VP', 'CNPM', 99, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (223, 'Korry Bricklebank', 'Nu', '10-05-2001', '33 Duke Hill', '659 603 9467', 'VP', 'CNPM', 137, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (224, 'Konrad Dadson', 'Nu', '07-07-2014', '62042 Morning Crossing', '607 760 9033', 'CLC', 'KHMT', 110, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (225, 'Anthony Valiant', 'Nam', '11-01-2002', '15171 Spenser Trail', '575 400 6017', 'CLC', 'KHMT', 113, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (226, 'Joelly Farrans', 'Nam', '31-12-2020', '9238 Heath Parkway', '746 600 5057', 'CLC', 'KHMT', 110, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (227, 'Val Brands', 'Nu', '13-01-2000', '88888 Schmedeman Lane', '506 309 6002', 'CLC', 'CNTT', 109, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (228, 'Meade Quig', 'Nu', '02-06-2012', '9 Riverside Alley', '422 149 2066', 'CQ', 'HTTT', 110, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (229, 'Catherin Teece', 'Nam', '17-02-2011', '1 Oriole Avenue', '377 886 4706', 'CLC', 'CNTT', 131, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (230, 'Sabrina McCandless', 'Nu', '29-09-2003', '17 Iowa Avenue', '666 495 5045', 'VP', 'HTTT', 121, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (231, 'Mandie Hemshall', 'Nam', '16-09-2006', '74695 Fieldstone Pass', '282 307 5788', 'CLC', 'HTTT', 126, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (232, 'Klara Gustus', 'Nam', '09-05-2021', '8161 Jana Court', '620 733 3038', 'VP', 'CNPM', 121, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (233, 'Neila Kures', 'Nu', '14-05-2017', '1956 Saint Paul Alley', '331 462 7615', 'VP', 'HTTT', 108, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (234, 'Cristin Heasly', 'Nu', '08-08-2015', '6 Novick Point', '974 451 0988', 'CQ', 'KHDL', 121, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (235, 'Sianna Helian', 'Nam', '09-09-2011', '602 Melrose Terrace', '478 783 6981', 'CQ', 'CNPM', 101, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (236, 'Leeanne Juhruke', 'Nam', '29-09-2021', '18 Tony Pass', '724 196 5062', 'VP', 'CNTT', 114, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (237, 'Olwen MacCallester', 'Nu', '06-05-2010', '1053 La Follette Drive', '889 100 1059', 'VP', 'KHDL', 129, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (238, 'Gill Brando', 'Nu', '10-03-2005', '0 Fuller Avenue', '808 367 4113', 'CLC', 'KHMT', 130, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (239, 'Frederique Jakeway', 'Nu', '01-04-2003', '05210 Steensland Junction', '522 819 9535', 'CLC', 'CNPM', 106, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (240, 'Kary Willars', 'Nu', '02-03-2023', '8 Browning Court', '671 538 4045', 'CQ', 'CNPM', 109, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (241, 'Jodee Flippelli', 'Nu', '14-12-2003', '6 Killdeer Court', '706 114 9169', 'CLC', 'KHMT', 100, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (242, 'Lyndel Fewell', 'Nu', '26-11-2013', '0 Shelley Alley', '815 351 6585', 'CLC', 'CNTT', 120, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (243, 'Ferne Asquith', 'Nam', '24-12-2010', '08994 Golf View Road', '877 709 1865', 'CQ', 'CNPM', 110, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (244, 'Theressa Craufurd', 'Nu', '10-12-2007', '88 Pankratz Terrace', '557 210 5435', 'VP', 'KHDL', 106, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (245, 'Odilia Bendare', 'Nu', '11-09-2010', '45578 Shelley Alley', '716 934 1975', 'CLC', 'HTTT', 110, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (246, 'Kean Langcaster', 'Nu', '03-01-2001', '07 East Road', '423 929 2688', 'VP', 'KHDL', 109, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (247, 'Mabel Paszak', 'Nam', '11-07-2004', '75 Waywood Plaza', '896 961 2011', 'CLC', 'KHDL', 113, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (248, 'Elissa Edmands', 'Nam', '22-06-2015', '315 Autumn Leaf Junction', '144 627 8598', 'CQ', 'CNTT', 130, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (249, 'Perren Druitt', 'Nu', '23-05-2000', '0 Hoffman Road', '603 207 1198', 'CLC', 'CNPM', 102, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (250, 'Vale Lebel', 'Nam', '21-10-2020', '28 Sheridan Park', '207 153 7254', 'CQ', 'KHDL', 114, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (251, 'Dinny Murdie', 'Nam', '17-08-2004', '96756 Mayfield Park', '398 653 6204', 'CQ', 'HTTT', 128, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (252, 'Imojean Marconi', 'Nu', '01-07-2015', '2235 Algoma Pass', '740 869 9286', 'CQ', 'HTTT', 132, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (253, 'Odie Robelin', 'Nu', '24-12-2000', '13 Ruskin Center', '385 347 5755', 'VP', 'KHDL', 138, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (254, 'Dorthea Massot', 'Nu', '07-01-2014', '6 Anderson Circle', '545 514 8388', 'CQ', 'KHDL', 124, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (255, 'Carina Sussems', 'Nu', '20-10-2006', '83 Westridge Pass', '482 213 6176', 'CLC', 'HTTT', 130, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (256, 'Eolanda Lugg', 'Nu', '22-08-2016', '5 Golf View Circle', '437 504 3562', 'CLC', 'KHDL', 134, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (257, 'Errick Bursnall', 'Nu', '22-10-2016', '9283 Dovetail Park', '536 115 6761', 'CLC', 'KHMT', 114, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (258, 'Gustav Bridgwood', 'Nu', '02-05-2004', '0 Mosinee Street', '916 290 9650', 'CQ', 'KHDL', 107, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (259, 'Mandel Scannell', 'Nam', '30-12-2018', '5 Clove Crossing', '558 860 8691', 'CQ', 'HTTT', 101, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (260, 'Rudolph Michel', 'Nam', '27-07-2019', '57356 Forest Dale Crossing', '769 753 6312', 'VP', 'CNPM', 108, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (261, 'Hayden Burton', 'Nu', '11-06-2001', '55 Anniversary Pass', '254 668 7275', 'CQ', 'KHDL', 132, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (262, 'Jemima Nuscha', 'Nam', '10-01-2024', '1334 Katie Road', '779 105 3376', 'VP', 'KHDL', 123, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (263, 'Robbie Stratley', 'Nam', '03-10-2009', '2477 Northland Park', '857 218 9647', 'CQ', 'KHMT', 101, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (264, 'Constantine Gilardengo', 'Nam', '11-02-2010', '421 Sunbrook Drive', '364 539 8748', 'VP', 'KHDL', 138, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (265, 'Phebe Tamburo', 'Nam', '05-12-2000', '8505 East Drive', '749 318 3951', 'CQ', 'CNTT', 109, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (266, 'Gerladina Feifer', 'Nu', '02-09-2023', '3 Waxwing Terrace', '855 733 6891', 'CQ', 'HTTT', 107, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (267, 'Burk Pillinger', 'Nam', '20-12-2003', '6 Havey Drive', '208 141 1581', 'VP', 'CNTT', 127, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (268, 'Vikky Hitcham', 'Nu', '17-11-2012', '137 Mayer Street', '832 170 7004', 'CQ', 'CNTT', 134, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (269, 'Cazzie Bydaway', 'Nu', '21-04-2016', '3 Mariners Cove Way', '580 260 2869', 'CQ', 'KHDL', 113, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (270, 'Royce Urrey', 'Nu', '15-08-2016', '372 5th Plaza', '130 473 0812', 'CQ', 'CNPM', 128, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (271, 'Issiah Thrower', 'Nu', '29-08-2015', '10763 Elka Trail', '536 328 9490', 'CQ', 'HTTT', 119, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (272, 'Loralie Habbert', 'Nam', '10-08-2007', '15 David Court', '245 884 3226', 'VP', 'HTTT', 126, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (273, 'Annalise Halhead', 'Nu', '11-06-2008', '0209 Kenwood Lane', '404 488 9871', 'CLC', 'KHDL', 129, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (274, 'Bambie Sagerson', 'Nam', '12-07-2014', '15 Alpine Road', '386 465 5994', 'CLC', 'CNTT', 135, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (275, 'Bethina Claris', 'Nu', '15-03-2003', '31 Lunder Park', '166 691 0218', 'VP', 'HTTT', 99, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (276, 'Maisey Erridge', 'Nu', '12-06-2014', '1181 Morrow Junction', '797 129 9738', 'CQ', 'KHDL', 104, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (277, 'Brooks Treadgold', 'Nu', '11-03-2024', '837 Saint Paul Trail', '269 940 9354', 'CLC', 'KHMT', 124, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (278, 'Lorinda Hamnett', 'Nu', '14-12-2003', '62 Kedzie Plaza', '863 784 6695', 'CQ', 'HTTT', 135, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (279, 'Lynnet Hetterich', 'Nam', '23-10-2005', '0 Forest Run Lane', '430 256 4045', 'VP', 'CNTT', 107, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (280, 'Mala Sabathier', 'Nam', '17-07-2017', '479 Redwing Court', '925 456 6651', 'VP', 'KHDL', 104, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (281, 'Meade Kiddy', 'Nam', '10-10-2019', '69 Kennedy Junction', '516 280 2629', 'CLC', 'HTTT', 126, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (282, 'Rosabel Girvin', 'Nu', '06-04-2011', '8 Susan Street', '564 306 3602', 'CQ', 'CNPM', 101, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (283, 'Sorcha Belliard', 'Nu', '28-04-2016', '7000 Quincy Park', '886 869 8409', 'CLC', 'KHDL', 138, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (284, 'Cindelyn MacTeggart', 'Nu', '10-06-2018', '56268 Everett Point', '270 193 7640', 'CQ', 'KHDL', 108, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (285, 'Leigh Maccaig', 'Nu', '05-10-2021', '19 Esch Avenue', '732 664 8672', 'CQ', 'HTTT', 100, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (286, 'Rodger Averay', 'Nu', '22-10-2009', '2 Golf Course Way', '650 818 3525', 'VP', 'HTTT', 127, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (287, 'Kynthia Cheston', 'Nam', '25-09-2012', '6467 Havey Point', '667 581 1617', 'CLC', 'HTTT', 122, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (288, 'Donal Moretto', 'Nam', '22-02-2024', '33030 Ridgeview Crossing', '351 585 7246', 'CQ', 'CNTT', 111, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (289, 'Nanine Ligerton', 'Nu', '14-03-2000', '84898 Ridgeway Road', '306 347 4055', 'CQ', 'CNTT', 133, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (290, 'Kerry Januszewicz', 'Nam', '01-03-2017', '09 Arapahoe Center', '106 612 7009', 'VP', 'HTTT', 120, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (291, 'Adriane Ambrois', 'Nam', '20-06-2021', '681 Longview Junction', '193 310 1963', 'CLC', 'KHMT', 133, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (292, 'Bruno Earwaker', 'Nu', '18-05-2019', '944 Stoughton Parkway', '161 908 6559', 'CLC', 'CNTT', 133, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (293, 'Casey Gossington', 'Nu', '12-10-2000', '647 Tomscot Place', '377 377 0910', 'CLC', 'KHDL', 123, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (294, 'Louisette Bointon', 'Nam', '25-05-2011', '89390 Wayridge Alley', '514 709 7085', 'CQ', 'KHDL', 130, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (295, 'Heather Totton', 'Nu', '27-10-2019', '572 Susan Avenue', '312 668 2366', 'VP', 'HTTT', 119, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (296, 'Jessie Strowther', 'Nu', '01-10-2007', '44 Brentwood Avenue', '365 706 7776', 'VP', 'HTTT', 107, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (297, 'Egan Arnefield', 'Nam', '03-02-2017', '339 Algoma Crossing', '953 326 6759', 'CLC', 'CNTT', 113, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (298, 'Twyla Shenfisch', 'Nam', '27-03-2009', '68 Tomscot Avenue', '414 667 4742', 'VP', 'HTTT', 133, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (299, 'Lydia Ebrall', 'Nam', '19-07-2019', '370 Express Pass', '761 569 5196', 'CLC', 'HTTT', 123, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (300, 'Pepillo Braizier', 'Nam', '25-07-2021', '27 Hagan Terrace', '627 104 4727', 'VP', 'HTTT', 105, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (301, 'Isis Broggetti', 'Nam', '25-05-2022', '3 Cordelia Road', '895 728 7272', 'VP', 'HTTT', 135, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (302, 'Cathrin Lamers', 'Nu', '11-11-2009', '859 Sheridan Junction', '565 515 1309', 'VP', 'KHMT', 123, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (303, 'Jolynn Dyerson', 'Nu', '11-04-2000', '2 Everett Parkway', '839 518 1583', 'CQ', 'CNTT', 117, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (304, 'Kellyann Docker', 'Nu', '16-10-2013', '9 Packers Point', '671 680 8636', 'CLC', 'KHDL', 112, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (305, 'Ulric Murty', 'Nam', '04-06-2021', '6693 Tennessee Court', '108 268 2452', 'CQ', 'HTTT', 128, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (306, 'Ashleigh Corteney', 'Nam', '19-02-2007', '65143 Mifflin Park', '233 839 9080', 'VP', 'HTTT', 128, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (307, 'Virgie Di Biagio', 'Nam', '29-06-2009', '25 Parkside Pass', '864 662 4512', 'CQ', 'CNPM', 131, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (308, 'Mab Baptiste', 'Nam', '04-11-2014', '66 Sachs Parkway', '310 100 9392', 'CLC', 'KHDL', 117, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (309, 'Yvor Kellough', 'Nu', '06-10-2007', '119 Dennis Avenue', '227 587 2144', 'CQ', 'HTTT', 116, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (310, 'Vitoria Jeanesson', 'Nam', '07-06-2013', '5396 Spaight Alley', '206 297 0567', 'CQ', 'KHMT', 125, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (311, 'Cedric Klaggeman', 'Nu', '02-05-2004', '73660 Oxford Lane', '729 727 8329', 'CQ', 'CNTT', 123, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (312, 'Ingrid Barnfield', 'Nu', '25-12-2006', '69107 Green Alley', '997 598 4936', 'CQ', 'CNTT', 133, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (313, 'Ferrell Trotter', 'Nam', '09-07-2017', '48732 Scofield Avenue', '778 704 1863', 'VP', 'HTTT', 111, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (314, 'Siobhan Gagie', 'Nam', '22-07-2006', '6416 Dryden Park', '828 548 8132', 'CLC', 'KHDL', 124, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (315, 'Barny Muscat', 'Nam', '06-06-2019', '74 Stoughton Hill', '363 837 9189', 'VP', 'CNTT', 112, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (316, 'Joann Scopes', 'Nam', '27-10-2017', '42939 Laurel Place', '949 628 7128', 'VP', 'KHMT', 131, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (317, 'Beniamino Jurs', 'Nam', '13-01-2021', '2925 Oak Valley Alley', '670 562 7322', 'CQ', 'CNPM', 100, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (318, 'Remington Jesson', 'Nu', '10-07-2003', '15 Darwin Park', '694 597 4627', 'CQ', 'HTTT', 116, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (319, 'Egan Morais', 'Nu', '25-12-2011', '83 Hanover Trail', '974 381 4819', 'CQ', 'HTTT', 112, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (320, 'Jordain Maffia', 'Nam', '10-06-2014', '82284 Twin Pines Circle', '712 929 9918', 'CQ', 'HTTT', 106, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (321, 'Rik Frie', 'Nu', '11-01-2009', '3820 Corry Hill', '226 802 0216', 'VP', 'KHMT', 125, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (322, 'Rachel Spight', 'Nu', '05-01-2022', '103 Scofield Drive', '134 263 4392', 'CQ', 'HTTT', 125, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (323, 'Neron Shenton', 'Nam', '04-07-2015', '4 Mendota Court', '743 998 7075', 'VP', 'CNTT', 107, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (324, 'Norton Glowacha', 'Nam', '14-04-2001', '32475 Kim Junction', '628 570 7159', 'CQ', 'CNPM', 105, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (325, 'Faydra Oldmeadow', 'Nu', '20-04-2016', '08484 Darwin Alley', '775 748 2700', 'CQ', 'CNTT', 134, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (326, 'Binny Colgrave', 'Nu', '27-02-2016', '177 Lakewood Gardens Way', '662 616 6798', 'VP', 'CNTT', 105, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (327, 'Caprice Bengtson', 'Nam', '18-02-2004', '96 Golden Leaf Trail', '208 894 3991', 'CLC', 'KHMT', 123, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (328, 'Pamella Whitear', 'Nam', '19-08-2008', '569 Algoma Trail', '259 718 4777', 'CQ', 'CNTT', 101, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (329, 'Margaretha Duffet', 'Nu', '23-10-2016', '13008 Bunting Park', '319 353 6933', 'CQ', 'CNPM', 131, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (330, 'Deeanne Gobel', 'Nu', '07-12-2022', '764 Lindbergh Terrace', '754 901 6866', 'CQ', 'KHDL', 119, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (331, 'Raf Cleverly', 'Nu', '14-09-2014', '0334 Lotheville Point', '982 296 6954', 'VP', 'KHDL', 126, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (332, 'Norry Nason', 'Nam', '12-04-2020', '03 Knutson Pass', '772 731 5684', 'VP', 'KHDL', 138, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (333, 'Bentlee Bernocchi', 'Nam', '21-09-2014', '7412 Delaware Way', '807 675 4019', 'VP', 'KHDL', 114, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (334, 'Shayla Norris', 'Nam', '01-05-2011', '8603 Continental Road', '624 367 6428', 'VP', 'HTTT', 109, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (335, 'Jillayne Sommerville', 'Nam', '06-08-2012', '7324 Fulton Way', '332 681 4446', 'CLC', 'CNTT', 128, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (336, 'Camila Bestiman', 'Nu', '02-09-2019', '0 Monica Pass', '996 145 8239', 'VP', 'CNTT', 122, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (337, 'Nollie Gietz', 'Nam', '25-04-2014', '8618 Lotheville Crossing', '890 533 4397', 'CQ', 'CNTT', 107, 9.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (338, 'Storm Wagstaff', 'Nu', '09-03-2023', '74 Mariners Cove Trail', '488 326 7140', 'CLC', 'KHDL', 137, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (339, 'Had Edwardes', 'Nam', '15-05-2004', '2 Maryland Pass', '758 994 7244', 'CQ', 'KHDL', 118, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (340, 'Sheffield Le Pine', 'Nam', '19-05-2023', '50 Mccormick Pass', '753 559 3458', 'CQ', 'CNTT', 126, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (341, 'Shayne Pesterfield', 'Nu', '25-02-2007', '29 Macpherson Trail', '472 605 2506', 'VP', 'CNTT', 106, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (342, 'Kaitlyn Bleasdale', 'Nu', '16-09-2010', '213 Bayside Street', '256 705 7016', 'CLC', 'KHMT', 104, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (343, 'Portie Ravilus', 'Nam', '24-02-2009', '39364 Prairieview Crossing', '686 208 4923', 'CLC', 'CNTT', 118, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (344, 'Francesco Hue', 'Nu', '12-09-2020', '4 Sauthoff Way', '472 983 9502', 'CQ', 'KHMT', 130, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (345, 'Belle Gaudon', 'Nu', '04-04-2018', '3 Mesta Avenue', '566 650 3322', 'CLC', 'CNTT', 103, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (346, 'Victoir Pipes', 'Nam', '04-07-2022', '775 Warrior Crossing', '556 995 7986', 'VP', 'KHMT', 112, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (347, 'Cherianne Duffil', 'Nu', '16-09-2020', '39 Monument Point', '558 284 7583', 'CLC', 'KHDL', 122, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (348, 'Leighton Capineer', 'Nam', '24-05-2018', '83467 Moose Plaza', '807 755 4787', 'VP', 'CNTT', 127, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (349, 'Lovell Pemble', 'Nam', '19-07-2005', '76698 Pleasure Point', '406 724 3328', 'VP', 'KHMT', 131, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (350, 'Davida Potapczuk', 'Nam', '26-10-2019', '04082 Monument Way', '207 576 9750', 'VP', 'CNPM', 130, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (351, 'Helli Heinritz', 'Nu', '24-09-2011', '81688 Melody Place', '943 971 9425', 'VP', 'CNPM', 114, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (352, 'Gerald Croke', 'Nam', '20-02-2023', '1 Hermina Circle', '927 381 2429', 'CLC', 'KHMT', 104, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (353, 'Juliann Mc Meekin', 'Nam', '31-10-2002', '9 Rusk Terrace', '597 158 3984', 'CQ', 'KHMT', 120, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (354, 'Veronique Martel', 'Nu', '14-03-2010', '6822 Mesta Center', '983 350 1758', 'CQ', 'CNTT', 109, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (355, 'Xenos Sharpin', 'Nu', '23-04-2003', '8 Trailsway Hill', '605 619 6822', 'CQ', 'KHDL', 104, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (356, 'Oswell Choulerton', 'Nu', '26-05-2017', '2 5th Crossing', '363 204 1802', 'CQ', 'HTTT', 134, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (357, 'Bar Moreno', 'Nam', '17-11-2017', '084 Eagle Crest Terrace', '137 989 1234', 'CLC', 'HTTT', 127, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (358, 'Edeline Barnsdale', 'Nam', '11-08-2014', '44 Lyons Place', '911 154 9850', 'VP', 'KHMT', 131, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (359, 'Felicle Skurm', 'Nu', '28-09-2018', '697 Calypso Street', '661 853 1115', 'CQ', 'KHDL', 121, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (360, 'Abbye Girardi', 'Nu', '06-03-2003', '1 Colorado Terrace', '977 298 1928', 'VP', 'HTTT', 109, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (361, 'Casar Glasspool', 'Nu', '05-08-2022', '29 Bonner Junction', '630 502 5114', 'CQ', 'CNPM', 137, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (362, 'Tomkin Healy', 'Nam', '15-05-2021', '595 Butternut Circle', '194 566 8515', 'CQ', 'HTTT', 136, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (363, 'Levi Gulleford', 'Nu', '22-12-2023', '12206 Washington Alley', '875 995 1392', 'VP', 'CNPM', 111, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (364, 'Karolina Gillingwater', 'Nu', '02-06-2008', '5537 Forest Dale Pass', '392 280 6354', 'VP', 'HTTT', 118, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (365, 'Ashby Worden', 'Nu', '15-07-2012', '9809 Monterey Alley', '918 138 6297', 'VP', 'CNPM', 125, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (366, 'Reynold Simco', 'Nam', '28-08-2002', '77512 Green Circle', '889 556 7020', 'VP', 'CNPM', 118, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (367, 'Wright Shotter', 'Nam', '07-12-2011', '81376 Chinook Crossing', '322 659 8860', 'CQ', 'CNTT', 111, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (368, 'Corinna Clewer', 'Nam', '12-11-2009', '3 Reinke Avenue', '208 464 1001', 'VP', 'KHMT', 106, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (369, 'Allissa Semechik', 'Nu', '25-09-2018', '846 Boyd Lane', '588 175 7339', 'CLC', 'CNTT', 108, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (370, 'Samantha Steptow', 'Nu', '07-06-2015', '7 Toban Hill', '961 554 0231', 'CLC', 'CNTT', 136, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (371, 'Meg Rowson', 'Nu', '20-01-2020', '3 Moose Trail', '579 732 4167', 'VP', 'HTTT', 99, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (372, 'Malissa Hazelton', 'Nam', '11-03-2004', '2935 Hermina Alley', '415 840 1525', 'VP', 'KHMT', 128, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (373, 'Kayley Sutherington', 'Nam', '25-08-2018', '181 Hazelcrest Pass', '596 860 1680', 'VP', 'KHDL', 127, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (374, 'Hermine Clother', 'Nu', '24-12-2019', '99926 Merchant Junction', '930 153 9964', 'CQ', 'CNPM', 115, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (375, 'Carena Wardlow', 'Nam', '17-07-2016', '0451 Sommers Hill', '524 295 8683', 'VP', 'KHDL', 130, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (376, 'Ferguson Northrop', 'Nu', '11-01-2003', '252 Steensland Way', '543 669 5782', 'CQ', 'HTTT', 128, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (377, 'Carol-jean Gayther', 'Nu', '22-09-2009', '502 Lawn Place', '381 249 4625', 'CLC', 'CNTT', 112, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (378, 'Jammal Shepherdson', 'Nam', '18-09-2014', '951 Oneill Parkway', '471 846 8094', 'CLC', 'HTTT', 105, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (379, 'Manuel Ormond', 'Nu', '16-01-2004', '43 Vermont Street', '326 270 9484', 'VP', 'CNPM', 112, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (380, 'Lara Stamper', 'Nam', '13-12-2019', '6 Elmside Road', '665 426 6478', 'CLC', 'HTTT', 109, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (381, 'Tobit Benoix', 'Nam', '21-08-2022', '012 Northridge Point', '675 320 1109', 'VP', 'HTTT', 115, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (382, 'Brigida Adam', 'Nam', '24-11-2018', '22 Bluestem Alley', '453 306 0099', 'CLC', 'KHDL', 116, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (383, 'Ralf Utteridge', 'Nu', '06-01-2014', '78963 Kennedy Drive', '899 435 3607', 'CLC', 'KHMT', 118, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (384, 'Aloin Caukill', 'Nu', '13-10-2014', '9 Grayhawk Place', '118 845 3448', 'VP', 'KHMT', 99, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (385, 'Madel Nacci', 'Nam', '23-11-2013', '4754 Vermont Place', '757 768 0118', 'CQ', 'KHMT', 115, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (386, 'Cariotta Barrett', 'Nu', '06-05-2012', '642 Crest Line Alley', '253 382 4474', 'CLC', 'KHMT', 121, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (387, 'Ivett Davidove', 'Nu', '26-04-2000', '424 Harper Place', '248 571 5738', 'CQ', 'KHMT', 116, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (388, 'Rena Langabeer', 'Nu', '23-11-2004', '0 Esker Avenue', '762 744 9238', 'VP', 'HTTT', 121, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (389, 'Adena Stendell', 'Nam', '22-12-2023', '45324 Blue Bill Park Alley', '282 209 3106', 'CLC', 'KHDL', 104, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (390, 'Kenn Sawden', 'Nam', '19-02-2018', '8 Vernon Pass', '247 484 1317', 'CQ', 'HTTT', 122, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (391, 'Cordie Case', 'Nam', '28-01-2016', '7947 8th Way', '251 227 1259', 'VP', 'HTTT', 135, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (392, 'Corina Ritch', 'Nu', '07-08-2017', '7 Oneill Avenue', '535 798 8232', 'CQ', 'CNPM', 111, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (393, 'Hieronymus Message', 'Nam', '19-05-2010', '21857 Jana Pass', '936 915 0661', 'CLC', 'CNTT', 137, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (394, 'Che Isaak', 'Nu', '29-12-2001', '72007 Paget Hill', '124 404 7918', 'VP', 'KHDL', 116, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (395, 'Alejandrina Babalola', 'Nu', '15-06-2001', '7586 New Castle Junction', '241 397 1456', 'CLC', 'KHMT', 130, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (396, 'Jade Barrett', 'Nu', '19-10-2011', '53 Maywood Pass', '394 921 1884', 'VP', 'KHDL', 118, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (397, 'Godfrey McBoyle', 'Nam', '29-10-2001', '7 Hudson Plaza', '591 326 5548', 'VP', 'HTTT', 117, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (398, 'Rhianon Pettecrew', 'Nu', '30-05-2012', '7 Onsgard Road', '420 932 4300', 'CQ', 'HTTT', 130, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (399, 'Honey Morpeth', 'Nu', '13-07-2009', '864 Lakeland Road', '330 145 4371', 'CLC', 'KHMT', 126, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (400, 'Ted Grigore', 'Nam', '05-12-2002', '92831 Elgar Terrace', '477 116 8667', 'VP', 'HTTT', 134, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (401, 'Corrina Cargo', 'Nu', '18-12-2002', '4634 South Trail', '300 813 5915', 'VP', 'CNPM', 106, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (402, 'Shaun Folliss', 'Nu', '21-06-2023', '61 Barnett Alley', '231 988 0416', 'VP', 'HTTT', 105, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (403, 'Julie Sturgeon', 'Nu', '09-02-2024', '2604 Miller Point', '213 586 9808', 'CQ', 'KHMT', 133, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (404, 'Melvin Deekes', 'Nam', '27-06-2018', '8896 Kennedy Parkway', '283 539 0334', 'VP', 'KHMT', 112, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (405, 'Ediva Lean', 'Nu', '25-12-2009', '583 Warner Lane', '434 298 1244', 'CLC', 'KHMT', 113, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (406, 'Gwenora MacMechan', 'Nam', '08-11-2019', '9 Leroy Way', '345 548 3828', 'CLC', 'KHMT', 128, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (407, 'Val Chellingworth', 'Nu', '27-03-2018', '4487 Havey Terrace', '905 332 1442', 'CLC', 'CNTT', 121, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (408, 'Stormie Bachmann', 'Nam', '02-05-2021', '5 Swallow Circle', '386 683 1987', 'CQ', 'KHDL', 104, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (409, 'Lanni Craddock', 'Nam', '01-11-2002', '267 Mcbride Point', '202 962 0835', 'CQ', 'CNPM', 127, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (410, 'Fredric Baudesson', 'Nam', '03-04-2006', '3587 Hazelcrest Circle', '792 699 5759', 'VP', 'KHMT', 118, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (411, 'Siobhan Rabb', 'Nu', '23-08-2010', '57481 Granby Junction', '724 376 2459', 'CQ', 'KHDL', 103, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (412, 'Kat Margarson', 'Nu', '13-10-2002', '6718 Independence Crossing', '911 959 3456', 'CLC', 'KHMT', 115, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (413, 'Wendell Gething', 'Nu', '05-12-2022', '114 Tomscot Park', '288 562 2839', 'CQ', 'KHMT', 130, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (414, 'Northrup Rosterne', 'Nu', '12-07-2014', '74 5th Plaza', '313 944 3846', 'VP', 'KHDL', 123, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (415, 'Quillan Oguz', 'Nu', '15-12-2001', '80 Oak Junction', '986 888 2540', 'CQ', 'KHDL', 138, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (416, 'Willey Mattisssen', 'Nam', '28-07-2006', '4213 Bellgrove Point', '360 752 5572', 'VP', 'CNTT', 118, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (417, 'Ginger Kensley', 'Nam', '05-02-2009', '20 Blackbird Center', '962 421 8861', 'CLC', 'HTTT', 99, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (418, 'Nev Casillas', 'Nu', '01-05-2012', '75284 Mitchell Circle', '608 767 8493', 'CQ', 'KHMT', 129, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (419, 'Winfield Woolland', 'Nam', '09-10-2019', '0790 Beilfuss Drive', '157 360 5463', 'VP', 'KHMT', 134, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (420, 'Nathan Moynham', 'Nu', '30-05-2015', '1 Golf View Street', '484 454 6815', 'VP', 'KHMT', 112, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (421, 'Milli Jewitt', 'Nam', '17-07-2017', '791 Susan Way', '566 375 2075', 'CQ', 'CNTT', 135, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (422, 'Cayla Jaumet', 'Nu', '01-10-2020', '3 Gina Alley', '407 694 6039', 'CQ', 'KHDL', 122, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (423, 'Linnea Culbard', 'Nam', '31-05-2011', '112 Mayfield Parkway', '369 640 7721', 'VP', 'HTTT', 117, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (424, 'Wilbur Leahey', 'Nam', '19-05-2011', '193 Sommers Trail', '332 556 4996', 'CQ', 'CNPM', 106, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (425, 'Melantha Humerstone', 'Nu', '12-05-2012', '6 Oak Parkway', '885 164 1542', 'VP', 'KHMT', 132, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (426, 'Bernita Damiral', 'Nu', '25-08-2014', '15 School Junction', '128 811 0889', 'VP', 'KHMT', 117, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (427, 'Domingo Argile', 'Nam', '11-04-2011', '88 Everett Plaza', '950 187 0917', 'VP', 'HTTT', 134, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (428, 'Anne-corinne Burbury', 'Nam', '22-05-2005', '8833 Mayer Avenue', '605 530 9841', 'CLC', 'KHDL', 120, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (429, 'Bertie Keegan', 'Nu', '05-09-2012', '0110 Dwight Park', '524 480 8019', 'CLC', 'CNTT', 135, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (430, 'Ruggiero Hemphall', 'Nu', '14-04-2002', '95 Morningstar Point', '811 127 6505', 'CQ', 'CNTT', 120, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (431, 'Babara Kelling', 'Nam', '28-02-2009', '92119 Duke Street', '648 662 1526', 'CLC', 'HTTT', 107, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (432, 'Norry Schulkins', 'Nam', '20-05-2016', '52308 Sachs Circle', '246 600 6833', 'VP', 'CNPM', 113, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (433, 'Ulrika Ragbourn', 'Nu', '19-05-2005', '90582 Huxley Park', '590 802 3071', 'CQ', 'HTTT', 109, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (434, 'Kerry Greenly', 'Nu', '21-08-2004', '5 Jenna Court', '149 129 1994', 'CLC', 'CNPM', 102, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (435, 'Roseline Bamfield', 'Nu', '05-09-2012', '3042 Coleman Alley', '187 679 7974', 'CQ', 'KHDL', 124, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (436, 'Sherlock Rain', 'Nam', '21-05-2016', '04 International Hill', '805 588 1723', 'CLC', 'CNPM', 124, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (437, 'Nertie Atthow', 'Nam', '17-11-2015', '932 Carberry Terrace', '140 867 6234', 'CLC', 'HTTT', 113, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (438, 'Connor Oleszczak', 'Nu', '11-10-2003', '0987 Delladonna Hill', '990 749 6292', 'CQ', 'HTTT', 109, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (439, 'Minda Merfin', 'Nam', '27-07-2010', '679 Ramsey Plaza', '127 411 4725', 'VP', 'CNTT', 131, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (440, 'Franky Chaim', 'Nu', '22-12-2019', '1 Lake View Circle', '705 112 3527', 'CQ', 'KHDL', 134, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (441, 'Aristotle Denisot', 'Nu', '18-06-2017', '0 Blaine Avenue', '388 768 4912', 'VP', 'HTTT', 130, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (442, 'Boote Niemetz', 'Nam', '14-09-2016', '9407 Northridge Avenue', '371 142 2904', 'CQ', 'CNTT', 111, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (443, 'Del Karlolak', 'Nu', '18-10-2001', '6 Duke Avenue', '268 535 0213', 'CQ', 'KHDL', 131, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (444, 'Delilah Dyerson', 'Nam', '28-03-2013', '874 Village Terrace', '921 330 3366', 'VP', 'KHMT', 107, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (445, 'Bondie Tutchell', 'Nu', '09-06-2009', '4 Arrowood Terrace', '191 569 6740', 'CLC', 'CNPM', 123, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (446, 'Genevra Cromarty', 'Nu', '28-01-2017', '28517 Eagan Hill', '337 639 3775', 'CLC', 'CNTT', 116, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (447, 'Phillipp Caush', 'Nam', '16-05-2019', '41090 Fairview Place', '413 255 4097', 'CQ', 'HTTT', 102, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (448, 'Renaud Scoterbosh', 'Nam', '02-09-2008', '3 Lakewood Gardens Place', '811 845 6304', 'CQ', 'KHMT', 125, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (449, 'Hillary Yon', 'Nu', '06-12-2004', '0 Hanover Point', '851 546 4454', 'CQ', 'CNPM', 123, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (450, 'Alaric Inge', 'Nu', '09-03-2006', '920 Troy Parkway', '567 884 5676', 'CLC', 'HTTT', 126, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (451, 'Burton Durnin', 'Nam', '07-11-2011', '70 Sommers Pass', '851 195 3387', 'VP', 'HTTT', 131, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (452, 'Chariot Hairesnape', 'Nu', '12-04-2015', '7194 Hanover Plaza', '544 421 5796', 'CQ', 'KHDL', 135, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (453, 'Amalie Martinat', 'Nu', '18-04-2013', '07323 Moose Crossing', '781 149 8449', 'VP', 'KHMT', 130, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (454, 'Tripp Snoday', 'Nu', '03-02-2016', '50498 Springview Avenue', '938 882 9425', 'VP', 'KHDL', 118, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (455, 'Rip Thorley', 'Nu', '21-03-2014', '71340 Old Gate Point', '788 732 8354', 'VP', 'KHDL', 136, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (456, 'Lucien De Winton', 'Nam', '19-07-2008', '8 Larry Place', '807 619 2509', 'CQ', 'KHDL', 101, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (457, 'Jarid Jales', 'Nam', '14-09-2020', '08 Brentwood Parkway', '321 669 0764', 'CQ', 'KHMT', 110, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (458, 'Maria Fehners', 'Nu', '07-06-2017', '6 Forster Crossing', '880 292 8252', 'VP', 'CNTT', 137, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (459, 'Rosamund Torregiani', 'Nam', '07-03-2015', '44 Shelley Crossing', '909 763 7256', 'VP', 'CNTT', 129, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (460, 'Denys Jaquemar', 'Nu', '16-11-2009', '9 Merchant Park', '757 854 9773', 'CQ', 'KHDL', 100, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (461, 'Dennison Durbridge', 'Nu', '06-01-2003', '401 Declaration Avenue', '581 885 4639', 'VP', 'CNTT', 113, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (462, 'Samuel Renac', 'Nam', '25-01-2021', '25 Upham Lane', '603 612 8100', 'CLC', 'KHDL', 122, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (463, 'Jewell Chesney', 'Nu', '03-11-2017', '044 Fallview Plaza', '142 605 3039', 'CQ', 'CNPM', 127, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (464, 'Arden Angove', 'Nu', '10-10-2001', '56 Spenser Point', '257 583 3086', 'CQ', 'HTTT', 127, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (465, 'Reine Curwood', 'Nu', '23-03-2013', '6 Hanson Plaza', '329 615 3636', 'CLC', 'KHMT', 127, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (466, 'Thedrick Giddings', 'Nu', '23-05-2013', '42045 Merrick Pass', '203 375 9933', 'CQ', 'CNPM', 134, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (467, 'Melany Blaasch', 'Nu', '04-05-2010', '2 Hintze Way', '247 193 9268', 'CQ', 'KHDL', 108, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (468, 'Joshua Upshall', 'Nam', '22-07-2010', '29742 Scofield Alley', '906 398 9837', 'VP', 'KHMT', 115, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (469, 'Nestor Millhill', 'Nam', '31-12-2004', '837 Kedzie Plaza', '459 412 3446', 'CLC', 'CNTT', 134, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (470, 'Shir Philipart', 'Nam', '25-12-2001', '8 Miller Avenue', '733 122 6032', 'CQ', 'KHDL', 135, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (471, 'Ashien Paoletti', 'Nam', '16-11-2002', '4695 Schlimgen Alley', '994 797 5470', 'CLC', 'CNPM', 137, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (472, 'Lilla Turbefield', 'Nu', '25-01-2016', '68 Twin Pines Court', '314 734 7295', 'CQ', 'CNTT', 114, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (473, 'Perice Fidgett', 'Nam', '30-10-2008', '5 Porter Plaza', '208 662 7732', 'VP', 'CNTT', 127, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (474, 'Tamiko Anderbrugge', 'Nam', '22-05-2017', '4 Sherman Park', '780 650 1022', 'CLC', 'KHMT', 130, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (475, 'Konstantin Crottagh', 'Nu', '06-09-2005', '038 Boyd Alley', '724 715 5571', 'VP', 'CNTT', 135, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (476, 'Krystyna Rosling', 'Nu', '14-09-2022', '0528 Redwing Point', '912 590 0371', 'VP', 'CNTT', 136, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (477, 'Eleonora Willavize', 'Nam', '22-01-2014', '409 Bellgrove Plaza', '268 342 5845', 'VP', 'KHMT', 127, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (478, 'Teresina Cubbit', 'Nam', '18-06-2017', '3 Forest Run Center', '803 565 4819', 'CLC', 'CNTT', 104, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (479, 'Devlin Karolowski', 'Nu', '19-05-2010', '7091 Melrose Street', '583 274 5056', 'CLC', 'HTTT', 115, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (480, 'Griffie Antosch', 'Nam', '14-08-2012', '980 Thackeray Street', '649 197 2133', 'VP', 'CNTT', 132, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (481, 'Gualterio Johantges', 'Nam', '04-06-2004', '45 Cardinal Center', '958 974 9705', 'CLC', 'KHDL', 118, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (482, 'Clareta Budgett', 'Nam', '07-12-2018', '10 Dorton Avenue', '244 909 6554', 'VP', 'HTTT', 131, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (483, 'Verina Francescone', 'Nu', '14-06-2005', '72 Esch Park', '838 729 2281', 'CLC', 'CNPM', 129, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (484, 'Magdalene Hamman', 'Nam', '08-02-2007', '6 Browning Street', '745 815 3230', 'CLC', 'CNTT', 106, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (485, 'Brockie Zannutti', 'Nu', '15-03-2008', '17 Northfield Center', '873 898 6391', 'VP', 'CNTT', 101, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (486, 'Melisent Giffaut', 'Nu', '08-05-2019', '54511 Hauk Terrace', '701 665 6346', 'CQ', 'KHDL', 127, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (487, 'Maryanne Corkish', 'Nu', '30-01-2009', '918 Fulton Park', '838 702 9858', 'VP', 'HTTT', 112, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (488, 'Herschel Jimes', 'Nam', '27-10-2011', '86603 Rusk Drive', '946 509 4459', 'CQ', 'KHMT', 106, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (489, 'Elmo Ossulton', 'Nam', '29-04-2000', '9 Mcbride Drive', '285 682 5695', 'CQ', 'CNPM', 125, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (490, 'Frederica Faulder', 'Nam', '25-07-2019', '376 High Crossing Avenue', '930 385 1018', 'VP', 'KHMT', 134, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (491, 'Denna Liptrod', 'Nam', '20-03-2024', '2 Di Loreto Alley', '304 935 3792', 'CLC', 'HTTT', 102, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (492, 'Bartholomeus Mattingson', 'Nam', '13-05-2003', '37501 Westridge Street', '277 771 5464', 'CLC', 'KHDL', 137, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (493, 'Massimo Bengtsson', 'Nam', '02-11-2015', '0073 Mitchell Road', '193 710 2869', 'CLC', 'CNTT', 132, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (494, 'Aila Beade', 'Nu', '16-08-2017', '5491 Fallview Park', '609 974 0493', 'VP', 'KHDL', 133, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (495, 'Robbyn Shimman', 'Nu', '17-03-2018', '737 Menomonie Park', '292 787 8532', 'CQ', 'KHMT', 132, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (496, 'Tuck Grief', 'Nu', '23-02-2012', '1878 La Follette Place', '417 478 8415', 'VP', 'KHDL', 125, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (497, 'Lynnea Desforges', 'Nam', '04-03-2023', '0 Meadow Ridge Point', '290 266 3348', 'CQ', 'HTTT', 132, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (498, 'Clara Latter', 'Nam', '27-11-2020', '11 Hallows Junction', '415 774 4599', 'CLC', 'KHDL', 128, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (499, 'Bradford Lieber', 'Nu', '23-10-2016', '56 Briar Crest Avenue', '558 375 4534', 'CLC', 'KHMT', 136, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (500, 'Fallon Kiljan', 'Nam', '25-06-2002', '464 Waywood Court', '930 115 3819', 'CQ', 'CNPM', 123, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (501, 'Mallorie Dils', 'Nam', '02-09-2017', '1 Caliangt Center', '862 759 1951', 'CLC', 'HTTT', 110, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (502, 'Anet Gynne', 'Nu', '25-02-2011', '369 Swallow Court', '178 283 8859', 'CQ', 'KHMT', 112, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (503, 'Morten Carnow', 'Nu', '10-08-2016', '7 Melvin Point', '320 189 6958', 'CLC', 'CNTT', 100, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (504, 'Leda Deverall', 'Nam', '08-08-2012', '52599 Karstens Point', '474 476 4173', 'CLC', 'KHMT', 135, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (505, 'Alvy Wetton', 'Nam', '14-05-2016', '7206 Kropf Street', '433 456 8424', 'CQ', 'CNTT', 135, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (506, 'Erwin Warstall', 'Nam', '22-08-2008', '1 Logan Road', '419 350 4045', 'CQ', 'CNTT', 104, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (507, 'Saxe Ralph', 'Nu', '24-02-2013', '37 Golf View Court', '826 544 0731', 'CLC', 'KHMT', 100, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (508, 'Pearle Pauer', 'Nu', '16-06-2015', '10412 Fairview Street', '995 531 0820', 'CLC', 'CNTT', 126, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (509, 'Avrit Nan Carrow', 'Nu', '18-09-2020', '1310 Golf View Center', '851 218 0790', 'CQ', 'KHMT', 126, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (510, 'Nikolas Darinton', 'Nu', '16-08-2008', '6479 Johnson Plaza', '937 420 0766', 'CLC', 'CNTT', 129, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (511, 'Hephzibah Philippe', 'Nam', '15-11-2012', '5 Del Mar Junction', '774 956 3762', 'CQ', 'KHDL', 123, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (512, 'Clare Loweth', 'Nam', '07-09-2010', '1023 Ridge Oak Place', '143 512 2094', 'CQ', 'KHMT', 120, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (513, 'Bunny Brimley', 'Nu', '23-06-2021', '7808 Knutson Street', '507 938 8544', 'CQ', 'KHMT', 103, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (514, 'Farlee Yardy', 'Nu', '24-11-2020', '607 Sunbrook Pass', '855 565 5351', 'VP', 'CNTT', 133, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (515, 'Rudolfo D''Avaux', 'Nam', '16-12-2019', '5717 4th Crossing', '767 707 0525', 'CQ', 'KHDL', 115, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (516, 'Yasmeen Gatlin', 'Nu', '04-08-2021', '7659 Packers Junction', '642 180 4787', 'CQ', 'KHMT', 134, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (517, 'Marius Mompesson', 'Nu', '08-11-2019', '44 Arrowood Park', '631 617 5740', 'CLC', 'KHMT', 121, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (518, 'Dixie Jachimczak', 'Nu', '12-02-2006', '4810 Browning Hill', '666 137 8028', 'CQ', 'CNTT', 120, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (519, 'Mikel Byrde', 'Nu', '24-03-2020', '26775 Mayer Street', '413 336 4578', 'CQ', 'KHDL', 114, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (520, 'Ellen Roome', 'Nu', '19-10-2008', '5781 Monument Center', '367 219 9187', 'CQ', 'KHDL', 129, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (521, 'Letitia Chritchley', 'Nu', '13-04-2012', '14427 Susan Center', '961 900 9891', 'CLC', 'KHMT', 111, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (522, 'Ludovika Simioni', 'Nu', '05-07-2006', '8 Stoughton Lane', '389 835 3884', 'CLC', 'KHMT', 114, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (523, 'Karol Hellmore', 'Nu', '03-12-2014', '3 Sycamore Center', '635 491 0090', 'CQ', 'CNTT', 135, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (524, 'Audrey Castagna', 'Nam', '07-10-2010', '2 Stuart Lane', '682 566 4781', 'CLC', 'CNPM', 138, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (525, 'Evelina Delgado', 'Nam', '21-07-2003', '6156 Sommers Place', '205 563 5485', 'CQ', 'KHMT', 117, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (526, 'Adriane Kleinmann', 'Nam', '11-09-2003', '03 Linden Parkway', '716 608 8475', 'VP', 'KHMT', 108, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (527, 'Dietrich Standish-Brooks', 'Nam', '25-01-2001', '52084 West Circle', '677 627 8180', 'CQ', 'CNTT', 102, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (528, 'Ford MacDermid', 'Nam', '07-10-2021', '367 Blue Bill Park Crossing', '605 719 5381', 'VP', 'CNTT', 100, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (529, 'Ewell Carratt', 'Nam', '31-05-2021', '33099 Troy Lane', '457 883 2975', 'CLC', 'KHDL', 126, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (530, 'Marietta Dominguez', 'Nu', '11-03-2018', '9936 Cordelia Point', '124 418 7613', 'CQ', 'KHMT', 120, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (531, 'Darsey Rassmann', 'Nu', '05-08-2017', '5 Sunnyside Road', '473 641 6492', 'CLC', 'KHDL', 135, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (532, 'Godfrey Flewett', 'Nam', '04-04-2017', '10346 6th Center', '646 924 4963', 'CQ', 'HTTT', 111, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (533, 'Goran Clitheroe', 'Nu', '31-03-2010', '473 Towne Hill', '411 940 3399', 'CQ', 'CNPM', 136, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (534, 'Gene Thomlinson', 'Nu', '05-05-2017', '040 Springview Plaza', '166 485 1850', 'VP', 'CNPM', 134, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (535, 'Hilarius Nucciotti', 'Nam', '13-07-2003', '2 Montana Park', '945 760 2219', 'CQ', 'CNTT', 106, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (536, 'Loraine Koop', 'Nu', '16-06-2007', '55773 Upham Terrace', '897 863 4127', 'CQ', 'HTTT', 117, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (537, 'Bride Goldberg', 'Nam', '30-07-2008', '26 Jay Parkway', '859 230 9727', 'CLC', 'HTTT', 105, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (538, 'Carce Hearfield', 'Nam', '03-01-2014', '5207 Pine View Junction', '980 366 2962', 'CQ', 'CNTT', 126, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (539, 'Carter Fliege', 'Nam', '01-05-2014', '8941 Dorton Junction', '397 658 4698', 'VP', 'HTTT', 138, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (540, 'Hildegarde Poynzer', 'Nam', '22-05-2015', '780 Bartelt Trail', '823 908 6897', 'CQ', 'CNTT', 127, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (541, 'Issiah Walentynowicz', 'Nu', '25-11-2004', '6 Annamark Road', '411 788 7276', 'VP', 'CNPM', 99, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (542, 'Marcello Shane', 'Nu', '10-05-2020', '07 Menomonie Parkway', '857 980 1755', 'CQ', 'CNPM', 125, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (543, 'Bogart Hatliffe', 'Nu', '30-11-2007', '0 Commercial Alley', '184 401 7492', 'VP', 'CNTT', 112, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (544, 'Karlen Yerborn', 'Nam', '10-05-2008', '3 Luster Way', '932 321 0769', 'CLC', 'KHMT', 128, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (545, 'Pascal Dicker', 'Nam', '28-01-2007', '06091 Twin Pines Road', '155 921 3194', 'CLC', 'CNPM', 110, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (546, 'Libbie Ubsdell', 'Nam', '26-05-2018', '868 Schlimgen Way', '972 760 6815', 'VP', 'CNTT', 104, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (547, 'Roseanna Alesio', 'Nu', '15-08-2012', '0380 Nevada Park', '139 214 6250', 'CLC', 'CNPM', 115, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (548, 'Kenton Silliman', 'Nu', '21-11-2018', '0412 Karstens Junction', '827 260 1132', 'CLC', 'KHMT', 123, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (549, 'Den Ions', 'Nu', '09-08-2023', '46 Kipling Trail', '578 577 0826', 'VP', 'KHMT', 105, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (550, 'Sherm Jorry', 'Nu', '23-09-2014', '7506 Springview Crossing', '177 967 2809', 'CQ', 'CNTT', 120, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (551, 'Golda Noir', 'Nam', '20-06-2022', '9 Laurel Terrace', '592 733 3469', 'CQ', 'HTTT', 107, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (552, 'Danit McClifferty', 'Nam', '25-06-2001', '7137 Cambridge Lane', '822 768 0516', 'CQ', 'CNPM', 110, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (553, 'Gerald Sprowle', 'Nu', '02-05-2016', '46564 Becker Circle', '688 535 0971', 'CQ', 'HTTT', 106, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (554, 'Rochelle Cotterel', 'Nu', '29-07-2018', '44 Buhler Terrace', '438 646 8604', 'VP', 'KHMT', 132, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (555, 'Jojo O''Reilly', 'Nu', '29-04-2003', '1 Clove Hill', '713 623 6014', 'VP', 'CNTT', 120, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (556, 'Dar Baudy', 'Nu', '21-04-2006', '50 Menomonie Alley', '524 768 6194', 'CLC', 'KHMT', 104, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (557, 'Alexina Huot', 'Nu', '19-11-2015', '5174 Sage Way', '818 570 4997', 'VP', 'KHMT', 132, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (558, 'Vale Deighan', 'Nu', '05-01-2018', '618 Chinook Avenue', '999 464 0802', 'CQ', 'KHDL', 131, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (559, 'Gardner McGonigal', 'Nam', '01-10-2000', '48 Sloan Junction', '916 758 2477', 'CLC', 'HTTT', 99, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (560, 'Brandtr Peacher', 'Nam', '01-02-2016', '479 Anniversary Trail', '267 512 9217', 'CLC', 'KHMT', 115, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (561, 'Beniamino Dixon', 'Nu', '18-01-2011', '17 Dexter Way', '181 733 7011', 'CLC', 'HTTT', 122, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (562, 'Clo Branford', 'Nam', '15-12-2001', '0693 Mallard Place', '723 210 8882', 'CQ', 'KHMT', 136, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (563, 'Tammy Mapson', 'Nu', '05-04-2004', '4915 Carberry Alley', '350 554 4293', 'CQ', 'KHMT', 110, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (564, 'Ford Brotherhed', 'Nam', '10-02-2002', '8616 Brentwood Junction', '881 190 0591', 'CLC', 'HTTT', 100, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (565, 'Moreen Guwer', 'Nam', '19-10-2005', '158 Raven Parkway', '698 947 6353', 'CQ', 'KHDL', 116, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (566, 'Talbert Dimmer', 'Nu', '03-10-2018', '0260 Delladonna Lane', '529 289 5534', 'CQ', 'HTTT', 112, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (567, 'Daryle Warham', 'Nam', '05-04-2005', '50425 Lyons Alley', '894 740 9082', 'CQ', 'KHMT', 127, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (568, 'Harv Purvey', 'Nu', '14-02-2019', '31 Forest Court', '580 661 0838', 'CQ', 'HTTT', 116, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (569, 'Bernita Heater', 'Nu', '29-10-2015', '5060 Drewry Center', '783 990 4826', 'CLC', 'CNTT', 114, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (570, 'Aeriell Bakster', 'Nu', '06-01-2006', '509 Fallview Way', '614 568 0051', 'CQ', 'KHMT', 109, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (571, 'Oona Habershon', 'Nam', '14-11-2017', '4 Tomscot Park', '176 337 4522', 'CQ', 'HTTT', 130, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (572, 'Myrilla Bransdon', 'Nu', '05-02-2019', '57 Redwing Junction', '627 201 9598', 'CQ', 'CNPM', 117, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (573, 'Peggi Jewiss', 'Nu', '20-11-2002', '36426 Artisan Plaza', '211 115 5140', 'VP', 'HTTT', 111, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (574, 'Corey Bezant', 'Nu', '25-08-2014', '0 Cambridge Place', '639 614 7996', 'CLC', 'CNPM', 102, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (575, 'Evangelia Swatheridge', 'Nu', '21-09-2000', '2699 Towne Parkway', '627 343 4390', 'VP', 'CNTT', 131, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (576, 'Reeba Foxton', 'Nu', '15-09-2012', '07762 Rutledge Way', '520 373 4093', 'CQ', 'KHDL', 111, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (577, 'Lidia Crackett', 'Nu', '21-10-2016', '3762 Dakota Lane', '190 418 2985', 'VP', 'CNPM', 130, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (578, 'Theo Scarman', 'Nu', '20-10-2006', '840 Hollow Ridge Way', '205 729 9520', 'VP', 'KHMT', 111, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (579, 'Clair Pickup', 'Nam', '13-01-2019', '5847 Quincy Avenue', '628 336 4278', 'VP', 'KHDL', 117, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (580, 'Heloise Matzel', 'Nam', '05-06-2013', '42200 Michigan Junction', '222 854 2823', 'CQ', 'CNPM', 105, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (581, 'Magdaia Long', 'Nam', '19-09-2006', '481 Surrey Crossing', '655 291 8070', 'CLC', 'HTTT', 110, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (582, 'Andros Brownsworth', 'Nam', '17-09-2002', '0 Hanson Alley', '964 647 3122', 'CQ', 'CNPM', 121, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (583, 'Noble Shottin', 'Nam', '22-08-2021', '50 Manitowish Plaza', '671 988 7466', 'CLC', 'CNPM', 126, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (584, 'Siana Meadowcroft', 'Nam', '05-06-2015', '54326 American Park', '753 196 2944', 'CLC', 'CNPM', 132, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (585, 'Laverne Fearnehough', 'Nu', '08-08-2015', '77262 Talmadge Lane', '411 750 5167', 'CQ', 'KHMT', 127, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (586, 'Nye Ayce', 'Nam', '23-06-2010', '9368 Thierer Avenue', '354 782 6912', 'CLC', 'KHMT', 124, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (587, 'Haskell Vear', 'Nam', '17-08-2013', '6 Blue Bill Park Plaza', '943 683 1186', 'CLC', 'HTTT', 130, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (588, 'Simonne Boatman', 'Nu', '07-02-2010', '9944 Arrowood Street', '847 205 8478', 'CQ', 'KHMT', 112, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (589, 'Abner Toal', 'Nu', '30-03-2019', '604 Blue Bill Park Park', '322 717 0498', 'CLC', 'KHMT', 105, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (590, 'Honey Euels', 'Nu', '15-11-2013', '85573 Crest Line Point', '381 158 2102', 'CQ', 'KHMT', 106, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (591, 'Menard Duiguid', 'Nu', '21-12-2014', '9876 Eagan Center', '594 838 3508', 'VP', 'CNTT', 125, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (592, 'Kit Matuszewski', 'Nam', '19-07-2017', '318 Columbus Lane', '500 215 4336', 'CQ', 'HTTT', 112, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (593, 'Cal Blackett', 'Nu', '29-01-2006', '25402 Prairieview Junction', '479 940 4943', 'CQ', 'CNTT', 127, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (594, 'Kerwin Swett', 'Nam', '03-08-2013', '2383 Dexter Circle', '150 893 0991', 'CLC', 'CNTT', 104, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (595, 'Fina Druhan', 'Nu', '28-01-2022', '50358 Dapin Street', '668 936 8794', 'CQ', 'KHMT', 117, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (596, 'Lyndel Maiklem', 'Nam', '14-02-2007', '00 Springs Parkway', '648 317 7307', 'CQ', 'CNTT', 120, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (597, 'Estel Swepson', 'Nu', '26-11-2009', '41513 Alpine Park', '213 806 8813', 'CLC', 'CNPM', 121, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (598, 'Trefor Fergyson', 'Nu', '23-06-2014', '86 Thompson Alley', '956 252 8991', 'CQ', 'CNPM', 132, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (599, 'Aimil Buxsy', 'Nu', '09-03-2017', '87 Kingsford Street', '578 852 3688', 'CLC', 'KHDL', 136, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (600, 'Frasier Kemp', 'Nu', '04-12-2013', '7536 Mariners Cove Trail', '619 258 7261', 'CQ', 'KHMT', 125, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (601, 'Suzy Ovington', 'Nam', '24-10-2012', '49 Judy Avenue', '309 664 1574', 'CLC', 'HTTT', 136, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (602, 'Cirillo Allmann', 'Nam', '01-07-2013', '4266 Sherman Place', '518 291 5381', 'VP', 'KHDL', 136, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (603, 'Ahmed Fursey', 'Nu', '19-01-2016', '3620 Montana Point', '695 428 4804', 'VP', 'HTTT', 108, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (604, 'Tanya Cisco', 'Nam', '04-12-2001', '4 Forest Road', '344 851 6816', 'CQ', 'HTTT', 120, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (605, 'Dom McMechan', 'Nam', '06-12-2015', '97078 Grayhawk Avenue', '839 432 8137', 'VP', 'HTTT', 113, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (606, 'Alfredo Godbert', 'Nu', '27-09-2019', '12 Longview Circle', '728 478 4245', 'VP', 'CNPM', 108, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (607, 'Vito Gieves', 'Nu', '08-11-2010', '51505 Northwestern Place', '861 208 5423', 'CLC', 'KHMT', 136, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (608, 'Chucho Saiger', 'Nu', '05-05-2021', '177 Cordelia Trail', '563 224 8909', 'VP', 'CNPM', 117, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (609, 'Cass Minihane', 'Nu', '30-10-2007', '4243 Morningstar Pass', '675 749 4722', 'VP', 'CNTT', 101, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (610, 'Martina Vaughn', 'Nam', '29-05-2010', '379 Lukken Point', '701 936 2522', 'CLC', 'HTTT', 120, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (611, 'Arv Kondrachenko', 'Nu', '18-07-2023', '98 Veith Way', '473 256 5298', 'CLC', 'CNTT', 102, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (612, 'Marillin Ducham', 'Nam', '19-12-2000', '66 Manufacturers Park', '418 542 0381', 'CQ', 'CNTT', 102, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (613, 'Alisun Costello', 'Nu', '08-04-2007', '3 8th Center', '297 443 1609', 'CQ', 'KHDL', 126, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (614, 'Arvy Cecil', 'Nu', '29-12-2012', '46 Prentice Way', '414 369 2795', 'CLC', 'HTTT', 119, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (615, 'Chaddy Delacroix', 'Nam', '07-11-2000', '303 Hauk Alley', '149 807 6947', 'CQ', 'HTTT', 106, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (616, 'Clementina Bortolussi', 'Nam', '04-01-2009', '5 Norway Maple Alley', '817 211 4583', 'CQ', 'HTTT', 100, 9.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (617, 'Marshal Jilkes', 'Nam', '24-03-2005', '6689 Anhalt Trail', '691 129 5607', 'VP', 'KHDL', 106, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (618, 'Robenia Antonognoli', 'Nam', '02-08-2004', '197 Moulton Street', '582 752 9064', 'CLC', 'CNPM', 133, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (619, 'Magda Parcall', 'Nam', '20-05-2000', '7134 Eastlawn Plaza', '631 143 8817', 'VP', 'KHDL', 125, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (620, 'Conroy Fruish', 'Nu', '04-11-2002', '78254 Graceland Center', '479 229 6762', 'CLC', 'CNPM', 100, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (621, 'Delia Pothecary', 'Nu', '17-12-2009', '779 Bunting Plaza', '230 832 7940', 'CLC', 'CNPM', 137, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (622, 'Julina Mandell', 'Nu', '19-06-2016', '873 Northview Parkway', '816 569 2384', 'VP', 'CNTT', 109, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (623, 'Karon Sirett', 'Nu', '18-12-2018', '53732 Browning Way', '631 631 7425', 'VP', 'KHMT', 126, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (624, 'Moyra Galpin', 'Nam', '17-09-2002', '77156 Eliot Center', '162 610 6040', 'CQ', 'CNPM', 117, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (625, 'Onfre Dearle-Palser', 'Nu', '02-09-2012', '29 School Terrace', '251 328 8540', 'VP', 'CNPM', 130, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (626, 'Suzie Loosely', 'Nam', '17-08-2011', '746 Westridge Avenue', '820 525 4561', 'CQ', 'KHMT', 133, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (627, 'Madonna Piggford', 'Nam', '30-01-2020', '38 Mallory Junction', '994 347 1820', 'VP', 'CNTT', 114, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (628, 'Willow Pittel', 'Nu', '03-04-2003', '52 Jackson Drive', '630 896 2675', 'CQ', 'HTTT', 131, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (629, 'Gaven Gallen', 'Nam', '02-08-2023', '9745 Warbler Street', '169 565 0801', 'VP', 'KHDL', 129, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (630, 'Marieann Priddle', 'Nu', '10-08-2000', '16 Bay Avenue', '155 845 4780', 'CLC', 'KHDL', 110, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (631, 'Mavis Sneath', 'Nu', '14-09-2020', '35058 Mcbride Lane', '601 728 7424', 'VP', 'HTTT', 128, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (632, 'Sibeal Cartmill', 'Nu', '15-06-2014', '56429 Welch Street', '523 783 9189', 'CLC', 'HTTT', 101, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (633, 'Gwynne Turfs', 'Nu', '20-11-2006', '63 Gateway Drive', '865 442 6602', 'VP', 'KHMT', 104, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (634, 'Alex Pawel', 'Nu', '22-04-2012', '01 Hollow Ridge Road', '406 199 4035', 'VP', 'KHDL', 116, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (635, 'Amelia Jayme', 'Nam', '06-02-2007', '0602 Nova Way', '556 482 2444', 'CLC', 'HTTT', 116, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (636, 'Harrie Murray', 'Nam', '30-12-2007', '4 Hauk Trail', '374 853 7097', 'VP', 'CNPM', 107, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (637, 'Alejandro Clemson', 'Nam', '14-08-2013', '45 Village Alley', '206 394 9228', 'CLC', 'KHMT', 128, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (638, 'Kimbra Frank', 'Nu', '09-08-2002', '3022 Jay Drive', '923 196 5198', 'VP', 'KHMT', 130, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (639, 'Ashton Swabey', 'Nam', '26-10-2012', '00511 Rieder Street', '161 266 4545', 'VP', 'CNPM', 102, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (640, 'Diarmid Kydd', 'Nam', '05-04-2011', '962 Moose Crossing', '187 912 2810', 'CQ', 'HTTT', 132, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (641, 'Carlee Frigot', 'Nam', '06-03-2018', '9 Utah Avenue', '246 312 2152', 'VP', 'HTTT', 116, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (642, 'Coleen Vasishchev', 'Nu', '12-08-2011', '7142 Springs Avenue', '106 525 5591', 'CQ', 'KHMT', 107, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (643, 'Boyd Cole', 'Nam', '18-10-2006', '916 Upham Parkway', '326 865 2512', 'CQ', 'KHDL', 121, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (644, 'Sayer Filppetti', 'Nu', '11-11-2004', '85 Ryan Hill', '694 620 0961', 'VP', 'HTTT', 106, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (645, 'Lemmie Liddyard', 'Nam', '16-08-2008', '46394 Corry Trail', '428 824 3771', 'CLC', 'KHMT', 133, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (646, 'Ronnie Rumke', 'Nam', '02-04-2007', '667 Alpine Court', '197 856 3185', 'VP', 'KHDL', 134, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (647, 'Cherrita Yurchenko', 'Nu', '12-03-2011', '73835 Pankratz Trail', '686 935 1294', 'CQ', 'CNTT', 129, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (648, 'Benjamen Hendin', 'Nam', '29-01-2001', '7088 Emmet Hill', '438 183 8287', 'CLC', 'CNTT', 138, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (649, 'Marcela Sambrook', 'Nam', '23-04-2022', '8 Kropf Hill', '378 398 3090', 'VP', 'HTTT', 136, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (650, 'Dolf Waddicor', 'Nam', '14-08-2019', '2604 Schmedeman Trail', '307 598 1982', 'VP', 'HTTT', 108, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (651, 'Flss Saer', 'Nam', '25-03-2014', '70957 Monument Crossing', '272 749 8790', 'VP', 'HTTT', 99, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (652, 'Chane Morrieson', 'Nu', '14-12-2011', '41 Bluejay Hill', '853 129 0307', 'VP', 'CNTT', 110, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (653, 'Thurstan MacGuffog', 'Nu', '26-04-2011', '6 Graceland Plaza', '997 777 6351', 'CLC', 'KHDL', 99, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (654, 'Yorgos Lantoph', 'Nu', '08-11-2004', '86418 Namekagon Parkway', '179 660 4842', 'VP', 'KHDL', 128, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (655, 'Levy Whelan', 'Nam', '09-10-2013', '53657 Leroy Drive', '282 933 4996', 'CLC', 'HTTT', 132, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (656, 'Thacher Lennarde', 'Nam', '07-05-2016', '66 Ronald Regan Drive', '179 492 0995', 'VP', 'KHMT', 136, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (657, 'Ingmar Saphir', 'Nam', '21-01-2008', '6344 Comanche Drive', '985 864 8871', 'VP', 'KHDL', 100, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (658, 'Huberto Knowlden', 'Nu', '20-11-2023', '1 Briar Crest Circle', '386 532 3241', 'VP', 'CNPM', 109, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (659, 'Alikee Piddocke', 'Nam', '03-01-2016', '561 Clyde Gallagher Way', '199 629 4711', 'VP', 'KHDL', 125, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (660, 'Hatty Rodd', 'Nam', '22-01-2002', '5335 Granby Avenue', '525 997 4894', 'VP', 'KHMT', 131, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (661, 'Vincents Goodlad', 'Nam', '20-01-2022', '0084 Eagle Crest Junction', '872 222 4988', 'CLC', 'KHMT', 137, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (662, 'Glenn Crayden', 'Nu', '08-08-2004', '61056 Scoville Street', '970 916 3367', 'CLC', 'CNTT', 133, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (663, 'Rita Goulbourn', 'Nam', '10-01-2011', '3 Dexter Circle', '853 518 4974', 'CLC', 'CNTT', 127, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (664, 'Brandais Snarie', 'Nam', '06-01-2003', '896 Fallview Street', '576 746 0220', 'CLC', 'HTTT', 104, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (665, 'Deny Rosenberger', 'Nu', '14-05-2002', '688 Spohn Avenue', '821 407 0516', 'CQ', 'CNPM', 105, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (666, 'Gawain Colnet', 'Nu', '19-06-2011', '02 Brown Circle', '647 497 3567', 'VP', 'CNPM', 136, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (667, 'Sheelagh Giddy', 'Nam', '24-01-2007', '408 Jay Junction', '782 390 8841', 'CLC', 'CNPM', 137, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (668, 'Bernadina Buckmaster', 'Nam', '26-04-2018', '265 3rd Alley', '733 323 8107', 'VP', 'KHDL', 138, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (669, 'Elna Jewel', 'Nam', '11-05-2002', '80 Helena Junction', '632 718 9507', 'CLC', 'KHDL', 110, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (670, 'Archibaldo Ratie', 'Nu', '09-03-2013', '86541 Hintze Alley', '212 769 2821', 'VP', 'CNPM', 120, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (671, 'Melitta Whieldon', 'Nam', '21-08-2009', '9 Sullivan Point', '689 409 1376', 'VP', 'KHDL', 115, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (672, 'Aylmer Creeboe', 'Nam', '25-09-2001', '180 Park Meadow Way', '554 433 5531', 'CQ', 'KHMT', 102, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (673, 'Brianna Healks', 'Nu', '17-01-2024', '41 Northfield Drive', '731 314 2747', 'CLC', 'HTTT', 134, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (674, 'Riane Cheley', 'Nam', '16-06-2011', '90 Sommers Point', '864 594 5819', 'CQ', 'CNPM', 102, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (675, 'Erminia Gini', 'Nam', '24-10-2004', '13 Granby Circle', '876 526 0706', 'VP', 'CNPM', 126, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (676, 'Ansel Staneland', 'Nu', '21-03-2004', '39061 Lindbergh Pass', '666 990 1782', 'CQ', 'CNPM', 101, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (677, 'Casandra Karlmann', 'Nu', '26-02-2003', '276 Elmside Circle', '598 751 3043', 'CQ', 'KHDL', 127, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (678, 'Julita Thairs', 'Nam', '21-07-2017', '782 Mcbride Parkway', '388 121 0430', 'CLC', 'CNPM', 128, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (679, 'Sibella Wightman', 'Nam', '11-04-2022', '1533 Magdeline Lane', '316 128 0188', 'VP', 'CNPM', 132, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (680, 'Romonda Kermon', 'Nu', '09-11-2009', '03621 Sage Crossing', '842 713 9588', 'CLC', 'CNPM', 100, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (681, 'Iggy de Mullett', 'Nu', '27-11-2007', '9 Waubesa Center', '355 251 3877', 'VP', 'CNPM', 112, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (682, 'Kipper Holywell', 'Nu', '20-09-2006', '9620 Ludington Plaza', '412 517 3660', 'VP', 'CNTT', 112, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (683, 'Rusty Thorrington', 'Nam', '01-04-2012', '4 Lillian Way', '479 270 9083', 'VP', 'CNPM', 134, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (684, 'Loralee Weekley', 'Nu', '11-03-2022', '506 Vernon Alley', '847 610 5978', 'VP', 'KHMT', 136, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (685, 'Corny Aysh', 'Nu', '25-09-2004', '236 Butterfield Hill', '530 174 6207', 'CLC', 'KHMT', 104, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (686, 'Rollie Fiennes', 'Nu', '21-11-2011', '7523 Hoepker Trail', '376 521 0382', 'CLC', 'HTTT', 132, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (687, 'Kit Stanbra', 'Nam', '27-02-2003', '65 Roth Avenue', '518 668 2002', 'CLC', 'CNPM', 102, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (688, 'Juliana Mabbott', 'Nam', '26-01-2006', '15541 Lien Hill', '872 336 9664', 'CQ', 'KHDL', 103, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (689, 'Jeanette Donaghy', 'Nam', '30-01-2009', '600 Little Fleur Park', '870 560 8538', 'CLC', 'KHDL', 105, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (690, 'Carola Lester', 'Nam', '14-02-2009', '55 Shoshone Trail', '477 500 2865', 'CQ', 'HTTT', 101, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (691, 'Tomas Labdon', 'Nu', '28-01-2021', '63444 Rowland Hill', '723 180 3462', 'VP', 'CNTT', 129, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (692, 'Maximilian Campelli', 'Nu', '24-11-2009', '0 Maryland Place', '308 798 3115', 'CQ', 'CNPM', 137, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (693, 'Addy Cicero', 'Nu', '18-06-2021', '835 Jackson Street', '411 166 0402', 'VP', 'HTTT', 99, 9.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (694, 'Michele Brownsill', 'Nu', '17-02-2000', '7 Autumn Leaf Avenue', '679 185 2457', 'VP', 'KHDL', 104, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (695, 'Nadia Grigolashvill', 'Nu', '03-04-2007', '5316 Brown Plaza', '597 680 4101', 'VP', 'HTTT', 125, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (696, 'Perceval Mc Comb', 'Nam', '14-08-2013', '5467 Hermina Alley', '420 514 3417', 'VP', 'KHMT', 106, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (697, 'Jaclyn Mateiko', 'Nam', '01-09-2016', '9 Stoughton Park', '672 156 2528', 'CQ', 'HTTT', 113, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (698, 'Xever Zealey', 'Nam', '14-01-2015', '1 David Crossing', '439 150 6981', 'CLC', 'KHDL', 99, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (699, 'Angeli Cockland', 'Nu', '29-07-2021', '7 Sullivan Drive', '702 664 8940', 'CQ', 'KHMT', 135, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (700, 'Bealle Carbery', 'Nu', '17-03-2017', '9 Pleasure Point', '387 877 3333', 'CQ', 'KHMT', 102, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (701, 'Gordy Herkess', 'Nam', '05-09-2008', '65 Glacier Hill Circle', '856 105 3060', 'CLC', 'KHMT', 104, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (702, 'Simonne Brotheridge', 'Nu', '05-12-2013', '38742 Continental Park', '131 427 4589', 'CLC', 'CNTT', 137, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (703, 'Gal Zieme', 'Nu', '28-04-2015', '5991 Vahlen Court', '526 206 3638', 'CLC', 'KHMT', 138, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (704, 'Adlai Twiname', 'Nu', '18-10-2008', '98628 Sauthoff Way', '687 693 1530', 'CQ', 'CNTT', 102, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (705, 'Cross Poletto', 'Nu', '25-09-2006', '77 Pearson Way', '769 139 2598', 'CLC', 'CNTT', 129, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (706, 'Laurence Berendsen', 'Nu', '17-03-2014', '011 South Alley', '881 451 3724', 'CQ', 'HTTT', 108, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (707, 'Corie Joll', 'Nam', '21-07-2017', '5 Loeprich Street', '609 389 3377', 'CQ', 'HTTT', 104, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (708, 'Adi Rubinlicht', 'Nam', '16-01-2014', '8 Mosinee Pass', '804 192 5812', 'VP', 'KHMT', 100, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (709, 'Harwilll Suggett', 'Nu', '19-01-2009', '26734 Union Crossing', '209 463 8983', 'CQ', 'KHMT', 104, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (710, 'Druci Morrallee', 'Nam', '29-07-2013', '2876 Heffernan Drive', '702 167 3837', 'CQ', 'KHDL', 103, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (711, 'Mill Birk', 'Nam', '01-02-2000', '001 Continental Plaza', '171 592 7109', 'VP', 'HTTT', 133, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (712, 'Tawnya Divina', 'Nam', '14-08-2014', '09 Granby Avenue', '303 936 7607', 'VP', 'KHMT', 137, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (713, 'Tab Rushmere', 'Nu', '28-05-2023', '28160 Vera Park', '747 253 4837', 'VP', 'HTTT', 137, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (714, 'Penelopa Hadley', 'Nam', '17-07-2022', '78 Norway Maple Place', '925 394 9096', 'VP', 'CNTT', 131, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (715, 'Payton Phizackarley', 'Nam', '15-05-2020', '313 Fuller Crossing', '154 604 6646', 'VP', 'CNPM', 109, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (716, 'Leonardo Pine', 'Nam', '12-04-2023', '9367 Rutledge Alley', '213 304 8419', 'VP', 'KHDL', 130, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (717, 'Frieda Slatcher', 'Nu', '20-02-2015', '6 Coolidge Hill', '759 848 4493', 'CLC', 'CNTT', 137, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (718, 'Megen Sinncock', 'Nu', '08-10-2006', '45253 Fulton Circle', '954 619 7135', 'CLC', 'CNPM', 105, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (719, 'Nicole Saladine', 'Nam', '13-03-2023', '4 Kedzie Trail', '521 338 6509', 'CLC', 'KHDL', 138, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (720, 'Wang Goldson', 'Nu', '11-10-2021', '94980 Brown Circle', '846 426 1462', 'CLC', 'HTTT', 134, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (721, 'Amble Thorouggood', 'Nu', '14-03-2017', '53353 Arkansas Avenue', '574 865 3341', 'CQ', 'KHDL', 116, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (722, 'Rodolfo Dellatorre', 'Nu', '14-05-2011', '9 Pine View Point', '251 720 7473', 'VP', 'CNPM', 134, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (723, 'Kermy McClelland', 'Nu', '01-08-2009', '5 Sage Circle', '174 493 3053', 'CQ', 'CNPM', 101, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (724, 'Channa Bradmore', 'Nam', '20-03-2004', '2278 Burning Wood Trail', '312 898 3123', 'CLC', 'HTTT', 107, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (725, 'Orsa Dunsmuir', 'Nam', '08-03-2011', '4582 Tomscot Trail', '258 730 3022', 'CLC', 'KHDL', 116, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (726, 'Mikael Towne', 'Nu', '17-01-2024', '511 Dexter Point', '464 682 3646', 'CLC', 'KHDL', 122, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (727, 'Herc Bullivent', 'Nam', '09-10-2014', '48426 Schiller Circle', '695 825 3071', 'CLC', 'KHMT', 126, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (728, 'Weider Barnhill', 'Nu', '30-04-2005', '5 Shopko Street', '662 656 2608', 'VP', 'CNPM', 136, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (729, 'Alastair MacGhee', 'Nam', '13-01-2002', '57148 Scott Street', '545 171 3936', 'CLC', 'HTTT', 108, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (730, 'Robby Jevon', 'Nam', '09-12-2013', '621 Ridgeview Hill', '938 880 6633', 'CQ', 'KHDL', 129, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (731, 'Celia Voller', 'Nam', '17-02-2006', '4 Stoughton Avenue', '909 881 6667', 'VP', 'CNPM', 101, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (732, 'Hamilton Rushforth', 'Nu', '17-12-2013', '26104 Loeprich Avenue', '689 852 6511', 'CLC', 'CNPM', 124, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (733, 'Hercule Warwick', 'Nam', '27-04-2003', '88 Artisan Crossing', '684 317 4717', 'VP', 'CNPM', 129, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (734, 'Kylila Chaves', 'Nam', '11-06-2018', '6 Orin Way', '902 860 0416', 'VP', 'KHMT', 133, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (735, 'Georgette Chatters', 'Nam', '27-05-2004', '3 Brickson Park Court', '205 466 0363', 'CLC', 'KHMT', 106, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (736, 'Gwendolyn Rahl', 'Nu', '02-03-2006', '58 Glendale Crossing', '336 388 8243', 'CLC', 'HTTT', 116, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (737, 'Arabelle Meakes', 'Nu', '11-11-2013', '6659 West Road', '599 603 9558', 'VP', 'CNTT', 121, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (738, 'Ravi Renn', 'Nam', '11-03-2000', '8378 Badeau Park', '558 795 0193', 'VP', 'HTTT', 125, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (739, 'Van Cromie', 'Nu', '21-11-2007', '05656 Pennsylvania Street', '436 426 8030', 'VP', 'KHDL', 115, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (740, 'Clarence Punton', 'Nam', '19-01-2023', '60615 Cardinal Street', '156 402 8010', 'CLC', 'CNTT', 122, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (741, 'Brander Birkhead', 'Nam', '14-04-2002', '8 Fallview Pass', '113 121 5272', 'VP', 'CNTT', 109, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (742, 'Gabi Eseler', 'Nu', '19-09-2020', '25759 Saint Paul Circle', '354 792 2328', 'CQ', 'CNPM', 121, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (743, 'Findley Winterton', 'Nu', '03-12-2013', '45635 Waubesa Way', '388 780 8126', 'CQ', 'KHMT', 138, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (744, 'Tedda Thurstance', 'Nu', '10-02-2003', '2096 New Castle Junction', '963 233 3479', 'VP', 'CNTT', 123, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (745, 'Fax Whitemarsh', 'Nam', '04-06-2017', '40068 Jana Point', '588 563 5490', 'VP', 'CNPM', 123, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (746, 'Etti Badam', 'Nu', '07-05-2020', '4 Declaration Drive', '300 210 2539', 'CLC', 'KHMT', 105, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (747, 'Ciro Tripon', 'Nu', '07-04-2015', '6 West Parkway', '709 394 6842', 'CLC', 'KHMT', 117, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (748, 'Jereme Skitterel', 'Nu', '09-05-2001', '8096 Kingsford Avenue', '248 166 1050', 'VP', 'CNTT', 108, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (749, 'Abbott Sweeney', 'Nu', '02-04-2019', '941 Shasta Way', '591 648 0133', 'CQ', 'HTTT', 109, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (750, 'Deeanne Sambells', 'Nu', '14-07-2019', '9 Holy Cross Point', '664 661 1603', 'VP', 'KHDL', 138, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (751, 'Ernesta Harrold', 'Nu', '02-08-2001', '34 Walton Center', '447 294 2912', 'CQ', 'KHDL', 132, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (752, 'Codi Janu', 'Nam', '10-05-2016', '1 Kedzie Drive', '228 755 2454', 'CQ', 'KHMT', 113, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (753, 'Charleen Foucher', 'Nu', '19-10-2006', '27899 Forest Run Park', '400 449 5834', 'VP', 'HTTT', 135, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (754, 'Lloyd Van Arsdall', 'Nam', '28-03-2015', '081 Artisan Terrace', '853 470 0321', 'CQ', 'HTTT', 112, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (755, 'Rosalinda Waldie', 'Nu', '30-03-2007', '39146 Spaight Drive', '673 635 9796', 'CLC', 'CNTT', 109, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (756, 'Ingemar Pepperd', 'Nu', '19-05-2004', '11 7th Parkway', '744 274 6041', 'CQ', 'HTTT', 118, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (757, 'Sean Yeats', 'Nu', '14-12-2014', '764 Bayside Place', '991 970 6005', 'CLC', 'KHDL', 116, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (758, 'Elaina Decourt', 'Nu', '31-03-2020', '51 Eliot Point', '879 601 3359', 'CLC', 'CNPM', 123, 9.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (759, 'Jamal Chatain', 'Nam', '10-07-2023', '0 Killdeer Court', '960 346 3008', 'CQ', 'KHMT', 100, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (760, 'Crysta Girardy', 'Nam', '30-12-2008', '8 Oakridge Parkway', '343 473 7175', 'CLC', 'KHMT', 133, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (761, 'Erick Perazzo', 'Nam', '11-07-2009', '9904 Pond Trail', '739 534 7693', 'VP', 'CNTT', 120, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (762, 'Lori Quarrie', 'Nam', '18-04-2011', '01842 Darwin Parkway', '971 769 7358', 'VP', 'HTTT', 132, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (763, 'Doroteya McAdam', 'Nu', '16-05-2019', '7775 Johnson Circle', '355 467 5443', 'CQ', 'CNPM', 138, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (764, 'Dorothea Liddiard', 'Nu', '10-10-2003', '2 Gerald Crossing', '322 474 6355', 'CQ', 'CNPM', 122, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (765, 'Tammara Puddefoot', 'Nu', '28-01-2013', '09 Barnett Park', '997 165 1783', 'VP', 'HTTT', 126, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (766, 'Titus Stopforth', 'Nam', '01-11-2015', '01 Elmside Alley', '333 910 5866', 'CQ', 'KHDL', 99, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (767, 'Eldridge Triplet', 'Nu', '06-06-2017', '4739 Norway Maple Lane', '796 553 5037', 'CLC', 'CNTT', 131, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (768, 'Isabelle Cromwell', 'Nam', '12-01-2019', '694 Burrows Lane', '234 449 9566', 'CLC', 'KHDL', 111, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (769, 'Madelle Walbrook', 'Nu', '30-03-2007', '9 Carpenter Circle', '580 278 5478', 'CQ', 'CNPM', 113, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (770, 'Marabel Peschka', 'Nu', '26-07-2004', '27326 Waubesa Terrace', '717 776 8211', 'VP', 'CNTT', 125, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (771, 'Goldina Limmer', 'Nu', '25-01-2024', '850 Carey Point', '153 609 4165', 'CLC', 'CNPM', 101, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (772, 'Creigh Lazer', 'Nu', '23-12-2013', '17 Farwell Plaza', '794 250 5721', 'CQ', 'KHMT', 133, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (773, 'Claretta Gladdifh', 'Nu', '02-03-2005', '88098 Blue Bill Park Junction', '190 578 0203', 'CQ', 'CNTT', 126, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (774, 'Butch Lockett', 'Nu', '21-06-2007', '5589 Meadow Ridge Court', '311 368 3548', 'CLC', 'KHMT', 107, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (775, 'Lodovico Canfer', 'Nam', '27-02-2009', '64427 Ridgeway Alley', '728 391 9276', 'CQ', 'CNPM', 112, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (776, 'Llywellyn Ellit', 'Nu', '14-10-2016', '7 Schlimgen Trail', '106 263 6337', 'CQ', 'KHDL', 105, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (777, 'Liana Paxman', 'Nu', '12-02-2000', '0 Scott Trail', '655 105 4601', 'CQ', 'CNTT', 127, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (778, 'Kaitlin Staterfield', 'Nu', '11-12-2005', '50756 Lyons Lane', '775 344 4033', 'CQ', 'KHMT', 113, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (779, 'Denise Jedrzejewsky', 'Nam', '26-09-2021', '84958 Holmberg Point', '555 325 3707', 'CLC', 'CNTT', 108, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (780, 'Lorraine Westhead', 'Nu', '07-11-2022', '230 Ridgeview Road', '823 784 5017', 'CLC', 'CNTT', 138, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (781, 'Dulsea Halton', 'Nam', '10-12-2020', '3378 Hansons Lane', '980 564 0569', 'CLC', 'KHMT', 103, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (782, 'Ibbie Heinke', 'Nam', '15-08-2012', '6125 Cherokee Park', '671 916 4195', 'CQ', 'CNTT', 120, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (783, 'Hogan Innocent', 'Nu', '01-11-2004', '9 Eggendart Parkway', '614 844 8330', 'CLC', 'KHDL', 115, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (784, 'Jill Tweedie', 'Nam', '20-04-2022', '87 Pankratz Parkway', '811 463 8668', 'CLC', 'CNTT', 127, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (785, 'Margret Nise', 'Nam', '25-12-2009', '95 Talmadge Trail', '106 204 3377', 'CQ', 'CNTT', 138, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (786, 'Evangelia Hintzer', 'Nam', '27-06-2020', '76826 Monument Lane', '137 742 0934', 'CQ', 'KHDL', 115, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (787, 'Rochester Perazzo', 'Nam', '10-12-2010', '784 Grover Way', '925 816 8838', 'CQ', 'KHDL', 131, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (788, 'Ingar Halegarth', 'Nu', '02-07-2018', '0233 Scofield Trail', '424 561 8775', 'VP', 'CNTT', 101, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (789, 'Kippy Higgen', 'Nu', '10-08-2008', '4 Carey Alley', '997 453 4835', 'CQ', 'KHMT', 118, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (790, 'Gratiana Hartright', 'Nu', '03-10-2004', '73 Stoughton Way', '441 196 0316', 'CQ', 'KHMT', 121, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (791, 'Derick Priscott', 'Nu', '05-04-2004', '597 Summer Ridge Drive', '491 764 3329', 'VP', 'HTTT', 111, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (792, 'Caroljean Frances', 'Nam', '02-05-2013', '275 Dayton Drive', '859 317 6554', 'CQ', 'KHMT', 131, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (793, 'Marie-jeanne Bent', 'Nu', '11-03-2020', '4417 Pepper Wood Road', '605 949 5257', 'VP', 'HTTT', 119, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (794, 'Kai Conew', 'Nu', '28-03-2020', '2 Tomscot Pass', '668 396 6510', 'CLC', 'CNTT', 120, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (795, 'Idalina Bartolomivis', 'Nu', '07-11-2019', '3 Carioca Street', '396 718 0257', 'VP', 'KHMT', 125, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (796, 'Valentia Whear', 'Nam', '04-12-2012', '348 Meadow Vale Drive', '284 909 2480', 'CLC', 'KHMT', 128, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (797, 'Jammie Desforges', 'Nam', '09-04-2007', '001 Algoma Lane', '669 194 4500', 'VP', 'KHDL', 138, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (798, 'Malcolm Tudor', 'Nam', '10-06-2023', '4737 Holy Cross Avenue', '689 629 9773', 'CQ', 'KHMT', 110, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (799, 'Saxon Pendlington', 'Nam', '16-12-2006', '124 Muir Pass', '544 454 7149', 'CQ', 'KHDL', 122, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (800, 'Niko Eldritt', 'Nu', '15-08-2022', '61264 La Follette Junction', '748 635 3385', 'CQ', 'KHDL', 127, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (801, 'Ervin Holtum', 'Nam', '19-11-2008', '570 Straubel Center', '272 850 2909', 'CQ', 'CNPM', 135, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (802, 'Gaylor Theriot', 'Nam', '20-09-2018', '53 Mayfield Road', '530 400 8387', 'VP', 'KHMT', 137, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (803, 'Antone Dungey', 'Nam', '15-02-2014', '5576 Lotheville Way', '705 560 9811', 'CLC', 'KHDL', 115, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (804, 'Fayette Chapier', 'Nu', '20-07-2014', '40 Pond Circle', '463 128 6661', 'VP', 'KHDL', 106, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (805, 'Tyrone Eagers', 'Nam', '28-08-2020', '8530 5th Center', '874 845 2877', 'CLC', 'KHDL', 126, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (806, 'Sydelle Brandt', 'Nu', '14-03-2008', '57739 Golf Course Center', '990 555 6015', 'VP', 'KHMT', 134, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (807, 'Konstanze Lerego', 'Nu', '28-11-2022', '103 South Crossing', '512 312 9470', 'CQ', 'KHMT', 108, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (808, 'Drake Colisbe', 'Nam', '08-12-2021', '0284 Mcguire Court', '499 403 5402', 'CQ', 'CNTT', 132, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (809, 'Karalee Lemmanbie', 'Nu', '03-07-2001', '0438 Warner Way', '351 818 5955', 'CQ', 'HTTT', 130, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (810, 'Theodora Axell', 'Nam', '03-11-2014', '1 East Place', '586 792 4226', 'CLC', 'KHMT', 133, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (811, 'Ripley Fairfull', 'Nam', '31-08-2011', '5843 Kenwood Alley', '497 913 4294', 'CQ', 'CNPM', 132, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (812, 'Zitella Bartot', 'Nam', '10-02-2010', '3321 Sloan Pass', '497 165 8133', 'CQ', 'KHMT', 121, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (813, 'Sunshine Maggiori', 'Nam', '02-06-2002', '51 Meadow Vale Center', '538 512 4219', 'CLC', 'CNPM', 134, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (814, 'Bone Grimston', 'Nam', '09-01-2007', '9 Spohn Center', '343 282 7872', 'VP', 'HTTT', 116, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (815, 'Cody Hand', 'Nam', '31-03-2008', '4 Fallview Alley', '215 218 0587', 'CLC', 'KHMT', 110, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (816, 'Charlene MacDowall', 'Nu', '18-09-2009', '1988 Barby Terrace', '705 937 3337', 'CQ', 'KHDL', 138, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (817, 'Yorke Clerc', 'Nam', '03-02-2018', '3593 Lighthouse Bay Parkway', '745 619 2591', 'CLC', 'HTTT', 122, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (818, 'Stormi Swede', 'Nu', '03-05-2003', '42 Buena Vista Point', '243 362 2471', 'CLC', 'CNPM', 134, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (819, 'Cleo Davydychev', 'Nam', '08-04-2012', '9 Gale Street', '860 663 7497', 'VP', 'CNTT', 130, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (820, 'Zelda Swaton', 'Nam', '01-01-2011', '8498 Norway Maple Street', '499 125 5396', 'VP', 'HTTT', 111, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (821, 'Sullivan Mouland', 'Nu', '19-11-2001', '70492 Continental Terrace', '216 208 6445', 'CLC', 'HTTT', 114, 9.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (822, 'Conroy Gilfoy', 'Nam', '12-12-2017', '72336 Homewood Crossing', '555 189 1562', 'VP', 'KHDL', 104, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (823, 'Graehme Zaniolo', 'Nu', '28-08-2002', '1376 Beilfuss Circle', '179 250 7568', 'CQ', 'HTTT', 100, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (824, 'Spense Vondrasek', 'Nu', '16-04-2005', '819 Ronald Regan Alley', '976 537 2472', 'CLC', 'KHDL', 110, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (825, 'Yehudi Spilsbury', 'Nam', '25-02-2020', '7 Schurz Pass', '449 350 8114', 'CQ', 'KHDL', 103, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (826, 'Prudence Frackiewicz', 'Nam', '05-08-2001', '6452 Elgar Terrace', '628 301 9032', 'CQ', 'KHDL', 127, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (827, 'Cthrine Growcott', 'Nam', '05-12-2020', '374 Onsgard Plaza', '786 302 7442', 'CLC', 'KHDL', 119, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (828, 'Margery Nail', 'Nu', '23-03-2007', '773 Manley Street', '472 917 6884', 'VP', 'HTTT', 112, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (829, 'Hewet Davis', 'Nu', '27-05-2007', '26 Eliot Circle', '830 229 3219', 'CLC', 'CNPM', 113, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (830, 'Donalt Asplen', 'Nam', '24-05-2009', '205 Elgar Way', '665 545 5455', 'CQ', 'HTTT', 120, 9.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (831, 'Lita Chitham', 'Nu', '30-09-2009', '304 Tony Way', '234 124 5323', 'CQ', 'CNTT', 122, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (832, 'Ashby Tosney', 'Nam', '11-12-2020', '24 Montana Drive', '779 387 5388', 'VP', 'KHMT', 108, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (833, 'Janice Littefair', 'Nu', '22-03-2024', '2188 High Crossing Lane', '600 867 8803', 'CQ', 'CNPM', 99, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (834, 'Murdoch Pottberry', 'Nam', '14-05-2011', '9863 Farragut Pass', '188 991 0908', 'VP', 'KHMT', 115, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (835, 'Kellie Attril', 'Nu', '16-04-2018', '8212 Prairie Rose Alley', '569 723 0019', 'CLC', 'HTTT', 118, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (836, 'Ferguson Arnoult', 'Nam', '26-11-2023', '9121 Westerfield Alley', '472 791 3343', 'CLC', 'KHDL', 106, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (837, 'Imogen Vigors', 'Nu', '29-11-2013', '11022 Melby Hill', '822 286 8801', 'CLC', 'CNPM', 125, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (838, 'Kassi Gullam', 'Nam', '12-09-2001', '71500 Jackson Crossing', '476 927 4542', 'CLC', 'CNPM', 138, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (839, 'Burl Bernon', 'Nam', '26-07-2005', '12 Eagle Crest Circle', '126 925 2735', 'VP', 'CNTT', 131, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (840, 'Quinta McGeechan', 'Nam', '11-03-2016', '03 Graedel Trail', '772 940 0289', 'CQ', 'CNPM', 131, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (841, 'Elana Halahan', 'Nu', '14-10-2013', '292 Melby Drive', '710 922 5036', 'VP', 'HTTT', 138, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (842, 'Esma Alexsandrov', 'Nam', '13-04-2006', '5 Mallard Road', '933 612 3841', 'VP', 'KHMT', 117, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (843, 'Alfy Grew', 'Nam', '04-08-2012', '559 Truax Trail', '398 397 4742', 'CLC', 'KHDL', 112, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (844, 'Mahala Dinley', 'Nu', '15-07-2016', '4402 Ludington Court', '339 607 6332', 'VP', 'CNPM', 99, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (845, 'Dedra Saunter', 'Nam', '14-04-2016', '60 Hoffman Plaza', '380 796 1375', 'CQ', 'HTTT', 110, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (846, 'Tabbie Boylan', 'Nam', '26-02-2006', '34 Almo Drive', '209 954 3260', 'VP', 'CNPM', 109, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (847, 'Zaneta Ritson', 'Nam', '08-02-2010', '85 Wayridge Center', '261 801 0882', 'CLC', 'CNTT', 129, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (848, 'Isa Kinnane', 'Nu', '26-02-2019', '29605 Annamark Crossing', '716 284 4810', 'VP', 'CNPM', 99, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (849, 'Turner Mowlam', 'Nam', '04-05-2001', '7 Del Sol Drive', '858 488 7604', 'CQ', 'KHMT', 134, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (850, 'Claiborne Dack', 'Nu', '25-04-2002', '2 Grim Center', '834 953 2966', 'CQ', 'HTTT', 111, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (851, 'Ashby Jans', 'Nam', '06-10-2019', '095 Hoepker Parkway', '877 759 3608', 'CQ', 'KHMT', 118, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (852, 'Adrianna Kehir', 'Nam', '09-11-2021', '0 Tony Trail', '517 387 3764', 'VP', 'CNPM', 128, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (853, 'Magda Folliss', 'Nu', '07-12-2009', '364 Crescent Oaks Avenue', '483 760 3765', 'CLC', 'HTTT', 126, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (854, 'Pryce Angrove', 'Nam', '09-01-2013', '823 Dunning Park', '728 224 2537', 'CQ', 'KHDL', 126, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (855, 'Barry Honeyghan', 'Nam', '24-06-2020', '6 Schurz Pass', '100 107 3994', 'CQ', 'HTTT', 113, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (856, 'Feodor Ert', 'Nam', '15-06-2016', '82 Fallview Park', '490 657 7182', 'CQ', 'KHDL', 131, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (857, 'Betta Camplejohn', 'Nu', '02-03-2005', '28 8th Hill', '633 943 5256', 'VP', 'CNPM', 132, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (858, 'Isaiah Houlison', 'Nam', '30-05-2023', '6 Sauthoff Parkway', '889 814 3154', 'CQ', 'KHMT', 120, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (859, 'Clarinda McMurrugh', 'Nu', '08-09-2004', '9494 Scoville Point', '985 250 8070', 'CQ', 'CNTT', 109, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (860, 'Ruthann Sichardt', 'Nam', '14-11-2013', '65678 Susan Center', '891 247 9335', 'VP', 'HTTT', 116, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (861, 'Kendricks Pedrozzi', 'Nu', '04-06-2000', '73 Mccormick Drive', '329 480 8979', 'CQ', 'KHMT', 110, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (862, 'Vidovic Finlason', 'Nam', '27-04-2000', '26686 Onsgard Center', '575 834 1629', 'CQ', 'CNTT', 110, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (863, 'Lauralee Stonuary', 'Nam', '19-03-2008', '3611 Sloan Place', '871 481 6794', 'VP', 'KHMT', 137, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (864, 'Angelique Ede', 'Nu', '20-04-2016', '684 Bluejay Crossing', '860 209 5423', 'CQ', 'KHMT', 104, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (865, 'Webb Radnage', 'Nu', '17-03-2022', '6 High Crossing Hill', '865 342 9148', 'VP', 'KHDL', 118, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (866, 'Jenn Willars', 'Nu', '10-07-2019', '8145 Sachs Plaza', '123 668 2154', 'CQ', 'HTTT', 105, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (867, 'Mickie Gooding', 'Nam', '01-12-2019', '512 Atwood Junction', '919 238 9518', 'CLC', 'KHMT', 107, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (868, 'Amalie Synder', 'Nam', '31-12-2014', '7742 Namekagon Circle', '456 987 8117', 'CLC', 'HTTT', 110, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (869, 'Heather Thresher', 'Nu', '14-08-2001', '07 Maryland Center', '155 836 3863', 'CLC', 'KHMT', 105, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (870, 'Jesse Gregr', 'Nam', '15-06-2017', '62149 Susan Park', '475 526 6346', 'CQ', 'KHMT', 112, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (871, 'Brannon Townend', 'Nu', '22-08-2018', '90075 Ruskin Court', '660 183 1330', 'CLC', 'CNTT', 125, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (872, 'Donny Saker', 'Nu', '17-06-2016', '808 Derek Trail', '433 887 6746', 'CLC', 'KHDL', 125, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (873, 'Gerik Bedlington', 'Nu', '13-04-2002', '2997 Sherman Parkway', '879 300 1816', 'CLC', 'HTTT', 120, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (874, 'Trudey Nore', 'Nam', '03-11-2011', '9 Twin Pines Hill', '963 626 7787', 'CLC', 'KHDL', 122, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (875, 'Archibold Revan', 'Nu', '30-10-2008', '90177 Northview Court', '371 841 6286', 'VP', 'HTTT', 110, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (876, 'Jodee Jamary', 'Nu', '21-02-2011', '689 Jackson Park', '206 713 3173', 'CLC', 'HTTT', 132, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (877, 'Robena Hartshorn', 'Nu', '28-02-2013', '59 Lien Place', '352 169 2786', 'VP', 'HTTT', 130, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (878, 'Kinsley McKeighan', 'Nam', '20-12-2018', '6759 Loomis Parkway', '940 332 5193', 'CLC', 'CNTT', 117, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (879, 'Camellia Evitts', 'Nu', '12-02-2014', '7 Heffernan Center', '931 756 3446', 'CLC', 'HTTT', 122, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (880, 'Corrina Troctor', 'Nam', '26-08-2015', '86709 North Center', '202 963 5053', 'CLC', 'CNTT', 107, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (881, 'Ignace Cordero', 'Nam', '05-11-2003', '923 Upham Junction', '730 885 9652', 'CLC', 'HTTT', 103, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (882, 'Paulo Greep', 'Nu', '07-12-2009', '732 Iowa Circle', '425 618 9851', 'CLC', 'CNPM', 122, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (883, 'Joyan Pauncefoot', 'Nam', '04-11-2021', '131 Scott Drive', '881 551 1835', 'VP', 'HTTT', 104, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (884, 'Conant Yaxley', 'Nam', '14-10-2018', '7859 Little Fleur Junction', '740 374 8976', 'VP', 'KHDL', 105, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (885, 'Joelie Dowsing', 'Nu', '10-10-2007', '32282 Shasta Park', '819 361 5224', 'CLC', 'CNTT', 114, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (886, 'Brook Coplestone', 'Nam', '19-09-2014', '56527 Straubel Road', '704 939 7922', 'CLC', 'HTTT', 123, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (887, 'Paulie Rosenauer', 'Nu', '08-01-2002', '59112 Pepper Wood Plaza', '328 503 0318', 'VP', 'KHDL', 111, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (888, 'Drusy Westfield', 'Nu', '06-01-2013', '55642 Nobel Alley', '237 795 3112', 'CQ', 'CNPM', 116, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (889, 'Odell Athowe', 'Nu', '18-09-2019', '73 Amoth Terrace', '538 804 5919', 'VP', 'KHMT', 129, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (890, 'Wilmette Carlesi', 'Nu', '05-01-2003', '3120 Michigan Junction', '366 398 1715', 'CLC', 'CNTT', 102, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (891, 'Colette Rojahn', 'Nu', '09-03-2016', '67630 Nelson Point', '392 744 1640', 'CLC', 'HTTT', 118, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (892, 'Krissie Mitchely', 'Nam', '11-04-2007', '12585 Evergreen Avenue', '544 369 3442', 'CLC', 'KHDL', 105, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (893, 'Dylan Kitchiner', 'Nam', '28-04-2017', '0454 Vera Court', '825 193 7132', 'CQ', 'HTTT', 117, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (894, 'Lynde Gegay', 'Nam', '02-01-2001', '00181 Orin Point', '148 445 3120', 'VP', 'KHMT', 122, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (895, 'Shepperd Danskine', 'Nu', '25-09-2019', '20499 Moulton Pass', '651 210 7873', 'CQ', 'KHDL', 102, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (896, 'Wallis Kings', 'Nu', '16-03-2022', '64658 Manley Road', '438 800 2803', 'CLC', 'KHDL', 124, 8.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (897, 'Lev Wadforth', 'Nu', '08-03-2008', '6095 Schurz Lane', '452 890 3313', 'CQ', 'CNTT', 113, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (898, 'Karina Sindall', 'Nu', '27-03-2009', '119 Linden Pass', '778 214 1467', 'VP', 'KHDL', 134, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (899, 'Foster Skipworth', 'Nu', '09-10-2009', '6955 Corscot Point', '652 405 9895', 'CLC', 'HTTT', 123, 9.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (900, 'Humphrey Mansuer', 'Nam', '14-04-2021', '78404 Ryan Alley', '576 683 7852', 'VP', 'CNTT', 132, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (901, 'Corly Shipman', 'Nu', '20-06-2019', '88 Lawn Lane', '242 221 8537', 'CQ', 'KHDL', 116, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (902, 'Caye Dederich', 'Nam', '20-07-2017', '5 Pankratz Junction', '145 986 1182', 'VP', 'HTTT', 125, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (903, 'Wilhelm St. Louis', 'Nu', '24-09-2015', '799 Rutledge Alley', '405 998 3018', 'CLC', 'HTTT', 110, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (904, 'Vick McSorley', 'Nam', '28-03-2013', '9442 Sycamore Street', '714 870 0251', 'CQ', 'KHDL', 123, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (905, 'Kele Hallibone', 'Nam', '11-06-2018', '58 Goodland Alley', '104 277 4153', 'CLC', 'KHMT', 123, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (906, 'Lainey Raspin', 'Nu', '03-02-2018', '93 Lighthouse Bay Terrace', '830 162 3691', 'VP', 'CNPM', 127, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (907, 'Claire Hopfner', 'Nu', '22-12-2009', '9 Schlimgen Terrace', '471 382 9043', 'CQ', 'KHDL', 131, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (908, 'Cathleen Fouch', 'Nu', '12-04-2015', '6482 Ilene Court', '855 612 1420', 'CQ', 'CNTT', 110, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (909, 'Vilma Elnough', 'Nam', '26-03-2007', '6391 Clyde Gallagher Circle', '427 948 5803', 'VP', 'CNTT', 99, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (910, 'Shaylah Balharrie', 'Nam', '27-08-2009', '92464 Browning Crossing', '893 833 8996', 'VP', 'HTTT', 104, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (911, 'Delinda Godber', 'Nu', '25-05-2018', '7 Park Meadow Street', '529 387 4288', 'CQ', 'CNPM', 132, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (912, 'Malcolm Stainsby', 'Nu', '10-01-2014', '207 Clemons Way', '825 255 0358', 'CQ', 'CNPM', 109, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (913, 'Ashia Delicate', 'Nu', '29-08-2021', '269 Waywood Center', '742 767 3519', 'CQ', 'HTTT', 126, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (914, 'Camile Saffell', 'Nu', '06-12-2020', '62914 Johnson Parkway', '626 709 3029', 'CQ', 'CNTT', 116, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (915, 'Electra Finlator', 'Nu', '24-07-2014', '79568 Moland Avenue', '100 363 5540', 'CLC', 'CNTT', 128, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (916, 'Dominik Sallis', 'Nam', '20-03-2012', '1649 Gale Pass', '276 406 1483', 'CLC', 'HTTT', 125, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (917, 'Kittie Druce', 'Nam', '26-04-2001', '22370 Autumn Leaf Center', '333 211 7404', 'CLC', 'CNTT', 125, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (918, 'Stormi Belfit', 'Nu', '06-10-2011', '6 Troy Lane', '692 272 9439', 'VP', 'CNPM', 117, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (919, 'Laurice Ballin', 'Nu', '24-02-2018', '3 Bashford Lane', '847 591 7388', 'VP', 'KHMT', 126, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (920, 'Thorndike D''Adamo', 'Nu', '29-04-2007', '0758 Sachs Circle', '918 152 4945', 'VP', 'CNPM', 103, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (921, 'Juanita Kensett', 'Nam', '06-02-2004', '2156 Cascade Place', '554 689 5923', 'CLC', 'KHDL', 101, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (922, 'Pauly Poxon', 'Nam', '12-08-2021', '5 Loomis Drive', '727 684 2108', 'CLC', 'HTTT', 132, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (923, 'Sig Habbergham', 'Nam', '22-01-2019', '85 Carioca Alley', '397 549 2359', 'CQ', 'CNTT', 134, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (924, 'Korella Bortoluzzi', 'Nu', '08-11-2005', '3816 Sunfield Pass', '878 463 6744', 'CLC', 'CNPM', 134, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (925, 'Petronille Chimes', 'Nam', '25-04-2000', '93 Vermont Lane', '600 135 4609', 'CQ', 'CNTT', 117, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (926, 'Sumner Jentet', 'Nu', '14-07-2015', '738 Laurel Lane', '550 327 7122', 'VP', 'KHMT', 135, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (927, 'Lonee Vost', 'Nam', '05-06-2009', '15 Maywood Junction', '920 427 5337', 'CQ', 'CNTT', 125, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (928, 'Jessie Larrosa', 'Nam', '10-06-2015', '81760 Macpherson Hill', '929 396 7261', 'VP', 'KHDL', 138, 6.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (929, 'Yasmeen Jowle', 'Nu', '29-12-2008', '069 Bultman Avenue', '873 618 8920', 'VP', 'KHMT', 137, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (930, 'Emylee Gillivrie', 'Nu', '03-12-2010', '24 Caliangt Center', '440 303 2628', 'CLC', 'CNPM', 107, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (931, 'Rurik Gother', 'Nam', '02-09-2022', '182 Orin Point', '781 627 0945', 'VP', 'CNTT', 110, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (932, 'Nonnah Mish', 'Nu', '11-02-2000', '50 Eggendart Junction', '246 773 4062', 'CQ', 'CNTT', 128, 6.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (933, 'Ruddie Collister', 'Nu', '10-02-2022', '94 Arizona Point', '720 667 5118', 'CLC', 'KHDL', 109, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (934, 'Blair Agar', 'Nam', '27-07-2011', '5740 Sheridan Park', '834 357 1897', 'VP', 'KHMT', 135, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (935, 'Johanna Macconaghy', 'Nam', '25-10-2005', '8953 Packers Pass', '564 662 4952', 'VP', 'HTTT', 120, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (936, 'Quinn Basindale', 'Nam', '14-08-2021', '74968 Hansons Point', '107 879 5400', 'VP', 'CNPM', 110, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (937, 'Carleton Rhydderch', 'Nam', '16-08-2016', '9308 Autumn Leaf Alley', '983 855 0617', 'VP', 'HTTT', 101, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (938, 'Ida Tulloch', 'Nam', '09-09-2005', '3003 Ilene Drive', '589 341 0023', 'VP', 'HTTT', 109, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (939, 'Lanny Officer', 'Nu', '31-03-2008', '44023 Monica Place', '324 893 6317', 'CQ', 'KHDL', 108, 7.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (940, 'Marcelle Sainsbury', 'Nu', '15-11-2002', '74 Reindahl Lane', '207 788 3166', 'CLC', 'KHMT', 115, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (941, 'Deny Baiden', 'Nam', '10-09-2010', '27371 Dunning Junction', '603 852 2000', 'CQ', 'CNTT', 105, 7.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (942, 'Dale McCollum', 'Nam', '01-12-2022', '1383 Iowa Court', '432 555 8724', 'CLC', 'CNPM', 134, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (943, 'Valentino Kersting', 'Nu', '03-11-2003', '8 Havey Plaza', '216 820 9780', 'CLC', 'KHDL', 112, 7.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (944, 'Gerianne Niccolls', 'Nam', '10-11-2013', '75002 Sommers Avenue', '237 161 2426', 'CLC', 'HTTT', 103, 7.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (945, 'Gael Taleworth', 'Nu', '23-04-2016', '28 Kensington Hill', '102 576 7492', 'VP', 'KHMT', 124, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (946, 'Simmonds Gleed', 'Nam', '01-09-2003', '69566 Arkansas Way', '588 306 1892', 'CLC', 'CNTT', 121, 8.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (947, 'Nahum Speakman', 'Nam', '25-10-2000', '7 Forest Run Plaza', '727 658 9968', 'CLC', 'CNTT', 125, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (948, 'Norman Hammant', 'Nam', '15-05-2005', '42 Lake View Lane', '569 912 2304', 'CLC', 'KHDL', 129, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (949, 'Price Stoffer', 'Nu', '19-11-2012', '52123 Darwin Terrace', '723 947 0072', 'CQ', 'KHDL', 106, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (950, 'Iolanthe Jirousek', 'Nu', '30-01-2021', '655 Mayfield Plaza', '919 110 4073', 'VP', 'KHMT', 121, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (951, 'Gabrielle Givens', 'Nu', '20-12-2013', '256 Melody Crossing', '737 153 8523', 'CLC', 'CNTT', 128, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (952, 'Nap Mascall', 'Nam', '18-02-2001', '13 Pine View Place', '864 162 4733', 'VP', 'KHMT', 106, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (953, 'Davis Manginot', 'Nu', '11-02-2020', '18 Fulton Court', '579 687 3008', 'CLC', 'CNTT', 125, 8.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (954, 'Nance Braganca', 'Nu', '02-11-2019', '3 Vera Plaza', '762 448 3559', 'CLC', 'HTTT', 115, 9.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (955, 'Carissa Charnock', 'Nam', '16-09-2009', '355 Schlimgen Alley', '627 515 2714', 'VP', 'KHDL', 107, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (956, 'Joye Mendez', 'Nu', '06-05-2023', '6 Corben Lane', '866 817 3236', 'CQ', 'KHMT', 138, 7.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (957, 'Swen Mauchline', 'Nu', '09-06-2019', '4 Messerschmidt Circle', '741 748 0406', 'CQ', 'KHMT', 106, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (958, 'Erie Walmsley', 'Nam', '16-07-2011', '6614 Loeprich Circle', '299 665 8092', 'CLC', 'KHDL', 99, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (959, 'Archaimbaud Melvin', 'Nu', '06-04-2016', '17 Forster Avenue', '906 620 8672', 'CLC', 'KHMT', 108, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (960, 'Blancha Brodhead', 'Nu', '05-11-2001', '8896 Evergreen Circle', '587 959 0620', 'VP', 'KHMT', 126, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (961, 'Adelle Kenward', 'Nu', '09-02-2003', '38 Bunting Street', '185 434 6302', 'VP', 'CNPM', 102, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (962, 'Margeaux Beahan', 'Nu', '20-07-2021', '34849 Stephen Plaza', '715 232 9810', 'VP', 'KHDL', 123, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (963, 'Carlye Harback', 'Nam', '04-10-2008', '54 Randy Avenue', '627 875 3122', 'VP', 'KHDL', 137, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (964, 'Vanessa Moogan', 'Nu', '13-02-2019', '37 Eagan Crossing', '285 712 6207', 'VP', 'CNTT', 130, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (965, 'Spence Cheston', 'Nu', '05-04-2011', '2716 Del Mar Center', '749 556 4979', 'VP', 'CNTT', 127, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (966, 'Del Kobu', 'Nu', '23-12-2018', '15242 Cascade Street', '742 168 4515', 'VP', 'HTTT', 107, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (967, 'Zulema Oloshin', 'Nam', '03-08-2005', '59 Kim Terrace', '683 837 3787', 'VP', 'CNPM', 101, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (968, 'Chiarra Feldbrin', 'Nam', '04-06-2008', '4302 Northland Place', '969 385 1868', 'CLC', 'KHMT', 107, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (969, 'Almeda Aveyard', 'Nam', '11-05-2007', '02 Carberry Road', '501 610 2366', 'CQ', 'CNPM', 127, 7.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (970, 'Leopold Wawer', 'Nam', '23-09-2002', '0 Lyons Terrace', '728 333 4800', 'CLC', 'CNPM', 126, 6.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (971, 'Rycca Cluely', 'Nam', '11-06-2017', '44 Marquette Lane', '262 221 2204', 'VP', 'HTTT', 99, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (972, 'Miriam Barehead', 'Nam', '10-08-2006', '8010 Lawn Street', '595 291 7369', 'VP', 'CNPM', 125, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (973, 'Arline Vanini', 'Nam', '09-09-2002', '9535 Harper Crossing', '985 355 3807', 'CQ', 'HTTT', 122, 8.5);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (974, 'Sonya Shapero', 'Nam', '12-01-2007', '041 Sage Circle', '938 819 6559', 'VP', 'HTTT', 109, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (975, 'Zabrina Belasco', 'Nu', '14-05-2013', '1 Service Drive', '673 358 4928', 'VP', 'KHMT', 104, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (976, 'Donnamarie Gailor', 'Nam', '12-03-2011', '59 Gina Alley', '543 552 2322', 'CQ', 'KHMT', 112, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (977, 'Lowrance Adamovsky', 'Nu', '20-09-2018', '5147 Forster Alley', '692 239 3573', 'CLC', 'CNTT', 130, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (978, 'Janifer Ruste', 'Nam', '05-02-2013', '9117 Menomonie Hill', '183 755 3177', 'CQ', 'KHDL', 114, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (979, 'Garrot Tillett', 'Nam', '02-03-2016', '057 Ramsey Trail', '794 976 7139', 'CLC', 'CNTT', 119, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (980, 'Eudora Bigg', 'Nu', '25-05-2006', '3 Chinook Way', '957 802 0442', 'CLC', 'KHMT', 134, 8.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (981, 'Marta Label', 'Nu', '21-05-2006', '09 Hanson Park', '668 622 6128', 'CLC', 'HTTT', 101, 6.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (982, 'Isabel Scemp', 'Nam', '09-12-2019', '60973 Dexter Hill', '205 768 7209', 'VP', 'CNTT', 111, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (983, 'Milo Whyman', 'Nu', '18-02-2015', '8404 Warbler Crossing', '553 239 1599', 'CQ', 'KHMT', 116, 6.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (984, 'Jocelyn Gallety', 'Nam', '08-12-2012', '633 Northport Plaza', '619 783 8378', 'VP', 'CNPM', 113, 6.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (985, 'Hagan Bury', 'Nu', '06-04-2001', '75 Rigney Terrace', '170 964 4008', 'VP', 'HTTT', 122, 7.9);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (986, 'Lucienne Stirman', 'Nam', '23-01-2004', '20 La Follette Parkway', '511 163 5394', 'CQ', 'KHDL', 128, 8.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (987, 'Ofella Packham', 'Nu', '01-10-2013', '43067 Blue Bill Park Alley', '772 209 9413', 'CQ', 'KHMT', 132, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (988, 'Ella Bodiam', 'Nam', '30-07-2012', '7 Westport Terrace', '844 832 6029', 'VP', 'CNPM', 129, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (989, 'Elyse Finnes', 'Nam', '26-07-2008', '65821 Katie Drive', '332 555 6545', 'VP', 'HTTT', 135, 6.7);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (990, 'Erhard Sarginson', 'Nam', '25-05-2020', '835 Kinsman Trail', '395 740 0158', 'VP', 'CNTT', 135, 7.4);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (991, 'Amelina Willison', 'Nu', '03-10-2018', '258 Charing Cross Plaza', '439 752 6636', 'CQ', 'HTTT', 135, 7.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (992, 'Row Scarratt', 'Nu', '18-11-2005', '525 Acker Plaza', '450 314 9635', 'CQ', 'CNTT', 117, 6.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (993, 'Gussie Hansill', 'Nam', '27-05-2010', '6022 Dryden Junction', '615 808 1025', 'VP', 'CNTT', 114, 8.0);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (994, 'Artemus Bertelmot', 'Nam', '06-05-2016', '7 Warrior Point', '679 742 8269', 'CLC', 'CNPM', 138, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (995, 'Stephanie Dobbson', 'Nam', '26-11-2013', '25 Amoth Trail', '325 731 1988', 'VP', 'CNPM', 134, 8.8);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (996, 'Shae Keggin', 'Nam', '07-07-2012', '9 Havey Place', '829 475 7757', 'CQ', 'CNTT', 115, 6.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (997, 'Arther Potkin', 'Nam', '25-12-2000', '21374 Towne Circle', '549 232 1990', 'CLC', 'HTTT', 112, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (998, 'Michelina Bernolet', 'Nam', '07-10-2017', '51250 Reinke Way', '241 747 0656', 'CLC', 'HTTT', 107, 7.1);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (999, 'Kym Huzzey', 'Nu', '03-01-2010', '671 Killdeer Drive', '199 962 8138', 'CLC', 'KHDL', 110, 8.6);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values (1000, 'Stearne Belch', 'Nam', '08-04-2011', '41 5th Place', '206 527 8046', 'VP', 'HTTT', 114, 8.6);

insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values (1, 'GV001', 'HP100', 'HK1', '2023-2024', 'CLC', 8.1, 8.4, 6.8, 5.7);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values (2, 'GV008', 'HP085', 'HK2', '2023-2024', 'CLC', 9.0, 8.3, 7.0, 6.8);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values (3, 'GV003', 'HP120', 'HK3', '2023-2024', 'CQ', 9.7, 7.1, 7.6, 8.4);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values (4, 'GV006', 'HP075', 'HK1', '2023-2024', 'CLC', 6.2, 7.7, 6.4, 8.3);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values (5, 'GV008', 'HP090', 'HK2', '2023-2024', 'CLC', 6.0, 8.3, 6.5, 5.3);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values (6, 'GV003', 'HP110', 'HK3', '2023-2024', 'VP', 9.3, 5.5, 8.3, 6.8);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values (7, 'GV001', 'HP095', 'HK1', '2023-2024', 'VP', 7.4, 6.2, 10.0, 9.3);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values (8, 'GV001', 'HP105', 'HK2', '2023-2024', 'CQ', 6.1, 5.8, 8.9, 9.5);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values (9, 'GV004', 'HP080', 'HK3', '2023-2024', 'CQ', 9.7, 8.4, 9.4, 5.2);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values (10, 'GV002', 'HP115', 'HK1', '2023-2024', 'VP', 8.2, 7.9, 6.2, 5.3);


CREATE OR REPLACE PROCEDURE admin.GetAdminTables (p_cursor OUT SYS_REFCURSOR) IS
BEGIN
    OPEN p_cursor FOR
        SELECT table_name
        FROM all_tables
        WHERE owner = 'ADMIN';
END ;

CREATE OR REPLACE PROCEDURE admin.GetAllRole (p_cursor OUT SYS_REFCURSOR) IS
BEGIN
    OPEN p_cursor FOR
        SELECT granted_role as role
        FROM user_role_privs;
END ;

CREATE OR REPLACE FUNCTION admin.GrantOption(OBJ NVARCHAR2, TABLE_NAME VARCHAR2, PERMISSION VARCHAR2, GRTOPT BOOLEAN)
RETURN VARCHAR2
AS
STRSQL NVARCHAR2(2000);
BEGIN
    STRSQL := 'GRANT '|| PERMISSON ||' ON '|| TABLE_NAME ||' TO ' || OBJ ;
    IF (GRTOPT = TRUE)
    THEN STRSQL := STRSQL || ' WITH GRANT OPTION' ;
    EXECUTE IMMEDIATE (STRSQL);
    RETURN 'Grant successfully executed.';
    
EXCEPTION
  WHEN OTHERS THEN
    RETURN 'Error: ' || SQLERRM;
END;

CREATE OR REPLACE PROCEDURE admin.getAttributes (tablename in varchar2 ,p_cursor OUT SYS_REFCURSOR) IS
BEGIN
    OPEN p_cursor FOR
        SELECT column_name
        FROM all_tab_columns
        WHERE table_name = tablename;
END ;

DECLARE
    v_cursor SYS_REFCURSOR;
    v_column_name VARCHAR2(100); -- Assuming column names are within 100 characters
BEGIN
    -- Call the procedure
    getAttributes('DANG KY', v_cursor);
    
    -- Fetch data from the cursor
    LOOP
        FETCH v_cursor INTO v_column_name;
        EXIT WHEN v_cursor%NOTFOUND;
        -- Do something with the column name, for example, print it
        DBMS_OUTPUT.PUT_LINE('Column Name: ' || v_column_name);
    END LOOP;
    
    -- Close the cursor
    CLOSE v_cursor;
END;
alter session set "_ORACLE_SCRIPT"=true;
CREATE USER TEST IDENTIFIED BY TEST123
grant create session to TEST
GRANT SELECT ON ADMIN.SINHVIEN TO TEST;
CREATE ROLE ROLETEST;
GRANT ROLETEST TO TEST;
REVOKE ROLETEST FROM TEST; 