CREATE TABLE "postMediaUserTag"(
    "post_media_id" BIGINT NOT NULL,
    "user_tagged_id" BIGINT NOT NULL
);
CREATE INDEX "postmediausertag_post_media_id_index" ON
    "postMediaUserTag"("post_media_id");
CREATE INDEX "postmediausertag_user_tagged_id_index" ON
    "postMediaUserTag"("user_tagged_id");
CREATE TABLE "userActivation"(
    "unactive_user_id" BIGINT NOT NULL,
    "activation_hash" CHAR(255) NOT NULL
);
CREATE INDEX "useractivation_unactive_user_id_index" ON
    "userActivation"("unactive_user_id");
CREATE TABLE "comment"(
    "comment_id" BIGINT NOT NULL,
    "created_by_user_id" BIGINT NOT NULL,
    "comment_post_id" BIGINT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "comment_text" CHAR(255) NOT NULL,
    "comment_reply_Id" BIGINT NOT NULL
);
ALTER TABLE
    "comment" ADD PRIMARY KEY("comment_id");
CREATE INDEX "comment_created_by_user_id_index" ON
    "comment"("created_by_user_id");
CREATE TABLE "Friend"(
    "following_user_id" BIGINT NOT NULL,
    "followed_by_user_id" BIGINT NOT NULL,
    "friend_since" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
CREATE INDEX "friend_following_user_id_index" ON
    "Friend"("following_user_id");
CREATE INDEX "friend_followed_by_user_id_index" ON
    "Friend"("followed_by_user_id");
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
CREATE TABLE "friendRequest"(
    "from_user_id" BIGINT NOT NULL,
    "to_user_id" BIGINT NOT NULL,
    "request_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
CREATE INDEX "friendrequest_from_user_id_index" ON
    "friendRequest"("from_user_id");
CREATE INDEX "friendrequest_to_user_id_index" ON
    "friendRequest"("to_user_id");
CREATE TABLE "reaction"(
    "reaction_user_id" BIGINT NOT NULL,
    "reaction_post_id" BIGINT NOT NULL,
    "liked" BOOLEAN NOT NULL
);
CREATE INDEX "reaction_reaction_user_id_index" ON
    "reaction"("reaction_user_id");
CREATE INDEX "reaction_reaction_post_id_index" ON
    "reaction"("reaction_post_id");
CREATE TABLE "postMedia"(
    "id" BIGINT NOT NULL,
    "post_id" BIGINT NOT NULL,
    "media_uri" CHAR(255) NOT NULL,
    "media_position" CHAR(255) NOT NULL
);
ALTER TABLE
    "postMedia" ADD PRIMARY KEY("id");
CREATE TABLE "users"(
    "user_id" BIGINT NOT NULL,
    "email_address" CHAR(255) NOT NULL,
    "username" CHAR(255) NOT NULL,
    "first_name" CHAR(255) NOT NULL,
    "last_name" CHAR(255) NOT NULL,
    "password" CHAR(255) NOT NULL,
    "actived" BOOLEAN NOT NULL,
    "signup_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("user_id");
ALTER TABLE
    "Friend" ADD CONSTRAINT "friend_followed_by_user_id_foreign" FOREIGN KEY("followed_by_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "reaction" ADD CONSTRAINT "reaction_reaction_user_id_foreign" FOREIGN KEY("reaction_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "postMediaUserTag" ADD CONSTRAINT "postmediausertag_user_tagged_id_foreign" FOREIGN KEY("user_tagged_id") REFERENCES "users"("user_id");
ALTER TABLE
    "comment" ADD CONSTRAINT "comment_comment_reply_id_foreign" FOREIGN KEY("comment_reply_Id") REFERENCES "comment"("comment_id");
ALTER TABLE
    "userActivation" ADD CONSTRAINT "useractivation_unactive_user_id_foreign" FOREIGN KEY("unactive_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "comment" ADD CONSTRAINT "comment_comment_post_id_foreign" FOREIGN KEY("comment_post_id") REFERENCES "post"("post_id");
ALTER TABLE
    "Friend" ADD CONSTRAINT "friend_following_user_id_foreign" FOREIGN KEY("following_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "post" ADD CONSTRAINT "post_create_by_user_id_foreign" FOREIGN KEY("create_by_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "friendRequest" ADD CONSTRAINT "friendrequest_to_user_id_foreign" FOREIGN KEY("to_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "postMediaUserTag" ADD CONSTRAINT "postmediausertag_post_media_id_foreign" FOREIGN KEY("post_media_id") REFERENCES "postMedia"("id");
ALTER TABLE
    "postMedia" ADD CONSTRAINT "postmedia_post_id_foreign" FOREIGN KEY("post_id") REFERENCES "post"("post_id");
ALTER TABLE
    "comment" ADD CONSTRAINT "comment_created_by_user_id_foreign" FOREIGN KEY("created_by_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "reaction" ADD CONSTRAINT "reaction_reaction_post_id_foreign" FOREIGN KEY("reaction_post_id") REFERENCES "post"("post_id");
ALTER TABLE
    "friendRequest" ADD CONSTRAINT "friendrequest_from_user_id_foreign" FOREIGN KEY("from_user_id") REFERENCES "users"("user_id");