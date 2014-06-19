# Sunspot sample app

## Rails 3 + ActiveRecord

This app exists for a few reasons...

1. Provide an example of how to use Sunspot.
2. Provide integration testing for Sunspot.

Autocomplete and Autosuggest with Solr

To run the examples, do the following:

    rake db:create
    rake db:schema:load
    rake db:seed
    rake sunspot:solr:start
    open http://localhost:3000/
    
The database has been seeded with a few posts, all of which contain the term 'post' somewhere in the title.  Enter 'post' into each of the text fields to see autocomplete and autosuggest with Solr.

Make sure you aren't running any other Solr instances on the same port as is configured in config/sunspot.yml.

The major changes to solr/conf/schema.xml, and a custom version of Sunspot forked at http://github.com/greggersh/sunspot.

See app/models/post.rb to see how to add autocomplete and autosuggest to a model, and how to search.

### Pull requests welcome

Do you have a pet feature that your app uses? Model it out in here so we can all benefit from a collection of best practices.

Found a bug in Sunspot? Fork this application, duplicate the bug, and send us a pull request. Anything goes!

