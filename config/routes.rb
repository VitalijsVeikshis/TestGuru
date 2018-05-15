Rails.application.routes.draw do
  scope '(:lang)' do
    root 'main#index'

    get 'contact', to: 'contacts#new'
    post 'contact', to: 'contacts#create'

    devise_for :users,
               controllers: { sessions: 'sessions' },
               path: :gurus,
               path_names: { sign_in: :login, sign_out: :logout }

    resources :tests, only: :index do
      post :start, on: :member
    end

    resources :test_passages, only: %i[show update] do
      member do
        get :result
        post :gist
      end
    end

    resources :badges, only: :index

    namespace :admin do
      resources :tests do
        patch :update_inline, on: :member

        resources :questions, shallow: true, except: :index do
          patch :update_inline, on: :member

          resources :answers, shallow: true, except: :index
        end
      end

      resources :gists, only: %i[index destroy]

      resources :badges, except: %i[new create] do
        patch :update_inline, on: :member
      end

      resources :badge_for_test_attempts, only: %i[new create]
      resources :badge_for_test_categories, only: %i[new create]
      resources :badge_for_test_levels, only: %i[new create]
    end
  end
end
