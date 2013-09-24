class ExercisesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @exercises = current_user.exercises
  end

  def new
    @exercise = Exercise.new
  end

  def edit
  end

  def create
    @exercise = current_user.exercises.build(exercise_params)
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
