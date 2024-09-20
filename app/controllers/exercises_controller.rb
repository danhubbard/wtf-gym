class ExercisesController < ApplicationController
  def index
    @exercise = Exercise.order("RANDOM()").first
  end

  def show
    @exercise = Exercise.find(params['id'])
  end
end
