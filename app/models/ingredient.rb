class Ingredient < ApplicationRecord
    has_many :recipe_ingredients # an ingredient has many recipe-ingredients joiners
    has_many :recipes, through: :recipe_ingredients # an ingredient has many recipes through its joiner

    # this method creates a puzzle of num_ingredients size (it returns it as a hash containing the answer and ingredients)
    def self.create_ingredients_puzzle(num_ingredients)

        answerHash = {recipe_answer_id: nil, ingredients: []} # create an hash containing answer key and ingredients key

        until answerHash[:recipe_answer_id] != 1 && answerHash[:recipe_answer_id] != nil do # until we find a random recipe that is not garbage
            answerHash[:recipe_answer_id] = Recipe.all.sample.id # find another recipe
        end

        answerHash[:ingredients_given] =  Recipe.find(answerHash[:recipe_answer_id]).ingredients.to_a # pull out the ingredients on that recipe
        
        availableIngredients = Ingredient.all - answerHash[:ingredients_given] # figure out what ingredients are remaining

        until answerHash[:ingredients_given].size >= num_ingredients # until the puzzle is the size we want
            selected_ingredient = availableIngredients.pop # take one of the remaining ingredients and put it into the puzzle
            answerHash[:ingredients_given].push(selected_ingredient) 
        end

        answerHash # return the hash
    end
end
