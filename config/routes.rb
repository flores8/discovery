Discovery::Engine.routes.draw do
  resources :questions, :answers

  resources :personalities do
  	resources :career_contentments, only: [:create, :edit, :update, :destroy]
    resources :strengths, except: [:index, :new, :show]
  end

  resources :categories do
    resources :personality_careers, except: [:index, :new, :show]
    resources :personality_majors, except: [:index, :new, :show]
  end
  get 'results' => "quiz#show"
  get 'recommendations' => "quiz#recommendations"
  put 'recommendations' => "quiz#recommendations"
  # get 'self-guided' => "questions#self_guided", as: :self_guided
  root to: "questions#index"
end
