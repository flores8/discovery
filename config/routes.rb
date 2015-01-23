Discovery::Engine.routes.draw do
  resources :questions, :answers, :personalities, :categories, :strengths

  # resources :categories do
  # 	resources :strengths
  # end
  get 'results' => "quiz#show" 
  get 'recommendations' => "quiz#recommendations"
  put 'recommendations' => "quiz#recommendations"
  # get 'self-guided' => "questions#self_guided", as: :self_guided
  root to: "questions#index"
end
