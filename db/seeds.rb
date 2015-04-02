
User.delete_all
Item.delete_all

#Create an admin user
admin = User.new(
  name:    'Admin User',
  email:   'admin@example.com',
  password:'helloworld'
  )
admin.skip_confirmation!
admin.save!

#Create a member
member = User.new(
  name:    'Member User',
  email:   'member@example.com',
  password:'helloworld'
  )
member.skip_confirmation!
member.save!

users = User.all

#Create items
25.times do
  Item.create!(
    name: Faker::Lorem.sentence,
    user: users.sample,
    created_at: (1..7).to_a.sample.days.ago
    )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"