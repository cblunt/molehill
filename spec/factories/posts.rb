Factory.define :post do |p|
  p.body "Some random post text"
  p.user { |u| u.association(:user, :username => Faker::Internet.user_name, :email_address => Faker::Internet.email) }
end
