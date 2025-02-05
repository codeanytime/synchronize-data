-- liquibase formatted sql

-- changeset thanhch:1711625356332-1
CREATE TABLE "comments" ("comment_id" INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL, "content" TEXT, "post_id" INTEGER, "created_at" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL, "created_by" INTEGER, "updated_at" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL, "updated_by" INTEGER, CONSTRAINT "comments_pkey" PRIMARY KEY ("comment_id"));

-- changeset thanhch:1711625356332-2
CREATE TABLE "posts" ("post_id" INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL, "title" VARCHAR(60), "content" TEXT, "created_at" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL, "created_by" INTEGER, "updated_at" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL, "updated_by" INTEGER, CONSTRAINT "posts_pkey" PRIMARY KEY ("post_id"));

-- changeset thanhch:1711625356332-3
CREATE TABLE "tags" ("tag_id" INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL, "tag_name" TEXT, "created_at" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL, "created_by" INTEGER, "updated_at" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL, "updated_by" INTEGER, CONSTRAINT "tags_pkey" PRIMARY KEY ("tag_id"));

-- changeset thanhch:1711625356332-4
CREATE TABLE "post_tags" ("tag_id" INTEGER, "post_id" INTEGER, "created_at" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL, "created_by" INTEGER, "updated_at" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL, "updated_by" INTEGER);

-- changeset thanhch:1711625356332-5
CREATE TABLE "categories" ("category_id" INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL, "name" TEXT, "parent_id" INTEGER, "created_at" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL, "created_by" INTEGER, "updated_at" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL, "updated_by" INTEGER, CONSTRAINT "categories_pkey" PRIMARY KEY ("category_id"));

-- changeset thanhch:1711625356332-6
CREATE TABLE "post_categories" ("category_id" INTEGER, "post_id" INTEGER, "created_at" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL, "created_by" INTEGER, "updated_at" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL, "updated_by" INTEGER);

-- changeset thanhch:1711625356332-7
ALTER TABLE "tags" ADD CONSTRAINT "tags_tag_name_key" UNIQUE ("tag_name");

-- changeset thanhch:1711625356332-8
ALTER TABLE "post_tags" ADD CONSTRAINT "post_tags_tag_id_post_id_key" UNIQUE ("tag_id", "post_id");

-- changeset thanhch:1711625356332-9
ALTER TABLE "categories" ADD CONSTRAINT "categories_name_key" UNIQUE ("name");

-- changeset thanhch:1711625356332-10
ALTER TABLE "post_categories" ADD CONSTRAINT "post_categories_category_id_post_id_key" UNIQUE ("category_id", "post_id");

-- changeset thanhch:1711625356332-11
CREATE TABLE "test-table" ("name" CHAR(1));

-- changeset thanhch:1711625356332-12
CREATE TABLE "users" ("user_id" INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL, "user_name" VARCHAR(50), "password" VARCHAR(50), "email" VARCHAR(50), "role" ROLE DEFAULT 'USER', "avatar" TEXT, "active" BOOLEAN DEFAULT FALSE, "last_login" TIMESTAMP WITHOUT TIME ZONE, "created_at" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL, "created_by" INTEGER, "updated_at" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL, "updated_by" INTEGER, CONSTRAINT "users_pkey" PRIMARY KEY ("user_id"));

-- changeset thanhch:1711625356332-13
ALTER TABLE "users" ADD CONSTRAINT "email_unique" UNIQUE ("email");

-- changeset thanhch:1711625356332-14
ALTER TABLE "users" ADD CONSTRAINT "username_unique" UNIQUE ("user_name");

