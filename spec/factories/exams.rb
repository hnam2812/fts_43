FactoryGirl.define do
  factory :exam do
    subject Subject.first
    user User.first
    status :uncheck
  end

end
