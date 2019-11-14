class StaticController < ApplicationController
    def about

    end

    def instructions

    end

    def ingredients_list
        @recipes = Recipe.all
    end
end
