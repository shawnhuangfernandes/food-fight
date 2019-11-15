class PlayController < ApplicationController
    skip_before_action :verify_authenticity_token

    def choose_chef #prefix: chef_selection_form
        @available_chefs = Chef.all # create chef collection for view
        @chef = Chef.new # create chef instance for form_for
    end

    def chef_selected #prefix: chef_selected
        Chef.reset_all_health # reset all chef's lives
        Monster.all.reset_all_health # reset all monster health
        session[:chef_id] = params[:chef][:id] # REMEMBER the chef that was selected in the form
        session[:monster_id] = Monster.select_random_living_monster.id # REMEMBER a random living monster
        redirect_to ingredients_pick_form_path # redirect to the ingredient pick form - action
    end

    def create_chef #prefix: chef_create_form
        @chef_images = Chef.chef_image_names # get all the chef images and save them to use in view (image-tags)
        @chef = Chef.new # create chef instance for form_for
    end

    def chef_created #prefix: chef_created
        Chef.setup_new_chef(params[:chef][:name], params[:chef][:image_name], params[:chef][:image_name].ext('gif')) # create a new chef based on input
        redirect_to chef_selection_form_path # redirect to chef selection page
    end

    def edit_chef #prefix: chef_edit_form
        @chef = Chef.new # create chef instance for form_for
        @chef_images = Chef.chef_image_names # get all the chef images and save them to use in view (image-tags)
    end

    def chef_editted #prefix: chef_editted
        Chef.find(params[:chef][:id]).update(name: params[:chef][:name]
                        , image_name: params[:chef][:name], gif_name: params[:chef][:image_name].ext('gif')) # update the chef selected in form
        redirect_to chef_selection_form_path # redirect to chef selection page
    end

    def delete_chef #prefix: chef_delete_form
        @chef = Chef.new # create a new chef for a form_for
    end

    def chef_deleted #prefix: chef_deleted
        Chef.destroy(params[:chef][:id]) # delete chef based on id passed back from deletion form
        redirect_to chef_selection_form_path # redirect to chef selection page
    end

    def pick_ingredients #prefix: ingredients_pick_form
        puzzleHash = Ingredient.create_ingredients_puzzle(8) # generate a puzzle Hash with 8 ingredients
        session[:recipe_answer_id] = puzzleHash[:recipe_answer_id] # REMEMBER but the "correct" recipe answer is
        @ingredients = puzzleHash[:ingredients_given].shuffle # get the ingredients list from the puzzle hash and randomize it
        @current_monster = Monster.find(session[:monster_id]) # get the current monster from the session to use in the view
        @current_chef = Chef.find(session[:chef_id]) # get the current chef from the session to use in the view
    end

    def ingredients_picked #prefix: ingredients_picked
            if params[:ingredient_ids] == nil # if the user has not selected any ingredients in the selection page
                @recipe_made = Recipe.find_by(name: "Garbage")  # set the recipe made to Garbage
            else    # if th user HAS selected ingredients
                @ingredients_selected = params[:ingredient_ids].map{|id| Ingredient.find(id).name} # turn the passed ingredient id's into their respective names
                @recipe_made = Recipe.recipe_or_garbage(@ingredients_selected) # check if the selected recipes make garbage or not
            end

            @monster = Monster.find(session[:monster_id]) # set the monster to the session's monster for the view
            @chef = Chef.find(session[:chef_id]) # set the chef for the session's chef for the view
            session[:recipe_id] = @recipe_made.id # REMEMBER the recipe id that the user created
           
        if @recipe_made.name == "Garbage" # if the recipe the user made was Garbage
            if @chef.lives - 1 == 0 # if the chef has no more lives left
                redirect_to lose_path # redirect to the lose page
            else # else if the chef still has lives to lose
                @chef.update(lives: @chef.lives - 1) # reduce the chef's lives by 1
                redirect_to result_path # redirect to the result page
            end
        else # else if the user made an actual recipe
            if @monster.health - @recipe_made.damage <= 0 # if the monster is about to take "fatal" damage
                @monster.update(health: @monster.health - @recipe_made.damage) # reduce the monster's health (so it is recognized as defeated)
                redirect_to win_path # redirect to the win page
            else # else if the monster is still going to live after taking damage
                @monster.update(health: @monster.health - @recipe_made.damage) # reduce the monster's health
                redirect_to result_path # redirect to the result page
            end
        end
    end

    def result #prefix: result
        @correct_answer = Recipe.find(session[:recipe_answer_id]) # get the correct answer from the session for the view
        @recipe_made = Recipe.find(session[:recipe_id]) # get the recipe the user made from the session for the view
        @current_monster = Monster.find(session[:monster_id]) # get the current monster from the session for the view
        @current_chef = Chef.find(session[:chef_id]) # get the current chef from the session for the view
    end

    def lose #prefix: lose
        @recipe_made = Recipe.find(session[:recipe_id]) # get the recipe made from the session for the view
        @current_chef = Chef.find(session[:chef_id]) # get the current chef from the session for the view
        @current_monster = Monster.find(session[:monster_id]) # get the current monster from the session for the view
    end

    def win #prefix: win
        @recipe_made = Recipe.find(session[:recipe_id]) # get the recipe made from the session for the view
        @won_game = Monster.all_defeated? # check if the user has defeated all the monsters
        @current_chef = Chef.find(session[:chef_id]) # get the current chef from the session for the view
        @current_monster = Monster.find(session[:monster_id]) # get the current monster from the session for the view
        if @won_game == false # if the game has not been won
            @next_monster = Monster.select_random_living_monster # get another living monster and set them as the next monster for the view
            session[:monster_id] = @next_monster.id # REMEMBER who the next monster is 
        end
    end
end
