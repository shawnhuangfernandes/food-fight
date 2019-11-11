class Monster < ApplicationRecord
   MAX_HEALTH = 100
   
    def self.reset_all_health
        self.all.each do |monster|    
            monster.health = MAX_HEALTH
        end
    end
end
