require 'post_importer'

namespace :post_sync do
  desc 'sync all missing posts from maxcnunes.net'
  task :maxcnunes => :environment do
    total = PostImporter.import_posts
    puts "There are now #{total} posts from maxcnunes.net"
  end
end