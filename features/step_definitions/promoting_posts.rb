Given /^I have (?:promoted|demoted) "#{capture_model}"$/ do |model|
  @current_user.voted_posts.should include model!(model)
end

Given /^I have not (?:promoted|demoted) "#{capture_model}"$/ do |model|
  @current_user.voted_posts.should_not include model!(model)
end
