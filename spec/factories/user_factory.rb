FactoryGirl.define do 
  factory :user do 
    name  "Sachin Maharjan"
    email "sachin@maharjan.com"
    password "password"
    password_confirmation "password"
  end

  factory :empty_user, class: User do 
    name  ""
    email ""
    password ""
    password_confirmation ""
  end

end 
