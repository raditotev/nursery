class AdminPagesController < AdministrationController
  def dashboard
  end

  def awards
    @awards = Award.all
  end

  def breaks
    @breaks = Break.all
  end

  def faqs
    @faqs = Faq.all
  end
end
