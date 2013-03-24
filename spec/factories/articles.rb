FactoryGirl.define do
  factory :article do
    feed
    title { Faker::Lorem.sentence }
    published_at "2013-01-16 23:33:21"
    content { Faker::Lorem.paragraph }
    link "http://foo.bar/articles/1"
  end
end
