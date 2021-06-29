FactoryBot.define do
    factory :yip do
        body { "It's yippilicious!" }
        association :author, factory: :user
    end
end