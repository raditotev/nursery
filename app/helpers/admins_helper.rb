module AdminsHelper
  def get_title object
    title = case
    when object.class == Faq then object.question
    when object.class == Event then event_text(object)
    when object.class == Newsletter then object.name
    when object.class == Parent then parent_full_name object
    when object.class == Admin then object.username
    else
      object.title
    end
  end

  def event_text event
    start = event.start_date
    finish = event.end_date
    start == finish ? "Day off on #{start.strftime("%e %B")}" :
                                "From #{start.strftime('%e %B').strip} to #{finish.strftime('%e %B %Y').strip}"
  end

  def parent_full_name parent
    "#{parent.title} #{parent.first_name} #{parent.last_name}"
  end
end
