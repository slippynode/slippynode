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
  },
  login: function () {
    return this.hasOne(UsersLogin, 'users_id');
  },
  nodeverses: function () {
    return this.hasMany(Nodeverses, 'users_id');
  },
  nodeversesSubmissions: function () {
    return this.hasMany(NodeversesSubmissions, 'users_id');
  },
  nodeversesComments: function () {
    return this.hasMany(NodeversesComments, 'users_id');
  },
  commentSaves: function () {
    return this.hasMany(UsersCommentsSaves, 'users_id');
  },
  commentVotes: function () {
    return this.hasMany(UsersCommentsVotes, 'users_id');
  },
  sentPrivateMessages: function () {
    return this.hasMany(UsersPrivateMessages, 'senders_users_id');
  },
  recievedPrivateMessages: function () {
    return this.hasMany(UsersPrivateMessages, 'recipients_users_id');
  },
  nodeversesSubscriptions: function () {
    return this.hasMany(UsersSubscriptions, 'users_id');
  },
  preferences: function () {
    return this.hasOne(UsersPreferences, 'users_id');
  }
});

UsersLogin = bookshelf.Model.extend({
  tableName: 'users_login',
  idAttribute: 'users_login_id',
  user: function () {
    return this.belongsTo(Users, 'users_id');
  }
});

BannedDomains = bookshelf.Model.extend({
  tableName: 'banned_domains',
  idAttribute: 'banned_domains_id',
  user: function () {
    return this.belongsTo(Users, 'users_id');
  }
});

BannedUsers = bookshelf.Model.extend({
  tableName: 'banned_users',
  idAttribute: 'banned_users_id',
  bannedUser: function () {
    return this.belongsTo(Users, 'users_id');
  },
  bannedBy: function () {
    return this.belongsTo(Users, 'banned_by_users_id');
  }
});

Nodeverses = bookshelf.Model.extend({
  tableName: 'nodeverses',
  idAttribute: 'nodeverses_id',
  createdBy: function () {
    return this.belongsTo(Users, 'created_by_users_id');
  }
});

NodeversesSubmissions = bookshelf.Model.extend({
  tableName: 'nodeverses_submissions',
  idAttribute: 'nodeverses_submissions_id',
  nodeverse: function () {
    return this.belongsTo(Nodeverses, 'nodeverses_id');
  },
  createdBy: function () {
    return this.belongsTo(Users, 'users_id');
  }
});

NodeversesComments = bookshelf.Model.extend({
  tableName: 'nodeverses_comments',
  idAttribute: 'nodeverses_comments_id',
  nodeverse: function () {
    return this.belongsTo(Nodeverses, 'nodeverses_id');
  },
  nodeversesSubmissions: function () {
    return this.belongsTo(NodeversesSubmissions, 'nodeverses_submissions_id');
  },
  createdBy: function () {
    return this.belongsTo(Users, 'users_id');
  }
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

module.exports = {
  'Users': Users,
  'UsersLogin': UsersLogin,
  'BannedDomains': BannedDomains,
  'BannedUsers': BannedUsers,
  'Nodeverses': Nodeverses,
  'NodeversesSubmissions': NodeversesSubmissions,
  'NodeversesComments': NodeversesComments,
  'NodeversesCommentsReplyNotifications':
    NodeversesCommentsReplyNotifications,
  'UsersCommentsSaves': UsersCommentsSaves,
  'UsersCommentsVotes': UsersCommentsVotes,
  'NodeversesDefaults': NodeversesDefaults,
  'NodeversesFeatured': NodeversesFeatured,
  'NodeversesCategories': NodeversesCategories,
  'NodeversesTags': NodeversesTags,
  'NodeversesAdmins': NodeversesAdmins,
  'NodeversesBannedUsers': NodeversesBannedUsers,
  'NodeversesSubmissionsReplyNotifications':
    NodeversesSubmissionsReplyNotifications,
  'NodeversesStickySubmissions': NodeversesStickySubmissions,
  'UsersPrivateMessages': UsersPrivateMessages,
  'UsersSubscriptions': UsersSubscriptions,
  'UsersPreferences': UsersPreferences
};