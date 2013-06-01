require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @post_defaults = {
      title:        'Debug Knockout js',
      content:      'Tenho utilizado knockout js em alguns projetos e o desacoplamento que ele possibilita aplicando o padrao MVVM e fascinante...',
      published: 	Date.parse('Mon, 25 Jun 2012 00:00:00 -0700'),
  	  author: 		'maxcnunes'
    }
  end

  test "should be invalid if missing required data" do
    post = Post.new
    assert !post.valid? 
    [:title, :content, :published, :author].each do |field_name|
      assert post.errors.keys.include? field_name
    end
  end

  test "should be valid if required data exists" do
    post = Post.new(@post_defaults)
    assert post.valid?
  end

  test "should only allow one screencast with the same title" do
    post = Post.new(@post_defaults)
    post.title = posts(:tdc_2013).title
    assert !post.valid?
    assert post.errors[:title].include? "has already been taken"
  end
end
