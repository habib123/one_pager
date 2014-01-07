class SearchController < ApplicationController
  def search
    
  end
  
  def search_result
    
    search_criteria = params['criteria']
    search_text_array = params['search-text'].split("\r\n")
    result_array = []
    
    if !search_text_array.empty?
    
      search_text_array.each do |search_text|
        type_search_result_by_name = OnePager.where(type: search_criteria).where("patent_name like ?", "%#{search_text}%")
      
        by_tags = OnePagersTag.where("tag like ?", "%#{search_text}%")
        
        #by_tags = OnePagersTag.where(tag: search_text)
        uniq_tag = by_tags.uniq {|p| p.one_pager_id}
        uniq_tag_patent_ids = uniq_tag.map(&:one_pager_id)
        result_by_tag_main = OnePager.find(uniq_tag_patent_ids)
        
        type_search_result_by_name = type_search_result_by_name + result_by_tag_main
        result_array = result_array + type_search_result_by_name 
        @result = result_array.uniq {|p| p.id}
        @result = Kaminari.paginate_array(@result).page(params[:page]).per(10) 
      end
    else
      type_search_result_by_name = OnePager.where(type: search_criteria)
      result_array = type_search_result_by_name
      @result = result_array.uniq {|p| p.id}
      @result = @result.page(params[:page]).per(10)
    end  
    
  end
end
