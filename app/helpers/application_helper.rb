module ApplicationHelper
  def humanize_datetime datetime
    str = ''
    unless datetime.nil?
      if datetime > 1.week.ago
        str = distance_of_time_in_words_to_now datetime
      elsif datetime > 1.year.ago
        str = l(datetime.to_date, format: :short)
      else
        str = l(datetime.to_date, format: :long)
      end
    end
    str
  end

  def simple_text text
    sanitize simple_format(text), tags: %w{p br}, attributes: []
  end
end
