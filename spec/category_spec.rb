require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'category model creation' do
    let(:c1) {Category.new(name: 'sports', priority: 500)}
    before(:each) do
      c1.save
    end
    it 'valid category' do
      expect(c1.valid?).to eq(true)
    end

    it 'invalid category' do
      c2 = Category.new(name: 'sports', priority: 600)
      expect(c2.valid?).to eq(false)
    end

    it 'invalid article by repeated priority' do
      c2 = Category.new(name: 'art', priority: 500)
      expect(c2.valid?).to eq(false)
    end
  end
end
