admin_users = User.seed(:username) do |a|
  a.username = "demo"
  a.email = "demo@example.com"
  a.password = "sf1234"
  a.password_confirmation = "sf1234"
end
