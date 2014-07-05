# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  project = Project.create(name: 'example', description: 'example description')
  ticket = Ticket.create(title: 'test ticket', description: 'test ticket description', project_id: project.id)
