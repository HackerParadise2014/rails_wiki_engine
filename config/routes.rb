RailsWiki::Engine.routes.draw do
  resources :articles, path: "wiki" do
    member do
      get :versions
    end
  end
end
