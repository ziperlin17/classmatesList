drop table if exists group;
drop table if exists teachers;

create table teachers (
                          id bigserial primary key,
                          first_name varchar(20),
                          last_name varchar(20),
                          email varchar(20),
                          comment varchar(50)
);

create table group (
                          id bigserial primary key,
                          first_name varchar(20),
                          last_name varchar(20),
                          email varchar(20),
                          comment varchar(50)
);