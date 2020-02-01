class LimitedRelease::ControllerOverrideController < HelloController
  include LimitedRelease::Controller

  def show
    @message = 'Good morning'
  end
end
