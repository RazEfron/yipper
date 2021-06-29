FactoryBot.define do
    factory :user do
        # Curly braces are a code block to run each time the factory is used to create a user
        username { Faker::Games::Pokemon.name }
        email { Faker::Internet.email }
        password { "password" }
        age { 20 }
        political_affiliation { Faker::Movies::HarryPotter.house }

        factory :harry_potter do
            username { "Harry Potter" }
            political_affiliation { "Gryffindor" }
        end
    end
end

# "#build": Does not save to db
# "#create": saves to db