class DummyStream
  def puts(string); end
end

if Object.const_defined?(:Logger)
  assert('Logger.new') do
    Logger.new.class == Logger
  end

  assert('Logger#stderr') do
    Logger.new.respond_to?(:stderr)
  end

  assert('Logger') do
    Logger.class == Class
  end

  assert('Logger superclass') do
    Logger.superclass == Object
  end

  assert('Logger#level == :debug') do
    Logger.new.level == :debug
  end

  assert('Logger#level = :warn') do
    l = Logger.new
    (l.level = :warn) == :warn
  end

  assert('Logger#level = :warn') do
    l = Logger.new
    l.level = :warn
    l.level == :warn
  end

  {debug:true, info:nil, warn:nil, error:nil}.each do |level, result|
    assert('Logger#debug') do
      l = Logger.new(level, DummyStream.new)
      l.debug('hello') == result
    end
  end

  {debug:true, info:true, warn:nil, error:nil}.each do |level, result|
    assert('Logger#info') do
      l = Logger.new(level, DummyStream.new)
      l.info('hello') == result
    end
  end

  {debug:true, info:true, warn:true, error:nil}.each do |level, result|
    assert('Logger#warn') do
      l = Logger.new(level, DummyStream.new)
      l.warn('hello') == result
    end
  end

  {debug:true, info:true, warn:true, error:true}.each do |level, result|
    assert('Logger#error') do
      l = Logger.new(level, DummyStream.new)
      l.error('hello') == result
    end
  end
end
