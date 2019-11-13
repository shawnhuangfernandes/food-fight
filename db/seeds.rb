# This file should contain all the record creation needed to seed the database with its default values.

# recipes # their associated images
gb = Recipe.create(name: "Garbage")
gb.update(image_name: "ing_chicken.png")
gb.image.attach(io: File.open('app/assets/images/ing_chicken.png'), filename: 'ing_chicken.png')

fc = Recipe.create_by_ingredient_names("Fried Chicken", 20, ["Chicken", "Flour", "Spice"])
fc.update(image_name: "rec_fried_chicken.png")
fc.image.attach(io: File.open('app/assets/images/rec_fried_chicken.png'), filename: 'rec_fried_chicken.png')

ch = Recipe.create_by_ingredient_names("Chili", 20, ["Spice", "Onion", "Beef", "Salt"])
ch.update(image_name: "rec_chili.png")
ch.image.attach(io: File.open('app/assets/images/rec_chili.png'), filename: 'rec_chili.png')

ck = Recipe.create_by_ingredient_names("Cookies", 20, ["Flour", "Sugar", "Butter", "Salt"])
ck.update(image_name: "rec_cookies.png")
ck.image.attach(io: File.open('app/assets/images/rec_cookies.png'), filename: 'rec_cookies.png')

cns = Recipe.create_by_ingredient_names("Chicken Noodle Soup", 20, ["Chicken", "Flour", "Onion", "Water", "Salt"])
cns.update(image_name: "rec_chicken_noodle_soup.png")
cns.image.attach(io: File.open('app/assets/images/rec_chicken_noodle_soup.png'), filename: 'rec_chicken_noodle_soup.png')

bs = Recipe.create_by_ingredient_names("Beef Stew", 20, ["Salt", "Beef", "Water", "Spice", "Onion"])
bs.update(image_name: "rec_beef_stew.png")
bs.image.attach(io: File.open('app/assets/images/rec_beef_stew.png'), filename: 'rec_beef_stew.png')

ls = Recipe.create_by_ingredient_names("Lasagna", 20, ["Beef", "Flour", "Butter", "Cheese", "Onion", "Salt"])
ls.update(image_name: "rec_lasagna.png")
ls.image.attach(io: File.open('app/assets/images/rec_lasagna.png'), filename: 'rec_lasagna.png')

rc = Recipe.create_by_ingredient_names("Roast Chicken", 20, ["Chicken", "Spice", "Salt", "Butter"])
rc.update(image_name: "rec_roast_chicken.png")
rc.image.attach(io: File.open('app/assets/images/rec_roast_chicken.png'), filename: 'rec_roast_chicken.png')

#ingredients and their associated images
i_cc = Ingredient.find_by(name: "Chicken")
i_cc.image.attach(io: File.open('app/assets/images/ing_chicken.png'), filename: 'ing_chicken.png')
i_cc.update(image_name: "ing_chicken.png")

i_fl = Ingredient.find_by(name: "Flour")
i_fl.image.attach(io: File.open('app/assets/images/ing_flour.png'), filename: 'ing_flour.png')
i_fl.update(image_name: "ing_flour.png")

i_sp = Ingredient.find_by(name: "Spice")
i_sp.image.attach(io: File.open('app/assets/images/ing_spice.png'), filename: 'ing_spice.png')
i_sp.update(image_name: "ing_spice.png")

i_on = Ingredient.find_by(name: "Onion")
i_on.image.attach(io: File.open('app/assets/images/ing_onion.png'), filename: 'ing_onion.png')
i_on.update(image_name: "ing_onion.png")

i_be = Ingredient.find_by(name: "Beef")
i_be.image.attach(io: File.open('app/assets/images/ing_beef.png'), filename: 'ing_beef.png')
i_be.update(image_name: "ing_beef.png")

i_sa = Ingredient.find_by(name: "Salt")
i_sa.image.attach(io: File.open('app/assets/images/ing_salt.png'), filename: 'ing_salt.png')
i_sa.update(image_name: "ing_salt.png")

i_sg = Ingredient.find_by(name: "Sugar")
i_sg.image.attach(io: File.open('app/assets/images/ing_sugar.png'), filename: 'ing_sugar.png')
i_sg.update(image_name: "ing_sugar.png")

i_bu = Ingredient.find_by(name: "Butter")
i_bu.image.attach(io: File.open('app/assets/images/ing_butter.png'), filename: 'ing_butter.png')
i_bu.update(image_name: "ing_butter.png")

i_wa = Ingredient.find_by(name: "Water")
i_wa.image.attach(io: File.open('app/assets/images/ing_water.png'), filename: 'ing_water.png')
i_wa.update(image_name: "ing_water.png")

i_ch = Ingredient.find_by(name: "Cheese")
i_ch.image.attach(io: File.open('app/assets/images/ing_cheese.png'), filename: 'ing_cheese.png')
i_ch.update(image_name: "ing_cheese.png")

#monster and their associated images
m_mc = Monster.create(name: "Madame Cheesy", health: 100)
m_mc.images.attach(io: File.open('app/assets/images/mon_cheesy.png'), filename: 'mon_cheesy.png')
m_mc.update(image_name: "mon_cheesy.png")

m_mg = Monster.create(name: "Mr. Gassy", health: 100)
m_mg.images.attach(io: File.open('app/assets/images/mon_gassy.png'), filename: 'mon_gassy.png')
m_mg.update(image_name: "mon_gassy.png")

m_so = Monster.create(name: "Senior Oozy", health: 100)
m_so.images.attach(io: File.open('app/assets/images/mon_oozy.png'), filename: 'mon_oozy.png')
m_so.update(image_name: "mon_oozy.png")

m_cp = Monster.create(name: "Captain Puffy", health: 100)
m_cp.images.attach(io: File.open('app/assets/images/mon_puffy.png'), filename: 'mon_puffy.png')
m_cp.update(image_name: "mon_puffy.png")

m_sn = Monster.create(name: "Seniorita Nosey", health: 100)
m_sn.images.attach(io: File.open('app/assets/images/mon_nosey.png'), filename: 'mon_nosey.png')
m_sn.update(image_name: "mon_nosey.png")

#chefs and their associated images
c_alf = Chef.create(name: "Alfonzi", lives: 3)
c_alf.update(image_name: "chf_chef1.png")
c_alf.images.attach(io: File.open('app/assets/images/chf_chef1.png'), filename: 'chf_chef1.png')

c_su = Chef.create(name: "Susan", lives: 3)
c_su.update(image_name: "chf.chef2.png")
c_su.images.attach(io: File.open('app/assets/images/chf_chef2.png'), filename: 'chf_chef2.png')

c_gr = Chef.create(name: "Gregory", lives: 3)
c_gr.update(image_name: "chf.chef3.png")
c_gr.images.attach(io: File.open('app/assets/images/chf_chef3.png'), filename: 'chf_chef3.png')

