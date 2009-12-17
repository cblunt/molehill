Given /^"#{capture_model}" belongs to me$/ do |model|
  model!(model).send(:update_attribute, :user, controller.current_user)
end

Given /^#{capture_model} belongs to #{capture_model}$/ do |model, user|
  model!(model).send(:update_attribute, :user, model!(user))
end

Given /^#{capture_model} (?:is|has been) completed?$/ do |model|
  model!(model).send :update_attribute, :completed_at, Time.now
end

Given /^#{capture_model} (?:is|has been) declined$/ do |model|
  model!(model).send :update_attribute, :declined_at, Time.now
end

Then /^#{capture_model}'s (\w+) should be (me|mine)$/ do |model, association, me|
  model!(model).send(association).should == controller.current_user
end

