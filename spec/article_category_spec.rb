require 'rails_helper'

RSpec.describe ArticleCategory, type: :model do
  context 'article_category model creation' do
    let(:u1) { User.create(name: 'Oscar', email: 'q@q.com', password: '12345678', password_confirmation: '12345678') }
    let(:text) { '1234567890' * 20 }
    let(:a1) { Article.new(title: 'test article', text: text, user_id: u1.id, picture: '/example.jpg') }
    let(:c1) { Category.new(name: 'sports', priority: 1000) }
    let(:ac1) { ArticleCategory.new(article_id: a1.id, category_id: c1.id) }
    before(:each) do
      u1.save
      a1.save
      c1.save
      ac1.save
    end
    it 'valid article_category' do
      expect(ac1.valid?).to eq(true)
    end

    it 'invalid category' do
      ac2 = ArticleCategory.new(article_id: -1, category_id: c1.id)
      expect(ac2.valid?).to eq(false)
    end

    it 'invalid article by repeated priority' do
      ac2 = ArticleCategory.new(article_id: a1.id, category_id: -1)
      expect(ac2.valid?).to eq(false)
    end
  end
end
