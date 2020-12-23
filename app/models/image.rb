class Image < ApplicationRecord
 belongs_to :user
 has_one_attached :imgUrl
 validates :name, presence: true
end
