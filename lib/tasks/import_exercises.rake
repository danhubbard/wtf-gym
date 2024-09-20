require 'json'

namespace :import do
  desc 'Import exercises from JSON file'
  task exercises: :environment do
    file_path = Rails.root.join('exercises.json')
    exercises = JSON.parse(File.read(file_path))

    exercises.each do |exercise_data|
      Exercise.create!(
        name: exercise_data['name'],
        force: exercise_data['force']&.downcase,
        level: exercise_data['level']&.downcase,
        mechanic: exercise_data['mechanic']&.downcase,
        equipment: exercise_data['equipment'],
        category: exercise_data['category'],
        instructions: exercise_data['instructions'],
        primary_muscles: exercise_data['primaryMuscles'],
        secondary_muscles: exercise_data['secondaryMuscles'],
        images: exercise_data['images']
      )
    end

    puts "Imported #{Exercise.count} exercises"
  end
end