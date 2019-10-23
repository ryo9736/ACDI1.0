FactoryBot.define do
    factory :user do
      email { 'test@test.com' }
      password { '123456' }
      password_confirmation { '123456' }
      trainer {true}
    end

    factory :second_user, class: User do
      email { 'second@second.com' }
      password { '678910' }
      password_confirmation { '678910' }
      trainee {true}
    end
end