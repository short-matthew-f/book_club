class StaticController < ApplicationController
  def query
    
  end
  
  def search
    @title = params[:title].empty? ? nil : "intitle:#{URI::escape params[:title]}"
    @author = params[:author].empty? ? nil : "inauthor:#{URI::escape params[:author]}"
    @join = (@title && @author) ? "+" : nil
    
    @url = "https://www.googleapis.com/books/v1/volumes?q=#{@title}#{@join}#{@author}"
    @response = HTTParty.get(@url)
    
    @items = @response['items'].take(5).map do |item|
      volume_info = item['volumeInfo'] || {}
      image_links = volume_info['imageLinks'] || {
        'thumbnail' => 'http://lorempixel.com/150/200',
        'smallThumbnail' => 'http://lorempixel.com/150/200'
      }
      isbn = volume_info["industryIdentifiers"].select { |id| id['type'] == "ISBN_13" }.first['identifier']
      
      {
        title: volume_info['title'],
        authors: volume_info['authors'],
        publication_year: volume_info['publishedDate'],
        image_url: image_links['thumbnail'],
        small_image_url: image_links['smallThumbnail'],
        isbn: isbn
      }
    end
    
    # render json: JSON.pretty_generate(@items)
    
    # @url = "https://www.goodreads.com/search/index.xml?key=#{ENV['good_reads_key']}&q=#{URI.escape params[:title]}+#{URI.escape params[:author]}"
    # @response = HTTParty.get(@url)
    #
    # @items = @response["GoodreadsResponse"]["search"]["results"]["work"].map do |item|
    #   book = item["best_book"]
    #
    #   {
    #     title: book["title"],
    #     author: book["author"]["name"],
    #     publication_year: item["original_publication_year"],
    #     image_url: book["image_url"],
    #     small_image_url: book["small_image_url"]
    #   }
    #end
  end
  
  private
  
  def search_params
    
  end
end
