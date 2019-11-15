class PlayController < ApplicationController
    skip_before_action :verify_authenticity_token

    def choose_chef #prefix: chef_selection_form
        @available_chefs = Chef.all
        @chef = Chef.new
    end

    def chef_selected #prefix: chef_selected
        Chef.reset_all_health
        Monster.all.reset_all_health
        session[:chef_id] = params[:chef][:id]
        session[:monster_id] = Monster.select_random_living_monster.id
        redirect_to ingredients_pick_form_path
    end

    def create_chef #prefix: chef_create_form
        @chef_images = Chef.chef_image_names
        @chef = Chef.new
    end

    def chef_created #prefix: chef_created
        Chef.setup_new_chef(params[:chef][:name], params[:chef][:image_name], params[:chef][:image_name].ext('gif'))
        redirect_to chef_selection_form_path
    end

    def edit_chef #prefix: chef_edit_form
        @chef = Chef.new
        @arr = Chef.chef_image_names
    end

    def chef_editted #prefix: chef_editted
        Chef.find(params[:chef][:id]).update(name: params[:chef][:name], image_name: params[:chef][:name], gif_name: params[:chef][:image_name].ext('gif'))
        redirect_to chef_selection_form_path
    end

    def delete_chef #prefix: chef_delete_form
        @chef = Chef.new
    end

    def chef_deleted #prefix: chef_deleted
        Chef.destroy(params[:chef][:id])
        redirect_to chef_selection_form_path
    end

    def pick_ingredients #prefix: ingredients_pick_form
        puzzleHash = Ingredient.create_ingredients_puzzle(8)
        session[:recipe_answer_id] = puzzleHash[:recipe_answer_id]
        @ingredients = puzzleHash[:ingredients_given].shuffle
        @current_monster = Monster.find(session[:monster_id])
        @current_chef = Chef.find(session[:chef_id])
    end

    def ingredients_picked #prefix: ingredients_picked
            if params[:ingredient_ids] == nil
                @recipe_made = Recipe.find_by(name: "Garbage")
            else
                @ingredients_selected = params[:ingredient_ids].map{|id| Ingredient.find(id).name}
                @recipe_made = Recipe.recipe_or_garbage(@ingredients_selected)
            end

            @monster = Monster.find(session[:monster_id])
            @chef = Chef.find(session[:chef_id])
            session[:recipe_id] = @recipe_made.id
           
        if @recipe_made.name == "Garbage"
            session[:recipe_id] = @recipe_made.id
            if @chef.lives - 1 == 0 
                redirect_to lose_path
            else
                @chef.update(lives: @chef.lives - 1)
                redirect_to result_path
            end
        else
            if @monster.health - @recipe_made.damage <= 0
                @monster.update(health: @monster.health - @recipe_made.damage)
                redirect_to win_path
            else
                @monster.update(health: @monster.health - @recipe_made.damage)
                redirect_to result_path
            end
        end
    end

    def result #prefix: result
        @correct_answer = Recipe.find(session[:recipe_answer_id])
        @recipe_made = Recipe.find(session[:recipe_id])
        @current_monster = Monster.find(session[:monster_id])
        @current_chef = Chef.find(session[:chef_id])
    end

    def lose #prefix: lose
        @recipe_made = Recipe.find(session[:recipe_id])
        @current_chef = Chef.find(session[:chef_id])
        @current_monster = Monster.find(session[:monster_id])
    end

    def win #prefix: win
        @recipe_made = Recipe.find(session[:recipe_id])
        @won_game = Monster.all_defeated?
        @current_chef = Chef.find(session[:chef_id])
        @current_monster = Monster.find(session[:monster_id])
        if @won_game == false
            @next_monster = Monster.select_random_living_monster
            session[:monster_id] = @next_monster.id
        end
    end
end
