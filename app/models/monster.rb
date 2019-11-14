class Monster < ApplicationRecord
   MAX_HEALTH = 100
   has_many_attached :images
   
    def self.reset_all_health
        self.all.each do |monster|    
            monster.update(health: MAX_HEALTH)
        end
    end

    def self.select_random_living_monster
        Monster.all.select {|monster| monster.health > 0}.sample
    end

    def self.all_defeated?
        Monster.all.all? {|monster| monster.health <= 0}
    end
end
