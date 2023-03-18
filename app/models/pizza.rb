class Pizza < ApplicationRecord
    has_many :restaurant_pizzas, dependent: :destroy
    has_many :restaurants, through: :restaurant_pizzas
  
    validates :name, presence: true
end