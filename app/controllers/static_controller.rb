class StaticController < ApplicationController
  def query
    
  end
  
  def search
    @res = Amazon::Ecs.item_search(nil, {
      title: params[:title],
      author: params[:author],
      search_index: 'Books',
      response_group: 'Large'
    })
    
    @items = @res.items.take(6).map do |item|
      Hash.from_xml(item.elem.to_xml)["Item"]
    end
  end
  
  private
  
  def search_params
    
  end
end
