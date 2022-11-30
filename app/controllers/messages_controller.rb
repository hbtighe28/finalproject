class MessagesController < ApplicationController
  def index
    @matching_messages = Message.all
    the_id = session.fetch(:user_id)
    @list_of_messages = @matching_messages.where({ :send_to_id => the_id })
    @list_of_sent = @matching_messages.where({:user_id => the_id})

    @list_of_accept = @list_of_sent.where({:accept => "yes"})

    render({ :template => "messages/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_messages = Message.where({ :send_to_id => the_id })

    @the_message = matching_messages.at(0)

    render({ :template => "messages/show.html.erb" })
  end

  def create
    @list_of_available = IngredientOwned.all
    
    the_id = session.fetch(:user_id)
    @list_of_owned = IngredientOwned.where( :user_id => the_id)

    the_message = Message.new
    the_message.send_to_id = params.fetch("send_to_box")
    the_message.user_id = session.fetch(:user_id)
    the_item = params.fetch("item_box")
    item_name = IngredientOwned.where({:item => the_item}).at(0)
    the_message.item_id = item_name.id
    the_message.message = "I'd like your " + the_item + "!"
    the_message.save
    

    if the_message.valid?
      the_message.save
      redirect_to("/messages", { :notice => "Message created successfully." })
    else
      redirect_to("/messages", { :alert => the_message.errors.full_messages.to_sentence })
    end
  end

  def accept
    the_id = params.fetch("path_id")
    the_accept = Message.where({:id => the_id}).at(0)

    the_accept.send_to_id = params.fetch("send_to")
    the_accept.user_id = session.fetch(:user_id)
    the_accept.user.phone = params.fetch("phone_number")
    the_accept.accept = "yes"
    the_accept.save
    
    redirect_to("/messages", {:notice => "Accepted successfully"})
  end


  def update
    the_id = params.fetch("path_id")
    the_message = Message.where({ :id => the_id }).at(0)

    the_message.user_id = params.fetch("query_user_id")
    the_message.message = params.fetch("query_message")

    if the_message.valid?
      the_message.save
      redirect_to("/messages/#{the_message.id}", { :notice => "Message updated successfully."} )
    else
      redirect_to("/messages/#{the_message.id}", { :alert => the_message.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_message = Message.where({ :id => the_id }).at(0)

    the_message.destroy

    redirect_to("/messages", { :notice => "Message deleted successfully."} )
  end
end
