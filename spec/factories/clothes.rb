FactoryBot.define do
  factory :cloth do
    name { 'MyString' }
    user_id { 1 }
    group_id { 1 }
    author_id { 1 }
    amount { '9.99' }
  end
end
