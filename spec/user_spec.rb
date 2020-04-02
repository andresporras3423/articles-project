require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @u1 = User.create(name: 'Oscar', email: 'q@q.com', password: '12345678', password_confirmation: '12345678')
    @u1.save
  end
  context 'test user model creation' do
    it 'create valid user' do
      expect(@u1.valid?).to eq(true)
    end

    it 'create invalid user by existing name' do
      u2 = User.create(name: 'Oscar', email: 'q1@q.com',
                       password: '1234567', password_confirmation: '1234567')
      expect(u2.valid?).to eq(false)
    end

    it 'create invalid user by short password' do
      u2 = User.create(name: 'Oscar Andrés', email: 'q1@q.com',
                       password: '123', password_confirmation: '123')
      expect(u2.valid?).to eq(false)
    end

    it 'create invalid user by different pasword and password_confirmations' do
      u2 = User.create(name: 'Oscar andres', email: 'q1@q.com',
                       password: '12345678', password_confirmation: '12345679')
      expect(u2.valid?).to eq(false)
    end
  end
  # context 'test user model creation' do
  #   it 'bring list of created posts by this user' do
  #     expect(@u1.posts[0].content).to eq('abc')
  #   end

  #   it 'bring list of created comments by this user' do
  #     c1 = Comment.new(user_id: @u1.id, post_id: @p1.id, content: 'abc')
  #     c1.save
  #     expect(@u1.comments[0].content).to eq('abc')
  #   end

  #   it 'bring list of created likes by this user' do
  #     l1 = Like.new(user_id: @u1.id, post_id: @p1.id)
  #     l1.save
  #     expect(@u1.likes[0].post_id).to eq(@p1.id)
  #   end

  #   it 'created friendship between users' do
  #     u2 = User.create(name: 'salvaldor', email: 's@s.com', password: '12345678', password_confirmation: '12345678')
  #     u2.save
  #     f1 = Friendship.new(user_id: @u1.id, friend_id: u2.id, confirmed: true)
  #     f1.save
  #     expect(@u1.friendships[0].confirmed).to eq(true)
  #   end
  # end
end
