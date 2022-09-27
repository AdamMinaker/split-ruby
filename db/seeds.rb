# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Session.destroy_all
Exercise.destroy_all
Workout.destroy_all

# Inserting products with .csv
require "csv"

def load_csv(type)
  csv_file = Rails.root.join("db/#{type}.csv")
  csv_data = File.read(csv_file)
  parsed_csv = CSV.parse(csv_data, headers: true)

  # If CSV was created by Excel in Windows you may also need to set an encoding type:
  # products = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')
  if (type == 'workouts')
    parsed_csv.each do |row|
      record = Workout.new(:name =>  row['name'], :description => row['description'])
      record.save
    end
  end

  if (type == 'exercises')
    parsed_csv.each do |row|
      workout = Workout.find_or_create_by(name: row['workout'])
      record = Exercise.new(:name =>  row['name'], :description => row['description'], :workout => workout)
      record.save
    end
  end

  if (type == 'sessions')
    parsed_csv.each do |row|
      exercise = Exercise.find_or_create_by(name: row['exercise'])
      record = Session.new(:weight =>  row['weight'].to_i, :reps => row['reps'].to_i, :exercise => exercise)
      record.save
    end
  end
end

load_csv('workouts')
load_csv('exercises')
load_csv('sessions')

# Inserting products with Faker
# # Create 50 workouts
# 50.times do
#   workout = Workout.new(:name =>  Faker::Emotion.noun, :description => Faker::ChuckNorris.fact)
#   workout.save

#   # Create 5 exercises for each workout
#   5.times do
#     exercise = Exercise.new(:name => Faker::Dessert.variety, :description => Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4), :workout => workout)
#     exercise.save

#     # Create 3 sessions for each exercise
#     3.times do
#       Session.new(:weight => Faker::Number.decimal_part(digits: 2), :reps => Faker::Number.decimal_part(digits: 2), :exercise => exercise).save
#     end
#   end
# end
