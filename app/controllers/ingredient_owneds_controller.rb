class IngredientOwnedsController < ApplicationController
  def index
    matching_ingredient_owneds = IngredientOwned.all
    
    the_id = session.fetch(:user_id)
    @list_of_owned = IngredientOwned.where( :user_id => the_id)


    
    render({ :template => "ingredient_owneds/index.html.erb" })

  end

  def show
    the_id = params.fetch("path_id")

    matching_ingredient_owneds = IngredientOwned.where({ :id => the_id })

    @the_ingredient_owned = matching_ingredient_owneds.at(0)

    render({ :template => "ingredient_owneds/show.html.erb" })
  end

  def create
    the_ingredient_owned = IngredientOwned.new
    the_ingredient_owned.item = params.fetch("query_item")
    the_ingredient_owned.user_id = session.fetch(:user_id)

    if the_ingredient_owned.valid?
      the_ingredient_owned.save
      redirect_to("/", { :notice => "Ingredient owned created successfully." })
    else
      redirect_to("/", { :alert => the_ingredient_owned.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_ingredient_owned = IngredientOwned.where({ :id => the_id }).at(0)

    the_ingredient_owned.item = params.fetch("query_item")
    the_ingredient_owned.quantity = params.fetch("query_quantity")
    the_ingredient_owned.location = params.fetch("query_location")

    if the_ingredient_owned.valid?
      the_ingredient_owned.save
      redirect_to("/ingredient_owneds/#{the_ingredient_owned.id}", { :notice => "Ingredient owned updated successfully."} )
    else
      redirect_to("/ingredient_owneds/#{the_ingredient_owned.id}", { :alert => the_ingredient_owned.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_ingredient_owned = IngredientOwned.where({ :id => the_id }).at(0)

    the_ingredient_owned.destroy

    redirect_to("/", { :notice => "Ingredient owned deleted successfully."} )
  end

  def find_recipes

    ingredient = params.fetch("ingredient")

    key = ENV.fetch("SPOON_KEY")
    
    @url = "https://api.spoonacular.com/recipes/findByIngredients?apiKey="+ key + "&ingredients=" + ingredient
    raw_data =open(@url).read
    parsed_data = JSON.parse(raw_data)
    @ingredient_name = parsed_data.at(0).fetch("usedIngredients").at(0).fetch("name")
    @recipe_name_one = parsed_data.at(0).fetch("title")
    recipe_id_one = parsed_data.at(0).fetch("id")

    @recipe_name_two = parsed_data.at(1).fetch("title")
    recipe_id_two = parsed_data.at(1).fetch("id")

    @recipe_name_three = parsed_data.at(2).fetch("title")
    recipe_id_three = parsed_data.at(2).fetch("id")


    @recipe_photo_one = parsed_data.at(0).fetch("image")
    @recipe_photo_two = parsed_data.at(1).fetch("image")
    @recipe_photo_three = parsed_data.at(2).fetch("image")


    url_1 = "https://api.spoonacular.com/recipes/" + recipe_id_one.to_s + "/information?apiKey=" + key +"&includeNutrition=false"
    raw_data = open(url_1).read
    parsed_data = JSON.parse(raw_data)
    @recipe_link_one = parsed_data.fetch("sourceUrl")

    url_2 = "https://api.spoonacular.com/recipes/" + recipe_id_two.to_s + "/information?apiKey=7abec61d9bdb4ccba70af8dedf2dddd4&includeNutrition=false"
    raw_data = open(url_2).read
    parsed_data = JSON.parse(raw_data)
    @recipe_link_two = parsed_data.fetch("sourceUrl")

    url_3 = "https://api.spoonacular.com/recipes/" + recipe_id_three.to_s + "/information?apiKey=7abec61d9bdb4ccba70af8dedf2dddd4&includeNutrition=false"
    raw_data = open(url_3).read
    parsed_data = JSON.parse(raw_data)
    @recipe_link_three = parsed_data.fetch("sourceUrl")

    


    render({:template => "ingredient_owneds/recipes.html.erb"})
  end
end
