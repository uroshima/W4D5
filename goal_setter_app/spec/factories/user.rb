
FactoryBot.define do
  factory :user do
    username 'harrypotter'
    password '123456'
    # 
    # # Child of :post factory, since it's in the `factory :post` block
    # factory :published_post do
    #   published true
    # end
  end
end