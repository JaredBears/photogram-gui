Rails.application.routes.draw do

  get("/", { :controller => "misc", :action => "index" })

  get("/users", { :controller => "user", :action => "index" })
  get("/users/:path_username", { :controller => "user", :action => "show" })
  post("/insert_user_record", { :controller => "user", :action => "create" })
  post("/update_user_record/:path_id", { :controller => "user", :action => "update" })

  get("/photos", { :controller => "photo", :action => "index" })
  get("/photos/:path_id", { :controller => "photo", :action => "show" })
  get("/delete_photo/:path_id", { :controller => "photo", :action => "destroy" })
  post("/insert_photo_record", { :controller => "photo", :action => "create" })
  post("/update_photo_record/:path_id", { :controller => "photo", :action => "update" })
  post("/comment_photo/:path_id", { :controller => "photo", :action => "comment" })

end
