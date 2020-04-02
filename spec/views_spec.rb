require 'spec_helper'

RSpec.describe 'index page', type: :feature do
  before(:all) do
    @user1 = User.create(name: 'user1', email: 'user1@u1.com', password: '123456', password_confirmation: '123456')
    @user1.save

    @user2 = User.create(name: 'user2', email: 'user2@u2.com', password: 'qwerty', password_confirmation: 'qwerty')
    @user2.save

    @user3 = User.create(name: 'user3', email: 'user3@u3.com', password: 'asdfgh', password_confirmation: 'asdfgh')
    @user3.save

    @c1 = Category.new(name: 'health', priority: 1)
    @c1.save
    @c2 = Category.new(name: 'sport', priority: 2)
    @c2.save
  end

  before(:each) do
    visit '/login'
    fill_in 'name', with: 'user1'
    fill_in 'password', with: '123456'
    click_button 'Log In'
  end

  scenario 'index page' do
    find('a', text: 'Logout').click
    visit '/'
    expect(page).to have_content('Login')
  end
  scenario 'visit sign up page' do
    find('a', text: 'Logout').click
    visit '/signup'
    expect(page).to have_content('Password confirmation:')
  end

  scenario 'test signup event' do
    find('a', text: 'Logout').click
    visit '/signup'
    fill_in 'name', with: 'fernando'
    fill_in 'email', with: 'f@f.com'
    fill_in 'password', with: '123456'
    fill_in 'password_confirmation', with: '123456'
    click_button 'Sign Up'
    page.should have_content('Sign In')
  end

  scenario 'test login event' do
    page.should have_content('Signed in as user1')
  end

  scenario 'test post event' do
    find('a', text: 'new article').click
    @text = '1234qwerasdf' * 20
    fill_in 'title', with: 'my first article'
    fill_in 'text', with: @text
    page.attach_file('image', File.expand_path('./app/assets/images/screenshot.png'))
    find('#checkbox1').click
    click_button 'Submit'
    page.should have_content('my first article')
  end

  scenario 'test access to category' do
    find('a', text: 'new article').click
    @text = '1234qwerasdf' * 20
    fill_in 'title', with: 'my first article'
    fill_in 'text', with: @text
    page.attach_file('image', File.expand_path('./app/assets/images/screenshot.png'))
    find('#checkbox1').click
    click_button 'Submit'
    find('a', text: 'health').click
    page.should have_content('1234qwerasdf')
  end

  scenario 'vote article' do
    find('a', text: 'new article').click
    @text = '1234qwerasdf' * 20
    fill_in 'title', with: 'my first article user1'
    fill_in 'text', with: @text
    page.attach_file('image', File.expand_path('./app/assets/images/screenshot.png'))
    find('#checkbox1').click
    click_button 'Submit'
    article = Article.all.find_by_title('my first article user1')
    find('a', text: 'health').click
    find("#article#{article.id}").click
    page.should have_content('1234qwerasdf')
  end

  scenario 'test vote article' do
    find('a', text: 'new article').click
    @text = '1234qwerasdf' * 20
    fill_in 'title', with: 'my first article user1'
    fill_in 'text', with: @text
    page.attach_file('image', File.expand_path('./app/assets/images/screenshot.png'))
    find('#checkbox1').click
    click_button 'Submit'
    article = Article.all.find_by_title('my first article user1')
    find('a', text: 'health').click
    find("#article#{article.id}").click
    click_button 'vote'
    page.should have_content('total votes: 1')
  end

  scenario 'test link to most popular article' do
    find('a', text: 'new article').click
    @text = '1234qwerasdf' * 20
    fill_in 'title', with: 'my first article'
    fill_in 'text', with: @text
    page.attach_file('image', File.expand_path('./app/assets/images/screenshot.png'))
    find('#checkbox1').click
    click_button 'Submit'
    find('a', text: 'Read More').click
    page.should have_content('1234qwerasdf')
  end
end
