module ApplicationHelper

  def svg(name)
    file_path = "#{Rails.root}/app/assets/images/#{name}.svg"
    return File.read(file_path).html_safe if File.exists?(file_path)
    '(not found)'
  end

  def description content
    raw sanitize(simple_format(content), :tags => %w(br))
  end

  def excerpt description
    description.split(". ").map(&:strip)[0..1].join(". ") + "."
  end
end
