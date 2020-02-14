require 'open-uri'
require 'json'

ingredients = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
results = JSON.parse(ingredients)
results["drinks"].each do |result|
  Ingredient.create(name: result["strIngredient1"])
end
