class Monster < ApplicationRecord
   MAX_HEALTH = 100 # Constant to reset all monster health
   
   # This method resets all the health of the monsters in the database
    def self.reset_all_health
        self.all.each do |monster|    
            monster.update(health: MAX_HEALTH)
        end
    end

    # this method returns a random monster whose health is > 0
    def self.select_random_living_monster
        Monster.all.select {|monster| monster.health > 0}.sample
    end

    # this method returns a boolean to see if all the monsters are defeated
    def self.all_defeated?
        Monster.all.all? {|monster| monster.health <= 0}
    end
end
