SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS participants;
DROP TABLE IF EXISTS seminars;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS mst_admins;
DROP TABLE IF EXISTS mst_blocks;
DROP TABLE IF EXISTS mst_seminars;
DROP TABLE IF EXISTS mst_speakers;




/* Create Tables */

CREATE TABLE events
(
	event_id int(10) unsigned NOT NULL AUTO_INCREMENT,
	event_name varchar(256) NOT NULL,
	event_overview varchar(4000),
	event_date datetime NOT NULL,
	event_venue varchar(4000),
	is_deleted boolean NOT NULL,
	PRIMARY KEY (event_id),
	UNIQUE (event_id)
);


CREATE TABLE mst_admins
(
	admin_id int(10) unsigned NOT NULL AUTO_INCREMENT,
	account_id varchar(256) NOT NULL,
	account_pw varchar(256) NOT NULL,
	is_deleted boolean NOT NULL,
	PRIMARY KEY (admin_id),
	UNIQUE (admin_id)
);


CREATE TABLE mst_blocks
(
	block_id int(10) unsigned NOT NULL AUTO_INCREMENT,
	block_name char(1) NOT NULL,
	is_deleted boolean NOT NULL,
	PRIMARY KEY (block_id),
	UNIQUE (block_id),
	UNIQUE (block_name)
);


CREATE TABLE mst_seminars
(
	mst_seminar_id int(10) unsigned NOT NULL AUTO_INCREMENT,
	seminar_name varchar(256) NOT NULL,
	seminar_overview varchar(4000),
	capacity int unsigned,
	is_deleted boolean NOT NULL,
	PRIMARY KEY (mst_seminar_id),
	UNIQUE (mst_seminar_id)
);


CREATE TABLE mst_speakers
(
	speaker_id int NOT NULL AUTO_INCREMENT,
	speaker_name varchar(256) NOT NULL,
	speaker_profile varchar(4000),
	is_deleted boolean NOT NULL,
	PRIMARY KEY (speaker_id),
	UNIQUE (speaker_id)
);


CREATE TABLE participants
(
	participants_id int(10) unsigned NOT NULL AUTO_INCREMENT,
	user_id varchar(256) NOT NULL,
	user_name varchar(256) NOT NULL,
	kinds_of_sso varchar(256) NOT NULL,
	registered_date datetime NOT NULL,
	is_deleted boolean NOT NULL,
	seminar_id int(10) unsigned NOT NULL,
	PRIMARY KEY (participants_id),
	UNIQUE (participants_id)
);


CREATE TABLE seminars
(
	seminar_id int(10) unsigned NOT NULL AUTO_INCREMENT,
	start_datetime datetime NOT NULL,
	is_deleted boolean NOT NULL,
	mst_seminar_id int(10) unsigned NOT NULL,
	block_id int(10) unsigned NOT NULL,
	speaker_id int,
	event_id int(10) unsigned NOT NULL,
	PRIMARY KEY (seminar_id),
	UNIQUE (seminar_id)
);



/* Create Foreign Keys */

ALTER TABLE seminars
	ADD FOREIGN KEY (event_id)
	REFERENCES events (event_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE seminars
	ADD FOREIGN KEY (block_id)
	REFERENCES mst_blocks (block_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE seminars
	ADD FOREIGN KEY (mst_seminar_id)
	REFERENCES mst_seminars (mst_seminar_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE seminars
	ADD FOREIGN KEY (speaker_id)
	REFERENCES mst_speakers (speaker_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE participants
	ADD FOREIGN KEY (seminar_id)
	REFERENCES seminars (seminar_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



