FactoryBot.define do
  factory :post do
    title { Faker::Movie.title }
    image { Rack::Test::UploadedFile.new('spec/files/test-image.jpg', 'image/jpeg') }
  end
end
