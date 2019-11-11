# This file should contain all the record creation needed to seed the database with its default values.

Recipe.create_by_ingredient_names("Fried Chicken", 20, "", ["Chicken", "Flour", "Spice"])
Recipe.create_by_ingredient_names("Chili", 20, "", ["Spice", "Onion", "Beef", "Salt"])
Recipe.create_by_ingredient_names("Cookies", 20, "", ["Flour", "Sugar", "Butter", "Salt"])
Recipe.create_by_ingredient_names("Chicken Noodle Soup", 20, "", ["Chicken", "Flour", "Onion", "Water", "Salt"])
Recipe.create_by_ingredient_names("Beef Stew", 20, "", ["Salt", "Beef", "Water", "Spice", "Onion"])
Recipe.create_by_ingredient_names("Lasagna", 20, "", ["Beef", "Flour", "Butter", "Cheese", "Onion", "Salt"])
Recipe.create_by_ingredient_names("Roast Chicken", 20, "", ["Chicken", "Spice", "Salt", "Butter"])

Monster.create(name: "Madame Cheesy", image_url: "", health: 100)
Monster.create(name: "Mr. Gassy", image_url: "", health: 100)
Monster.create(name: "Senior Oozy", image_url: "", health: 100)
Monster.create(name: "Captain Puffy", image_url: "", health: 100)
Monster.create(name: "Seniorita Nosey", image_url: "", health: 100)

Chef.create(name: "Alfonzi", lives: 3, image_url: "")
