module TestemonialsHelper
   def description testimonial
    raw sanitize(simple_format(testimonial.description), :tags => %w(br))
  end
end
