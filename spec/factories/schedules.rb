FactoryBot.define do
  factory :schedule do
    times { '10:00' }
    title { '朝食' }
    text  { '五分粥　茶碗1杯の8割程食べられました。' }
    association :user
    association :care_user

    after(:build) do |schedule|
      schedule.images.attach(io: File.open('public/images/atataka_tori_tamagogohan.png'), filename: 'test_image.png')
    end
  end
end

