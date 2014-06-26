Discovery::Engine.routes.draw do
  get "quiz/new"
  resources :questions
  resources :answers
  resources :quiz
  root to: "questions#index"
end
