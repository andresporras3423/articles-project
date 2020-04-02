require 'rails_helper'

RSpec.describe Vote, type: :model do
  before(:each) do
    @u1 = User.create(name: 'Oscar', email: 'q@q.com', password: '12345678', password_confirmation: '12345678')
    @u1.save
    @text = '1234567890' * 20
    @a1 = Article.new(title: 'test article', text: @text, user_id: @u1.id, picture: '/example.jpg')
    @a1.save
    @v1 = Vote.new(user_id: @u1.id, article_id: @a1.id)
    @v1.save
  end
  context 'test vote creation' do
    it 'create valid vote' do
      expect(@v1.valid?).to eq(true)
    end

    it 'create invalid vote by invalid user id' do
      v2 = Vote.new(user_id: -1, article_id: @a1.id)
      expect(v2.valid?).to eq(false)
    end

    it 'create invalid vote by invalid article id' do
      v2 = Vote.new(user_id: @u1.id, article_id: -1)
      expect(v2.valid?).to eq(false)
    end
  end
end
