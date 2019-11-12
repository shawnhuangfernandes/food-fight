class Monster < ApplicationRecord
   MAX_HEALTH = 100
   has_many_attached :images
   
    def self.reset_all_health
        self.all.each do |monster|    
            monster.health = MAX_HEALTH
        end
    end
end
