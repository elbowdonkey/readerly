Readerly::Application.routes.draw do
  match 'sperfeedr/feed/:id' => "articles#subscribe"
  match 'read/:id' => 'articles#read', :as => "read"
  root :to => 'articles#index'
end
