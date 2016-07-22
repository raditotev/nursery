module AdminPagesHelper
  def get_title object
    title = case
    when object.class == Faq then object.question
    when object.class == Break then break_text(object)
    else
      object.title
    end
  end

  def break_text closure
    start = closure.start_date
    finish = closure.end_date
    "From #{start.strftime("%e %B")} to #{finish.strftime("%e %B %Y")}"
  end
end
