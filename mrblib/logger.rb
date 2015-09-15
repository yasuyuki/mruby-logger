class Logger
  attr_accessor :level, :stream

  def initialize(level = :debug, stream = nil)
    @level = level
    @stream = stream
  end

  def debug(message)
    if level_number(:debug) >= level_number(level)
      log(message, 'debug')
    end
  end

  def info(message)
    if level_number(:info) >= level_number(level)
      log(message, 'info')
    end
  end

  def warn(message)
    if level_number(:warn) >= level_number(level)
      log(message, 'warn')
    end
  end

  def error(message)
    if level_number(:error) >= level_number(level)
      log(message, 'error')
    end
  end

  # private

  def log(message, prefix='')
    output = "#{Time.now.to_s} #{prefix}: #{message}"
    if stream
      stream.puts(output)
    else
      stderr(output)
    end
    true
  end

  def level_number(value)
    {debug:0, info:1, warn:2, error:3}[value] || 0
  end
end
