module CombinationHelper
  def combination_fields_removal_link(form)
    combination = form.object
    unless combination.workout.present?
      link = link_to_remove_fields('Remove Combination', form)

      ("| " + link).html_safe
    end
  end
end
