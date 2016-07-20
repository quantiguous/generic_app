# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Base::AdminUser.all.empty?
  admin = Base::AdminUser.new(username: "admin", email: "admin@example.com", password: "rootpassword",
         password_confirmation: "rootpassword")
  if admin.save
    admin.add_role :super_admin
  end
end

Base::Role.create(:name=>"user") if Base::Role.find_by_name("user").nil?