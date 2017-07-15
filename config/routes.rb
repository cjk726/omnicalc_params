Rails.application.routes.draw do
  get("/flexible/square/:a_number", { :controller => "calculations", :action => "flex_square" })
  get("/flexible/square_root/:a_number", { :controller => "calculations", :action => "flex_square_root" })
  get("/flexible/payment/:annual_int_rate/:years/:principal", { :controller => "calculations", :action => "flex_payment" })
  
  get("/square/new", { :controller => "calculations", :action => "square_form" })
  get("/square/results", { :controller => "calculations", :action => "process_square" })
  
  # Copy and paste and edit more of these "get"s for the rest of the app features

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
