Factory.define :post do |p|
  p.body "Some random post text"
  p.user { |u| u.association(:user, :email_address => Faker::Internet.email) }
end
