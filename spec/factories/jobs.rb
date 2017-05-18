FactoryGirl.define do

  sequence(:title) { |n| "Space Pilot #{n}" }

  factory :job do
    company

    title
    description "Galactic Smuggling"
    city "Mos Eisley"
    level_of_interest 99
  end

  # factory :company do
  #   association :company
  # end
end
