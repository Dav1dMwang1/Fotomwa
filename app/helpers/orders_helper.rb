module OrdersHelper
  def convert_seconds(processing_time)
    hours = ((processing_time/60)/60.to_f).ceil
    minutes = ((processing_time%60)%60)
    "#{hours}:#{two_digit_minutes(minutes)} hours"
  end

  def two_digit_minutes(minutes)
    if minutes.digits.count.eql?(1)
      "0#{minutes}"
    else
      "#{minutes}"
    end
  end


end
