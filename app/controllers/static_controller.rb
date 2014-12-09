class StaticController < ApplicationController
  def query
    
  end
  
  def search
    @url = "https://www.goodreads.com/search/index.xml?key=#{ENV['good_reads_key']}&q=#{URI.escape params[:title]}+#{URI.escape params[:author]}"
    @response = HTTParty.get(@url) 
    
    @items = @response["GoodreadsResponse"]["search"]["results"]["work"].map do |item|
      book = item["best_book"]
      
      {
        title: book["title"],
        author: book["author"]["name"],
        publication_year: item["original_publication_year"],
        image_url: book["image_url"],
        small_image_url: book["small_image_url"]
      }
    end
  end
  
  private
  
  def search_params
    
  end
end
