CREATE TABLE "post media user tag"(
    "postMedia_id" BIGINT NOT NULL,
    "userTagged_id" BIGINT NOT NULL
);
CREATE INDEX "post media user tag_postmedia_id_index" ON
    "post media user tag"("postMedia_id");
CREATE INDEX "post media user tag_usertagged_id_index" ON
    "post media user tag"("userTagged_id");
CREATE TABLE "user activation"(
    "unactive_user_id" BIGINT NOT NULL,
    "activation_hash" CHAR(255) NOT NULL
);
CREATE INDEX "user activation_unactive_user_id_index" ON
    "user activation"("unactive_user_id");
CREATE TABLE "comment"(
    "commentId" BIGINT NOT NULL,
    "createdBy_user_id" BIGINT NOT NULL,
    "comment_post_id" BIGINT NOT NULL,
    "createdAt" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "commentText" CHAR(255) NOT NULL,
    "comment_replied_to_id" BIGINT NOT NULL
);
ALTER TABLE
    "comment" ADD PRIMARY KEY("commentId");
CREATE INDEX "comment_createdby_user_id_index" ON
    "comment"("createdBy_user_id");
CREATE TABLE "Friend"(
    "following_user_id" BIGINT NOT NULL,
    "followedBy_user_id" BIGINT NOT NULL,
    "friend_since" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
CREATE INDEX "friend_following_user_id_index" ON
    "Friend"("following_user_id");
CREATE INDEX "friend_followedby_user_id_index" ON
    "Friend"("followedBy_user_id");
CREATE TABLE "post"(
    "post_id" BIGINT NOT NULL,
    "Title" CHAR(255) NOT NULL,
    "createBy_user_id" BIGINT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "caption" CHAR(255) NOT NULL
);
ALTER TABLE
    "post" ADD PRIMARY KEY("post_id");
CREATE INDEX "post_createby_user_id_index" ON
    "post"("createBy_user_id");
CREATE TABLE "friend's request"(
    "from_user_id" BIGINT NOT NULL,
    "to_user_id" BIGINT NOT NULL,
    "request_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
CREATE INDEX "friend's request_from_user_id_index" ON
    "friend's request"("from_user_id");
CREATE INDEX "friend's request_to_user_id_index" ON
    "friend's request"("to_user_id");
CREATE TABLE "reaction"(
    "reaction_user_id" BIGINT NOT NULL,
    "reaction_post_id" BIGINT NOT NULL,
    "likeOrNot" BOOLEAN NOT NULL
);
CREATE INDEX "reaction_reaction_user_id_index" ON
    "reaction"("reaction_user_id");
CREATE INDEX "reaction_reaction_post_id_index" ON
    "reaction"("reaction_post_id");
CREATE TABLE "post media"(
    "id" BIGINT NOT NULL,
    "post_id" BIGINT NOT NULL,
    "media url" CHAR(255) NOT NULL,
    "media_position" CHAR(255) NOT NULL
);
ALTER TABLE
    "post media" ADD PRIMARY KEY("id");
CREATE TABLE "users"(
    "user_id" BIGINT NOT NULL,
    "email address" CHAR(255) NOT NULL,
    "username" CHAR(255) NOT NULL,
    "firstName" CHAR(255) NOT NULL,
    "lastName" CHAR(255) NULL,
    "password" CHAR(255) NOT NULL,
    "actived" BOOLEAN NOT NULL,
    "signup_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("user_id");
ALTER TABLE
    "Friend" ADD CONSTRAINT "friend_followedby_user_id_foreign" FOREIGN KEY("followedBy_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "reaction" ADD CONSTRAINT "reaction_reaction_user_id_foreign" FOREIGN KEY("reaction_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "post media user tag" ADD CONSTRAINT "post media user tag_usertagged_id_foreign" FOREIGN KEY("userTagged_id") REFERENCES "users"("user_id");
ALTER TABLE
    "comment" ADD CONSTRAINT "comment_comment_replied_to_id_foreign" FOREIGN KEY("comment_replied_to_id") REFERENCES "comment"("commentId");
ALTER TABLE
    "user activation" ADD CONSTRAINT "user activation_unactive_user_id_foreign" FOREIGN KEY("unactive_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "comment" ADD CONSTRAINT "comment_comment_post_id_foreign" FOREIGN KEY("comment_post_id") REFERENCES "post"("post_id");
ALTER TABLE
    "Friend" ADD CONSTRAINT "friend_following_user_id_foreign" FOREIGN KEY("following_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "post" ADD CONSTRAINT "post_createby_user_id_foreign" FOREIGN KEY("createBy_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "friend's request" ADD CONSTRAINT "friend's request_to_user_id_foreign" FOREIGN KEY("to_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "post media user tag" ADD CONSTRAINT "post media user tag_postmedia_id_foreign" FOREIGN KEY("postMedia_id") REFERENCES "post media"("id");
ALTER TABLE
    "post media" ADD CONSTRAINT "post media_post_id_foreign" FOREIGN KEY("post_id") REFERENCES "post"("post_id");
ALTER TABLE
    "comment" ADD CONSTRAINT "comment_createdby_user_id_foreign" FOREIGN KEY("createdBy_user_id") REFERENCES "users"("user_id");
ALTER TABLE
    "reaction" ADD CONSTRAINT "reaction_reaction_post_id_foreign" FOREIGN KEY("reaction_post_id") REFERENCES "post"("post_id");
ALTER TABLE
    "friend's request" ADD CONSTRAINT "friend's request_from_user_id_foreign" FOREIGN KEY("from_user_id") REFERENCES "users"("user_id");