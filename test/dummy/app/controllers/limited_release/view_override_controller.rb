class LimitedRelease::ViewOverrideController < HelloController
  include LimitedRelease::Controller

  def show
    super
  end
end
