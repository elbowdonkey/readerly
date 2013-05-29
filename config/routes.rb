Readerly::Application.routes.draw do
  get 'superfeedr/feed/:id' => "articles#subscribe"
  get 'read/all'     => 'articles#read_all', :as => "read_all"
  get 'read/:id' => 'articles#read', :as => "read"
  root :to => 'articles#index'
end
