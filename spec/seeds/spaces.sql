DROP TABLE IF EXISTS "public"."spaces";

-- Table Definition
CREATE TABLE "public"."spaces" (
    "id" SERIAL,
    "name" text,
    "photo_url" text,
    "description" text,
    "price_per_night" text,
    PRIMARY KEY ("id")
);

TRUNCATE TABLE "public"."spaces" RESTART IDENTITY;

INSERT INTO "public"."spaces" ("name", "photo_url", "description", "price_per_night") VALUES

('Picturesque cabin in the woods','https://images.unsplash.com/photo-1505635552518-3448ff116af3', 'Blue castello blue castello rubber cheese. Halloumi who moved my cheese caerphilly fromage frais cheddar cheese and wine halloumi hard cheese.','600' ),

('Seaside retreat', 'https://images.unsplash.com/photo-1566754844421-9bc834baf4a3' , 'Croque monsieur fromage frais cow. Cheese strings bocconcini squirty cheese port-salut paneer croque monsieur the big cheese queso. Mozzarella lancashire cheese and wine emmental bavarian bergkase lancashire cheese triangles the big cheese. Danish fontina caerphilly chalk and cheese melted cheese st. agur blue cheese.', '700'),

('Batcave', 'https://images.unsplash.com/photo-1582983560672-ab41be5d05a4', 'Who moved my cheese mascarpone manchego boursin pecorino cauliflower cheese port-salut manchego. Cheeseburger.', '200'),

('City nights', 'https://images.unsplash.com/photo-1504971261747-65c524d60ca2', 'St. agur blue cheese port-salut macaroni cheese bocconcini danish fontina melted cheese blue castello airedale.', '1000'),

('The upsidedown', 'https://images.unsplash.com/photo-1583856355246-48f2c53875ef', 'Croque monsieur fromage frais cow.', '50');
