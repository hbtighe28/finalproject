class AcceptsController < ApplicationController
  def index
    matching_accepts = Accept.all

    @list_of_accepts = matching_accepts.order({ :created_at => :desc })

    render({ :template => "accepts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_accepts = Accept.where({ :id => the_id })

    @the_accept = matching_accepts.at(0)

    render({ :template => "accepts/show.html.erb" })
  end

  def create
    the_accept = Accept.new
    the_accept.user_id = params.fetch("query_user_id")
    the_accept.accept = params.fetch("query_accept")
    the_accept.send_to_id = params.fetch("query_send_to_id")

    if the_accept.valid?
      the_accept.save
      redirect_to("/accepts", { :notice => "Accept created successfully." })
    else
      redirect_to("/accepts", { :alert => the_accept.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_accept = Accept.where({ :id => the_id }).at(0)

    the_accept.user_id = params.fetch("query_user_id")
    the_accept.accept = params.fetch("query_accept")
    the_accept.send_to_id = params.fetch("query_send_to_id")

    if the_accept.valid?
      the_accept.save
      redirect_to("/accepts/#{the_accept.id}", { :notice => "Accept updated successfully."} )
    else
      redirect_to("/accepts/#{the_accept.id}", { :alert => the_accept.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_accept = Accept.where({ :id => the_id }).at(0)

    the_accept.destroy

    redirect_to("/accepts", { :notice => "Accept deleted successfully."} )
  end
end
