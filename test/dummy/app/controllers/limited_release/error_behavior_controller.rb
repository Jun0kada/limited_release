class LimitedRelease::ErrorBehaviorController < HelloController
  def show
    raise
  end
end
