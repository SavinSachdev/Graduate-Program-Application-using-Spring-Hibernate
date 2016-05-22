
   

   
    
     create table Programs (
        program_id int4 not null,
        name varchar(255),
        department_dept_id int4,
        primary key (program_id)
    );

    create table academic_records (
        application_id int4 not null,
        gpa float8 not null,
        gre float8 not null,
        toefl float8 not null,
        transcripts bytea
    );

    create table additional_fields (
        department_id int4 not null,
        name varchar(255),
        required varchar(255),
        type varchar(255)
    );

    create table application_additionalFields (
        application_id int4 not null,
        name varchar(255),
        required varchar(255),
        type varchar(255)
    );

    create table applications (
        application_id int4 not null,
        term varchar(255),
        programs_program_id int4,
        student_user_id int4,
        primary key (application_id)
    );

    create table degrees (
        application_id int4 not null,
        degreeEarned varchar(255),
        major varchar(255),
        timeAttended float8 not null,
        universityName varchar(255)
    );

    create table departments (
        dept_id int4 not null,
        name varchar(255),
        primary key (dept_id)
    );

    create table status (
        application_id int4 not null,
        comments varchar(255),
        modifiedBy varchar(255),
        status varchar(255),
        time varchar(255)
    );

    create table users (
        user_role varchar(31) not null,
        user_id int4 not null,
        email varchar(255),
        enabled boolean default true,
        fname varchar(255),
        lname varchar(255),
        password varchar(255),
        CIN varchar(255),
        citizenship varchar(255),
        dob timestamp,
        gender varchar(255),
        phone varchar(255),
        manager_user_id int4,
        department_dept_id int4,
        primary key (user_id)
    );

    alter table users 
        add constraint UK_6dotkott2kjsp8vw4d0m25fb7 unique (email);

    alter table Programs 
        add constraint FK_ojm3tgtynxd5v2fvv3h03rvd7 
        foreign key (department_dept_id) 
        references departments;

    alter table academic_records 
        add constraint FK_fabplmguv116budiwddxe2msa 
        foreign key (application_id) 
        references applications;

    alter table additional_fields 
        add constraint FK_cmnxuvbl13x9vvqhs9jgfh3dx 
        foreign key (department_id) 
        references departments;

    alter table application_additionalFields 
        add constraint FK_ovlnbbkwqi5jrcdmkwtw0rbb4 
        foreign key (application_id) 
        references applications;

    alter table applications 
        add constraint FK_lq4q6aed1a3tduqwdx2ki9qqt 
        foreign key (programs_program_id) 
        references Programs;

    alter table applications 
        add constraint FK_1fx9j82ywrmxw5x4bi174x4tx 
        foreign key (student_user_id) 
        references users;

    alter table degrees 
        add constraint FK_rqi4wrhhtwwk6r9c9hcjyext9 
        foreign key (application_id) 
        references applications;

    alter table status 
        add constraint FK_4k6d2fq6rldgac1txlsfvhcgw 
        foreign key (application_id) 
        references applications;

    alter table users 
        add constraint FK_c7ll92kt1lp3h0eh6fwhbjmbc 
        foreign key (manager_user_id) 
        references users;

    alter table users 
        add constraint FK_81efli5j68ia45fdjwe4066fv 
        foreign key (department_dept_id) 
        references departments;


    create sequence hibernate_sequence
    MINVALUE 121;




	ALTER TABLE academic_records
  	OWNER TO gapp;
  	ALTER TABLE additional_fields
  	OWNER TO gapp;
  	ALTER TABLE degrees
  	OWNER TO gapp;
  	ALTER TABLE applications
  	OWNER TO gapp;
  	ALTER TABLE departments
  	OWNER TO gapp;
  	ALTER TABLE programs
  	OWNER TO gapp;
  	ALTER TABLE status
  	OWNER TO gapp;
  	ALTER TABLE users
  	OWNER TO gapp;
	ALTER TABLE application_additionalfields
	OWNER to gapp;










Insert into users(user_id,user_role,email,fname,lname,password,enabled) values(101,'administrators','admin@localhost.localdomain','savin','sachdev','abcd',true);



Insert into users(user_id,user_role,email,fname,lname,password,enabled) values(102,'staff','staff1@localhost.localdomain','kishan','mistry','abcd',true);
Insert into users(user_id,user_role,email,fname,lname,password,enabled) values(103,'staff','staff2@localhost.localdomain','mark','ben','abcd',true);



INSERT INTO users(
            user_role, user_id, email, fname, lname, password, cin, citizenship, 
            dob, gender, phone,enabled)
    VALUES ('students', 104, 'student1@localhost.localdomain', 'abhijeet','joshi','abcd','304470567','Indian', 
            '12/09/1991', 'male','626692212',true);

INSERT INTO users(
            user_role, user_id, email, fname, lname, password, cin, citizenship, 
            dob, gender, phone,enabled)
    VALUES ('students', 105, 'student2@localhost.localdomain', 'richa','edlabadkar','abcd','545457371','Indian', 
            '01/23/1989', 'female','626692212',true);


Insert into departments values(106,'Computer Science');
Insert into departments values(107,'Accounting');



Insert into programs values(108,'MS in Accounting',107);
Insert into programs values(109,'MS in Computer Science',106);

Insert into applications values(110,'Fall 2016',108,104);

Insert into additional_fields values(107,'GMAT Score','required','Number');