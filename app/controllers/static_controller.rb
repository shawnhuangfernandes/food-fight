class StaticController < ApplicationController
    def about
        # static page that renders a view for the about page
    end

    def instructions
        # static page that renders a view for the instructions page
    end

    def ingredients_list
        @recipes = Recipe.all # gets all the recipes to print out the recipe list for users to try to remember
    end
end
