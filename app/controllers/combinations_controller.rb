class CombinationsController < ApplicationController

  def update
    @combination = Combination.find(params[:id])
    @combination.update(combination_params)
    redirect_to workout_path(@combination.workout)
  end

  private

  def combination_params
    params.require(:combination).permit(:id, :sets, :sets_complete)
  end
end
