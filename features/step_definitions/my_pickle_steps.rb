Then /^#{capture_model}'s (\w+) should be (me|mine)$/ do |model, association, me|
  model!(model).send(association).should == @current_user
end
