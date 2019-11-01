module OrdersHelper
  def convert_seconds(processing_time)
    if processing_time.eql? nil
      processing_time = 0
    end
    hours = ((processing_time/60)/60.to_f).ceil
    minutes = ((processing_time%60)%60)
    "#{hours}:#{two_digit_minutes(minutes)}"
  end

  def two_digit_minutes(minutes)
    if minutes.digits.count.eql?(1)
      "0#{minutes}"
    else
      "#{minutes}"
    end
  end


end
