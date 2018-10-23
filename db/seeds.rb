puts 'Creating users...'

5.times do |i|
  User.create!(
    username: "user#{i}",
    email: "user#{i}@tester.com",
    password: 'thecops',
    confirmed_at: Time.current
  )
end

puts "Created #{User.count} users"
