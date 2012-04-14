# Create a new user
user = new User(username: 'tom', twitter: 'almostobsolete')
# Bind to the change event for the title property
user.bind 'change:username', (value) =>
  alert "Username updated to #{value}"
# Print out details of posts when they are created by the user
user.bind 'posts:add', (post) =>
  alert "Post '#{post.get('title')}' created at #{post.get('created_at')}"

# Change the user's username (which will trigger the event bound above)
user.set('username', 'thomas')

# Create a blog post associated with the new user (which will
# trigger the other event)
post = user.posts.create
  title: 'Declarative Models'
  body: 'One of the useful additions....'