module OrdersHelper
  def calculate_time_left(processing_time, start_time)
    if processing_time.eql? nil
      processing_time = 0
    end
    hours = hour_left(((processing_time/60)/60.to_f).ceil, start_time)
    minutes = min_left(((processing_time%60)%60), start_time)
    "#{hours}:#{two_digit_minutes(minutes)}"
  end

  def two_digit_minutes(minutes)
    if minutes.digits.count.eql?(1)
      "0#{minutes}"
    else
      "#{minutes}"
    end
  end

  def hour_left(hour, start_time)
    runtime = Time.now.hour - start_time.hour
    hour - runtime
  end

  def min_left(min, start_time)
    runtime = Time.now.min - start_time.min
    min - runtime
  end

end
