# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name "MyString"
    description "MyText"
    planned_duration 1
    start "2013-04-10 17:20:42"
  end
end
