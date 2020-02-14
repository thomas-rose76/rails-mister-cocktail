require 'open-uri'
require 'json'

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

ingredients = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
results = JSON.parse(ingredients)
results["drinks"].each do |result|
  Ingredient.create(name: result["strIngredient1"])
end


mojito = Cocktail.new(name: "Mojito")
mojito.doses << Dose.new(description: "2", ingredient: Ingredient.first )
mojito.save
