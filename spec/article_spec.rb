require 'rails_helper'

RSpec.describe Article, type: :model do
  before(:each) do
    @u1 = User.create(name: 'Oscar2', email: 'q2@q.com', password: '12345678', password_confirmation: '12345678')
    @u1.save
    @text = '1234567890' * 20
    @a1 = Article.new(title: 'test article', text: @text, user_id: @u1.id, picture: '/example.jpg')
    @a1.save
  end
  context 'test article model creation' do
    it 'create valid article' do
      expect(@a1.valid?).to eq(true)
    end

    it 'create invalid article by short text' do
      a2 = Article.new(title: 'test article', text: 'text', user_id: @u1.id)
      expect(a2.valid?).to eq(false)
    end

    it 'create invalid article by short title' do
      a2 = Article.new(title: '', text: @text, user_id: @u1.id)
      expect(a2.valid?).to eq(false)
    end

    it 'create invalid article by invalid user if' do
      a2 = Article.new(title: '', text: @text, user_id: -1)
      expect(a2.valid?).to eq(false)
    end
  end
end
