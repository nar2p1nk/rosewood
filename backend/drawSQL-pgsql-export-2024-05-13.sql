CREATE TABLE "postMediaUserTag"(
    "userTagId" BIGINT NOT NULL,
    "postMediaId" BIGINT NOT NULL,
    "userTaggedId" BIGINT NOT NULL
);
ALTER TABLE
    "postMediaUserTag" ADD PRIMARY KEY("userTagId");
CREATE INDEX "postmediausertag_postmediaid_index" ON
    "postMediaUserTag"("postMediaId");
CREATE INDEX "postmediausertag_usertaggedid_index" ON
    "postMediaUserTag"("userTaggedId");
CREATE TABLE "userActivation"(
    "userActivationId" BIGINT NOT NULL,
    "unactiveUserId" BIGINT NOT NULL,
    "activationHash" CHAR(255) NOT NULL
);
ALTER TABLE
    "userActivation" ADD PRIMARY KEY("userActivationId");
CREATE INDEX "useractivation_unactiveuserid_index" ON
    "userActivation"("unactiveUserId");
CREATE TABLE "comment"(
    "commentId" BIGINT NOT NULL,
    "createdByUserId" BIGINT NOT NULL,
    "commentPostId" BIGINT NOT NULL,
    "createdAt" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "commentText" CHAR(255) NOT NULL,
    "commentReplyId" BIGINT NOT NULL
);
ALTER TABLE
    "comment" ADD PRIMARY KEY("commentId");
CREATE INDEX "comment_createdbyuserid_index" ON
    "comment"("createdByUserId");
CREATE TABLE "Friend"(
    "friendId" BIGINT NOT NULL,
    "followingUserId" BIGINT NOT NULL,
    "followedByUserId" BIGINT NOT NULL,
    "friendSince" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "Friend" ADD PRIMARY KEY("friendId");
CREATE INDEX "friend_followinguserid_index" ON
    "Friend"("followingUserId");
CREATE INDEX "friend_followedbyuserid_index" ON
    "Friend"("followedByUserId");
CREATE TABLE "post"(
    "postId" BIGINT NOT NULL,
    "Title" CHAR(255) NOT NULL,
    "createByUserId" BIGINT NOT NULL,
    "createdAt" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "caption" CHAR(255) NOT NULL
);
ALTER TABLE
    "post" ADD PRIMARY KEY("postId");
CREATE INDEX "post_createbyuserid_index" ON
    "post"("createByUserId");
CREATE TABLE "friendRequest"(
    "friendRequestId" BIGINT NOT NULL,
    "fromUserId" BIGINT NOT NULL,
    "toUserId" BIGINT NOT NULL,
    "requestDate" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "friendRequest" ADD PRIMARY KEY("friendRequestId");
CREATE INDEX "friendrequest_fromuserid_index" ON
    "friendRequest"("fromUserId");
CREATE INDEX "friendrequest_touserid_index" ON
    "friendRequest"("toUserId");
CREATE TABLE "reaction"(
    "reactionId" BIGINT NOT NULL,
    "reactionUserId" BIGINT NOT NULL,
    "reactionPostId" BIGINT NOT NULL,
    "liked" BOOLEAN NOT NULL
);
ALTER TABLE
    "reaction" ADD PRIMARY KEY("reactionId");
CREATE INDEX "reaction_reactionuserid_index" ON
    "reaction"("reactionUserId");
CREATE INDEX "reaction_reactionpostid_index" ON
    "reaction"("reactionPostId");
CREATE TABLE "postMedia"(
    "id" BIGINT NOT NULL,
    "postId" BIGINT NOT NULL,
    "mediaUri" CHAR(255) NOT NULL,
    "mediaPosition" CHAR(255) NOT NULL
);
ALTER TABLE
    "postMedia" ADD PRIMARY KEY("id");
CREATE TABLE "users"(
    "userId" BIGINT NOT NULL,
    "emailAddress" CHAR(255) NOT NULL,
    "username" CHAR(255) NOT NULL,
    "firstName" CHAR(255) NOT NULL,
    "lastName" CHAR(255) NOT NULL,
    "password" CHAR(255) NOT NULL,
    "actived" BOOLEAN NOT NULL,
    "signupDate" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("userId");
ALTER TABLE
    "Friend" ADD CONSTRAINT "friend_followedbyuserid_foreign" FOREIGN KEY("followedByUserId") REFERENCES "users"("userId");
ALTER TABLE
    "reaction" ADD CONSTRAINT "reaction_reactionuserid_foreign" FOREIGN KEY("reactionUserId") REFERENCES "users"("userId");
ALTER TABLE
    "postMediaUserTag" ADD CONSTRAINT "postmediausertag_usertaggedid_foreign" FOREIGN KEY("userTaggedId") REFERENCES "users"("userId");
ALTER TABLE
    "comment" ADD CONSTRAINT "comment_commentreplyid_foreign" FOREIGN KEY("commentReplyId") REFERENCES "comment"("commentId");
ALTER TABLE
    "userActivation" ADD CONSTRAINT "useractivation_unactiveuserid_foreign" FOREIGN KEY("unactiveUserId") REFERENCES "users"("userId");
ALTER TABLE
    "comment" ADD CONSTRAINT "comment_commentpostid_foreign" FOREIGN KEY("commentPostId") REFERENCES "post"("postId");
ALTER TABLE
    "Friend" ADD CONSTRAINT "friend_followinguserid_foreign" FOREIGN KEY("followingUserId") REFERENCES "users"("userId");
ALTER TABLE
    "post" ADD CONSTRAINT "post_createbyuserid_foreign" FOREIGN KEY("createByUserId") REFERENCES "users"("userId");
ALTER TABLE
    "friendRequest" ADD CONSTRAINT "friendrequest_touserid_foreign" FOREIGN KEY("toUserId") REFERENCES "users"("userId");
ALTER TABLE
    "postMediaUserTag" ADD CONSTRAINT "postmediausertag_postmediaid_foreign" FOREIGN KEY("postMediaId") REFERENCES "postMedia"("id");
ALTER TABLE
    "postMedia" ADD CONSTRAINT "postmedia_postid_foreign" FOREIGN KEY("postId") REFERENCES "post"("postId");
ALTER TABLE
    "comment" ADD CONSTRAINT "comment_createdbyuserid_foreign" FOREIGN KEY("createdByUserId") REFERENCES "users"("userId");
ALTER TABLE
    "reaction" ADD CONSTRAINT "reaction_reactionpostid_foreign" FOREIGN KEY("reactionPostId") REFERENCES "post"("postId");
ALTER TABLE
    "friendRequest" ADD CONSTRAINT "friendrequest_fromuserid_foreign" FOREIGN KEY("fromUserId") REFERENCES "users"("userId");