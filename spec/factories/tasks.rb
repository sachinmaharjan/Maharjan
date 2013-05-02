# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    user_id 1
    headline "MyString"
    completed_at "2013-04-28 11:32:15"
  end
end
