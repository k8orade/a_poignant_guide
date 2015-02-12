module ApplicationHelper
  def minutes_in_words(duration)
    now = Time.now
    distance_of_time_in_words(now, now + duration.minutes)
  end
end
