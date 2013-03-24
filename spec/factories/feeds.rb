# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feed do
    name { Faker::Lorem.sentence }
    url "http://foo.bar/"

    factory :feed_with_articles do
      ignore do
        articles_count 5
      end

      after(:create) do |feed, evaluator|
        FactoryGirl.create_list(:article, evaluator.articles_count, feed: feed)
      end
    end
  end
end
