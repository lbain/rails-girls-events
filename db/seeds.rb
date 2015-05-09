User.destroy_all
Admin.destroy_all
Vote.destroy_all

#create users
User.create(name: 'Joanna Smith', email: 'Joanna_Smith@gmail.com', under_18: false, previous_attendant: true, track: 'Rails Girls Next', programming_experience: 'Some Ruby', reason: 'I want to learn to program', tshirt_size: 'S', status: 'applied')
User.create(name: 'Sam Kelly', email: 'Sam_Kelly@gmail.com', under_18: true, previous_attendant: false, track: 'Rails Girls', programming_experience: 'none', reason: 'I want to learn to program', tshirt_size: 'S', status: 'applied')
User.create(name: 'Rochelle Gainsford', email: 'Rochelle_Gainsford@gmail.com', under_18: false, previous_attendant: true, track: 'Rails Girls Next', programming_experience: 'Some Ruby', reason: 'I want to learn to program', tshirt_size: 'S', status: 'applied')
User.create(name: 'Amy Wind', email: 'Amy_Wind@gmail.com', under_18: false, previous_attendant: false, track: 'Rails Girls', programming_experience: 'none', reason: 'I want to learn to program', tshirt_size: 'S', status: 'applied')
User.create(name: 'Jennifer Embleton', email: 'Jennifer_Embleton@gmail.com', under_18: false, previous_attendant: false, track: 'Rails Girls', programming_experience: 'none', reason: 'I want to learn to program', tshirt_size: 'S', status: 'applied')
User.create(name: 'Nicole Newman', email: 'Nicole_Newman@gmail.com', under_18: false, previous_attendant: false, track: 'Rails Girls', programming_experience: 'none', reason: 'I want to learn to program', tshirt_size: 'S', status: 'applied')
User.create(name: 'Monica Osborn', email: 'Monica_Osborn@gmail.com', under_18: true, previous_attendant: false, track: 'Rails Girls', programming_experience: 'none', reason: 'I want to learn to program', tshirt_size: 'S', status: 'applied')
User.create(name: 'Valentina Waters', email: 'Valentina_Waters@gmail.com', under_18: false, previous_attendant: false, track: 'Rails Girls', programming_experience: 'none', reason: 'I want to learn to program', tshirt_size: 'S', status: 'applied')
User.create(name: 'John Doe', email: 'John_Doe@gmail.com', under_18: false, previous_attendant: false, track: 'Rails Girls', programming_experience: 'none', reason: 'I want to learn to program', tshirt_size: 'S', status: 'applied')
User.create(name: 'Caroline Rowland', email: 'Caroline_Rowland@gmail.com', under_18: false, previous_attendant: true, track: 'Rails Girls Next', programming_experience: 'Some Ruby', reason: 'I want to learn to program', tshirt_size: 'S', status: 'applied')
User.create(name: 'Janet Kirk', email: 'Janet_Kirk@gmail.com', under_18: false, previous_attendant: false, track: 'Rails Girls', programming_experience: 'none', reason: 'I want to learn to program', tshirt_size: 'S', status: 'applied')
User.create(name: 'Sophie Dorsey', email: 'Sophie_Dorsey@gmail.com', under_18: true, previous_attendant: false, track: 'Rails Girls', programming_experience: 'none', reason: 'I want to learn to program', tshirt_size: 'S', status: 'applied')
User.create(name: 'Rose Simpson', email: 'Rose_Simpson@gmail.com', under_18: false, previous_attendant: true, track: 'Rails Girls Next', programming_experience: 'Some Ruby', reason: 'I want to learn to program', tshirt_size: 'S', status: 'applied')
User.create(name: 'Liana Klein', email: 'Liana_Klein@gmail.com', under_18: false, previous_attendant: false, track: 'Rails Girls', programming_experience: 'none', reason: 'I want to learn to program', tshirt_size: 'S', status: 'applied')
User.create(name: 'Melody Glenn', email: 'Melody_Glenn@gmail.com', under_18: false, previous_attendant: false, track: 'Rails Girls', programming_experience: 'none', reason: 'I want to learn to program', tshirt_size: 'S', status: 'applied')

#create admins
Admin.create(username: 'Amy Simmons', email: 'amysimmons.abc@gmail.com')
Admin.create(username: 'Lucy Bain', email: 'lucybain@gmail.com')
Admin.create(username: 'Angie', email: 'angie@gmail.com')

#create votes
Vote.create(admin_id: 4, user_id: 91, vote_type: 'up')
Vote.create(admin_id: 5, user_id: 92, vote_type: 'up')
Vote.create(admin_id: 6, user_id: 93, vote_type: 'down')


