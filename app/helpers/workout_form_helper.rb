module WorkoutFormHelper
  def combination_fields_removal_link(form)
    combination = form.object
    unless combination.workout.present?
      link = link_to_remove_fields('Remove Combination', form)

      ("| " + link).html_safe
    end
  end

  def superset_fields_removal_link(form)
    superset = form.object
    unless superset.combination.present?
      link = link_to_remove_fields('Remove Complex', form)

      ("| " + link).html_safe
    end
  end

  def exercise_removal_link(form)
    exercise = form.object
    unless exercise.superset.present?
      link = link_to_remove_fields('Remove Exercise', form)

      (link).html_safe
    end
  end

end
