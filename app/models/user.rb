class User < ApplicationRecord
 has_many :images
 has_secure_password
 validates :username, uniqueness: true, presence: true
end
