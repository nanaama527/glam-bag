class User < ApplicationRecord
    has_many :bags, dependent: :destroy
    # has_many :makeup_bags, through: :bags

    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    
end
