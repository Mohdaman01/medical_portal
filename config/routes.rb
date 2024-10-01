Rails.application.routes.draw do
  devise_for :users

  authenticated :user, ->(u) { u.receptionist? } do
    resources :patients
    root to: "receptionists#index", as: :receptionist_root
  end

  authenticated :user, ->(u) { u.doctor? } do
    get 'doctors/index'
    root to: "doctors#index", as: :doctor_root
  end

  root to: redirect('/users/sign_in')
end