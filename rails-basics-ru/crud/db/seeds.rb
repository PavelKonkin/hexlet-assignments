# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  task = Task.new
  task.name = Faker::Book.title
  task.description = Faker::Movie.quote
  task.creator = Faker::Book.author
  task.performer = Faker::Book.author
  task.save
end
