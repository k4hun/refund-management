puts 'Start seed'

REFUND_CATEGORIES = ['Health care', 'Education', 'Sport']
STATUSES = [nil, 'approved', 'rejected']

Role.create(name: 'admin')
Role.create(name: 'user')

# Create admin
user = User.new(email: 'admin@mail.com', password: '123456')
user.role = Role.find_by_name('admin')
user.save

# Create categories
REFUND_CATEGORIES.each do |category|
	Category.create!(
		name: category
	)
end
categories = Category.all

# Create users
5.times do
	User.create!(
		email: Faker::Internet.email,
		password: '123456',
		role: Role.find_by_name('user')
	)
end
users = User.all

# Create pending applications
15.times do
	Application.create!(
		description: Faker::Lorem.sentence,
		user: users.sample,
		refund_value: 1
	)
end

# Create applications
10.times do
	Application.create!(
		description: Faker::Lorem.sentence,
		category: categories.sample,
		status: STATUSES.sample,
		user: users.sample,
		refund_value: [*1..100].sample
	)
end

puts 'Seed end'