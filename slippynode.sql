CREATE TABLE users (
    users_id SERIAL PRIMARY KEY,
    username
    registration_datetime
    email
    email_confirmed
    password
    lockout_enabled
    lockout_end_date
);

CREATE TABLE banned_domains (
    banned_domains_id
    users_id
    hostname
    reason
    datetime
);

CREATE TABLE banned_users (
    banned_users_id
    users_id
    banned_by
    reason
    date_banned
);

CREATE TABLE comments (
    comments_id
    users_id
    nodeverse_id
    messages_id
    subject
    body
    likes
    votes
    dislikes
    anonymous
    last_edit_date
    datetime
);

CREATE TABLE comment_reply_notifications (
    comment_reply_notifications_id
    comments_id
    submissions_id
    recipient_id
    sender_id
    nodeverse_id
    subject
    body
    status
    nodeverse
    marked_as_unread
    datetime
);

CREATE TABLE users_comments_saves (

);

CREATE TABLE users_comments_votes (

);

CREATE TABLE featured_nodeverses (
    featured_nodeverses_id
    nodeverse_id
    nodeverse_name
    datetime
);

CREATE TABLE nodeverse_messages (
    messages_id
    users_id
    subject
    body
    likes
    dislikes
    anonymous
    datetime
);

CREATE TABLE nodeverses (
    nodeverses_id
    name
    title
    description
    type
    tags
    rated_adult
    stylesheet
    creation_date
    subscribers
    private
    anonymous_mode

);

ALTER TABLE users OWNER TO slippynode_user;
ALTER TABLE comment_reply_notifications OWNER TO slippynode_user;
ALTER TABLE comments OWNER TO slippynode_user;
ALTER TABLE featured_nodeverses OWNER TO slippynode_user;
ALTER TABLE nodeverses OWNER TO slippynode_user;