FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"test0000"}
    password_confirmation {password}
    first_name            {"鈴木"}
    family_name           {"彰"}
    first_name_kana       {"スズキ"}
    family_name_kana       {"アキラ"}
    birthday              {"1989-03-07"}
  end
end
