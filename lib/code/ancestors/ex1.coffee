class Post extends Model
  @field 'title', default: 'New post!'
  @field 'body'
  # the default is supplied as a closure which is evaluated at object
  # creation time
  @field 'created_at', default: -> new Date()

class User extends Model
  @field 'username'
  @field 'twitter'
  @has_many Post, as: 'posts'