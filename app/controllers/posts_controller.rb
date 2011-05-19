class PostsController < ApplicationController
  def index
  end

  def autocomplete
    suggestions = Post.autocomplete(params[:term])
    render :text => suggestions.results.collect{|suggestion| { :id => suggestion.id, :label => suggestion.title, :value => suggestion.title} }.to_json  
  end

  def autosuggest
    suggestions = Post.autosuggest(params[:term])
    render :text => suggestions.results.collect{|suggestion| { :id => suggestion.id, :label => suggestion.title, :value => suggestion.title} }.to_json  
  end
end
