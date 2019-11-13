class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    has_one_attached :image

    GARBAGE = Recipe.find_by(name: "Garbage")

    def self.ingredient_list_exists?(ingredient_names_array)
            Recipe.all.each do |recipe| 
                ingredients_on_this_recipe = recipe.get_ingredients_names

                if ingredient_names_array - ingredients_on_this_recipe == []
                    puts recipe.name
                    return true
                end
            end

            return false
    end

    def self.recipe_or_garbage(ingredients_names_array)
        if ingredients_names_array.size > 0 || ingredients_names_array != nil
            recipeResult = Recipe.all.detect {|recipe|
            recipe.get_ingredients_names.sort == ingredients_names_array.sort}
            if recipeResult == nil
                return GARBAGE
            else
                return recipeResult
            end
        else
            return GARBAGE
        end

    end

    def self.create_by_ingredient_names(recipeName, recipeDamage , ingredient_names_array)
        if ingredient_list_exists?(ingredient_names_array) == false
            thisRecipe = Recipe.create(name: recipeName, damage: recipeDamage)
            ingredient_names_array.each do |ingredient_name|
                ingredientToAdd = Ingredient.find_or_create_by(name: ingredient_name)
                RecipeIngredient.create(recipe_id: thisRecipe.id, ingredient_id: ingredientToAdd.id)
            end
            return thisRecipe
        else
            puts "Ingredients List for #{recipeName} Is Not Unique!"
        end      
    end

    def get_ingredients_names
        self.ingredients.map{|ingredient| ingredient.name}
    end
end
