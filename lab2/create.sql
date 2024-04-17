
create type en as enum ('value1', 'value2', 'value3');

create type profile as (
    nickname varchar(64),
    avatar varchar(64),
    information varchar(255)
);


create table task_2 (
    tsk_id uuid primary key,
    tsk_varchar varchar(64),
    tsk_int integer,
    tsk_bool boolean,
    tsk_date date,
    tsk_enum en,
    tsk_array varchar(64)[],
    tsk_xml xml,
    tsk_json json,
    tsk_profile profile,
    tsk_money money,
    tsk_byte bytea,
    tsk_point point,
    tsk_bit bit(8)
);