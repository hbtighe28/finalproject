class MarketController < ApplicationController
  def index
    @list_of_available = IngredientOwned.all
    
    the_id = session.fetch(:user_id)
    @list_of_owned = IngredientOwned.where( :user_id => the_id)

    @list_of_need = IngredientWanted.all

    

    render({:template => "market_templates/index.html.erb"})
  end

  def receive_message

    render({:template => "market_templates/message_inbox.html.erb"})
  end

end
