Discovery::Engine.routes.draw do
  get "quiz/new"
  resources :questions
  resources :answers
  get 'quiz' => "quiz#show" 
  # get 'self-guided' => "questions#self_guided", as: :self_guided
  root to: "questions#index"
end
