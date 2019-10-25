# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'bundler/setup'

User.create!(name: "admin_user",
               email: "1@1.com",
               password: "111111",
               password_confirmation: "111111",
               admin: true,
               trainer:true,
               )

User.create!(name: "test_user",
               email: "2@2.com",
               password: "222222",
               password_confirmation: "222222",
               trainer:true,
               )

               20.times do |n|
                name = Faker::Games::Pokemon.name
                email = Faker::Internet.email
                password = "password"
                User.create!(name: name,
                             email: email,
                             password: password,
                             password_confirmation: password,
                             trainee:true,
                             )
               end
