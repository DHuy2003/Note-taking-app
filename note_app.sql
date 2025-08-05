create table users(
    user_id int auto_increment primary key,
    username VARCHAR(50) NOT NULL unique,
    email varchar(1000) NOT NULL unique,
    pwd varchar(50),
    created_at timestamp default CURRENT_TIMESTAMP,
    updated_at timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);

create table notes(
    note_id int auto_increment primary key,
    user_id int NOT NULL,
    title varchar(1000),
    color varchar(100),
    content text,
    is_archived boolean default FALSE,
    created_at timestamp default CURRENT_TIMESTAMP,
    updated_at timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    foreign key (user_id) references users(user_id) on delete cascade
);

CREATE TABLE tags (
     tag_id int auto_increment primary key,
     name varchar(50) NOT NULL unique,
     created_at timestamp default CURRENT_TIMESTAMP,
     updated_at timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);

CREATE TABLE note_tags (
    note_id int NOT NULL,
    tag_id int NOT NULL,
    primary key (note_id, tag_id),
    created_at timestamp default CURRENT_TIMESTAMP,
    updated_at timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    foreign key (note_id) references notes(note_id) on delete cascade,
    foreign key (tag_id) references tags(tag_id) on delete cascade
);

CREATE TABLE shared_notes (
    shared_id int auto_increment primary key,
    note_id int NOT NULL,
    shared_user_email varchar(100),
    can_edit boolean default FALSE,
    shared_at timestamp default CURRENT_TIMESTAMP,
    created_at timestamp default CURRENT_TIMESTAMP,
    updated_at timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    foreign key (note_id) references notes(note_id) on delete cascade
);

CREATE TABLE attachments (
    id int auto_increment primary key,
    note_id int NOT NULL,
    file_name varchar(255),
    file_path varchar(255),
    created_at timestamp default CURRENT_TIMESTAMP,
    updated_at timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    foreign key (note_id) references notes(note_id) on delete cascade
);

CREATE TABLE charts (
    chart_id int auto_increment primary key,
    note_id int NOT NULL,
    chart_title varchar(1000),
    chart_type varchar(50),
    created_at timestamp default CURRENT_TIMESTAMP,
    updated_at timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    foreign key (note_id) references notes(note_id) on delete cascade
);

CREATE TABLE charts_data (
    id int auto_increment primary key,
    chart_id int NOT NULL,
    label varchar(200),
    value varchar(100),
    color varchar(100),
    created_at timestamp default CURRENT_TIMESTAMP,
    updated_at timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    foreign key (chart_id) references charts(chart_id) on delete cascade
);

CREATE TABLE data_exports (
    id int auto_increment primary key,
    user_id int NOT NULL,
    export_time timestamp default CURRENT_TIMESTAMP,
    file_name varchar(255),
    file_path varchar(255),
    created_at timestamp default CURRENT_TIMESTAMP,
    updated_at timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    foreign key(user_id) references users(user_id) on delete cascade
);

CREATE TABLE data_imports (
    id int auto_increment primary key,
    user_id int NOT NULL,
    import_time timestamp default CURRENT_TIMESTAMP,
    file_name varchar(255),
    file_path varchar(255),
    created_at timestamp default CURRENT_TIMESTAMP,
    updated_at timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    foreign key(user_id) references users(user_id) on delete cascade
);


