require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user model creation' do
    let(:u1) { User.create(name: 'Oscar', email: 'q@q.com', password: '12345678', password_confirmation: '12345678') }
    before(:each) do
      u1.save
    end
    it 'valid user' do
      expect(u1.valid?).to eq(true)
    end

    it 'invalid user by existing name' do
      u2 = User.create(name: 'Oscar', email: 'q1@q.com',
                       password: '1234567', password_confirmation: '1234567')
      expect(u2.valid?).to eq(false)
    end

    it 'invalid user by short password' do
      u2 = User.create(name: 'Oscar Andrés', email: 'q1@q.com',
                       password: '123', password_confirmation: '123')
      expect(u2.valid?).to eq(false)
    end

    it 'invalid user by different pasword and password_confirmations' do
      u2 = User.create(name: 'Oscar andres', email: 'q1@q.com',
                       password: '12345678', password_confirmation: '12345679')
      expect(u2.valid?).to eq(false)
    end
  end
end
