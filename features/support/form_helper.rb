module FormHelpers
  def submit_form
    find('form[name="qasRefinementForm""]').click
  end
end