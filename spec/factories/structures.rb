FactoryBot.define do
  factory :structure do
    email { "structure@gmail.com" }
    
    password { "password" }
    password_confirmation { "password" }
    
  end
end
