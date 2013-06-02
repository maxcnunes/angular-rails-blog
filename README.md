angular-rails-blog
==================

Based on this post: [AngularJS on Rails 4](http://coderberry.me/blog/2013/04/22/angularjs-on-rails-4-part-1)

Model: Post
###########
- title
- content
- published
- author

Commands
########
1. rails create angular-rails-blog
2. rails generate resource post title content:text published:datetime author
3. rake db:migrate
4. rake db:migrate RAILS_ENV=test
5. rake test
6. bundle





ps: If you don't have curl configured yet then will need run this before the 6 command: 
`sudo apt-get install libcurl4-gnutls-dev`