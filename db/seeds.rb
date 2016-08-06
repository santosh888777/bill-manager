# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = [
    { email: "amar@bill-manager.com", password: "123456789", reset_password_token: nil, reset_password_sent_at: nil,
    remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, name: "Amar" },
    { email: "akbar@bill-manager.com", password: "123456789", reset_password_token: nil, reset_password_sent_at: nil,
    remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, name: "Akbar" },
   { email: "anthony@bill-manager.com", password: "123456789", reset_password_token: nil, reset_password_sent_at: nil,
    remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, name: "Anthony" }
]

users.each{|user|User.create!(user) }

