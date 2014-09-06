# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  admin_user = User.create(email: "admin@example.com",
                           name: "admin",
                           password: "password",
                           password_confirmation: "password",
                           admin: true)
  user = User.create(name: 'example user', email: 'example@example.com', password:'test1234', password_confirmation: 'test1234', admin: true)
  project = Project.create(name: 'Ticketee Beta')
  ticket = Ticket.create(title: 'test ticket', description: 'test ticket description', project_id: project.id, user_id: user.id)

  State.create(:name        => "New",
               :background  => "#85FF00",
               :color       => "white",
               :default     => true)

  State.create(:name        => "Open",
               :background  => "#85FF00",
               :color       => "white")

  State.create(:name        => "Closed",
               :background  => "black",
               :color       => "white")
