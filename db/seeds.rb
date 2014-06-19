# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Post.create(:title => 'This is a post', :body => 'This is the body of the post.', :published_at => Time.now)
Post.create(:title => 'Post about something else.', :body => 'Body of the post', :published_at => Time.now)
Post.create(:title => 'This is another post that should show up for autosuggest.', :body => 'Body of the post', :published_at => Time.now)
Post.reindex