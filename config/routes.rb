Discovery::Engine.routes.draw do
  resources :questions, :answers

  resources :personalities do
  	resources :career_contentments, only: [:create, :edit, :update, :destroy]
  end

  resources :categories do
    resources :career_recommendations, only: [:create, :destroy]
    resources :major_recommendations, only: [:create, :destroy]
    resources :strengths, only: [:create, :edit, :update, :destroy]
  end
  get 'results' => "quiz#show"
  get 'recommendations' => "quiz#recommendations"
  put 'recommendations' => "quiz#recommendations"
  # get 'self-guided' => "questions#self_guided", as: :self_guided
  root to: "questions#index"
end
