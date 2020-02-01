class LimitedRelease::ErrorBehaviorController < HelloController
  include LimitedRelease::Controller

  def show
    raise
  end
end
