Readerly::Application.routes.draw do
  match 'superfeedr/feed/:id' => "articles#subscribe", :via => [:get, :post]
  get 'read/all'     => 'articles#read_all', :as => "read_all"
  get 'read/:id' => 'articles#read', :as => "read"
  root :to => 'articles#index'
end
