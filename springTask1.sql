create database video_db;
use video_db;

/* Table : reference_artifacts for manage reference artifacts */
create table reference_artifacts(
id int primary key auto_increment,
name varchar(50) not null,
artifact varchar(50) not null,
description varchar(250),
video_id int not null,
CONSTRAINT uc_artifacts UNIQUE (ref_artifact_name),
CONSTRAINT fk_video_id FOREIGN KEY (video_id) REFERENCES video_details(id)
);
desc reference_artifacts;

/* Table : sample_program for manage sample program list*/
create table sample_program(
id int primary key auto_increment,
name varchar(50) not null,
artifact varchar(50) not null,
description varchar(250),
video_id int not null,
CONSTRAINT uc_program UNIQUE (sample_pgm_name),
CONSTRAINT fk_video_id FOREIGN KEY (video_id) REFERENCES video_details(id)
);

/* Table : reference_url for manage reference url list*/
create table reference_url(
id int primary key auto_increment,
url_name varchar(50) not null,
url_artifact varchar(50) not null,
url_description varchar(250),
url_type varchar(15) not null,
video_id int not null,
CONSTRAINT uc_url UNIQUE (ref_url_name),
CONSTRAINT fk_video_id FOREIGN KEY (video_id) REFERENCES video_details(id) 
);

/* Table : level for managing different levels*/
create table levels(
id int primary key auto_increment,
level_name varchar(20) not null,
CONSTRAINT uc_level UNIQUE (level_name)
);


/* Table : categories for managing different categories*/
create table categories(
id int primary key auto_increment,
category_name varchar(20) not null,
status boolean not null default 1,
CONSTRAINT uc_category UNIQUE (category_name)
);


/* Table : video_details for manage video related informations */
create table video_details(
id int primary key auto_increment,
video_name varchar(50) not null,
display_name varchar(50) not null,
vimeo_video_url varchar(60) not null,
tags varchar(100) not null,
description varchar(250),
transcript varchar(50),
level_id int not null,
category_id int not null,
status boolean not null default 1,

CONSTRAINT fk_level FOREIGN KEY (level_id) REFERENCES levels(id),
CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES categories(id)
);
