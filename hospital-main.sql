clear screen;

DROP TABLE patient CASCADE CONSTRAINTS;
DROP TABLE doctors CASCADE CONSTRAINTS;
DROP TABLE diagnosis CASCADE CONSTRAINTS;
DROP TABLE medicine CASCADE CONSTRAINTS;
DROP TABLE reports CASCADE CONSTRAINTS;
DROP TABLE history CASCADE CONSTRAINTS;
DROP TABLE surgical_history CASCADE CONSTRAINTS;



--
-- Table structure for table `doctors`
--

CREATE TABLE doctors
(
	dr_id varchar(5) NOT NULL,
	dr_name varchar(20) DEFAULT NULL,
	dr_age varchar(3) DEFAULT NULL,
	dr_sex varchar(1) DEFAULT NULL,
	dr_phn varchar(11) DEFAULT NULL,
	dr_email varchar(30) DEFAULT NULL,
	dr_hospital_chamber varchar(60) DEFAULT NULL,
	designation varchar(10) DEFAULT NULL,
	degree varchar(30) DEFAULT NULL,
	department varchar(15) DEFAULT NULL,
	experience varchar(10) DEFAULT NULL,
	time varchar(20) DEFAULT NULL,
	fee varchar(5) DEFAULT NULL,
	day varchar(60) DEFAULT NULL,
	PRIMARY KEY (dr_id)
);



INSERT INTO doctors VALUES('9001','Titu Miah','56','M','01528734145','titu_miah@gmail.com','Popular Diagnostic Centre','Professor','FCPS','Medicine','20y','4:00','1000','Sat,sun,tues');
INSERT INTO doctors VALUES('9002','Raihan Rabbani','40','M','01678904145','raihan1@gmail.com','Square Hospital','Consultant','MRCP,FCPS','Medicine','10y','5:00pm','1200','Sat,mon,tues,thurs');
INSERT INTO doctors VALUES('9003','Maliha Rashid','52','F','01728794345','mr@gmail.com','Central Hospital','Professor','FCPS','Gyne','20y','6:00pm','1000','Sat,tues');
INSERT INTO doctors VALUES('9004','Md. Anwarullah','60','M','01628034146','anwar@gmail.com','Medinova','Professor','FCPS,MD','Neuro-medicine','25y','3:00pm','1500','Sat,sun,tues,wed');
INSERT INTO doctors VALUES('9005','Rashedul Hasan','58','M','01556734189','hasan23@gmail.com','Anwar Khan Modern Hospital','Professor','FCPS,MD','Cardiology','23y','11:00am','1200','Sun,tues,thurs');



--
-- Table structure for table `reports`
--


CREATE TABLE reports 
(
	rep_id varchar(5) NOT NULL,
	rep_date varchar(20) DEFAULT NULL,
	impression varchar(60) DEFAULT NULL,
	PRIMARY KEY (rep_id)
);

INSERT INTO reports VALUES('501','21-05-2016','Normal report');
INSERT INTO reports VALUES('502','09-07-2017','Creatinine: 1.4');
INSERT INTO reports VALUES('503','02-04-2015','Ct-scan: normal');
INSERT INTO reports VALUES('504','29-10-2016','Xray(chest): normal');
INSERT INTO reports VALUES('505','11-02-2016','USG(whole abdomen): Dilated liver');



--
-- Table structure for table `medicine`
--

CREATE TABLE medicine 
(
	med_id varchar(5) NOT NULL,
	med_name varchar(20) DEFAULT NULL,
	med_generic_name varchar(20) DEFAULT NULL,
	med_company varchar(10) DEFAULT NULL,
	med_work varchar(30) DEFAULT NULL,
	med_per_price varchar(11) DEFAULT NULL,
	PRIMARY KEY (med_id)
);


INSERT INTO medicine VALUES('01','Ace','Paracetamol','Square','reduce pain','20tk');
INSERT INTO medicine VALUES('02','Ace+','Paracetamol','Square','reduce fever','30tk');
INSERT INTO medicine VALUES('03','Oradin','Loratidin','Square','reduce allergy','15tk');
INSERT INTO medicine VALUES('04','Cinaron','Cinarizin','Square','reduce fatigue','20tk');
INSERT INTO medicine VALUES('05','Lenso','Omiprazol','Square','reduce acidity','25tk');



--
-- Table structure for table `diagnosis`
--

CREATE TABLE diagnosis 
(
	dia_id varchar(5) NOT NULL,
	dia_name varchar(20) DEFAULT NULL,
	dia_cost varchar(10) DEFAULT NULL,
	dia_requirements varchar(40) DEFAULT NULL,
	dia_hospital varchar(20) DEFAULT NULL,
	rep_id varchar(5) NOT NULL,
	PRIMARY KEY (dia_id),
	FOREIGN KEY(rep_id) REFERENCES reports(rep_id)
);


INSERT INTO diagnosis VALUES('101','CBC','230tk',' ','Square Hoapital','501');
INSERT INTO diagnosis VALUES('102','Xray(chest)','500tk',' ','Central Hospital','504');
INSERT INTO diagnosis VALUES('103','USG(whole abdomen)','2300tk','Empty stomach ','Square Hospital','505');
INSERT INTO diagnosis VALUES('104','Creatinine','720tk',' ','Apollo Hospital','502');
INSERT INTO diagnosis VALUES('105','Ct-scan','3500tk',' ','Square Hoapital','503');



--
-- Table structure for table `history`
--


CREATE TABLE history
(
	his_id varchar(5) NOT NULL,
	his_date varchar(20) DEFAULT NULL,
	problem varchar(60) DEFAULT NULL,
	rep_id varchar(5) NOT NULL,
	dr_id varchar(5) NOT NULL,
	med_id varchar(5) NOT NULL,
	PRIMARY KEY (his_id),
	FOREIGN KEY(rep_id) REFERENCES reports(rep_id),
	FOREIGN KEY(dr_id) REFERENCES doctors(dr_id),
	FOREIGN KEY(med_id) REFERENCES medicine(med_id)
);


INSERT INTO history VALUES('001','20-05-2016','back pain with fever','502','9001','01');
INSERT INTO history VALUES('002','10-07-2017','pain at middle abdomen','505','9002','03');
INSERT INTO history VALUES('003','03-04-2015','severe headache for 3 days','503','9004','04');
INSERT INTO history VALUES('004','30-10-2016','fever with cough','501','9005','01');
INSERT INTO history VALUES('005','12-02-2016','stomach pain and vomiting','505','9001','05');


--
-- Table structure for table `surgical_history`
--

CREATE TABLE surgical_history 
(
	s_his_id varchar(5) NOT NULL,
	s_date varchar(20) DEFAULT NULL,
	s_name varchar(30) DEFAULT NULL,
	s_hospital varchar(40) DEFAULT NULL,
	s_cost varchar(20) DEFAULT NULL,
	dr_id varchar(5) NOT NULL,
	PRIMARY KEY (s_his_id),
	FOREIGN KEY(dr_id) REFERENCES doctors(dr_id)
);


INSERT INTO surgical_history VALUES('0101','24-08-2016','Bypass','National Heart Foundation','1.5 lakh','9001');
INSERT INTO surgical_history VALUES('0102','04-08-2015','Apendisitis','Square Hospital','50,000','9002');
INSERT INTO surgical_history VALUES('0103','21-04-2016','Kidney stone','Labaid hospital','60,000','9005');
INSERT INTO surgical_history VALUES('0104','12-10-2016','Head injury','Medinova','80,000','9004');
INSERT INTO surgical_history VALUES('0105','19-06-2017','Eye lasic','Bangladesh Eye Hospital','60,000','9002');



--
-- Table structure for table `patient`
--

CREATE TABLE patient
(
	pt_id varchar(5) NOT NULL,
	pt_name varchar(20) DEFAULT NULL,
	pt_age varchar(3) DEFAULT NULL,
	pt_sex varchar(1) DEFAULT NULL,
	pt_phn varchar(11) DEFAULT NULL,
	pt_house varchar(5) DEFAULT NULL,
	pt_road varchar(5) DEFAULT NULL,
	pt_block varchar(5) DEFAULT NULL,
	pt_section varchar(30) DEFAULT NULL,
	pt_district varchar(10) DEFAULT NULL,
	bl_grp varchar(3) DEFAULT NULL,
	weight varchar(10) DEFAULT NULL,
	height varchar(10) DEFAULT NULL,
	dia_id varchar(5) NOT NULL,
	his_id varchar(5) NOT NULL,
	s_his_id varchar(5),
	PRIMARY KEY (pt_id),
	FOREIGN KEY(dia_id) REFERENCES diagnosis(dia_id),
	FOREIGN KEY(his_id) REFERENCES history(his_id),
	FOREIGN KEY(s_his_id) REFERENCES surgical_history(s_his_id)
);

INSERT INTO patient VALUES('1001','Farzana Sharmin Mou','22','F','01554500522','7','11/1','B','Mirpur-10','Dhaka','B+','63kg','5ft 4inch','103','004','0101');
INSERT INTO patient VALUES('1002','Sk Hossain Shohag','23','M','01521111828','4','3','B','Lakhsmibazar','Dhaka','A+','76kg','5ft 6inch','102','002','0104');
INSERT INTO patient VALUES('1003','Prottasa Karim','21','F','01521103263','5','11','A','Uttara','Dhaka','A+','70kg','5ft 5inch','103','001','0103');
INSERT INTO patient VALUES('1004','Mirza Tairin Tarique','22','F','01672877967','9','A/5','C','Malibag','Dhaka','B+','47kg','5ft 5inch','101','002','0104');
INSERT INTO patient VALUES('1005','Sourabh Rahman','22','M','01677062575','1','11/A',' ','Shambazar','Dhaka','B+','63kg','5ft 5inch','105','003','0103');
INSERT INTO patient VALUES('1006','Debasish Ray','22','M','01622610659','3','31/2','H','Shahjahanpur','Dhaka','B+','67kg','5ft 7inch','101','004','0105');
INSERT INTO patient VALUES('1007','Neaz Ador','24','M','01764341299','9','5/D','F','Lakhsmibazar','Dhaka','B+','85kg','5ft 6inch','102','005','0102');


commit;