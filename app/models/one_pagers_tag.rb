class OnePagersTag < ActiveRecord::Base
  belongs_to :one_pager

  def self.get_tag_list(id)
  	array = OnePagersTag.where("one_pager_id = ?", id).pluck(:tag)
  	str = array.join(' , ')
  end

end
