CREATE TABLE "post_media_user_tag"(
    "user_tag_id" BIGINT NOT NULL,
    "post_media_id" BIGINT NOT NULL,
    "user_tagged_id" BIGINT NOT NULL
);
ALTER TABLE
    "post_media_user_tag" ADD PRIMARY KEY("user_tag_id");
CREATE INDEX "post_media_user_tag_post_media_id_index" ON
    "post_media_user_tag"("post_media_id");
CREATE INDEX "post_media_user_tag_user_tagged_id_index" ON
    "post_media_user_tag"("user_tagged_id");
CREATE TABLE "user_activation"(
    "user_activation_id" BIGINT NOT NULL,
    "unactive_userId" BIGINT NOT NULL,
    "activation_hash" CHAR(255) NOT NULL
);
ALTER TABLE
    "user_activation" ADD PRIMARY KEY("user_activation_id");
CREATE INDEX "user_activation_unactive_userid_index" ON
    "user_activation"("unactive_userId");
CREATE TABLE "comment"(
    "comment_id" BIGINT NOT NULL,
    "created_by_user_id" BIGINT NOT NULL,
    "comment_post_id" BIGINT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "comment_text" CHAR(255) NOT NULL,
    "comment_reply_id" BIGINT NOT NULL
);
ALTER TABLE
    "comment" ADD PRIMARY KEY("comment_id");
CREATE INDEX "comment_created_by_user_id_index" ON
    "comment"("created_by_user_id");
CREATE TABLE "Friend"(
    "friend_id" BIGINT NOT NULL,
    "following_user_id" BIGINT NOT NULL,
    "followed_by_user_d" BIGINT NOT NULL,
    "friend_since" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "Friend" ADD PRIMARY KEY("friend_id");
CREATE INDEX "friend_following_user_id_index" ON
    "Friend"("following_user_id");
CREATE INDEX "friend_followed_by_user_d_index" ON
    "Friend"("followed_by_user_d");
CREATE TABLE "post"(
    "post_id" BIGINT NOT NULL,
    "Title" CHAR(255) NOT NULL,
    "create_by_user_id" BIGINT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "caption" CHAR(255) NOT NULL
);
ALTER TABLE
    "post" ADD PRIMARY KEY("post_id");
CREATE INDEX "post_create_by_user_id_index" ON
    "post"("create_by_user_id");
CREATE TABLE "friend_request"(
    "friend_request_id" BIGINT NOT NULL,
    "from_user_id" BIGINT NOT NULL,
    "to_user_id" BIGINT NOT NULL,
    "request_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "friend_request" ADD PRIMARY KEY("friend_request_id");
CREATE INDEX "friend_request_from_user_id_index" ON
    "friend_request"("from_user_id");
CREATE INDEX "friend_request_to_user_id_index" ON
    "friend_request"("to_user_id");
CREATE TABLE "reaction"(
    "reaction_id" BIGINT NOT NULL,
    "reaction_user_id" BIGINT NOT NULL,
    "reaction_post_id" BIGINT NOT NULL,
    "liked" BOOLEAN NOT NULL
);
ALTER TABLE
    "reaction" ADD PRIMARY KEY("reaction_id");
CREATE INDEX "reaction_reaction_user_id_index" ON
    "reaction"("reaction_user_id");
CREATE INDEX "reaction_reaction_post_id_index" ON
    "reaction"("reaction_post_id");
CREATE TABLE "post_media"(
    "id" BIGINT NOT NULL,
    "post_id" BIGINT NOT NULL,
    "media_uri" CHAR(255) NOT NULL,
    "media_position" CHAR(255) NOT NULL
);
ALTER TABLE
    "post_media" ADD PRIMARY KEY("id");
CREATE TABLE "users"(
    "user_id" BIGINT NOT NULL,
    "email_address" CHAR(255) NOT NULL,
    "username" CHAR(255) NOT NULL,
    "password" CHAR(255) NOT NULL,
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