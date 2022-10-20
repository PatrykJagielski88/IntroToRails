class Category < ApplicationRecord
  has_many :dishes

  validates :meal_time, presence: true
end
