class Image < ApplicationRecord
 belongs_to :user
 has_one_attached :img
 validates :name, presence: true
 validates :description, presence: true
 validates :keywords, presence: true

 def self.search(search)
  if search
   where("name LIKE ? OR keywords LIKE ?", "%#{search}%", "%#{search}%")
  else
   find(:all)
  end
 end
end

# Table.where('keywords LIKE ?', '%crescent%').all
# @images = Image.where('name LIKE ?' '%ana%')
# Image.all.where("lowercase(name) LIKE :search", search: "%#{search}%")
# Image.all.select {|img| img.name === "#$search"} 

# Image.all.select{|img| img.name[0] === search[0] && img.name[1] === search[1] && img.name[2] === search[2]  }
# arr_names = arr.map{|img, id| img.name }
