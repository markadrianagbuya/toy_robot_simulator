module StdinHelper
  def with_stubbed_stdin(inputs)
    $stdin = StringIO.new(inputs)

    yield

    $stdin = STDIN
  end
end
