class Image < ApplicationRecord
 belongs_to :user
 has_one_attached :img
 validates :name, presence: true
 validates :description, presence: true
 validates :keywords, presence: true

 def self.search(search)
  if search
   find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
   find(:all)
  end
 end
end
