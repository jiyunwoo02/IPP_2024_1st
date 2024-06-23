-- 테이블1: 강의실
CREATE TABLE CLASSROOM (
  CLSNO VARCHAR(15) PRIMARY KEY NOT NULL,
  CLSADDR VARCHAR(100)
);

-- 테이블2: 강의
CREATE TABLE COURSE (
  CRSCODE INT PRIMARY KEY NOT NULL,
  STDNO INT NOT NULL,
  SUBCODE INT NOT NULL
);

-- 테이블3: 교수
CREATE TABLE PROF (
  PROFCODE INT PRIMARY KEY NOT NULL,
  PROFNAME VARCHAR(20),
  PROFTEL VARCHAR(20)
);

-- 테이블4: 학생
CREATE TABLE STUDENT (
  STDNO INT PRIMARY KEY NOT NULL,
  STDNAME VARCHAR(20),
  STDTEL VARCHAR(20)
);

-- 테이블5: 과목
CREATE TABLE SUBJECT (
  SUBCODE INT PRIMARY KEY NOT NULL,
  SUBTITLE VARCHAR(30),
  PROFCODE INT NOT NULL,
  CLSNO VARCHAR(15) NOT NULL
);

-- 테이블 주석 생성
COMMENT ON TABLE CLASSROOM IS '강의실테이블';
COMMENT ON TABLE COURSE IS '수강테이블';
COMMENT ON TABLE PROF IS '교수테이블';
COMMENT ON TABLE STUDENT IS '학생테이블';
COMMENT ON TABLE SUBJECT IS '과목테이블';

-- 외래키 지정
ALTER TABLE SUBJECT ADD CONSTRAINT "FK_PROF_TO_SUBJECT" FOREIGN KEY (PROFCODE) REFERENCES PROF (PROFCODE);
ALTER TABLE COURSE ADD CONSTRAINT "FK_STUDENT_TO_COURSE" FOREIGN KEY (STDNO) REFERENCES STUDENT (STDNO);
ALTER TABLE COURSE ADD CONSTRAINT "FK_SUBJECT_TO_COURSE" FOREIGN KEY (SUBCODE) REFERENCES SUBJECT (SUBCODE);
ALTER TABLE SUBJECT ADD CONSTRAINT "FK_CLASSROOM_TO_SUBJECT" FOREIGN KEY (CLSNO) REFERENCES CLASSROOM (CLSNO);

desc CLASSROOM;
desc COURSE;
desc PROF;
desc STUDENT;
desc SUBJECT;
