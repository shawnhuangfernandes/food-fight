# This file should contain all the record creation needed to seed the database with its default values.

# recipes # their associated images
gb = Recipe.create(name: "Garbage")
gb.update(image_name: "ing_chicken.png")

fc = Recipe.create_by_ingredient_names("Fried Chicken", 100, ["Chicken", "Flour", "Spice"])
fc.update(image_name: "rec_fried_chicken.png")

ch = Recipe.create_by_ingredient_names("Chili", 100, ["Spice", "Onion", "Beef", "Salt"])
ch.update(image_name: "rec_chili.png")

ck = Recipe.create_by_ingredient_names("Cookies", 100, ["Flour", "Sugar", "Butter", "Salt"])
ck.update(image_name: "rec_cookies.png")

cns = Recipe.create_by_ingredient_names("Chicken Noodle Soup", 100, ["Chicken", "Flour", "Onion", "Water", "Salt"])
cns.update(image_name: "rec_chicken_noodle_soup.png")

bs = Recipe.create_by_ingredient_names("Beef Stew", 100, ["Salt", "Beef", "Water", "Spice", "Onion"])
bs.update(image_name: "rec_beef_stew.png")

ls = Recipe.create_by_ingredient_names("Lasagna", 100, ["Beef", "Flour", "Butter", "Cheese", "Onion", "Salt"])
ls.update(image_name: "rec_lasagna.png")

rc = Recipe.create_by_ingredient_names("Roast Chicken", 100, ["Chicken", "Spice", "Salt", "Butter"])
rc.update(image_name: "rec_roast_chicken.png")

#ingredients and their associated images
i_cc = Ingredient.find_by(name: "Chicken")
i_cc.update(image_name: "ing_chicken.png", gif_name: "ing_chicken.gif")

i_fl = Ingredient.find_by(name: "Flour")
i_fl.update(image_name: "ing_flour.png", gif_name: "ing_flour.gif")

i_sp = Ingredient.find_by(name: "Spice")
i_sp.update(image_name: "ing_spice.png", gif_name: "ing_spice.gif")

i_on = Ingredient.find_by(name: "Onion")
i_on.update(image_name: "ing_onion.png", gif_name: "ing_onion.gif")

i_be = Ingredient.find_by(name: "Beef")
i_be.update(image_name: "ing_beef.png", gif_name: "ing_beef.gif")

i_sa = Ingredient.find_by(name: "Salt")
i_sa.update(image_name: "ing_salt.png", gif_name: "ing_salt.gif")

i_sg = Ingredient.find_by(name: "Sugar")
i_sg.update(image_name: "ing_sugar.png", gif_name: "ing_sugar.gif")

i_bu = Ingredient.find_by(name: "Butter")
i_bu.update(image_name: "ing_butter.png", gif_name: "ing_butter.gif")

i_wa = Ingredient.find_by(name: "Water")
i_wa.update(image_name: "ing_water.png", gif_name: "ing_water.gif")

i_ch = Ingredient.find_by(name: "Cheese")
i_ch.update(image_name: "ing_cheese.png", gif_name: "ing_cheese.gif")

#monster and their associated images
m_mc = Monster.create(name: "Madame Cheesy", health: 100)
m_mc.update(image_name: "mon_cheesy.png", gif_name: "mon_cheesy.gif")

m_mg = Monster.create(name: "Mr. Gassy", health: 100)
m_mg.update(image_name: "mon_gassy.png", gif_name: "mon_gassy.gif")

m_so = Monster.create(name: "Senior Oozy", health: 100)
m_so.update(image_name: "mon_oozy.png", gif_name: "mon_oozy.gif")

m_cp = Monster.create(name: "Captain Puffy", health: 100)
m_cp.update(image_name: "mon_puffy.png", gif_name: "mon_puffy.gif")

m_sn = Monster.create(name: "Seniorita Nosey", health: 100)
m_sn.update(image_name: "mon_nosey.png", gif_name: "mon_nosey.gif")

#chefs and their associated images
c_alf = Chef.create(name: "Alfonzi", lives: 3, image_name: "chf_chef1.png", gif_name: "chf_chef1.gif")

c_su = Chef.create(name: "Susan", lives: 3, image_name: "chf_chef2.png", gif_name: "chf_chef1.gif")

c_gr = Chef.create(name: "Gregory", lives: 3, image_name: "chf_chef3.png", gif_name: "chf_chef1.gif")
