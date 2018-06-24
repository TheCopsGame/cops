puts 'Creating users...'

5.times do |i|
  User.create!(
    email: "user_#{i}@tester.com",
    password: 'thecops'
  )
end

puts "Created #{User.count} users"
