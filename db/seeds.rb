# This file should contain all the record creation needed to seed the database with its default values.

# recipes # their associated images
fc = Recipe.create_by_ingredient_names("Fried Chicken", 20, ["Chicken", "Flour", "Spice"])
fc.image.attach(io: File.open('app/assets/images/rec_fried_chicken.png'), filename: 'rec_fried_chicken.png')

ch = Recipe.create_by_ingredient_names("Chili", 20, ["Spice", "Onion", "Beef", "Salt"])
ch.image.attach(io: File.open('app/assets/images/rec_chili.png'), filename: 'rec_chili.png')

ck = Recipe.create_by_ingredient_names("Cookies", 20, ["Flour", "Sugar", "Butter", "Salt"])
ck.image.attach(io: File.open('app/assets/images/rec_cookies.png'), filename: 'rec_cookies.png')

cns = Recipe.create_by_ingredient_names("Chicken Noodle Soup", 20, ["Chicken", "Flour", "Onion", "Water", "Salt"])
cns.image.attach(io: File.open('app/assets/images/rec_chicken_noodle_soup.png'), filename: 'rec_chicken_noodle_soup.png')

bs = Recipe.create_by_ingredient_names("Beef Stew", 20, ["Salt", "Beef", "Water", "Spice", "Onion"])
bs.image.attach(io: File.open('app/assets/images/rec_beef_stew.png'), filename: 'rec_beef_stew.png')

ls = Recipe.create_by_ingredient_names("Lasagna", 20, ["Beef", "Flour", "Butter", "Cheese", "Onion", "Salt"])
ls.image.attach(io: File.open('app/assets/images/rec_lasagna.png'), filename: 'rec_lasagna.png')

rc = Recipe.create_by_ingredient_names("Roast Chicken", 20, ["Chicken", "Spice", "Salt", "Butter"])
rc.image.attach(io: File.open('app/assets/images/rec_roast_chicken.png'), filename: 'rec_roast_chicken.png')

#ingredients and their associated images
Ingredient.find_by(name: "Chicken").image.attach(io: File.open('app/assets/images/rec_chili.png'), filename: 'rec_chili.png')
Ingredient.find_by(name: "Flour").image.attach(io: File.open('app/assets/images/rec_chili.png'), filename: 'rec_chili.png')
Ingredient.find_by(name: "Spice").image.attach(io: File.open('app/assets/images/rec_chili.png'), filename: 'rec_chili.png')
Ingredient.find_by(name: "Onion").image.attach(io: File.open('app/assets/images/rec_chili.png'), filename: 'rec_chili.png')
Ingredient.find_by(name: "Beef").image.attach(io: File.open('app/assets/images/rec_chili.png'), filename: 'rec_chili.png')
Ingredient.find_by(name: "Salt").image.attach(io: File.open('app/assets/images/rec_chili.png'), filename: 'rec_chili.png')
Ingredient.find_by(name: "Flour").image.attach(io: File.open('app/assets/images/rec_chili.png'), filename: 'rec_chili.png')
Ingredient.find_by(name: "Sugar").image.attach(io: File.open('app/assets/images/rec_chili.png'), filename: 'rec_chili.png')
Ingredient.find_by(name: "Butter").image.attach(io: File.open('app/assets/images/rec_chili.png'), filename: 'rec_chili.png')
Ingredient.find_by(name: "Water").image.attach(io: File.open('app/assets/images/rec_chili.png'), filename: 'rec_chili.png')
Ingredient.find_by(name: "Cheese").image.attach(io: File.open('app/assets/images/rec_chili.png'), filename: 'rec_chili.png')

#monster and their associated images
mc = Monster.create(name: "Madame Cheesy", health: 100)
mg = Monster.create(name: "Mr. Gassy", health: 100)
so = Monster.create(name: "Senior Oozy", health: 100)
cp = Monster.create(name: "Captain Puffy", health: 100)
sn = Monster.create(name: "Seniorita Nosey", health: 100)

#chefs and their associated images
alf = Chef.create(name: "Alfonzi", lives: 3)
alf.images.attach(io: File.open('app/assets/images/chf_chef1.png'), filename: 'chf_chef1.png')

su = Chef.create(name: "Susan", lives: 3)
su.images.attach(io: File.open('app/assets/images/chf_chef2.png'), filename: 'chf_chef2.png')

gr = Chef.create(name: "Gregory", lives: 3)
gr.images.attach(io: File.open('app/assets/images/chf_chef3.png'), filename: 'chf_chef3.png')

