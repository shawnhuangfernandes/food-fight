class PlayController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def transition #prefix: play_transition
        # fun transition page when starting to play (will play a gif)
    end

    def choose_chef #prefix: chef_selection_form
        # user gets to select their appearance (chef), and can move on to
            # starting a "battle" by picking ingredients
        @available_chefs = Chef.all
        @chef = Chef.new
    end

    def chef_selected #prefix: chef_selected
        session[:chef_id] = params[:chef][:id]
        redirect_to ingredient_selection_path
    end

    def create_chef #prefix: chef_create_form
        @arr = Chef.chef_image_names
        @chef = Chef.new
    end

    def chef_created #prefix: chef_created
        byebug
        Chef.setup_new_chef(params[:chef][:name], params[:chef][:image_name])
        redirect_to chef_selection_form_path
    end

    def edit_chef #prefix: chef_edit_form
        @chef
    end

    def pick_ingredients #prefix: ingredient_selection_form
        # user can see the chef, and monster, and also a series of buttons to select
            # ingredients and submit their selection to make an ingredient
    end

    def ingredients_picked #prefix: ingredients_selected

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
