PivotalReporter::Engine.routes.draw do

  resources :stories do
    member do
      get 'accept' => 'stories#accept', to: :accept_story
      get 'reject' => 'stories#reject', to: :reject_story
    end
  end

  root :to => 'stories#new'

end
