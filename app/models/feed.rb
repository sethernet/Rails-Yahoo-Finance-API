class Feed < ActiveRecord::Base

require 'rss'

def self.update_from_feed(feed_url)
	
	feed = RSS::Parser.parse(open(feed_url).read, false).items[0..4]
	
    add_entries(feed.entries)
  end
  
  def self.update_from_feed_continuously(feed_url, delay_interval = 15.minutes)
	feed = RSS::Parser.parse(open(feed_url).read, false).items[0..4]
    add_entries(feed.entries)
     
  end
  
  private
  
  def self.add_entries(entries)
    entries.each do |entry|
      unless exists? :title => entry.title
        create!(
          :title        => entry.title,
          :summary      => entry.description,
          :url          => entry.link,
          :published_at => entry.pubDate,
          :guid         => entry.guid
        )
      end
    end
  end
  
end
