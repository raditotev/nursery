class AdminPagesController < AdministrationController
  def dashboard
  end

  def awards
    @awards = Award.all
  end
end
