Discovery::Engine.routes.draw do
  get "quiz/new"
  resources :questions
  resources :answers
  get 'results' => "quiz#show" 
  get 'results/jobs' => "quiz#recommendations"
  # get 'self-guided' => "questions#self_guided", as: :self_guided
  root to: "questions#index"
end
