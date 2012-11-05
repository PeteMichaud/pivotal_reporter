Rails.application.routes.draw do
  mount PivotalReporter::Engine => "/tracker"
  root :to => 'home#show'
end
