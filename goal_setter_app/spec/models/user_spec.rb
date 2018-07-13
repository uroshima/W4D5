require 'rails_helper'

describe User do 
  
  subject(:user) do
    FactoryBot.build(:user, username: 'harrypotter', password: '123456')
  end
  
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  
  it { should have_many(:goals) }
  
  describe ".find_by_credentials" do
    it 'returns user given good credentials' do
      # user = User.new(username: 'harrypotter', password: '123456')
      user.save!
      
      expect(User.find_by_credentials('harrypotter', '123456')).to eq(user)
    end
    
    it 'returns nil given bad credentials' do
      expect(User.find_by_credentials('hermionegranger', '123456')).to eq(nil)
    end
  end
end


