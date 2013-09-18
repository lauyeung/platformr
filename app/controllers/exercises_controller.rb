class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
  end

  def edit
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      flash[:notice] = "Exercise was successfully added!"
      redirect_to '/exercises'
    else
      render :new
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name)
  end

end
