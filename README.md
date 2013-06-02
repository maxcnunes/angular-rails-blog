angular-rails-blog
==================

Based on this post: [AngularJS on Rails 4](http://coderberry.me/blog/2013/04/22/angularjs-on-rails-4-part-1)

### Model: Post
- title
- content
- published
- author

### Commands
1. `rails create angular-rails-blog`
2. `rails generate resource post title content:text published:datetime author`
3. `rake db:migrate`
4. `rake db:migrate RAILS_ENV=test`
5. `rake test`
6. `bundle`
7. `rake post_sync:maxcnunes`
8. `rake routes`
9. `mkdir -p app/assets/javascripts/angular/controllers \
         	 app/assets/javascripts/angular/directives \
         	 app/assets/javascripts/angular/services`
10. `touch app/assets/javascripts/app.js.coffee`
11. `rails generate controller home index`
12. `rm public/index.html`
13. `touch app/assets/javascripts/angular/controllers/posts_ctrl.js.coffee`
14. `touch app/assets/javascripts/angular/services/post.js.coffee`

### Api urls
- index - http://localhost:3000/api/posts.json
- show  - http://localhost:3000/api/posts/1.json


**ps**: If you don't have curl configured yet then will need run this before the 6 command: 
`sudo apt-get install libcurl4-gnutls-dev`