require 'rails_helper'

RSpec.describe ArticleCategory, type: :model do
  before(:each) do
    @u1 = User.create(name: 'Oscar', email: 'q@q.com', password: '12345678', password_confirmation: '12345678')
    @u1.save
    @text='1234567890'*20
    @a1 = Article.new(title: 'test article', text: @text, user_id: @u1.id, picture:"/example.jpg")
    @a1.save
    @c1 = Category.new(name: 'sports', priority: 1000)
    @c1.save
    @ac1 = ArticleCategory.new(article_id: @a1.id, category_id: @c1.id)
    @ac1.save
  end
  context 'test article_category model creation' do
    it 'create valid article_category' do
      expect(@ac1.valid?).to eq(true)
    end

    it 'create invalid category' do
      ac2 = ArticleCategory.new(article_id: -1, category_id: @c1.id)
      expect(ac2.valid?).to eq(false)
    end

    it 'create invalid article by repeated priority' do
        ac2 = ArticleCategory.new(article_id: @a1.id, category_id: -1)
        expect(ac2.valid?).to eq(false)
    end
  end
end
