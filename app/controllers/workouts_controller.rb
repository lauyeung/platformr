class WorkoutsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @workouts = current_user.workouts.order("workout_date DESC")
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
    combination = @workout.combinations.build
    superset = combination.supersets.build
    exercise_set = superset.exercise_sets.build
  end

  def create
    @workout = current_user.workouts.build(workout_params)

    if @workout.save
      flash[:notice] = "Workout was successfully added!"
      redirect_to workouts_path
    else
      render 'new'
    end
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    if @workout.update(workout_params)
      redirect_to workouts_path, notice: 'Workout was successfully updated!'
    else
      render action: 'edit'
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    if @workout.user == current_user
      @workout.destroy
      redirect_to workouts_path, notice: 'Workout was successfully deleted!'
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:workout_date,
      combinations_attributes: [:sets, :sets_complete,
        supersets_attributes: [:weight,
          exercise_sets_attributes: [:reps, :exercise_id]
        ]
      ]
    )
  end
end
