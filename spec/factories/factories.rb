FactoryGirl.define do

 factory :article do
 	user
 	title 'Test article'
 	url 'www.article.com'
 end

 factory :user do
 	email { Faker::Internet.email }
 	password 'password'
 end

 factory :comment do
 	article
 	user
 	body 'This is a new comment'
 end

 factory :vote do
 	user
 	up true
 end

end



