FactoryGirl.define do
  factory :role do
    name       'user'
  end
  
  factory :admin_role, class: Role do
    name        'admin'
  end
end