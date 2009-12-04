Given /^I (promote|demote) "#{capture_model}"$/ do |method, model|
  @current_user.send method.to_sym, model!(model)
end

Given /^I have (?:promoted|demoted) "#{capture_model}"$/ do |model|
  @current_user.promote model!(model)
end

Given /^I have not (?:promoted|demoted) "#{capture_model}"$/ do |model|
  @current_user.demote model!(model)
end
