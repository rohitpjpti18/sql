-- Insert rows into table 'classroom'
INSERT INTO classroom
(building, room_number, capacity)
VALUES
('Packard', 101, 500),
('Painter', 514, 10),
('Taylor', 3128, 70),
('Watson', 100, 30),
('Watson', 120, 50);

-- Insert rows into table 'department'
INSERT INTO department
(dept_name, building, budget)
VALUES
('Biology', 'Watson', 90000),
('Comp. Sci.', 'Taylor', 100000),
('Elec. Eng.', 'Taylor', 85000),
('Finance', 'Painter', 120000),
('History', 'Painter', 50000),
('Music', 'Packard', 80000),
('Physics', 'Watson', 70000);

-- Insert rows into table 'course'
INSERT INTO course
(course_id, title, dept_name, credits)
VALUES
('BIO-101', 'Intro. to Biology', 'Biology', 4),
('BIO-301', 'Genetics', 'Biology', 4),
('BIO-399', 'Computational Biology', 'Biology', 3),
('CS-101', 'Intro. to Computer science', 'Comp. Sci.', 4),
('CS-190', 'Game Design', 'Comp. Sci.', 4),
('CS-315', 'Robotics', 'Comp. Sci.', 3),
('CS-319', 'Image Processing', 'Comp. Sci.', 3),
('CS-347', 'Database System Concepts', 'Comp. Sci.', 3),
('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3),
('FIN-201', 'Investment Banking', 'Finance', 3),
('HIS-351', 'World History', 'History', 3),
('MU-199', 'Music Video Production', 'Music', 3),
('PHY-101', 'Physical Principles', 'Physics', 4);


-- Insert rows into table 'course'
INSERT INTO instructor
(ID, name, dept_name, salary)
VALUES
(10101, 'Srinivasan', 'Comp. Sci.', 65000),
(12121, 'Wu', 'Finance', 90000),
(10101, 'Srinivasan', 'Comp. Sci.', 650),
(10101, 'Srinivasan', 'Comp. Sci.', 65000),
(10101, 'Srinivasan', 'Comp. Sci.', 65000),
(10101, 'Srinivasan', 'Comp. Sci.', 65000),
(10101, 'Srinivasan', 'Comp. Sci.', 65000),
(10101, 'Srinivasan', 'Comp. Sci.', 65000),
(10101, 'Srinivasan', 'Comp. Sci.', 65000),
(10101, 'Srinivasan', 'Comp. Sci.', 65000),
(10101, 'Srinivasan', 'Comp. Sci.', 65000);
