class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
    has_one_attached :image

    def self.create_ingredients_puzzle(num_ingredients)

        ingredientPuzzleArray = (Recipe.all.sample.ingredients).to_a
        availableIngredients = Ingredient.all - ingredientPuzzleArray

        until ingredientPuzzleArray.size >= num_ingredients
            selected_ingredient = availableIngredients.pop
            ingredientPuzzleArray.push(selected_ingredient)
        end

        ingredientPuzzleArray
    end
end
