class PlayController < ApplicationController
    def transition
        # fun transition page when starting to play (will play a gif)
    end

    def choose_chef
        # user gets to select their appearance (chef), and can move on to
            # starting a "battle" by picking ingredients
        @chef = Chef.new
        @available_chefs = Chef.all
        @chef_images = Chef::CHEF_IMAGE_URLS
    end

    def choose_chef_select

    end

    def create_chef
        # creates a new chef
            # name
            # appearance
    end

    def edit_chef
        # edits the current chef
            # name
            # appearance
    end

    def pick_ingredients
        # user can see the chef, and monster, and also a series of buttons to select
            # ingredients and submit their selection to make an ingredient
    end

    def result
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

    def lose
        # player loses, plays yet another funny gif, and provides the option to play again
            # redirects to chef selection page
    end

    def win
        # player wins, another monster takes the place of the defeated monster
            #
    end
end
