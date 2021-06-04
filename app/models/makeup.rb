class Makeup < ApplicationRecord
    has_many :makeup_bags
    has_many :bags, through: :makeup_bags
   
end
