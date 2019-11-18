# README

This README would normally document whatever steps are necessary to get the
application up and running.

# Food Fight - Rails MVC Project - Shawn Huang Fernandes
​
Welcome to my project. This is a guessing game using Ruby on Rails as a backbone.

Check it out on my blog: https://dev.to/shawnhuangfernandes/booting-up-week-6-project-week-25pf
​
## Schema
​
### Chefs
​
```ruby
  create_table "chefs", force: :cascade do |t|
    t.string "name"
    t.integer "lives"
    t.string "image_name"
    t.string "gif_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
```

### Ingredients

```ruby
  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "image_name"
    t.string "gif_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
```

### Monsters

```ruby

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.integer "health"
    t.string "image_name"
    t.string "gif_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
```

### Recipe_Ingredients

```ruby
  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "recipe_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
```

### Recipes

```ruby
  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "damage"
    t.string "image_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
```

## User Stories
1. As a user, I want to be able to choose a a chef, or create my own
2. As a user, I want to be able to solve a puzzle to defeat a monster
3. As a user, I want to be able to have access to the answers if I can't solve a puzzle
4. As a user, I want to be able to win or lose the game
​
## Install Instructions
​
1. Fork and clone this repository.
2. Open the repository in your IDE of choice.
3. Run ```bundle install``` in console to insure you have all the required gems.
4. Run ```rails db:migrate``` in console to create the schema.
5. Run ```rails db:reset``` in console to seed it
5. Run ```ruby bin/run.rb``` in the console to start the application
​
## Contributors Guide
​
If you wish to conribute to the project you may do so by following the proceeding steps:
1. Follow steps one and two of the *Install Instructions* section.
2. Create your own branch to work on.
3. Follow standard Ruby convention in your code.
4. Submit any changes you've made to your branch as a pull request on the master to be reviewed.
​
## License
​
[MIT License](https://opensource.org/licenses/MIT)
​
### Copyright 2019 Shawn Huang Fernandes
​
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
​
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
​
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
​
​
​
​
​
​
​
---
