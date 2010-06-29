ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'create'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'

  map.root :controller => 'tags', :action => 'index'
  map.search '/search', :controller => 'contents', :action => 'search'

  map.resources :users

  map.resource :session

  map.resources :contents, :only => [:index, :show]
  map.mark_as_favorite '/mark_as_favorite', :controller => 'contents', :action => 'mark_as_favorite'
  map.mypage '/mypage', :controller => 'users', :action => 'show'
  map.resources :tags, :only => [:index]

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
