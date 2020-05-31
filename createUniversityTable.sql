CREATE TABLE time_slot(
    time_slot_id    VARCHAR(4),
    day             VARCHAR(1) CHECK (day IN ('M', 'T', 'W', 'R', 'F', 'S', 'U')),
    start_time      TIME,
    end_time        TIME,
    PRIMARY KEY (time_slot_id, day, start_time)
);

CREATE TABLE classroom(
    building        VARCHAR(15),
    room_number     VARCHAR(7),
    capacity        NUMERIC(4,0),
    PRIMARY KEY (building, room_number)
);


CREATE TABLE department(
    dept_name       VARCHAR(20),
    building        VARCHAR(15),
    budget          NUMERIC(12,2),
    PRIMARY KEY (dept_name)
);


CREATE TABLE instructor(
    ID              CHAR(5),
    name            VARCHAR(20),
    dept_name       VARCHAR(20),
    salary          NUMERIC(8,0),
    PRIMARY KEY(ID),
    FOREIGN KEY (dept_name) REFERENCES department ON DELETE SET NULL
);

CREATE TABLE student(
    ID              VARCHAR(5),
    name            VARCHAR(20) NOT NULL,
    dept_name       VARCHAR(20),
    tot_cred        NUMERIC(3, 0) check (tot_cred>=0),
    PRIMARY KEY (ID),
    FOREIGN KEY (dept_name) REFERENCES department ON DELETE SET NULL
);

CREATE TABLE course(
    course_id       VARCHAR(8),
    title           VARCHAR(50),
    dept_name       VARCHAR(20),
    credits         NUMERIC(2,0) CHECK (credits>0),
    PRIMARY KEY (course_id),
    FOREIGN KEY (dept_name) REFERENCES department ON DELETE SET NULL
);

CREATE TABLE section(
    course_id       VARCHAR(8),
    sec_id          VARCHAR(8),
    semester        VARCHAR(6) CHECK(
        semester IN ('Fall', 'Winter', 'Spring', 'Summer')
    ),
    year            NUMERIC(4, 0) CHECK (year>1701 AND year < 2100),
    building        VARCHAR(15),
    room_number     VARCHAR(7),
    time_slot_id    VARCHAR(4),
    PRIMARY KEY (course_id, sec_id, semester, year),
    FOREIGN KEY (course_id) REFERENCES course ON DELETE CASCADE,
    FOREIGN KEY (building, room_number) REFERENCES classroom ON DELETE SET NULL
);

CREATE TABLE teaches(
    ID              VARCHAR(5),
    course_id       VARCHAR(8),
    sec_id          VARCHAR(8),
    semester        VARCHAR(6),
    year            NUMERIC(4, 0),
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section ON DELETE CASCADE,
    FOREIGN KEY (ID) REFERENCES instructor ON DELETE CASCADE
);



CREATE TABLE takes(
    ID              VARCHAR(5),
    course_id       VARCHAR(8),
    sec_id          VARCHAR(8),
    semester        VARCHAR(6),
    year            NUMERIC(4,0),
    grade           VARCHAR(2),
    PRIMARY KEY(ID, course_id, sec_id, semester, year),
    FOREIGN KEY(course_id, sec_id, semester, year) REFERENCES section ON DELETE CASCADE,
    FOREIGN KEY(ID) REFERENCES student ON DELETE CASCADE
);

CREATE TABLE advisor(
    s_ID            VARCHAR(5),
    i_ID            VARCHAR(5),
    PRIMARY KEY (s_ID),
    FOREIGN KEY (i_ID) REFERENCES instructor (ID) ON DELETE SET NULL,
    FOREIGN KEY (s_ID) REFERENCES student (ID) ON DELETE CASCADE
);

CREATE TABLE prereq(
    course_id       VARCHAR(8),
    prereq_id       VARCHAR(8),
    PRIMARY KEY (course_id, prereq_id),
    FOREIGN KEY (course_id) REFERENCES course ON DELETE CASCADE,
    FOREIGN KEY (prereq_id) REFERENCES course
);





