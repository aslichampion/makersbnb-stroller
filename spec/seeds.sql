DROP TABLE IF EXISTS "public"."spaces";

-- Table Definition
CREATE TABLE "public"."spaces" (
    "id" SERIAL,
    "name" text,
    PRIMARY KEY ("id")
);

TRUNCATE TABLE "public"."spaces" RESTART IDENTITY;

INSERT INTO "public"."spaces" ("name") VALUES
('Picturesque cabin in the woods'),
('Seaside retreat'),
('Batcave'),
('City nights'),
('The upsidedown');
