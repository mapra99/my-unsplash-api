FactoryBot.define do
  factory :post do
    title { Faker::Movie.title }

    factory :post_with_image do
      image { Rack::Test::UploadedFile.new('spec/files/test-image.jpg', 'image/jpeg') }
    end
  end
end
