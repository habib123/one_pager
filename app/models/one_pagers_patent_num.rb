class OnePagersPatentNum < ActiveRecord::Base
  belongs_to :one_pager

  def self.get_patent_list(id)
  	array = OnePagersPatentNum.where("one_pager_id = ?", id).pluck(:patent_num)
  	str = array.join(' , ')
  end
end
