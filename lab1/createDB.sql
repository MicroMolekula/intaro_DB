create table userP (
    usr_id serial primary key,
    usr_name varchar(64) not null,
    usr_email varchar(64) not null,
    usr_date_of_birth date not null
);

create table adminP (
    adn_id serial primary key,
    adn_name varchar(64) not null,
    adn_email varchar(64) not null,
    adn_rating real check ( adn_rating  between 1 and 10)
);

create table movie (
    mv_id serial primary key,
    mv_title varchar(64) not null,
    mv_rating real check ( mv_rating between 1 and 10),
    mv_date_release date not null,
    mv_duration integer not null
);

create table country (
    cnt_title varchar(64) primary key
);

create table director (
    drt_id serial primary key,
    drt_name varchar(64) not null,
    cnt_title varchar(64) not null,
    foreign key (cnt_title) references country (cnt_title)
                      on delete restrict
                      on update cascade
);

create table review (
    rv_id serial primary key,
    mv_id integer not null,
    adn_id integer not null,
    rv_text text not null,
    rv_date date not null,
    rv_mark real check ( rv_mark between 1 and 10),
    foreign key (mv_id) references movie (mv_id)
        on delete restrict
        on update restrict,
    foreign key (adn_id) references adminP (adn_id)
        on delete restrict
        on update restrict
);

create table commentary (
    cmt_id serial primary key,
    cmt_date date not null,
    cmt_text text not null,
    usr_id integer not null,
    rv_id integer not null,
    foreign key (usr_id) references userP (usr_id)
                        on delete restrict
                        on update restrict,
    foreign key (rv_id) references review (rv_id)
                        on delete restrict
                        on update restrict
);

create table actor (
    act_id serial primary key,
    act_name varchar(64) not null,
    cnt_title varchar(64) not null,
    foreign key (cnt_title) references country (cnt_title)
        on delete restrict
        on update cascade
);

create table genre (
    gr_title varchar(32) primary key
);

create table genre_movie (
    gr_title varchar(32) not null,
    mv_id integer not null,
    primary key (gr_title, mv_id),
    foreign key (gr_title) references genre (gr_title)
                         on delete restrict
                         on update cascade,
    foreign key (mv_id) references movie (mv_id)
                         on delete restrict
                         on update restrict
);

create table director_movie (
    drt_id integer not null,
    mv_id integer not null,
    primary key (drt_id, mv_id),
    foreign key (drt_id) references director (drt_id)
                            on delete restrict
                            on update restrict,
    foreign key (mv_id) references movie (mv_id)
                            on delete restrict
                            on update restrict
);

create table actor_movie (
    act_id integer not null,
    mv_id integer not null,
    primary key (act_id, mv_id),
    foreign key (act_id) references actor (act_id)
                         on delete restrict
                         on update restrict,
    foreign key (mv_id) references movie (mv_id)
                         on delete restrict
                         on update restrict
);

create table country_movie (
    cnt_title varchar(64) not null,
    mv_id integer not null,
    primary key (cnt_title, mv_id),
    foreign key (cnt_title) references country (cnt_title)
                           on delete restrict
                           on update cascade,
    foreign key (mv_id) references movie (mv_id)
                           on delete restrict
                           on update restrict
);
