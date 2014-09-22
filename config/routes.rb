RailsWiki::Engine.routes.draw do
  resources :articles do
    member do
      get :versions
    end
  end
end
