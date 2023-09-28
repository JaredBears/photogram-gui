Rails.application.routes.draw do

  # get("/", { :controller => "misc", :action => "index" })

  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })
  post("/insert_user_record", { :controller => "users", :action => "create" })
  post("/update_user_record/:path_id", { :controller => "users", :action => "update" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  post("/insert_photo_record", { :controller => "photos", :action => "create" })
  post("/update_photo_record/:path_id", { :controller => "photos", :action => "update" })
  post("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })
  post("/comment_photo/:path_id", { :controller => "photos", :action => "comment" })

end
