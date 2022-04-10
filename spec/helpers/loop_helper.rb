module LoopHelper
  def stop_loop_after_n_iterations(instance, iterations)
    allow(instance).to(receive(:loop).tap { |obj| iterations.times { obj.and_yield } })
  end
end
