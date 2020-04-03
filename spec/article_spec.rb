require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'article model creation' do
    let(:u1){User.create(name: 'Oscar2', email: 'q2@q.com', password: '12345678', password_confirmation: '12345678')}
    let(:text){'1234567890' * 20}
    let(:a1){Article.new(title: 'test article', text: text, user_id: u1.id, picture: '/example.jpg')}
    before(:each) do
      u1.save
      a1.save
    end
    it 'valid article' do
      expect(a1.valid?).to eq(true)
    end

    it 'invalid article by short text' do
      a2 = Article.new(title: 'test article', text: 'text', user_id: u1.id)
      expect(a2.valid?).to eq(false)
    end

    it 'invalid article by short title' do
      a2 = Article.new(title: '', text: text, user_id: u1.id)
      expect(a2.valid?).to eq(false)
    end

    it 'invalid article by invalid user if' do
      a2 = Article.new(title: '', text: text, user_id: -1)
      expect(a2.valid?).to eq(false)
    end
  end
end
