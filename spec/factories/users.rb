FactoryBot.define do
  factory :user do
    nick_name             { "てすと" }
    email                 {Faker::Internet.free_email}
    password              {'a1' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"やまだ"}
    last_name_kana        {"ヤマダ"}
    first_name            {"たろう"}
    first_name_kana       {"タロウ"}
    birth_day             {"2000-01-01"}
  end
end
