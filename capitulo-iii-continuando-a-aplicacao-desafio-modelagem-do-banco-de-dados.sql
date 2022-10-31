CREATE TABLE "users" (
  "id" uuid PRIMARY KEY NOT NULL DEFAULT (uuid_generate_v4()),
  "first_name" "character varying" NOT NULL,
  "last_name" "character varying" NOT NULL,
  "email" "character varying" NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now()),
  "updated_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "games" (
  "id" uuid PRIMARY KEY NOT NULL DEFAULT (uuid_generate_v4()),
  "title" "character varying" NOT NULL,
  "genresId" uuid NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now()),
  "updated_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "users_games_games" (
  "usersId" uuid NOT NULL,
  "gamesId" uuid NOT NULL,
  PRIMARY KEY ("usersId", "gamesId")
);

CREATE TABLE "genres" (
  "id" uuid PRIMARY KEY NOT NULL DEFAULT (uuid_generate_v4()),
  "title" "character varying" NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now()),
  "updated_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "orders" (
  "id" uuid PRIMARY KEY NOT NULL DEFAULT (uuid_generate_v4()),
  "usersId" uuid NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now()),
  "updated_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "orders_games" (
  "ordersId" uuid NOT NULL,
  "gamesId" uuid NOT NULL
);

CREATE INDEX "IDX_e5263d029d8644de829aae5c35" ON "users_games_games" ("usersId");

CREATE INDEX "IDX_934b0d8f9d0084c97d3876ad32" ON "users_games_games" ("gamesId");

ALTER TABLE "users_games_games" ADD FOREIGN KEY ("usersId") REFERENCES "users" ("id");

ALTER TABLE "users_games_games" ADD FOREIGN KEY ("gamesId") REFERENCES "games" ("id");

ALTER TABLE "games" ADD FOREIGN KEY ("genresId") REFERENCES "genres" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("usersId") REFERENCES "users" ("id");

ALTER TABLE "orders_games" ADD FOREIGN KEY ("ordersId") REFERENCES "orders" ("id");

ALTER TABLE "orders_games" ADD FOREIGN KEY ("gamesId") REFERENCES "games" ("id");
