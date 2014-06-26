Discovery::Engine.routes.draw do
  get "quiz/new"
  resources :questions
  resources :answers
  get 'quiz' => "quiz#show"
  root to: "questions#index"
end
