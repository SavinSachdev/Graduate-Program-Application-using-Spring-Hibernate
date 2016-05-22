
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

    create sequence hibernate_sequence;
