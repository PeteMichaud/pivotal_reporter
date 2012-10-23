Rails.application.routes.draw do
  mount PublicTracker::Engine => "/tracker"
  root :to => 'home#show'
end
