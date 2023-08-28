# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb

# Create default admin user
admin = User.find_by(email: 'admin@example.com')
unless admin
  admin = User.create!(
    name: 'Super Admin',
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password',
    admin: true
  )
  puts 'Default admin user created.'
end

# Create activities
activities = [
  { name: 'Agriculture' },
  { name: 'Commerce' },
  { name: 'Pêche' }
]

activities.each do |activity_attrs|
  Activite.find_or_create_by(activity_attrs)
end

puts 'Activities created.'
