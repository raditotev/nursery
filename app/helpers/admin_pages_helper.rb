module AdminPagesHelper
  def get_title object
    title = case
    when object.class == Faq then object.question
    when object.class == Break then break_text(object)
    when object.class == Newsletter then object.name
    when object.class == Parent then parent_full_name object
    when object.class == Admin then object.username
    else
      object.title
    end
  end

  def break_text closure
    start = closure.start_date
    finish = closure.end_date
    "From #{start.strftime("%e %B")} to #{finish.strftime("%e %B %Y")}"
  end

  def parent_full_name parent
    "#{parent.title} #{parent.first_name} #{parent.last_name}"
  end
end
