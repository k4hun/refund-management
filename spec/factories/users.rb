FactoryGirl.define do
  factory :user do
    email       Faker::Internet.email
    password    '123456'
    role
  end
  
  factory :admin, class: User do
    email       'admin@mail.com'
    password    'adminadmin'
    association :role, factory: :admin_role
  end
end