class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
    has_one_attached :image

    def self.create_ingredients_puzzle(num_ingredients)

        ingredientPuzzleArray = Recipe.all.sample.ingredients
        availableIngredients = Ingredient.all - ingredientPuzzleArray

        until ingredientPuzzleArray.size >= num_ingredients
            ingredientPuzzleArray << availableIngredients.delete_at(rand(0..availableIngredients.size-1))
        end

        ingredientPuzzleArray
    end
end
