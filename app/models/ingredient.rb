class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
    has_one_attached :image

    def self.create_ingredients_puzzle(num_ingredients)

        answerHash = {recipe_answer_id: nil, ingredients: []}

        answerHash[:recipe_answer_id] = Recipe.all.sample.id

        until answerHash[:recipe_answer_id] != 1 do
            answerHash[:recipe_answer_id] = Recipe.all.sample.id
        end
        
        answerHash[:ingredients_given] = Recipe.all.sample.ingredients.to_a
        
        availableIngredients = Ingredient.all - answerHash[:ingredients_given]

        until answerHash[:ingredients_given].size >= num_ingredients
            selected_ingredient = availableIngredients.pop
            answerHash[:ingredients_given].push(selected_ingredient)
        end

        answerHash
    end
end
