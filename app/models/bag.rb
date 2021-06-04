class Bag < ApplicationRecord
    has_many :makeup_bags
    has_many :makeups, through: :makeup_bags

    belongs_to :user
end
