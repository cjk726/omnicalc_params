Rails.application.routes.draw do
  
  get("/", { :controller => "calculations", :action => "homepage" })      # oot url
  
  get("/flexible/square/:a_number", { :controller => "calculations", :action => "flex_square" })
  get("/flexible/square_root/:a_number", { :controller => "calculations", :action => "flex_square_root" })
  get("/flexible/payment/:annual_int_rate/:years/:principal", { :controller => "calculations", :action => "flex_payment" })
  get("/flexible/random/:min_number/:max_number", { :controller => "calculations", :action => "flex_random" })
  
  get("/square/new", { :controller => "calculations", :action => "square_form" })
  get("/square/results", { :controller => "calculations", :action => "process_square" })
  
  get("/square_root/new", { :controller => "calculations", :action => "square_root_form" })
  get("/square_root/results", { :controller => "calculations", :action => "process_square_root" })
  
  get("/payment/new", { :controller => "calculations", :action => "payment_form" })
  get("/payment/results", { :controller => "calculations", :action => "process_payment" })
  
  get("/random/new", { :controller => "calculations", :action => "random_form" })
  get("/random/results", { :controller => "calculations", :action => "process_random" })
  
  get("/word_count/new", { :controller => "calculations", :action => "word_count_form" })
  get("/word_count/results", { :controller => "calculations", :action => "process_word_count" })
  
  get("/descriptive_stats/new", { :controller => "calculations", :action => "stats_form" })
  get("/descriptive_stats/results", { :controller => "calculations", :action => "process_stats" })
  
  # Copy and paste and edit more of these "get"s for the rest of the app features

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
