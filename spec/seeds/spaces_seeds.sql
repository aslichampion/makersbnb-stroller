DROP TABLE IF EXISTS "public"."spaces";

-- Table Definition
CREATE TABLE "public"."spaces" (
    "id" SERIAL,
    "owner_id" int4,
    "name" text,
    PRIMARY KEY ("id")
);

TRUNCATE TABLE "public"."spaces" RESTART IDENTITY;

INSERT INTO "public"."spaces" ("owner_id", "name") VALUES
(1, 'Picturesque cabin in the woods'),
(2, 'Seaside retreat'),
(3, 'Batcave'),
(4, 'City nights'),
(5, 'The upsidedown');