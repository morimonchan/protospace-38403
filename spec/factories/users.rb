FactoryBot.define do
  factory :user do
    name              {Faker::Name.initials(number: 2)}
    email             {Faker::Internet.free_email}
    password          {Faker::Internet.password(min_length: 6)}
    encrypted_password{password}
    profile           {Faker::Internet.username}
    occupation        {Faker::Company.name}
    position          {Faker::Company.profession}
  end
end