module ApplicationHelper

  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end

  TimeInt = Struct.new :name, :secs
  INTERVALS = [ TimeInt[:days, 60*60*24], TimeInt[:hours, 60*60],
                  TimeInt[:minutes, 60], TimeInt[:seconds, 1] ]
  def time_with_adaptive_units(secs)
    ti = INTERVALS.find {|ti| secs >= ti.secs} || INTERVALS.last
    "#{(secs/ti.secs).round} #{ti.name}"
  end
end
