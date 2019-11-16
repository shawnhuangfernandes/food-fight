class Recipe < ApplicationRecord
    has_many :recipe_ingredients # a recipe has many recipe_ignredients (association)
    has_many :ingredients, through: :recipe_ingredients # a recipe has many ingredients through its associations

    GARBAGE = Recipe.find_by(name: "Garbage") # constant for the garbage recipe

    # this method checks if a given list of ingredients names exists in any recipe
    def self.ingredient_list_exists?(ingredient_names_array)
            Recipe.all.any? do |recipe| # if any recipe meets my condition
                ingredients_on_this_recipe = recipe.get_ingredients_names # get the ignredients names from the recipe
                
                ingredient_names_array.sort == ingredients_on_this_recipe.sort # CONDITION: do the ingredients given match the ingredients on the recipe                 
            end
    end

    # this method returns a recipe of garbage if the ignredients names matches a recipe's ingredients names
    def self.recipe_or_garbage(ingredients_names_array)
        if ingredients_names_array.size > 0 || ingredients_names_array != nil # checking the argument to see if its not empty or null
            recipeResult = Recipe.all.detect {|recipe| # detect the first recipe that meets my condition
            recipe.get_ingredients_names.sort == ingredients_names_array.sort} # CONDITION: if the recipe's ignredients names match the argument's ingredients' names
            
            if recipeResult == nil # if our detect hasn't found anything
                return GARBAGE # the result should be garbage
            else    # if our detect found a recipe
                return recipeResult # the result should be the recipe we found
            end
        else # if the argument is empty or nil
            return GARBAGE # return garbage
        end

    end

    # this method creates a recipe by giving it some ingredients names (used for seeding)
    def self.create_by_ingredient_names(recipeName, recipeDamage , ingredient_names_array)
        if ingredient_list_exists?(ingredient_names_array) == false # if we haven't given this list before
            thisRecipe = Recipe.create(name: recipeName, damage: recipeDamage) # create a new recipe of the desired name and damage
            ingredient_names_array.each do |ingredient_name| # for every ingredient name given
                ingredientToAdd = Ingredient.find_or_create_by(name: ingredient_name) # find or create the ingredient by name
                RecipeIngredient.create(recipe_id: thisRecipe.id, ingredient_id: ingredientToAdd.id) # create an association between the recipe and ingredient
            end

            return thisRecipe # return the recipe
        else # if the list has been given before
            puts "Ingredients List for #{recipeName} Is Not Unique!" # print out a helpful message telling me the list isn't unique
        end      
    end

    # this method prints out the ingredients names of the recipe's ingredients
    def get_ingredients_names
        self.ingredients.map{|ingredient| ingredient.name}
    end

    # this method actually outputs the ingredients names of the recipe (for use in a view file)
    def present_ingredients_names
        get_ingredients_names.reduce("") {|memo, name| memo + ", #{name}"}.delete_prefix(", ")
    end
end
