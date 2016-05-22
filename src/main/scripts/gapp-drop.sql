
    alter table Programs 
        drop constraint FK_ojm3tgtynxd5v2fvv3h03rvd7;

    alter table academic_records 
        drop constraint FK_fabplmguv116budiwddxe2msa;

    alter table additional_fields 
        drop constraint FK_cmnxuvbl13x9vvqhs9jgfh3dx;

    alter table application_additionalFields 
        drop constraint FK_ovlnbbkwqi5jrcdmkwtw0rbb4;

    alter table applications 
        drop constraint FK_lq4q6aed1a3tduqwdx2ki9qqt;

    alter table applications 
        drop constraint FK_1fx9j82ywrmxw5x4bi174x4tx;

    alter table degrees 
        drop constraint FK_rqi4wrhhtwwk6r9c9hcjyext9;

    alter table status 
        drop constraint FK_4k6d2fq6rldgac1txlsfvhcgw;

    alter table users 
        drop constraint FK_c7ll92kt1lp3h0eh6fwhbjmbc;

    alter table users 
        drop constraint FK_81efli5j68ia45fdjwe4066fv;

    drop table if exists Programs cascade;

    drop table if exists academic_records cascade;

    drop table if exists additional_fields cascade;

    drop table if exists application_additionalFields cascade;

    drop table if exists applications cascade;

    drop table if exists degrees cascade;

    drop table if exists departments cascade;

    drop table if exists status cascade;

    drop table if exists users cascade;

    drop sequence hibernate_sequence;
