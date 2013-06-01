class Post < ActiveRecord::Base
  attr_accessible :author, :content, :published, :title

  validates_presence_of :author, :content, :published, :title
  validates_uniqueness_of :title
end
