class Dish < ApplicationRecord
  validates :name, :recipe, presence: true
end
