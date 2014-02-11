require 'spec_helper'

feature 'Add comments' do

	scenario 'a signed in user can add a comment' do
		sign_up_with('em@example.com', 'password')
		create_article
		click_on 'Add comment'
	end

end