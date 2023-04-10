class LogFormatter
  def call(severity, time, progname, msg = '')
    return '' if msg.blank?

    if progname.present?
      return "timestamp='#{time}' level=#{severity} progname='#{progname}' message='#{msg}'}\n"
    end
    if severity == "INFO"
      Rainbow("#{time} level=#{severity}: #{msg}\n").green
    elsif severity == "WARNING"
      Rainbow("#{time} level=#{severity}: #{msg}\n").yellow
    elsif severity == "ERROR"
      Rainbow("#{time} level=#{severity}: #{msg}\n").red.bright
    elsif severity == "FATAL"
      Rainbow("#{time} level=#{severity}: #{msg}\n").bg(:red)

    else
      Rainbow("#{time} level=#{severity}: #{msg}\n").white
    end
  end
end
