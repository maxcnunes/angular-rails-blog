require 'feedzirra'

class PostImporter
  def self.import_posts
    Rails.logger = Logger.new(STDOUT)
    Rails.logger.debug "Starting import posts"
    # # because the Railscasts feed is targeted at itunes, there is additional metadata that
    # # is not collected by Feedzirra by default. By using add_common_feed_entry_element,
    # # we can let Feedzirra know how to map those values. See more information at
    # # http://www.ruby-doc.org/gems/docs/f/feedzirra-0.1.2/Feedzirra/Feed.html
    # Feedzirra::Feed.add_common_feed_entry_element(:enclosure, :value => :url, :as => :video_url)
    # Feedzirra::Feed.add_common_feed_entry_element('itunes:duration', :as => :duration)

    # Capture the feed and iterate over each entry
    feed = Feedzirra::Feed.fetch_and_parse("http://feeds.feedburner.com/maxcnunes")

    Rails.logger.debug "Total feeds #{feed.entries.count}"

    feed.entries.each do |entry|

      # Rails.logger.debug ":::: Feed of Post ::::"
      Rails.logger.debug "Post: #{entry.title}"
      # Rails.logger.debug "Content: #{entry.summary}" 
      # Rails.logger.debug "Published: #{entry.published}"  

      # # Strip out the episode number from the title
      # title = entry.title.gsub(/^#\d{1,}\s/, '')

      # Find or create the post data into our database
      post = Post.where(title: entry.title).first_or_create(
        title:      entry.title,
        author:     entry.author,
        content:    entry.content,
        published:  entry.published
      )
      post.save!
    end

    # Return the number of total posts
    Post.count
  end
end