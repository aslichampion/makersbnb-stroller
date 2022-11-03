-- -------------------------------------------------------------
-- TablePlus 5.1.0(468)
--
-- https://tableplus.com/
--
-- Database: makersbnb_test
-- Generation Time: 2022-11-02 11:29:04.7850
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."bookings";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."bookings" (
    "id" SERIAL,
    "space_id" int,
    "renter_id" int,
    "start_date" date,
    "number_of_nights" int,
    PRIMARY KEY ("id")
);

TRUNCATE TABLE "public"."bookings" RESTART IDENTITY;

INSERT INTO "public"."bookings" ("space_id", "renter_id", "start_date", "number_of_nights") VALUES
(1, 3, '2022-06-15', 1),
(1, 2, '2022-06-02', 6),
(2, 2, '2022-05-01', 3),
(3, 4, '2022-05-02', 2),
(4, 1, '2022-05-03', 7);
