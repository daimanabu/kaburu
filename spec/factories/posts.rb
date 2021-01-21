FactoryBot.define do
  factory :post do
    title { '記事タイトルです' }
    catch_copy { '内容' }
    concept { 'ニュース記事' }
    
    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user 
  end
end
