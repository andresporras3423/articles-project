require 'rails_helper'

RSpec.describe Vote, type: :model do
  
  context 'vote model creation' do
    let(:u1) { User.create(name: 'Oscar', email: 'q@q.com', password: '12345678', password_confirmation: '12345678')}
    let(:text) {'1234567890' * 20}
    let(:a1) {Article.new(title: 'test article', text: text, user_id: u1.id, picture: '/example.jpg')}
    let(:v1) { Vote.new(user_id: u1.id, article_id: a1.id)}
    before(:each) do 
      u1.save
      a1.save
      v1.save
    end
    it 'valid vote' do
      expect(v1.valid?).to eq(true)
    end

    it 'invalid vote by invalid user id' do
      v2 = Vote.new(user_id: -1, article_id: a1.id)
      expect(v2.valid?).to eq(false)
    end

    it 'invalid vote by invalid article id' do
      v2 = Vote.new(user_id: u1.id, article_id: -1)
      expect(v2.valid?).to eq(false)
    end
  end
end
