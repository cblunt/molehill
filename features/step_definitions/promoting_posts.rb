Given /^I have (promoted|demoted) "#{capture_model}"$/ do |method, model|
  controller.current_user.send method.chop.to_sym, model!(model)
end

Given /^#{capture_model} has a score of (\d)$/ do |model, score|
  post = model!(model)
  user = Factory(:user, :username => Faker::Internet.user_name, :email_address => Faker::Internet.email)

  score.to_i.times do
    user.promote model!(model)
  end
end

Given /^#{capture_model} has no score$/ do |model|
  post = model!(model)
  post.votes.delete_all
end

Then /^my promoted posts should include "#{capture_model}"$/ do |model|
  controller.current_user.promoted_posts.should include model!(model)
end

Then /^I should have voted on "#{capture_model}"$/ do |model|
  controller.current_user.voted?(model!(model)).should be_true
end
