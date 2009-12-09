Given /^"#{capture_model}" belongs to me$/ do |model|
  model!(model).send(:user=, controller.current_user)
end
Then /^#{capture_model}'s (\w+) should be (me|mine)$/ do |model, association, me|
  model!(model).send(association).should == controller.current_user
end
