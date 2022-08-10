FactoryBot.define do
  factory :access_log do
    sequence(:request_id) { |n| n }
    sequence(:path) { |n| "/users/#{n}" }
    status { 200 }
    sequence(:duration) { |n| (1 + n * 0.1).ceil(1) }
    error { "" }
  end
end
