Rails.application.routes.draw do

  # Routes for the Message resource:

  # CREATE
  post("/insert_message", { :controller => "messages", :action => "create" })
  
  post("/accept/:path_id", {:controller => "messages", :action => "accept"})
          
  # READ
  get("/messages", { :controller => "messages", :action => "index" })
  
  # DELETE
  get("/delete_message/:path_id", { :controller => "messages", :action => "destroy" })


  #------------------------------

  # Routes for the Ingredient owned resource:

  # CREATE
  post("/insert_ingredient_owned", { :controller => "ingredient_owneds", :action => "create" })
          
  # READ
  get("/ingredient_owned", { :controller => "ingredient_owneds", :action => "index" })
  
  get("/ingredient_owneds/:path_id", { :controller => "ingredient_owneds", :action => "show" })
  
  # UPDATE
  
  post("/modify_ingredient_owned/:path_id", { :controller => "ingredient_owneds", :action => "update" })
  
  # DELETE
  get("/delete_ingredient_owned/:path_id", { :controller => "ingredient_owneds", :action => "destroy" })

  #------------------------------

  # Routes for the Ingredient wanted resource:

  # CREATE
  post("/insert_ingredient_wanted", { :controller => "ingredient_wanteds", :action => "create" })
          
  # READ
  get("/ingredient_wanteds", { :controller => "ingredient_wanteds", :action => "index" })
  
  get("/ingredient_wanteds/:path_id", { :controller => "ingredient_wanteds", :action => "show" })
  
  # UPDATE
  
  post("/modify_ingredient_wanted/:path_id", { :controller => "ingredient_wanteds", :action => "update" })
  
  # DELETE
  get("/delete_ingredient_wanted/:path_id", { :controller => "ingredient_wanteds", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

get("/", {:controller => "market", :action => "index"})

get("/messages", {:controller => "market", :action => "receive_message"})

get("/find_recipes", {:controller => "ingredient_owneds", :action => "find_recipes"})

end
