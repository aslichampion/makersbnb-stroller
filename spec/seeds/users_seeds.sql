-- -------------------------------------------------------------
-- TablePlus 5.1.0(468)
--
-- https://tableplus.com/
--
-- Database: makersbnb_test
-- Generation Time: 2022-11-02 11:29:04.7850
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "id" int4 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    "email" text,
    "password" text,
    "sms" text,
    PRIMARY KEY ("id")
);

TRUNCATE TABLE "public"."users" RESTART IDENTITY;

INSERT INTO "public"."users" ("email", "password", "sms") VALUES
('test@test.com', 'password', NULL),
('test2@test.com', 'password2', NULL),
('test3@test.com', 'password3', NULL),
('test4@test.com', 'password4', NULL),
('test5@test.com', 'password5', NULL);
