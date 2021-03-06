require 'spec_helper'

feature 'Sign-in' do
  let(:user) { User.new(username: 'bob', password: 'bob') }

  context "through navbar login form" do
    before(:each) do
      visit root_path
    end

    it "should display a navbar" do
      page.should have_css(".navbar")
    end

    context "with invalid info" do
      pending
    end

    context "with valid info" do
      it "should log in the user" do
        user.save
        fill_in 'username', with: 'bob'
        fill_in 'password', with: 'bob'
        click_on 'sign_in'
        expect(page).to have_css('#signout')
      end
    end
  end
end
