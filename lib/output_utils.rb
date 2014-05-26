module OutputUtils
  def puts args
    super (' ' * (@spaces || 0)) + args
  end

  def with_indent &block
    raise unless block_given?
    @spaces ||= 0
    @spaces += 2
    yield
    @spaces -= 2
  end

end
