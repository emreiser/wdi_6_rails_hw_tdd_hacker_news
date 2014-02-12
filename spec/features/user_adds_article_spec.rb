require 'spec_helper'

feature 'Logged in user can add article' do
	background do
		user = create(:user)
		sign_in_as(user)
	end

	scenario 'successfully' do
		visit root_path
		click_link 'Submit'
		fill_in 'Title', with: 'First article'
		fill_in 'Url', with: 'http://richardlynch.blogspot.com/'
		click_button 'Submit'
		expect(page).to have_link 'First article'
	end

end