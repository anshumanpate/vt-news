class State < ApplicationRecord
    has_many :cities, dependent: :destroy
    has_many :news
end
