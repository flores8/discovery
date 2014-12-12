Discovery::Engine.routes.draw do
  resources :questions
  resources :answers
  get 'results' => "quiz#show" 
  get 'results/recommendations' => "quiz#recommendations"
  put 'results/recommendations' => "quiz#recommendations"
  # get 'self-guided' => "questions#self_guided", as: :self_guided
  root to: "questions#index"
end
