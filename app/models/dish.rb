class Dish < ApplicationRecord
  belongs_to :category

  validates :name, :recipe, presence: true
end
