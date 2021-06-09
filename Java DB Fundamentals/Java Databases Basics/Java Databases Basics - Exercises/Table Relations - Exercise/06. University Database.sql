create table `majors`(
`major_id` int PRIMARY KEY ,
`name` varchar (50));
create TABLE `payments`(
`payment_id`int PRIMARY KEY,
`payment_date`date ,
`payment_amount`decimal(8,2),
`student_id`int);
create table `students`(
`student_id`int PRIMARY KEY,
`student_number`VARCHAR(12),
`student_name`VARCHAR(50),
`major_id`int);

create table `agenda`(
`student_id`int,
`subject_id`int);
create table `subjects`(
`subject_id`int PRIMARY KEY,
`subject_name`VARCHAR(50));
ALTER TABLE `payments`
add CONSTRAINT fk_student_id
FOREIGN KEY (student_id)REFERENCES students(student_id);
alter table `students`
add CONSTRAINT fk_major_id
FOREIGN KEY (major_id)REFERENCES majors(major_id);
alter table `agenda`
add CONSTRAINT pk_agenda
PRIMARY KEY (student_id,subject_id);
alter table `agenda`
add CONSTRAINT fk_agenda
FOREIGN KEY (student_id) REFERENCES students(student_id);
alter table `agenda`
add CONSTRAINT fk_agendaSECOND
FOREIGN key (subject_id) references subjects(subject_id);