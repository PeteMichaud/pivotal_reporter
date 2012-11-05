PivotalReporter::Engine.routes.draw do

  resources :stories

  root :to => 'stories#new'

end
