module ProfilesHelper
  def profile_display(value)
    if value.nil? || value.empty?
      "<code>[redacted]</code>".html_safe
    else
      value
    end
  end
end
