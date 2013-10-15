class ExercisesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @exercises = current_user.exercises.order('name')
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = current_user.exercises.build(exercise_params)
    if @exercise.save
      flash[:notice] = "Exercise was successfully added!"
      redirect_to exercises_path
    else
      render :new
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update(exercise_params)
      redirect_to exercises_path, notice: 'Exercise was successfully updated!'
    else
      render action: 'edit'
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    if @exercise.check_exercise_not_in_use
      @exercise.destroy
      redirect_to exercises_path, notice: 'Exercise was successfully deleted!'
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name)
  end

end
