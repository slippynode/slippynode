CREATE TABLE users (
    users_id SERIAL PRIMARY KEY,
    username VARCHAR (25),
    email VARCHAR (100),
    email_confirmed BOOLEAN,
    password VARCHAR (25),
    lockout_enabled BOOLEAN,
    lockout_end_date TIMESTAMP,
    registration_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE users OWNER TO slippynode_user;

CREATE TABLE users_login (
    users_login SERIAL PRIMARY KEY,
    users_id INTEGER REFERENCES users(users_id),
    last_login_ip VARCHAR (12),
    last_login_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE users_login OWNER TO slippynode_user;

CREATE TABLE banned_domains (
    banned_domains_id SERIAL PRIMARY KEY,
    users_id INTEGER REFERENCES users(users_id),
    hostname VARCHAR,
    reason VARCHAR (150),
    datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE banned_domains OWNER TO slippynode_user;

CREATE TABLE banned_users (
    banned_users_id SERIAL PRIMARY KEY,
    users_id INTEGER REFERENCES users(users_id),
    banned_by_users_id INTEGER REFERENCES users(users_id),
    reason VARCHAR (150),
    banned_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE banned_users OWNER TO slippynode_user;

CREATE TABLE nodeverses (
    nodeverses_id SERIAL PRIMARY KEY,
    name VARCHAR (250),
    title VARCHAR (500),
    description VARCHAR (100),
    submissions_text VARCHAR (200),
    allow_default BOOLEAN,
    enable_thumbnails BOOLEAN,
    rated_adult BOOLEAN,
    stylesheet VARCHAR,
    authorized_users_only BOOLEAN,
    private BOOLEAN,
    anonymous_mode BOOLEAN,
    last_submission_received_datetime TIMESTAMP,
    creation_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE nodeverses OWNER TO slippynode_user;

CREATE TABLE nodeverses_submissions (
    nodeverses_submissions_id SERIAL PRIMARY KEY,
    nodeverses_id INTEGER REFERENCES nodeverses(nodeverses_id),
    users_id INTEGER REFERENCES users(users_id),
    subject VARCHAR (300),
    body VARCHAR (1500),
    link_description VARCHAR (200),
    likes INTEGER,
    dislikes INTEGER,
    votes INTEGER,
    rank INTEGER,
    thumbnail VARCHAR,
    anonymous_mode BOOLEAN,
    views INTEGER,
    created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE nodeverses_submissions OWNER TO slippynode_user;

CREATE TABLE nodeverses_comments (
    nodeverses_comments_id SERIAL PRIMARY KEY,
    users_id INTEGER REFERENCES users(users_id),
    nodeverses_id INTEGER REFERENCES nodeverses(nodeverses_id),
    nodeverses_submissions_id INTEGER REFERENCES nodeverses_submissions(nodeverses_submissions_id),
    subject VARCHAR (250),
    body VARCHAR (1500),
    likes INTEGER,
    dislikes INTEGER,
    votes INTEGER,
    anonymous_mode BOOLEAN,
    last_edit_datetime TIMESTAMP,
    created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE nodeverses_comments OWNER TO slippynode_user;

CREATE TABLE nodeverses_comment_reply_notifications (
    nodeverses_comment_reply_notifications_id SERIAL PRIMARY KEY,
    nodeverses_comments_id INTEGER REFERENCES nodeverses_comments(nodeverses_comments_id),
    nodeverses_submissions_id INTEGER REFERENCES nodeverses_submissions(nodeverses_submissions_id),
    recipient_users_id INTEGER REFERENCES users(users_id),
    sender_users_id INTEGER REFERENCES users(users_id),
    nodeverses_id INTEGER REFERENCES nodeverses(nodeverses_id),
    status VARCHAR,
    marked_as_unread BOOLEAN,
    created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE nodeverses_comment_reply_notifications OWNER TO slippynode_user;

CREATE TABLE users_comments_saves (
    users_comments_saves_id SERIAL PRIMARY KEY,
    nodeverses_comments_id INTEGER REFERENCES nodeverses_comments(nodeverses_comments_id),
    users_id INTEGER REFERENCES users(users_id),
    created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE users_comments_saves OWNER TO slippynode_user;

CREATE TABLE users_comments_votes (
    users_comments_votes_id SERIAL PRIMARY KEY,
    nodeverses_comments_id INTEGER REFERENCES nodeverses_comments(nodeverses_comments_id),
    users_id INTEGER REFERENCES users(users_id),
    votes_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE users_comments_votes OWNER TO slippynode_user;

CREATE TABLE nodeverses_default (
    nodeverses_default_id SERIAL PRIMARY KEY,
    nodeverses_id INTEGER REFERENCES nodeverses(nodeverses_id),
    nodeverses_name VARCHAR (250)
);

ALTER TABLE nodeverses_default OWNER TO slippynode_user;

CREATE TABLE nodeverses_featured (
    nodeverses_featured_id SERIAL PRIMARY KEY,
    nodeverses_id INTEGER REFERENCES nodeverses(nodeverses_id),
    nodeverses_name VARCHAR (250)
);

ALTER TABLE nodeverses_featured OWNER TO slippynode_user;

CREATE TABLE nodeverses_categories (
    nodeverses_categories_id SERIAL PRIMARY KEY,
    nodeverses_id INTEGER REFERENCES nodeverses(nodeverses_id),
    name VARCHAR
);

ALTER TABLE nodeverses_categories OWNER TO slippynode_user;

CREATE TABLE nodeverses_tags (
    nodeverses_tags_id SERIAL PRIMARY KEY,
    nodeverses_id INTEGER REFERENCES nodeverses(nodeverses_id),
    name VARCHAR
);

ALTER TABLE nodeverses_tags OWNER TO slippynode_user;

CREATE TABLE nodeverses_admins (
    nodeverses_admins_id SERIAL PRIMARY KEY,
    nodeverses_id INTEGER REFERENCES nodeverses(nodeverses_id),
    users_id INTEGER REFERENCES users(users_id),
    added_by_users_id INTEGER REFERENCES users(users_id),
    created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE nodeverses_admins OWNER TO slippynode_user;

CREATE TABLE nodeverses_banned_users (
    nodeverses_banned_users_id SERIAL PRIMARY KEY,
    nodeverses_id INTEGER REFERENCES nodeverses(nodeverses_id),
    users_id INTEGER REFERENCES users(users_id),
    banned_by_users_id INTEGER REFERENCES users(users_id),
    reason VARCHAR (150),
    banned_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE nodeverses_banned_users OWNER TO slippynode_user;

CREATE TABLE nodeverses_submissions_reply_notifications (
    nodeverses_submissions_reply_notifications_id SERIAL PRIMARY KEY,
    nodeverses_comments_id INTEGER REFERENCES nodeverses_comments(nodeverses_comments_id),
    nodeverses_submissions_id INTEGER REFERENCES nodeverses_submissions(nodeverses_submissions_id),
    nodeverses_id INTEGER REFERENCES nodeverses(nodeverses_id),
    senders_users_id INTEGER REFERENCES users(users_id),
    recipients_users_id INTEGER REFERENCES users(users_id),
    status VARCHAR,
    marked_as_unread BOOLEAN,
    created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE nodeverses_submissions_reply_notifications OWNER TO slippynode_user;

CREATE TABLE nodeverses_sticky_submissions (
    nodeverses_sticky_submissions_id SERIAL PRIMARY KEY,
    nodeverses_submissions_id INTEGER REFERENCES nodeverses_submissions(nodeverses_submissions_id),
    nodeverses_id INTEGER REFERENCES nodeverses(nodeverses_id),
    users_id INTEGER REFERENCES users(users_id),
    created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE nodeverses_sticky_submissions OWNER TO slippynode_user;

CREATE TABLE users_private_messages (
    users_private_messages_id SERIAL PRIMARY KEY,
    senders_users_id INTEGER REFERENCES users(users_id),
    recipients_users_id INTEGER REFERENCES users(users_id),
    subject VARCHAR (300),
    body VARCHAR (1500),
    status VARCHAR,
    marked_as_unread BOOLEAN,
    created_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE users_private_messages OWNER TO slippynode_user;

CREATE TABLE users_subscriptions (
    users_subscriptions_id SERIAL PRIMARY KEY,
    nodeverses_id INTEGER REFERENCES nodeverses(nodeverses_id),
    users_id INTEGER REFERENCES users(users_id)
);

ALTER TABLE users_subscriptions OWNER TO slippynode_user;

CREATE TABLE users_preferences (
    users_preferences_id SERIAL PRIMARY KEY,
    users_id INTEGER REFERENCES users(users_id),
    night_mode BOOLEAN,
    bio VARCHAR (500),
    avatar VARCHAR,
    adult_content BOOLEAN,
    public_votes BOOLEAN,
    public_subscriptions BOOLEAN
);

ALTER TABLE users_preferences OWNER TO slippynode_user;