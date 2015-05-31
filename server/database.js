var bcrypt = require('bcrypt-nodejs')
  , config = require('../../config.json')
  , knex = require('knex')(config.db)
  , bookshelf = require('bookshelf')(knex)
  , Users
  , UsersLogin
  , BannedDomains
  , BannedUsers
  , Nodeverses
  , NodeversesSubmissions
  , NodeversesComments
  , NodeversesCommentsReplyNotifications
  , UsersCommentsSaves
  , UsersCommentsVotes
  , NodeversesDefaults
  , NodeversesFeatured
  , NodeversesCategories
  , NodeversesTags
  , NodeversesAdmins
  , NodeversesBannedUsers
  , NodeversesSubmissionsReplyNotifications
  , NodeversesStickySubmissions
  , UsersPrivateMessages
  , UsersSubscriptions
  , UsersPreferences
;

Users = bookshelf.Model.extend({
  tableName: 'users',
  idAttribute: 'users_id',
  generateHash: function (password) {
    return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
  },
  validPassword: function (password) {
    return bcrypt.compareSync(password, this.get('password'));
  }
})

UsersLogin = bookshelf.Model.extend({
  tableName: 'users_login',
  idAttribute: 'users_login_id',
});

BannedDomains = bookshelf.Model.extend({
  tableName: 'banned_domains',
  idAttribute: 'banned_domains_id',
});

BannedUsers = bookshelf.Model.extend({
  tableName: 'banned_users',
  idAttribute: 'banned_users_id',
});

Nodeverses = bookshelf.Model.extend({
  tableName: 'nodeverses',
  idAttribute: 'nodeverses_id',
});

NodeversesSubmissions = bookshelf.Model.extend({
  tableName: 'nodeverses_submissions',
  idAttribute: 'nodeverses_submissions_id',
});

NodeversesComments = bookshelf.Model.extend({
  tableName: 'nodeverses_comments',
  idAttribute: 'nodeverses_comments_id',
});

NodeversesCommentsReplyNotifications = bookshelf.Model.extend({
  tableName: 'nodeverses_comments_reply_notifications',
  idAttribute: 'nodeverses_comments_reply_notifications_id',
});

UsersCommentsSaves = bookshelf.Model.extend({
  tableName: 'users_comments_saves',
  idAttribute: 'users_comments_saves_id',
});

UsersCommentsVotes = bookshelf.Model.extend({
  tableName: 'users_comments_votes',
  idAttribute: 'users_comments_votes_id',
});

NodeversesDefaults = bookshelf.Model.extend({
  tableName: 'nodeverses_defaults',
  idAttribute: 'nodeverses_defaults_id',
});

NodeversesFeatured = bookshelf.Model.extend({
  tableName: 'nodeverses_featured',
  idAttribute: 'nodeverses_featured_id',
});

NodeversesCategories = bookshelf.Model.extend({
  tableName: 'nodeverses_categories',
  idAttribute: 'nodeverses_categories_id',
});

NodeversesTags = bookshelf.Model.extend({
  tableName: 'nodeverses_tags',
  idAttribute: 'nodeverses_tags_id',
});

NodeversesAdmins = bookshelf.Model.extend({
  tableName: 'nodeverses_admins',
  idAttribute: 'nodeverses_admins_id',
});

NodeversesBannedUsers = bookshelf.Model.extend({
  tableName: 'nodeverses_banned_users',
  idAttribute: 'nodeverses_banned_users_id',
});

NodeversesSubmissionsReplyNotifications = bookshelf.Model.extend({
  tableName: 'nodeverses_submissions_reply_notifications',
  idAttribute: 'nodeverses_submissions_reply_notifications_id',
});

NodeversesStickySubmissions = bookshelf.Model.extend({
  tableName: 'nodeverses_sticky_submissions',
  idAttribute: 'nodeverses_sticky_submissions_id',
});

UsersPrivateMessages = bookshelf.Model.extend({
  tableName: 'users_private_messages',
  idAttribute: 'users_private_messages_id',
});

UsersSubscriptions = bookshelf.Model.extend({
  tableName: 'users_subscriptions',
  idAttribute: 'users_subscriptions_id',
});

UsersPreferences = bookshelf.Model.extend({
  tableName: 'users_preferences',
  idAttribute: 'users_preferences_id',
});