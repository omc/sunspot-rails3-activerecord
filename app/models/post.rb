class Post < ActiveRecord::Base
  
  searchable do
    text :title
    autocomplete :post_title, :using => :title
    autosuggest :title_suggestion, :multiple => true do |faq|
      faq.split_title_on_first_ws
    end
  end
  
  def split_title_on_first_ws
    phrases = []
    t = self.title.split
    for i in 0..(t.size - 1)
      phrases << t[i..(t.size - 1)].join(" ")
    end
    return phrases
  end 
  
  class << self
    
    def search_for(query, num_results = 10)
      Post.search do
        fulltext query
        paginate :page => 1, :per_page => num_results
      end
    end
    
    def autocomplete(phrase, num_results = 10)
      Post.search do
        adjust_solr_params do |params|
          params[:q] = "post_title_ac:\"#{phrase}\""
        end
        paginate :page => 1, :per_page => num_results
      end
    end
    
    def autosuggest(phrase, num_results = 10)
      Post.search do
        adjust_solr_params do |params|
          params[:q] = "title_suggestion_asm:\"#{phrase}\""
        end
        paginate :page => 1, :per_page => num_results
      end  
    end
  end
end