require 'spec_helper'

feature 'User downvotes an article' do

	background do
		user = create(:user)
		sign_in_as(user)
		@article = create(:article)
	end

	scenario 'successfully' do
		visit root_path
		click_button 'Up vote'
		expect(page).to have_content '1 points'
		click_button 'Down vote'
		expect(page).to have_content '0 points'
	end


end