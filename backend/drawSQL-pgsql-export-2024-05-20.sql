CREATE TABLE "post_media_user_tag"(
    "user_tag_id" VARCHAR(255) NOT NULL,
    "post_media_id" VARCHAR(255) NOT NULL,
    "user_tagged_id" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "post_media_user_tag" ADD CONSTRAINT "post_media_user_tag_user_tag_id_unique" UNIQUE("user_tag_id");
ALTER TABLE
    "post_media_user_tag" ADD CONSTRAINT "post_media_user_tag_post_media_id_unique" UNIQUE("post_media_id");
ALTER TABLE
    "post_media_user_tag" ADD CONSTRAINT "post_media_user_tag_user_tagged_id_unique" UNIQUE("user_tagged_id");
CREATE TABLE "user_activation"(
    "user_activation_id" VARCHAR(255) NOT NULL,
    "unactive_userId" VARCHAR(255) NOT NULL,
    "activation_hash" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "user_activation" ADD CONSTRAINT "user_activation_user_activation_id_unique" UNIQUE("user_activation_id");
ALTER TABLE
    "user_activation" ADD CONSTRAINT "user_activation_unactive_userid_unique" UNIQUE("unactive_userId");
CREATE TABLE "comment"(
    "comment_id" VARCHAR(255) NOT NULL,
    "created_by_user_id" VARCHAR(255) NOT NULL,
    "comment_post_id" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "comment_text" VARCHAR(255) NOT NULL,
    "comment_reply_id" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "comment" ADD CONSTRAINT "comment_comment_id_unique" UNIQUE("comment_id");
ALTER TABLE
    "comment" ADD CONSTRAINT "comment_created_by_user_id_unique" UNIQUE("created_by_user_id");
CREATE TABLE "Friend"(
    "friend_id" VARCHAR(255) NOT NULL,
    "following_user_id" VARCHAR(255) NOT NULL,
    "followed_by_user_d" VARCHAR(255) NOT NULL,
    "friend_since" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "Friend" ADD CONSTRAINT "friend_friend_id_unique" UNIQUE("friend_id");
ALTER TABLE
    "Friend" ADD CONSTRAINT "friend_following_user_id_unique" UNIQUE("following_user_id");
ALTER TABLE
    "Friend" ADD CONSTRAINT "friend_followed_by_user_d_unique" UNIQUE("followed_by_user_d");
CREATE TABLE "post"(
    "post_id" VARCHAR(255) NOT NULL,
    "Title" VARCHAR(255) NOT NULL,
    "create_by_user_id" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "caption" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "post" ADD PRIMARY KEY("post_id");
CREATE INDEX "post_create_by_user_id_index" ON
    "post"("create_by_user_id");
CREATE TABLE "friend_request"(
    "friend_request_id" VARCHAR(255) NOT NULL,
    "from_user_id" VARCHAR(255) NOT NULL,
    "to_user_id" VARCHAR(255) NOT NULL,
    "request_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "friend_request" ADD CONSTRAINT "friend_request_friend_request_id_unique" UNIQUE("friend_request_id");
ALTER TABLE
    "friend_request" ADD CONSTRAINT "friend_request_from_user_id_unique" UNIQUE("from_user_id");
ALTER TABLE
    "friend_request" ADD CONSTRAINT "friend_request_to_user_id_unique" UNIQUE("to_user_id");
CREATE TABLE "reaction"(
    "reaction_id" VARCHAR(255) NOT NULL,
    "reaction_user_id" VARCHAR(255) NOT NULL,
    "reaction_post_id" VARCHAR(255) NOT NULL,
    "liked" BOOLEAN NOT NULL
);
ALTER TABLE
    "reaction" ADD CONSTRAINT "reaction_reaction_id_unique" UNIQUE("reaction_id");
ALTER TABLE
    "reaction" ADD CONSTRAINT "reaction_reaction_user_id_unique" UNIQUE("reaction_user_id");
ALTER TABLE
    "reaction" ADD CONSTRAINT "reaction_reaction_post_id_unique" UNIQUE("reaction_post_id");
CREATE TABLE "post_media"(
    "id" VARCHAR(255) NOT NULL,
    "post_id" VARCHAR(255) NOT NULL,
    "media_uri" VARCHAR(255) NOT NULL,
    "media_position" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "post_media" ADD CONSTRAINT "post_media_id_unique" UNIQUE("id");
ALTER TABLE
    "post_media" ADD CONSTRAINT "post_media_post_id_unique" UNIQUE("post_id");
CREATE TABLE "users"(
    "user_id" VARCHAR(255) NOT NULL,
    "email_address" VARCHAR(255) NOT NULL,
    "username" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "actived" BOOLEAN NOT NULL,
    "signup_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("user_id");
ALTER TABLE
    "Friend" ADD CONSTRAINT "friend_followed_by_user_d_foreign" FOREIGN KEY("followed_by_user_d") REFERENCES "users"("user_id");
ALTER TABLE
    "reaction" ADD CONSTRAINT "reaction_reaction_user_id_foreign" FOREIGN KEY("reaction_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "post_media_user_tag" ADD CONSTRAINT "post_media_user_tag_user_tagged_id_foreign" FOREIGN KEY("user_tagged_id") REFERENCES "users"("user_id");
ALTER TABLE
    "comment" ADD CONSTRAINT "comment_comment_reply_id_foreign" FOREIGN KEY("comment_reply_id") REFERENCES "comment"("comment_id");
ALTER TABLE
    "user_activation" ADD CONSTRAINT "user_activation_unactive_userid_foreign" FOREIGN KEY("unactive_userId") REFERENCES "users"("user_id");
ALTER TABLE
    "comment" ADD CONSTRAINT "comment_comment_post_id_foreign" FOREIGN KEY("comment_post_id") REFERENCES "post"("post_id");
ALTER TABLE
    "Friend" ADD CONSTRAINT "friend_following_user_id_foreign" FOREIGN KEY("following_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "post" ADD CONSTRAINT "post_create_by_user_id_foreign" FOREIGN KEY("create_by_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "friend_request" ADD CONSTRAINT "friend_request_to_user_id_foreign" FOREIGN KEY("to_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "post_media_user_tag" ADD CONSTRAINT "post_media_user_tag_post_media_id_foreign" FOREIGN KEY("post_media_id") REFERENCES "post_media"("id");
ALTER TABLE
    "post_media" ADD CONSTRAINT "post_media_post_id_foreign" FOREIGN KEY("post_id") REFERENCES "post"("post_id");
ALTER TABLE
    "comment" ADD CONSTRAINT "comment_created_by_user_id_foreign" FOREIGN KEY("created_by_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "reaction" ADD CONSTRAINT "reaction_reaction_post_id_foreign" FOREIGN KEY("reaction_post_id") REFERENCES "post"("post_id");
ALTER TABLE
    "friend_request" ADD CONSTRAINT "friend_request_from_user_id_foreign" FOREIGN KEY("from_user_id") REFERENCES "users"("user_id");