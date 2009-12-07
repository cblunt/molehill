Factory.define :user do |u|
  u.username "joebloggs"
  u.email_address "foo@bar.com"
  u.password "secret"
  u.verification_key "verification key"
  u.verified_at 1.week.ago
end
