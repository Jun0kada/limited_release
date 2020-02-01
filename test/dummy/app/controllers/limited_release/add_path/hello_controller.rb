class LimitedRelease::AddPath::HelloController < HelloController
  include LimitedRelease::Controller

  def show
    super
  end
end
