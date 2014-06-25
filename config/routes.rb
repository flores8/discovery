Discovery::Engine.routes.draw do
  get "quiz/new"
  resources :questions
  resources :answers
  root to: "questions#index"
end
