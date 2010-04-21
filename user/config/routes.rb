ActionController::Routing::Routes.draw do |map|

  map.resources :contents, :only => [:index, :show]

  map.resources :tags, :only => [:index]

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
