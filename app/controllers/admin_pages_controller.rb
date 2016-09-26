class AdminPagesController < AdministrationController
  def dashboard
  end

  def awards
    @awards = Award.all
  end

  def events
    @events = Event.all
  end

  def faqs
    @faqs = Faq.all
  end

  def jobs
    @jobs = Job.all
  end

  def newsletters
    @newsletters = Newsletter.all
  end

  def parents
    @parents = Parent.all
  end

  def testemonials
    @testemonials = Testemonial.all
  end

  def admins
    @admins = Admin.where(superadmin: false)
  end
end
