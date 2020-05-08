# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!({ email: "dan@example.com", first_name: "Dan", last_name: "Blair", password: "password" })
User.create!({ email: "bob@example.com", first_name: "Bob", last_name: "Currie", password: "password" })
User.create!({ email: "moira@example.com", first_name: "Moira", last_name: "Rose", password: "password" })
User.create!({ email: "johnny@example.com", first_name: "Johnny", last_name: "Sprockets", password: "password" })

Event.create!({ title: "Saturday Meetup", description: "Let's all get together and hang and drive", date: "2020-05-02", time: "10:00 AM", location: "Costco parking lot", image: "https://i0.wp.com/www.clovisroundup.com/wp-content/uploads/2019/07/Costco-new.jpg", user_id: 1 })
Event.create!({ title: "Coffee time", description: "We'll get charged up while our cars do, too!", date: "2020-06-03", time: "7:00 AM", location: "Starbucks", image: "https://media-cdn.tripadvisor.com/media/photo-s/07/08/25/f9/exterior-from-parking.jpg", user_id: 3 })
Event.create!({ title: "Driving all around", description: "We'll drive until our cars run out of juice!", date: "2020-05-18", time: "12:00 PM", location: "Columbus Drive", image: "https://media.timeout.com/images/102836817/image.jpg", user_id: 2 })

EventUser.create!({ event_id: 2, user_id: 2, role: "host" })
EventUser.create!({ event_id: 1, user_id: 2, role: "attendee" })
EventUser.create!({ event_id: 1, user_id: 1, role: "host" })
EventUser.create!({ event_id: 1, user_id: 3, role: "attendee" })
EventUser.create!({ event_id: 2, user_id: 1, role: "attendee" })
EventUser.create!({ event_id: 2, user_id: 3, role: "host" })

Comment.create!({ text: "Sounds like fun!", user_id: 2, event_id: 1 })
Comment.create!({ text: "Yeah I need some coffee", user_id: 1, event_id: 2 })

Make.create!({ manufacturer: "Tesla" })
Make.create!({ manufacturer: "Chevrolet" })
Make.create!({ manufacturer: "Nissan" })

VehicleModel.create!({ name: "Model 3", make_id: 1 })
VehicleModel.create!({ name: "Model X", make_id: 1 })
VehicleModel.create!({ name: "Model S", make_id: 1 })
VehicleModel.create!({ name: "Bolt", make_id: 2 })
VehicleModel.create!({ name: "Leaf", make_id: 3 })

Trim.create!({ name: "Long Range", make_id: 1 })
Trim.create!({ name: "Mid Range", make_id: 1 })
Trim.create!({ name: "Standard Range Plus", make_id: 1 })
Trim.create!({ name: "Performance", make_id: 1 })
Trim.create!({ name: "LT", make_id: 2 })
Trim.create!({ name: "Premier", make_id: 2 })
Trim.create!({ name: "SV", make_id: 3 })
Trim.create!({ name: "SV Plus", make_id: 3 })

Vehicle.create!({ nickname: "Duke Silver", make_id: 1, vehicle_model_id: 1, year: "2019", owner: true, color: "Midnight Silver", trim_id: 1, user_id: 1 })
Vehicle.create!({ nickname: "Sparky", make_id: 1, vehicle_model_id: 2, year: "2018", owner: true, color: "Pearl White", trim_id: 4, user_id: 3 })
Vehicle.create!({ nickname: "Apollo", make_id: 2, vehicle_model_id: 4, year: "2017", owner: true, color: "Electric Blue", trim_id: 5, user_id: 2 })
Vehicle.create!({ nickname: "Leafy", make_id: 3, vehicle_model_id: 5, year: "2020", owner: false, color: "Cherry Red", trim_id: 8, user_id: 4 })
