class IngredientWantedsController < ApplicationController
  def index
    matching_ingredient_wanteds = IngredientWanted.all

    @list_of_ingredient_wanteds = matching_ingredient_wanteds.order({ :created_at => :desc })

    render({ :template => "ingredient_wanteds/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_ingredient_wanteds = IngredientWanted.where({ :id => the_id })

    @the_ingredient_wanted = matching_ingredient_wanteds.at(0)

    render({ :template => "ingredient_wanteds/show.html.erb" })
  end

  def create
    the_ingredient_wanted = IngredientWanted.new
    the_ingredient_wanted.item = params.fetch("query_item")
    the_ingredient_wanted.user_id = session.fetch(:user_id)

    if the_ingredient_wanted.valid?
      the_ingredient_wanted.save
      redirect_to("/", { :notice => "Ingredient wanted created successfully." })
    else
      redirect_to("/", { :alert => the_ingredient_wanted.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_ingredient_wanted = IngredientWanted.where({ :id => the_id }).at(0)

    the_ingredient_wanted.item = params.fetch("query_item")


    if the_ingredient_wanted.valid?
      the_ingredient_wanted.save
      redirect_to("/ingredient_wanteds/#{the_ingredient_wanted.id}", { :notice => "Ingredient wanted updated successfully."} )
    else
      redirect_to("/ingredient_wanteds/#{the_ingredient_wanted.id}", { :alert => the_ingredient_wanted.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_ingredient_wanted = IngredientWanted.where({ :id => the_id }).at(0)

    the_ingredient_wanted.destroy

    redirect_to("/", { :notice => "Ingredient wanted deleted successfully."} )
  end
end
