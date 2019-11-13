class PlayController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def transition #prefix: play_transition
        # fun transition page when starting to play (will play a gif)
    end

    def choose_chef #prefix: chef_selection_form
        @available_chefs = Chef.all
        @chef = Chef.new
    end

    def chef_selected #prefix: chef_selected
        Chef.reset_all_health
        session[:chef_id] = params[:chef][:id]
        Monster.all.reset_all_health
        session[:monster_id] = Monster.select_random_living_monster.id
        redirect_to ingredients_pick_form_path
    end

    def create_chef #prefix: chef_create_form
        @arr = Chef.chef_image_names
        @chef = Chef.new
    end

    def chef_created #prefix: chef_created
        Chef.setup_new_chef(params[:chef][:name], params[:chef][:image_name])
        redirect_to chef_selection_form_path
    end

    def edit_chef #prefix: chef_edit_form
        @chef = Chef.new
        @arr = Chef.chef_image_names
    end

    def chef_editted #prefix: chef_editted
        Chef.find(params[:chef][:id]).update(name: params[:chef][:name], image_name: params[:chef][:name])
        redirect_to chef_selection_form_path
    end

    def pick_ingredients #prefix: ingredient_selection_form
        @ingredients = Ingredient.create_ingredients_puzzle(8)
        @monster = Monster.find(session[:monster_id])
    end

    def ingredients_picked #prefix: ingredients_selected
            @ingredients_selected = params[:ingredient_ids].map{|id| Ingredient.find(id).name}
            byebug
            @recipe_made = Recipe.recipe_or_garbage(@ingredients_selected)
            session[:recipe_id] = @recipe_made.id
            byebug
            @monster = Monster.find(session[:monster_id])
            @chef = Chef.find(session[:chef_id])


        if @recipe_made.name == "Garbage"
            byebug
            session[:recipe_id] = @recipe_made.id
            if @chef.lives - 1 == 0 
                redirect_to lose_page
            else
                @chef.update(lives: @chef.lives - 1)
                redirect_to result_path
            end
        else
            if @monster.health - @recipe_made.damage <= 0
                redirect_to win_path
            else
                @monster.update(health: @monster.health - @recipe_made.damage)
                redirect_to result_path
            end
        end
    end

    def result #prefix: result
        @recipe_made = Recipe.find(session[:recipe_id])
        @monster = Monster.find(session[:monster_id])
        @chef = Chef.find(session[:chef_id])
    end

    def lose #prefix: lose
        # player loses, plays yet another funny gif, and provides the option to play again
            # redirects to chef selection page
    end

    def win #prefix: win
        # player wins, another monster takes the place of the defeated monster
            #
    end
end
