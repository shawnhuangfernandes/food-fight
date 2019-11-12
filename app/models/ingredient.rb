class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
    has_one_attached :image

    def self.create_ingredients_puzzle(num_ingredients)

    end
end
