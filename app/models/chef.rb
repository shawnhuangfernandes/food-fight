class Chef < ApplicationRecord
    has_many_attached :images

    MAX_LIVES = 3

    def self.chef_image_names
        Dir.entries("app/assets/images/").select{|file_name| file_name.start_with?("chf")}
    end

    def self.setup_new_chef(name, image_url)
        new_chef = Chef.create(name: name, image_name: image_url)
        new_chef.lives = Chef::MAX_LIVES

        new_chef
    end

    def self.reset_all_health
        Chef.all.each do |chef|
            chef.update(lives: MAX_LIVES)
        end
    end
end
