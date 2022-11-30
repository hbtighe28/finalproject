class IngredientOwnedsController < ApplicationController
  def index
    matching_ingredient_owneds = IngredientOwned.all

    @list_of_ingredient_owneds = matching_ingredient_owneds.order({ :created_at => :desc })

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
end
