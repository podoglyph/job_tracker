FactoryGirl.define do

  sequence(:name) { |n| "Fake Company #{n}" }

  factory :company do
    name
  end

end
