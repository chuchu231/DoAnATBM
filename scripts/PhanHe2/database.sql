ALTER SESSION SET NLS_DATE_FORMAT = 'DD--MM--YYYY';
alter session set "_ORACLE_SCRIPT" = true;
-- Grant admin with pw admin123
drop user admin cascade;
create user admin identified by admin123;
grant dba to admin ;
grant grant any role to admin;
grant execute any procedure to admin;
grant create session to admin;
grant all privileges to admin;
GRANT EXECUTE ON DBMS_RLS TO ADMIN;
grant unlimited tablespace to admin;

-- DANGKY
ALTER TABLE admin.DANGKY DROP CONSTRAINT fk_dangky_sinhvien;
ALTER TABLE admin.DANGKY DROP CONSTRAINT fk_dangky_phancong;

-- PHANCONG
ALTER TABLE admin.PHANCONG DROP CONSTRAINT fk_phancong_nhansu;
ALTER TABLE admin.PHANCONG DROP CONSTRAINT fk_phancong_KHMO;

-- NHANSU
ALTER TABLE admin.NHANSU DROP CONSTRAINT fk_nhansu_donvi;

-- DONVI
ALTER TABLE admin.DONVI DROP CONSTRAINT fk_donvi_nhansu;

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
ALTER TABLE ADMIN.NHANSU
ADD CONSTRAINT fk_nhansu_donvi
FOREIGN KEY (MADV)
REFERENCES ADMIN.DONVI(MADV) ON DELETE CASCADE;

-- DONVI
ALTER TABLE ADMIN.DONVI
ADD CONSTRAINT fk_donvi_nhansu
FOREIGN KEY (TRGDV)
REFERENCES ADMIN.NHANSU(MANV) ON DELETE CASCADE;

-- HOCPHAN
ALTER TABLE ADMIN.HOCPHAN
ADD CONSTRAINT fk_hocphan_donvi
FOREIGN KEY (MADV)
REFERENCES ADMIN.DONVI(MADV) ON DELETE CASCADE;

-- KHMO
ALTER TABLE ADMIN.KHMO
ADD CONSTRAINT fk_khmo_hocphan
FOREIGN KEY (MAHP)
REFERENCES ADMIN.HOCPHAN(MAHP) ON DELETE CASCADE;

-- PHANCONG
ALTER TABLE ADMIN.PHANCONG
ADD CONSTRAINT fk_phancong_nhansu
FOREIGN KEY (MAGV)
REFERENCES ADMIN.NHANSU(MANV)ON DELETE CASCADE ;

ALTER TABLE ADMIN.PHANCONG
ADD CONSTRAINT fk_phancong_KHMO
FOREIGN KEY (MAHP, HK, NAM, MACT)
REFERENCES ADMIN.KHMO(MAHP, HK, NAM, MACT) ON DELETE CASCADE;

-- DANGKY
ALTER TABLE ADMIN.DANGKY
ADD CONSTRAINT fk_dangky_sinhvien
FOREIGN KEY (MASV)
REFERENCES ADMIN.SINHVIEN(MASV) ON DELETE CASCADE;

ALTER TABLE ADMIN.DANGKY
ADD CONSTRAINT fk_dangky_phancong
FOREIGN KEY (MAGV, MAHP, HK, NAM, MACT)
REFERENCES ADMIN.PHANCONG(MAGV, MAHP, HK, NAM, MACT) ON DELETE CASCADE
DEFERRABLE INITIALLY DEFERRED;

-- NHANSU
ALTER TABLE admin.NHANSU
ADD CONSTRAINT fk_nhansu_donvi
FOREIGN KEY (MADV)
REFERENCES admin.DONVI(MADV);
select * from admin.KHMO;
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
REFERENCES admin.PHANCONG(MAGV, MAHP, HK, NAM, MACT)


-- Insert
insert into admin.DONVI (MADV, TENDV, TRGDV) values (N'VPK', N'V?n phòng khoa', null);
insert into admin.DONVI (MADV, TENDV, TRGDV) values (N'HTTT', N'B? môn HTTT', null);
insert into admin.DONVI (MADV, TENDV, TRGDV) values (N'CNPM', N'B? môn CNPM', null);
insert into admin.DONVI (MADV, TENDV, TRGDV) values (N'KHMT', N'B? môn KHMT', null);
insert into admin.DONVI (MADV, TENDV, TRGDV) values (N'CNTT', N'B? môn CNTT', null);
insert into admin.DONVI (MADV, TENDV, TRGDV) values (N'TGMT', N'B? môn TGMT', null);
insert into admin.DONVI (MADV, TENDV, TRGDV) values (N'MMT', N'B? môn MMT và Vi?n thông', null);
insert into admin.DONVI (MADV, TENDV, TRGDV) values (N'GVK', N'Giáo v? khoa', null);

insert into ADMIN.NHANSU values('NS001', 'Nguyen Van An', 'Nam', '05-01-1989', 1000, '0768897001',  'Giang vien', 'HTTT');
insert into ADMIN.NHANSU values('NS002', 'Nguyen Thi Bich', 'Nu', '06-07-1990', 1000, '0768897002',  'Truong khoa', 'VPK');
insert into ADMIN.NHANSU values('NS003', 'Nguyen Van Chung', 'Nam', '03-07-1987', 1000, '0768897003',  'Nhan vien', 'VPK');
insert into ADMIN.NHANSU values('NS004', 'Nguyen Van Chu', 'Nam', '11-04-1979', 1500, '0768897013',  'Giang vien', 'CNPM');
insert into ADMIN.NHANSU values('NS005', 'Nguyen Van Chun', 'Nam', '12-03-1993', 900, '0768897093',  'Nhan vien', 'VPK');
insert into ADMIN.NHANSU values('NS006', 'Nguyen Van Ha', 'Nam', '02-04-1991', 1100, '0768897093',  'Giao vu','VPK');
insert into ADMIN.NHANSU values('NS007', 'Nguyen Van Chun', 'Nam', '12-03-1994',980, '0768897093',  'Giao vu','VPK');
insert into ADMIN.NHANSU values('NS008', 'Tran Van Hai', 'Nam', '05-08-1990', 1400, '0492295395', 'Giang vien','KHMT');
insert into ADMIN.NHANSU values('NS009', 'Nguyen Thi Ha', 'Nu', '16-05-1991', 1100, '0768897093',  'Nhan vien', 'VPK');
insert into ADMIN.NHANSU values('NS010', 'Nguyen Van Luan', 'Nam', '15-01-1989', 1200, '0768897001',  'Truong don vi', 'CNTT');
insert into ADMIN.NHANSU values('NS011', 'Nguyen Quang An', 'Nam', '05-02-1987', 900, '0768897002',  'Truong don vi', 'TGMT');
insert into ADMIN.NHANSU values('NS012', 'Nguyen Van Tri', 'Nam', '05-11-1981', 800, '0768897201',  'Truong don vi', 'MMT');
insert into ADMIN.NHANSU values('NS013', 'Nguyen Le Ngoc', 'Nu', '05-12-1989', 1100, '0768897321',  'Truong don vi', 'HTTT');
insert into ADMIN.NHANSU values('NS014', 'Phan Van Trieu', 'Nam', '25-11-1999', 2000, '0768827301',  'Truong don vi', 'CNPM');
insert into ADMIN.NHANSU values('NS015', 'Le Van Ba', 'Nam', '25-11-1980', 2000, '0768827301',  'Truong don vi', 'KHMT');
insert into ADMIN.NHANSU values('NS016', 'Nguyen Minh Thu', 'Nu', '12-08-1990', 2000, '0768827301',  'Truong don vi', 'GVK');
insert into ADMIN.NHANSU values('NS017', 'Hoang Ngoc Tu Trinh', 'Nu', '15-12-1992', 1200, '0768397021',  'Giang vien', 'KHMT');
insert into ADMIN.NHANSU values('NS018', 'Tran Van Minh', 'Nam', '15-07-1993', 1200, '0768397021',  'Giang vien', 'MMT');

UPDATE admin.DONVI SET TRGDV = 'NS013' WHERE MADV = 'HTTT';
UPDATE admin.DONVI SET TRGDV = 'NS014' WHERE MADV = 'CNPM';
UPDATE admin.DONVI SET TRGDV = 'NS015' WHERE MADV = 'KHMT';
UPDATE admin.DONVI SET TRGDV = 'NS010' WHERE MADV = 'CNTT';
UPDATE admin.DONVI SET TRGDV = 'NS011' WHERE MADV = 'TGMT';
UPDATE admin.DONVI SET TRGDV = 'NS012' WHERE MADV = 'MMT';
UPDATE admin.DONVI SET TRGDV = 'NS002' WHERE MADV = 'VPK';
UPDATE admin.DONVI SET TRGDV = 'NS016' WHERE MADV = 'GVK';


insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP100', N'C? s? trí tu? nhân t?o', 4, 3, 1, 75, 'TGMT');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP085', N'H? qu?n tr? c? s? d? li?u', 4, 2, 2, 90, 'CNTT');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP120', N'C? s? d? li?u', 4, 3, 1, 80, 'KHMT');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP075', N'Thi?t k? ph?n m?m', 4, 3, 1, 120, 'HTTT');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP090', N'Quy ho?ch tuy?n tính', 3, 2, 1, 95, 'CNPM');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP110', N'Toán r?i r?c', 4, 2, 2, 90, 'CNPM');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP095', N'Kh?i nghi?p', 2, 2, 0, 100, 'VPK');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP105', N'L?p trình ?ng d?ng', 4, 3, 1, 100, 'HTTT');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP080', N'Mã hóa', 4, 3, 1, 110, 'CNPM');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP115', N'An toàn và b?o m?t d? li?u', 4, 3, 1, 90, 'HTTT');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP130', N'Nh?p môn h?c máy', 4, 3, 1, 90, 'KHMT');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP135', N'Phát tri?n ?ng d?ng web', 4, 3, 1, 120, 'CNPM');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP140', N'Tr?c quan hóa d? li?u', 4, 3, 1, 100, 'KHMT');
insert into admin.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) values ('HP145', N'Phân tích thi?t k? h? th?ng thông tin', 4, 3, 1, 90, 'HTTT');

insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP100', 'HK1', '2023-2024', 'CLC');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP085', 'HK2', '2023-2024', 'CLC');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP120', 'HK3', '2022-2023', 'CQ');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP075', 'HK1', '2023-2024', 'CLC');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP090', 'HK2', '2023-2024', 'CLC');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP110', 'HK3', '2022-2023', 'VP');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP095', 'HK1', '2022-2023', 'VP');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP105', 'HK2', '2023-2024', 'CQ');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP080', 'HK3', '2022-2023', 'CQ');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP115', 'HK1', '2023-2024', 'VP');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP130', 'HK3', '2023-2024', 'CLC');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP135', 'HK3', '2023-2024', 'CLC');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP140', 'HK3', '2023-2024', 'CQ');
insert into admin.KHMO (MAHP, HK, NAM, MACT) values ('HP145', 'HK3', '2023-2024', 'VP');


insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('NS001', 'HP100', 'HK1', '2023-2024', 'CLC');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('NS002', 'HP085', 'HK2', '2023-2024', 'CLC');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('NS004', 'HP120', 'HK3', '2022-2023', 'CQ');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('NS008', 'HP075', 'HK1', '2023-2024', 'CLC');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('NS002', 'HP090', 'HK2', '2023-2024', 'CLC');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('NS011', 'HP110', 'HK3', '2022-2023', 'VP');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('NS001', 'HP095', 'HK1', '2022-2023', 'VP');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('NS013', 'HP105', 'HK2', '2023-2024', 'CQ');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('NS001', 'HP080', 'HK3', '2022-2023', 'CQ');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('NS015', 'HP115', 'HK1', '2023-2024', 'VP');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('NS016', 'HP130', 'HK3', '2023-2024', 'CLC');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('NS004', 'HP135', 'HK3', '2023-2024', 'CLC');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('NS018', 'HP140', 'HK3', '2023-2024', 'CQ');
insert into admin.PHANCONG (MAGV, MAHP, HK, NAM, MACT) values ('NS001', 'HP145', 'HK3', '2023-2024', 'VP');
SELECT * FROM ADMIN.PHANCONG;

insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV02', 'Ichabod Radley', 'Nam', '08-07-2006', '1293 Grasskamp Center', '814 974 8950', 'CLC', 'KHDL', 131, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV01', 'Lonny Willshaw', 'Nu', '04-01-2005', '54 Elka Parkway', '443 809 3568', 'CLC', 'HTTT', 110, 8.2);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV03', 'Mickey Ritmeyer', 'Nu', '23-10-2009', '69 Evergreen Road', '532 662 5974', 'CQ', 'CNPM', 130, 6.3);
insert into admin.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) values ('SV04', 'Mickey Ritmeyer', 'Nam', '23-10-2009', '69 Evergreen Road', '532 662 5974', 'CQ', 'CNPM', 130, 6.3);
SELECT * FROM ADMIN.SINHVIEN;
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV01', 'NS001', 'HP100', 'HK1', '2023-2024', 'CLC', 8.1, 8.4, 6.8, 5.7);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV02', 'NS002', 'HP085', 'HK2', '2023-2024', 'CLC', 9.0, 8.3, 7.0, 6.8);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV03', 'NS004', 'HP120', 'HK3', '2022-2023', 'CQ', 9.7, 7.1, 7.6, 8.4);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV02', 'NS008', 'HP075', 'HK1', '2023-2024', 'CLC', 6.2, 7.7, 6.4, 8.3);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV03', 'NS002', 'HP090', 'HK2', '2023-2024', 'CLC', 6.0, 8.3, 6.5, 5.3);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV01', 'NS011', 'HP110', 'HK3', '2022-2023', 'VP', 9.3, 5.5, 8.3, 6.8);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV01', 'NS001', 'HP095', 'HK1', '2022-2023', 'VP', 7.4, 6.2, 10.0, 9.3);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV02', 'NS013', 'HP105', 'HK2', '2023-2024', 'CQ', 6.1, 5.8, 8.9, 9.5);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV03', 'NS001', 'HP080', 'HK3', '2022-2023', 'CQ', 9.7, 8.4, 9.4, 5.2);
insert into admin.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) values ('SV02', 'NS015', 'HP115', 'HK1', '2023-2024', 'VP', 8.2, 7.9, 6.2, 5.3);
UPDATE ADMIN.DANGKY SET MACT = 'CLC' WHERE MASV = 'SV03' AND MAHP = 'HP090';
SELECT * FROM ADMIN.DANGKY;