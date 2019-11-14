class Chef < ApplicationRecord
    has_many_attached :images

    MAX_LIVES = 3

    def self.chef_image_names
        Dir.entries("app/assets/images/").select{|file_name| file_name.start_with?("chf") && file_name.end_with?(".png")}
    end

    def self.setup_new_chef(name, image_url, gif_name)
        new_chef = Chef.create(name: name, lives: MAX_LIVES, image_name: image_url, gif_name: gif_name)
    end

    def self.reset_all_health
        Chef.all.each do |chef|
            chef.update(lives: MAX_LIVES)
        end
    end
end
