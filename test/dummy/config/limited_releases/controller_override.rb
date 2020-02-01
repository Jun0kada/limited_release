class ControllerOverride
  include LimitedRelease::Feature

  active_if { params[:active_limited_release] == 'controller_override' }

  routes do
    get '/', to: 'controller_override#show', as: 'controller_override'
  end
end
