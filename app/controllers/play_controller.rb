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
        # check to see if ingredients makes a recipe
        # store that recipe 
    end

    def result #prefix: 
        # based on their selection, will determine if it makes a recipe or garbage
            # if recipe made garbage
                # chef loses health
            # if it made a recipe
                # monster loses health based on recipe damage
        # will re-route accordingly based on monster's/player's health
            # if below 0, player has won this battle --> to win page
            # if above 0, player keeps battling
            # if player or "chef's" health is below 0, will go to the lose page
    end

    def lose #prefix: 
        # player loses, plays yet another funny gif, and provides the option to play again
            # redirects to chef selection page
    end

    def win #prefix: 
        # player wins, another monster takes the place of the defeated monster
            #
    end
end
