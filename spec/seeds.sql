DROP TABLE IF EXISTS "public"."spaces";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS spaces_id_seq;

-- Table Definition
CREATE TABLE "public"."spaces" (
    "id" SERIAL,
    "name" text,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."spaces" ("id", "name") VALUES
(1, 'Picturesque cabin in the woods'),
(2, 'Seaside retreat'),
(3, 'Batcave'),
(4, 'City nights'),
(5, 'The upsidedown');
