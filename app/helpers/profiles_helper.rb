module ProfilesHelper
  def profile_display(value)
    if value.empty? || value.nil?
      "<code>[redacted]</code>".html_safe
    else
      value
    end
  end
end
