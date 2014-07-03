# -*- encoding : utf-8 -*-
namespace :dev do

  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed" ]
  
  desc "demo"
  task :demo => :environment do
  end

  desc "Populate database with fake data"
  task :popfake => :environment do
    require "populator"
    require "faker"

    User.populate 20 do |user|
      user.email = Faker::Internet.email
      user.encrypted_password = "test1234"
      Group.populate 1..10 do |group|
        group.user_id = user.id
        group.title = Faker::Company.name
        group.description = Populator.sentences(1..5)
        GroupUser.populate 1 do |groupuser|
          groupuser.group_id = group.id
          groupuser.user_id = user.id
        end
      end
    end
  end
end
