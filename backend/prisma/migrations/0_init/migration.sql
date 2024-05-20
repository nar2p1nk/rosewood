-- CreateTable
CREATE TABLE "Friend" (
    "friend_id" CHAR(255) NOT NULL,
    "following_user_id" CHAR(255) NOT NULL,
    "followed_by_user_d" CHAR(255) NOT NULL,
    "friend_since" TIMESTAMP(0) NOT NULL
);

-- CreateTable
CREATE TABLE "comment" (
    "comment_id" CHAR(255) NOT NULL,
    "created_by_user_id" CHAR(255) NOT NULL,
    "comment_post_id" CHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL,
    "comment_text" CHAR(255) NOT NULL,
    "comment_reply_id" CHAR(255) NOT NULL
);

-- CreateTable
CREATE TABLE "friend_request" (
    "friend_request_id" CHAR(255) NOT NULL,
    "from_user_id" CHAR(255) NOT NULL,
    "to_user_id" CHAR(255) NOT NULL,
    "request_date" TIMESTAMP(0) NOT NULL
);

-- CreateTable
CREATE TABLE "post" (
    "post_id" CHAR(255) NOT NULL,
    "Title" CHAR(255) NOT NULL,
    "create_by_user_id" CHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL,
    "caption" CHAR(255) NOT NULL
);

-- CreateTable
CREATE TABLE "post_media" (
    "id" CHAR(255) NOT NULL,
    "post_id" CHAR(255) NOT NULL,
    "media_uri" CHAR(255) NOT NULL,
    "media_position" CHAR(255) NOT NULL
);

-- CreateTable
CREATE TABLE "post_media_user_tag" (
    "user_tag_id" CHAR(255) NOT NULL,
    "post_media_id" CHAR(255) NOT NULL,
    "user_tagged_id" CHAR(255) NOT NULL
);

-- CreateTable
CREATE TABLE "reaction" (
    "reaction_id" CHAR(255) NOT NULL,
    "reaction_user_id" CHAR(255) NOT NULL,
    "reaction_post_id" CHAR(255) NOT NULL,
    "liked" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "user_activation" (
    "user_activation_id" CHAR(255) NOT NULL,
    "unactive_userId" CHAR(255) NOT NULL,
    "activation_hash" CHAR(255) NOT NULL
);

-- CreateTable
CREATE TABLE "users" (
    "user_id" CHAR(255) NOT NULL,
    "email_address" CHAR(255) NOT NULL,
    "username" CHAR(255) NOT NULL,
    "password" CHAR(255) NOT NULL,
    "actived" BOOLEAN NOT NULL,
    "signup_date" TIMESTAMP(0) NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "friend_friend_id_unique" ON "Friend"("friend_id");

-- CreateIndex
CREATE UNIQUE INDEX "friend_following_user_id_unique" ON "Friend"("following_user_id");

-- CreateIndex
CREATE UNIQUE INDEX "friend_followed_by_user_d_unique" ON "Friend"("followed_by_user_d");

-- CreateIndex
CREATE UNIQUE INDEX "comment_comment_id_unique" ON "comment"("comment_id");

-- CreateIndex
CREATE UNIQUE INDEX "comment_created_by_user_id_unique" ON "comment"("created_by_user_id");

-- CreateIndex
CREATE UNIQUE INDEX "friend_request_friend_request_id_unique" ON "friend_request"("friend_request_id");

-- CreateIndex
CREATE UNIQUE INDEX "friend_request_from_user_id_unique" ON "friend_request"("from_user_id");

-- CreateIndex
CREATE UNIQUE INDEX "friend_request_to_user_id_unique" ON "friend_request"("to_user_id");

-- CreateIndex
CREATE UNIQUE INDEX "post_post_id_unique" ON "post"("post_id");

-- CreateIndex
CREATE INDEX "post_create_by_user_id_index" ON "post"("create_by_user_id");

-- CreateIndex
CREATE UNIQUE INDEX "post_media_id_unique" ON "post_media"("id");

-- CreateIndex
CREATE UNIQUE INDEX "post_media_post_id_unique" ON "post_media"("post_id");

-- CreateIndex
CREATE UNIQUE INDEX "post_media_user_tag_user_tag_id_unique" ON "post_media_user_tag"("user_tag_id");

-- CreateIndex
CREATE UNIQUE INDEX "post_media_user_tag_post_media_id_unique" ON "post_media_user_tag"("post_media_id");

-- CreateIndex
CREATE UNIQUE INDEX "post_media_user_tag_user_tagged_id_unique" ON "post_media_user_tag"("user_tagged_id");

-- CreateIndex
CREATE UNIQUE INDEX "reaction_reaction_id_unique" ON "reaction"("reaction_id");

-- CreateIndex
CREATE UNIQUE INDEX "reaction_reaction_user_id_unique" ON "reaction"("reaction_user_id");

-- CreateIndex
CREATE UNIQUE INDEX "reaction_reaction_post_id_unique" ON "reaction"("reaction_post_id");

-- CreateIndex
CREATE UNIQUE INDEX "user_activation_user_activation_id_unique" ON "user_activation"("user_activation_id");

-- CreateIndex
CREATE UNIQUE INDEX "user_activation_unactive_userid_unique" ON "user_activation"("unactive_userId");

-- CreateIndex
CREATE UNIQUE INDEX "users_user_id_unique" ON "users"("user_id");

-- AddForeignKey
ALTER TABLE "Friend" ADD CONSTRAINT "friend_followed_by_user_d_foreign" FOREIGN KEY ("followed_by_user_d") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Friend" ADD CONSTRAINT "friend_following_user_id_foreign" FOREIGN KEY ("following_user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "comment" ADD CONSTRAINT "comment_comment_post_id_foreign" FOREIGN KEY ("comment_post_id") REFERENCES "post"("post_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "comment" ADD CONSTRAINT "comment_comment_reply_id_foreign" FOREIGN KEY ("comment_reply_id") REFERENCES "comment"("comment_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "comment" ADD CONSTRAINT "comment_created_by_user_id_foreign" FOREIGN KEY ("created_by_user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "friend_request" ADD CONSTRAINT "friend_request_from_user_id_foreign" FOREIGN KEY ("from_user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "friend_request" ADD CONSTRAINT "friend_request_to_user_id_foreign" FOREIGN KEY ("to_user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "post" ADD CONSTRAINT "post_create_by_user_id_foreign" FOREIGN KEY ("create_by_user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "post_media" ADD CONSTRAINT "post_media_post_id_foreign" FOREIGN KEY ("post_id") REFERENCES "post"("post_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "post_media_user_tag" ADD CONSTRAINT "post_media_user_tag_post_media_id_foreign" FOREIGN KEY ("post_media_id") REFERENCES "post_media"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "post_media_user_tag" ADD CONSTRAINT "post_media_user_tag_user_tagged_id_foreign" FOREIGN KEY ("user_tagged_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "reaction" ADD CONSTRAINT "reaction_reaction_post_id_foreign" FOREIGN KEY ("reaction_post_id") REFERENCES "post"("post_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "reaction" ADD CONSTRAINT "reaction_reaction_user_id_foreign" FOREIGN KEY ("reaction_user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_activation" ADD CONSTRAINT "user_activation_unactive_userid_foreign" FOREIGN KEY ("unactive_userId") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

