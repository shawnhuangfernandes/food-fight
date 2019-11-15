# This file should contain all the record creation needed to seed the database with its default values.

# recipes # their associated images
gb = Recipe.create(name: "Garbage")
gb.update(image_name: "rec_garbage.png")

fc = Recipe.create_by_ingredient_names("Fried Chicken", 20, ["Chicken", "Flour", "Spice"])
fc.update(image_name: "rec_fried_chicken.png")

ch = Recipe.create_by_ingredient_names("Chili", 25, ["Spice", "Onion", "Beef", "Salt"])
ch.update(image_name: "rec_chili.png")

ck = Recipe.create_by_ingredient_names("Cookies", 25, ["Flour", "Sugar", "Butter", "Salt"])
ck.update(image_name: "rec_cookies.png")

cns = Recipe.create_by_ingredient_names("Chicken Noodle Soup", 50, ["Chicken", "Flour", "Onion", "Water", "Salt"])
cns.update(image_name: "rec_chicken_noodle_soup.png")

bs = Recipe.create_by_ingredient_names("Beef Stew", 50, ["Salt", "Beef", "Water", "Spice", "Onion"])
bs.update(image_name: "rec_beef_stew.png")

ls = Recipe.create_by_ingredient_names("Lasagna", 50, ["Beef", "Flour", "Butter", "Cheese", "Onion", "Salt"])
ls.update(image_name: "rec_lasagna.png")

rc = Recipe.create_by_ingredient_names("Roast Chicken", 30, ["Chicken", "Spice", "Salt", "Butter"])
rc.update(image_name: "rec_roast_chicken.png")

cs = Recipe.create_by_ingredient_names("Caesar Salad", 25, ["Onion", "Lettuce", "Chicken", "Spice"])
cs.update(image_name: "rec_caesar_salad.png")

ch = Recipe.create_by_ingredient_names("Chai", 10, ["Milk", "Sugar", "Spice"])
ch.update(image_name: "rec_chai.png")

hb = Recipe.create_by_ingredient_names("Hamburger", 25, ["Bread", "Beef", "Lettuce", "Cheese"])
hb.update(image_name: "rec_hamburger.png")

te = Recipe.create_by_ingredient_names("Tea", 10, ["Water", "Spice", "Sugar"])
te.update(image_name: "rec_tea.png")

ct = Recipe.create_by_ingredient_names("French Toast", 15, ["Bread", "Spice", "Sugar"])
ct.update(image_name: "rec_french_toast.png")





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

i_ml = Ingredient.find_by(name: "Milk")
i_ml.update(image_name: "ing_milk.png", gif_name: nil)

i_lt = Ingredient.find_by(name: "Lettuce")
i_lt.update(image_name: "ing_lettuce.png", gif_name: nil)

i_bd = Ingredient.find_by(name: "Bread")
i_bd.update(image_name: "ing_bread.png", gif_name: nil)

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

c_su = Chef.create(name: "Susan", lives: 3, image_name: "chf_chef2.png", gif_name: "chf_chef2.gif")

c_gr = Chef.create(name: "Gregory", lives: 3, image_name: "chf_chef3.png", gif_name: "chf_chef3.gif")

c_ar = Chef.create(name: "Armand", lives: 3, image_name: "chf_chef4.png", gif_name: "chf_chef4.gif")
