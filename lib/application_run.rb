##
# This ApplicationRun class is used to determine whether the application should continue running

class ApplicationRun
  def continue_running?
    !stopped?
  end

  def stop
    @stopped = true
  end

  def stopped?
    @stopped
  end
end
