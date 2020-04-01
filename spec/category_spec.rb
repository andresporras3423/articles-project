require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @c1 = Category.new(name: 'sports', priority: 500)
    @c1.save
  end
  context 'test category model creation' do
    it 'create valid category' do
      expect(@c1.valid?).to eq(true)
    end

    it 'create invalid category' do
      c2 = Category.new(name: 'sports', priority: 600)
      expect(c2.valid?).to eq(false)
    end

    it 'create invalid article by repeated priority' do
        c2 = Category.new(name: 'art', priority: 500)
        expect(c2.valid?).to eq(false)
    end
  end
end
