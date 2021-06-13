# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

4.times do
  @course = Course.create(
    title: Faker::Name.name,
    description: Faker::Lorem.sentence(word_count: 3)
  )
  11.times do
    @course.lessons.create(
      title: Faker::Name.name,
      description: Faker::Lorem.sentence(word_count: 3)
    )
  end
end
